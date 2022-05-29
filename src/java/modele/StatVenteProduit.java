/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dx2Big
 */
public class StatVenteProduit {

    int idProduit;
    int quantiteProduit;
    float prixUnitaire;
    float prixTotal;
    String intitule;
    String dateCommande;
    String nomEtat;
    int idDetailsCommande;
    int idEtat;
    float montantTotal;
    String mois;
    String annee;

    public StatVenteProduit() {
    }

    public StatVenteProduit(float montantTotal, String mois, String annee) {
        this.montantTotal = montantTotal;
        this.mois = mois;
        this.annee = annee;
    }

    public float getMontantTotal() {
        return montantTotal;
    }

    public void setMontantTotal(float montantTotal) {
        this.montantTotal = montantTotal;
    }

    public String getMois() {
        return mois;
    }

    public void setMois(String mois) {
        this.mois = mois;
    }

    public String getAnnee() {
        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }

    public int getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public int getQuantiteProduit() {
        return quantiteProduit;
    }

    public void setQuantiteProduit(int quantiteProduit) {
        this.quantiteProduit = quantiteProduit;
    }

    public float getPrixUnitaire() {
        return prixUnitaire;
    }

    public void setPrixUnitaire(float prixUnitaire) {
        this.prixUnitaire = prixUnitaire;
    }

    public float getPrixTotal() {
        return prixTotal;
    }

    public void setPrixTotal(float prixTotal) {
        this.prixTotal = prixTotal;
    }

    public String getIntitule() {
        return intitule;
    }

    public void setIntitule(String intitule) {
        this.intitule = intitule;
    }

    public String getDateCommande() {
        return dateCommande;
    }

    public void setDateCommande(String dateCommande) {
        this.dateCommande = dateCommande;
    }

    public String getNomEtat() {
        return nomEtat;
    }

    public void setNomEtat(String nomEtat) {
        this.nomEtat = nomEtat;
    }

    public int getIdDetailsCommande() {
        return idDetailsCommande;
    }

    public void setIdDetailsCommande(int idDetailsCommande) {
        this.idDetailsCommande = idDetailsCommande;
    }

    public int getIdEtat() {
        return idEtat;
    }

    public void setIdEtat(int idEtat) {
        this.idEtat = idEtat;
    }

    public List<StatVenteProduit> listeVente(String annee) throws Exception {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        List<StatVenteProduit> getAll = new ArrayList();
        try {
            String requete = "select sum(prixTotal) as montantTotal , extract(month from dateCommande) as mois,extract(year from dateCommande) as annee \n"
                    + "from statVenteProduit where extract(year from dateCommande)="+annee+" group by extract(month from dateCommande) ,extract(year from dateCommande)";
            ResultSet rs = stmt.executeQuery(requete);

            while (rs.next()) {
                StatVenteProduit p = new StatVenteProduit(rs.getFloat("montantTotal"), rs.getString("mois"), rs.getString("annee"));
                getAll.add(p);
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return getAll;
    }

}
