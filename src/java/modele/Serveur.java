/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author User
 */
public class Serveur {

    private int idServeur;
    private String nom;

    public Serveur(int idServeur, String nom) {
        this.idServeur = idServeur;
        this.nom = nom;
    }

    public Serveur() {
    }

    public Serveur(int idServeur) {
        this.idServeur = idServeur;
    }
    
    
    
    public float getPourBoireServeur(Connection con,String date1, String date2) throws Exception {
        List retour = new ArrayList();
        float sommePourBoire=0;
        Statement stmt = con.createStatement();
        String requete = " select idServeur,c.idCommande,(sum(prixUnitaire*quantite)*2)/100 as pour_boireServeur from commande c join detailscommande d on c.idCommande=d.idCommande where idServeur=" + this.idServeur + " and dateCommande < '" + date1 + "' and dateCommande > '" + date2 + "' group by idServeur,c.idCommande";
       //String requete = " select idServeur,c.idCommande,(sum(prixUnitaire*quantite)*2)/100 as pour_boireServeur from commande c join detailscommande d on c.idCommande=d.idCommande group by idServeur,c.idCommande";
        ResultSet rs = stmt.executeQuery(requete);
        try {
            while (rs.next()) {
                //DetailCommande c = new DetailCommande(rs.getInt("idServeur"), rs.getInt("idCommande"),rs.getFloat("pour_boireServeur"));
                //retour.add(rs.getFloat("pour_boireServeur"));
                sommePourBoire=sommePourBoire+rs.getFloat("pour_boireServeur");
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
        }
        return sommePourBoire;
    }
    
    public double getSommePouboire(Date dateDebut, Date dateFin) throws Exception {
        double retour = 0;
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            DateFormat dateFormat = new SimpleDateFormat("yyyy/mm/dd");
            String requete = "SELECT * FROM commande WHERE idServeur = " + this.idServeur + " AND dateCommande > '" + dateFormat.format(dateDebut) + "' AND dateCommande < '" + dateFormat.format(dateFin) + "'";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Commande c = new Commande();
                c.setIdCommande(rs.getInt("idCommande"));
                double sommeCommande = c.getAddition();
                retour += sommeCommande * (8 / 100);
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public List<Serveur> selectAll() throws Exception {
        List<Serveur> retour = new ArrayList<Serveur>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM serveur";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Serveur s = new Serveur();
                s.setIdServeur(rs.getInt("idServeur"));
                s.setNom(rs.getString("nomServeur"));
                retour.add(s);
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return retour;
    }

    public int getIdServeur() {
        return idServeur;
    }

    public void setIdServeur(int idServeur) {
        this.idServeur = idServeur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

}
