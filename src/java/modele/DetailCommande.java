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
import java.util.List;

/**
 *
 * @author User
 */
public class DetailCommande {

    private int idDetailCommande;
    private Commande commande;
    private Produit produit;
    private Double prixUnitaire;
    private Serveur serveur;
    private float pour_boire;
    private Date dateCommande;
    
    
    public void fabriquer() throws Exception {
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "INSERT INTO etatPlat(idetat, iddetailscommande) VALUES (1,"+this.idDetailCommande+")";
            Boolean res = stmt.execute(requete);
            con.close();
        }
        catch(Exception ex){
            if(con != null) con.close();
            throw ex;
        }
    }
    
    
    public void livrer() throws Exception {
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "UPDATE etatplat SET idEtat=2 WHERE iddetailscommande="+this.idDetailCommande;
            Boolean res = stmt.execute(requete);
            con.close();
        }
        catch(Exception ex){
            if(con != null) con.close();
            throw ex;
        }
    }
    
    public static List<DetailCommande> getPlatsFabrique(String date1, String date2, Connection con) throws Exception {
        List<DetailCommande> retour = new ArrayList<DetailCommande>();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM platFabrique WHERE dateCommande>'"+date1+"' AND dateCommande < '"+date2+"'";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit produit = new Produit();
                produit.setIdProduit(rs.getInt("idProduit"));
                produit = produit.select(con);
                DetailCommande detailCommande = new DetailCommande(rs.getInt("idDetailsCommande"),
                         new Commande(rs.getInt("idCommande")),
                         produit,
                         rs.getDate("dateCommande"));
                retour.add(detailCommande);
            }
        } catch (Exception ex) {
            throw ex;
        }
        return retour;
    }
    
    public void payer() throws Exception {
        Connection con = DBConnection.getConnection();
        try {
            boolean etatPreparation = this.getEtatPayement(con);
            if (etatPreparation) {
                throw new Exception("Plat déja payé");
            }
            Statement stmt = con.createStatement();
            String requete = "INSERT INTO etatPlat(idDetailsCommande, idEtat) VALUES(" + this.idDetailCommande + ", 3)";
            boolean result = stmt.execute(requete);
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
    }
    
    private boolean getEtatPayement(Connection con) throws Exception {
        Statement stmt = con.createStatement();
        String requete = "SELECT * FROM etatPlat WHERE idEtat = 3 AND idDetailsCommande="+this.idDetailCommande;
        ResultSet rs = stmt.executeQuery(requete);
        while(rs.next()){
            return true;
        }
        return false;
    }

    public void preparer() throws Exception {
        Connection con = DBConnection.getConnection();
        try {
            boolean etatPreparation = this.getEtatPreparation(con);
            if (etatPreparation) {
                throw new Exception("Plat déja préparé");
            }
            Statement stmt = con.createStatement();
            String requete = "INSERT INTO etatPlat(idDetailsCommande, idEtat) VALUES(" + this.idDetailCommande + ", 1)";
            boolean result = stmt.execute(requete);
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
    }

    private boolean getEtatPreparation(Connection con) throws Exception {
        Statement stmt = con.createStatement();
        String requete = "SELECT * FROM etatPlat WHERE idEtat = 1 AND idDetailsCommande="+this.idDetailCommande;
        ResultSet rs = stmt.executeQuery(requete);
        while(rs.next()){
            return true;
        }
        return false;
    }
    
    public static List<DetailCommande> getDetailCommandeNonLivre() throws Exception {
        List<DetailCommande> retour = new ArrayList<DetailCommande>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM platFabrique ORDER BY dateCommande ASC";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit produit = new Produit();
                produit.setIdProduit(rs.getInt("idProduit"));
                produit = produit.select(con);
                DetailCommande detailCommande = new DetailCommande(rs.getInt("idDetailsCommande"),
                         new Commande(rs.getInt("idCommande")),
                         produit,
                         rs.getDate("dateCommande"));
                retour.add(detailCommande);
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public static List<DetailCommande> getDetailCommandeNonFini() throws Exception {
        List<DetailCommande> retour = new ArrayList<DetailCommande>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM platNonFabrique ORDER BY dateCommande ASC";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit produit = new Produit();
                produit.setIdProduit(rs.getInt("idProduit"));
                produit = produit.select(con);
                DetailCommande detailCommande = new DetailCommande(rs.getInt("idDetailsCommande"),
                         new Commande(rs.getInt("idCommande")),
                         produit,
                         rs.getDate("dateCommande"));
                retour.add(detailCommande);
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }
    
    public DetailCommande(int idDetailsCommande) {
        this.idDetailCommande = idDetailsCommande;
    }

    public DetailCommande(int idDetailsCommande, Commande commande, Produit produit, Date dateCommande) {
        this.idDetailCommande = idDetailsCommande;
        this.commande = commande;
        this.produit = produit;
        this.dateCommande = dateCommande;
    }

    public DetailCommande(int idServeur, int idCommande, float pour_boire) throws Exception {
        this.serveur.setIdServeur(idServeur);
        this.commande.setIdCommande(idCommande);
        this.pour_boire = pour_boire;
    }

    public DetailCommande(int idProduit, double prixUnitaire, String intitule) throws Exception {
        this.produit = new Produit();
        this.produit.setIdProduit(idProduit);
        this.setPrixUnitaire(prixUnitaire);
        this.produit.setIntitule(intitule);

    }

    public DetailCommande() {
    }

    public void insert(Connection con) throws Exception {
        Statement stmt = con.createStatement();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String requete = "INSERT INTO detailsCommande (idCommande, idProduit, prixUnitaire, idServeur, dateCommande) VALUES(" + this.commande.getIdCommande() + "," + this.produit.getIdProduit() + ", " + this.produit.getPrixUnitaire() + ", "+ this.serveur.getIdServeur() +", '"+dateFormat.format(this.dateCommande)+"' )";
        System.out.println(requete);
        Boolean rs = stmt.execute(requete);
        stmt.close();
    }

    public int getIdDetailCommande() {
        return idDetailCommande;
    }

    public void setIdDetailCommande(int idDetailCommande) {
        this.idDetailCommande = idDetailCommande;
    }

    public float getPour_boire() {
        return pour_boire;
    }

    public void setPour_boire(float pour_boire) {
        this.pour_boire = pour_boire;
    }

    public int getIdServeur() {
        return this.serveur.getIdServeur();
    }

    public void setIdServeur(int idServeur) {
        this.serveur.setIdServeur(idServeur);
    }

    public Commande getCommande() {
        return commande;
    }

    public void setCommande(Commande commande) {
        this.commande = commande;
    }

    public Produit getProduit() {
        return produit;
    }

    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public Double getPrixUnitaire() {
        return prixUnitaire;
    }

    public void setPrixUnitaire(Double prixUnitaire) {
        this.prixUnitaire = prixUnitaire;
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

}
