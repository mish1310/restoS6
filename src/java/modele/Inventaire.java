/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author Manda
 */
public class Inventaire {

    private Produit produit;
    private int quantiteEnStock;
    private Date dateInventaire;

    public void faireInventaire() throws Exception {
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            // recuperation et verification du date d'inventaire
            String requete = "SELECT * FROM inventaire WHERE idProduit = " + this.produit.getIdProduit() + " ORDER BY dateInventaire DESC LIMIT 1";
            ResultSet res = stmt.executeQuery(requete);
            Date dateInventairePrecedent = null;
            int quantite = 0;
            while (res.next()) {
                dateInventairePrecedent = (Date) res.getDate("dateInventaire");
                quantite = res.getInt("quantite");
            }
            if (dateInventairePrecedent != null) {
                if (dateInventairePrecedent.before(dateInventaire)) {
                    // proceder au traitement
                    // calcul du quantite sortant
                    requete = "SELECT quantiteSortant FROM stockSortant st JOIN stock s ON st.idStock=s.idStock WHERE idProduit="+this.produit.getIdProduit()+" dateSortie > '" + dateInventairePrecedent.getYear() + "-" + dateInventairePrecedent.getMonth() + "-" + dateInventairePrecedent.getDay() + "' AND dateSortie < '" + this.dateInventaire.getYear() + "-" + this.dateInventaire.getMonth() + "-" + this.dateInventaire.getDay() + "'";
                    res = stmt.executeQuery(requete);
                    int quantiteSortant = 0;
                    while (res.next()) {
                        quantiteSortant += res.getInt("quantitesortant");
                    }
                    // calcul du quantite entrant
                    requete = "SELECT * FROM stock WHERE idProduit="+this.produit.getIdProduit()+" WHERE dateStock > '" + dateInventairePrecedent.getYear() + "-" + dateInventairePrecedent.getMonth() + "-" + dateInventairePrecedent.getDay() + "' AND dateSortie < '" + this.dateInventaire.getYear() + "-" + this.dateInventaire.getMonth() + "-" + this.dateInventaire.getDay() + "'";
                    res = stmt.executeQuery(requete);
                    int quantiteEntrant = 0;
                    while (res.next()) {
                        quantiteEntrant += res.getInt("quantitesortant");
                    }
                    this.setQuantiteEnStock(quantite + quantiteEntrant - quantiteSortant);
                }
            } else {
                // proceder au traitement
                requete = "SELECT * FROM stockSortant WHERE dateSortie < '" + this.dateInventaire.getYear() + "-" + this.dateInventaire.getMonth() + "-" + this.dateInventaire.getDay() + "'";
                res = stmt.executeQuery(requete);
                int quantiteSortant = 0;
                while (res.next()) {
                    quantiteSortant += res.getInt("quantitesortant");
                }
                // calcul du quantite entrant
                requete = "SELECT * FROM stock WHERE dateSortie < '" + this.dateInventaire.getYear() + "-" + this.dateInventaire.getMonth() + "-" + this.dateInventaire.getDay() + "'";
                res = stmt.executeQuery(requete);
                int quantiteEntrant = 0;
                while (res.next()) {
                    quantiteEntrant += res.getInt("quantitesortant");
                }
                this.setQuantiteEnStock(quantite + quantiteEntrant - quantiteSortant);
            }
            this.insert(con);
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
    }
    
    public void insert(Connection con) throws Exception{
        try {
            Statement stmt = con.createStatement();
            String requete = "INSERT INTO inventaire(dateInventaire, quantite, idProduit) VALUES ("+this.dateInventaire.getYear()+"-"+this.dateInventaire.getMonth()+"-"+this.dateInventaire.getDay()+", "+this.quantiteEnStock+", "+this.produit.getIdProduit()+") ";
            Boolean rs = stmt.execute(requete);
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
    }

    public Inventaire(Produit produit, Date dateInventaire) {
        this.produit = produit;
        this.dateInventaire = dateInventaire;
    }

    public Produit getProduit() {
        return produit;
    }

    public void setProduit(Produit produit) {
        this.produit = produit;
    }

    public int getQuantiteEnStock() {
        return quantiteEnStock;
    }

    public void setQuantiteEnStock(int quantiteEnStock) {
        this.quantiteEnStock = quantiteEnStock;
    }

    public Date getDateInventaire() {
        return dateInventaire;
    }

    public void setDateInventaire(Date dateInventaire) {
        this.dateInventaire = dateInventaire;
    }

}
