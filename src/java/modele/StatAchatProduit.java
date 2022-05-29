/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dx2Big
 */
public class StatAchatProduit {
    float montantTotal;
    String annee;
    String mois;

    public StatAchatProduit() {
    }

    public StatAchatProduit(float montantTotal, String annee, String mois) {
        this.montantTotal = montantTotal;
        this.annee = annee;
        this.mois = mois;
    }

    public float getMontantTotal() {
        return montantTotal;
    }

    public void setMontantTotal(float montantTotal) {
        this.montantTotal = montantTotal;
    }

    public String getAnnee() {
        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }

    public String getMois() {
        return mois;
    }

    public void setMois(String mois) {
        this.mois = mois;
    }
    
    public List<StatAchatProduit> listeAchat(String annee) throws Exception {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        List<StatAchatProduit> getAll = new ArrayList();
        try {
            String requete = "select * from statAchatProduit where annee="+annee+" order by mois asc";
            ResultSet rs = stmt.executeQuery(requete);

            while (rs.next()) {
                StatAchatProduit p = new StatAchatProduit(rs.getFloat("montantTotal"), rs.getString("annee"), rs.getString("mois"));
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