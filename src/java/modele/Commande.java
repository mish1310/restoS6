/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author User
 */
public class Commande {

    private int idCommande;
    private Serveur serveur;
    private Table table;
    private Date dateCommande;
    private Double prixTotal;
    private List<DetailCommande> listeDetailCommande;

    public void ajouterDetailCommande(List<DetailCommande> listeDetailCommande) throws Exception {
        Connection con = DBConnection.getConnection();
        try {
            Calendar dateAct = Calendar.getInstance();
            Date dateAjout = dateAct.getTime();
            for (int i = 0; i < listeDetailCommande.size(); i++) {
                System.out.println(listeDetailCommande.toString());
                listeDetailCommande.get(i).setCommande(this);
                listeDetailCommande.get(i).setServeur(this.serveur);
                listeDetailCommande.get(i).setDateCommande(dateAjout);
                listeDetailCommande.get(i).insert(con);
            }
        } catch (Exception ex) {
            if (con != null) {
                con.close();
            }
            throw ex;
        }
    }

    public static List<Double> getPayementCommande(List<Commande> listeCommande, Connection con) throws Exception {
        List<Double> retour = new ArrayList<Double>();
        try {
            Statement stmt = con.createStatement();
            for (int i = 0; i < listeCommande.size(); i++) {
                Double ajout = 0.0;
                String requete = "SELECT sommePayement FROM paiementCommande WHERE idCommande= " + listeCommande.get(i).getIdCommande();
                ResultSet rs = stmt.executeQuery(requete);
                while (rs.next()) {
                    ajout = rs.getDouble("sommePayement");
                }
                retour.add(ajout);
            }
        } catch (Exception ex) {
            throw ex;
        }
        return retour;
    }

    public static List<Commande> getCommandeNonPaye(String date, Connection con) throws Exception {
        List<Commande> retour = new ArrayList<Commande>();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM commandeNonPaye";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Commande commande = new Commande(rs.getInt("idCommande"), null, rs.getDate("dateCommande"), rs.getDouble("prixTotal"));
                retour.add(commande);
            }
        } catch (Exception ex) {
            throw ex;
        }
        return retour;
    }

    public List<Commande> getListeCommandeNonPayes() throws Exception {
        List<Commande> retour = new ArrayList<Commande>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {

            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public List<DetailCommande> getListeDetailCommandeFromDB() throws Exception {
        List<DetailCommande> retour = new ArrayList<DetailCommande>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * from detailCommande WHERE idCommande=" + this.idCommande;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit produit = new Produit();
                produit.setIdProduit(rs.getInt("idProduit"));
                produit = produit.select(con);
                DetailCommande detailCommande = new DetailCommande(rs.getInt("idDetailsCommande"),
                        new Commande(rs.getInt("idCommande")),
                        new Produit(),
                        rs.getDate("dateCommande"));
                retour.add(detailCommande);
            }
            this.setListeDetailCommande(retour);
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public double getAddition() throws Exception {
        double retour = 0;
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * from detailCommande WHERE idCommande=" + this.idCommande;
            ResultSet res = stmt.executeQuery(requete);
            while (res.next()) {
                double sommeProduit = res.getDouble("prixUnitaire") * res.getInt("quantite");
                retour += sommeProduit;
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public String getDateDernierCommande(int idTable) throws Exception {
        Connection con = DBConnection.getConnection();
        String dateFin = "";
        try {
            Statement stmt = con.createStatement();
            String requete = "select dateCommande from detailsCommande d join commande c on d.idCommande=c.idCommande where c.idTable=" + idTable + "order by dateCommande desc limit 1";
            System.out.println("requete1=" + requete);
            ResultSet res = stmt.executeQuery(requete);
            while (res.next()) {
                dateFin = String.valueOf(res.getDate("dateCommande"));
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return dateFin;
    }

    public double findAdditionTable(int idTable) throws Exception {
        double retour = 0;
        String dateCommande = this.getDateDernierCommande(idTable);
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * from detailsCommande d join commande c on d.idCommande=c.idCommande WHERE c.idTable=" + idTable + " AND c.datecommande='" + dateCommande + "'";
            System.out.println(requete);
            ResultSet res = stmt.executeQuery(requete);
            while (res.next()) {
                double sommeProduit = res.getDouble("prixUnitaire") * res.getInt("quantite");
                retour += sommeProduit;
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public List<DetailCommande> getProduitTable(int idTable) throws Exception {

        String dateCommande = this.getDateDernierCommande(idTable);
        List<DetailCommande> retour = new ArrayList();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT d.prixUnitaire,p.idProduit,p.intitule from detailsCommande d join commande c on d.idCommande=c.idCommande join produit p on d.idProduit=p.idProduit WHERE c.idTable=" + idTable + " AND c.datecommande='" + dateCommande + "'";
            System.out.println(requete);
            ResultSet res = stmt.executeQuery(requete);
            while (res.next()) {
                DetailCommande d = new DetailCommande(res.getInt("idProduit"), res.getDouble("prixUnitaire"), res.getString("intitule"));
                retour.add(d);

            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;

    }

    public void insertCommande() throws Exception {
        Connection con = DBConnection.getConnection();
        con.setAutoCommit(false);
        try {
            Statement stmt = con.createStatement();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String requete = "INSERT INTO commande (idTable,dateCommande, prixTotal) VALUES(" + this.table.getIdTable() + " , '" + dateFormat.format(this.dateCommande) + "', 0 )";
            Boolean rs = stmt.execute(requete);
            requete = "SELECT idCommande from commande ORDER BY dateCommande DESC";
            ResultSet res = stmt.executeQuery(requete);
            while (res.next()) {
                this.idCommande = res.getInt("idCommande");
            }
            for (int i = 0; i < this.listeDetailCommande.size(); i++) {
                this.listeDetailCommande.get(i).setCommande(this);
                this.listeDetailCommande.get(i).insert(con);
            }
            con.commit();
            con.close();
        } catch (Exception ex) {
            con.rollback();
            con.close();
            throw ex;
        }
    }

    public Commande(int idCommande, Serveur serveur, Date dateCommande, double prixTotal) {
        this.idCommande = idCommande;
        this.serveur = serveur;
        this.dateCommande = dateCommande;
        this.prixTotal = prixTotal;
    }

    public Commande(int idCommande) {
        this.idCommande = idCommande;
    }

    public Commande() {
    }

    public int getIdCommande() {
        return idCommande;
    }

    public void setIdCommande(int idCommande) {
        this.idCommande = idCommande;
    }

    public Serveur getServeur() {
        return serveur;
    }

    public void setServeur(Serveur serveur) {
        this.serveur = serveur;
    }

    public Date getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(Date dateCommande) {
        this.dateCommande = dateCommande;
    }

    public Double getPrixTotal() {
        return prixTotal;
    }

    public void setPrixTotal(Double prixTotal) {
        this.prixTotal = prixTotal;
    }

    public List<DetailCommande> getListeDetailCommande() {
        return listeDetailCommande;
    }

    public void setListeDetailCommande(List<DetailCommande> listeDetailCommande) {
        this.listeDetailCommande = listeDetailCommande;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

}
