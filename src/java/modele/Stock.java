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
 * @author Manda
 */
public class Stock {

    private int idStock;
    private Produit produit;
    private Double prixUnitaire;
    private Date dateStock;
    private int quantite;

    public static List<Stock> rechercher(Produit produit, Date dateInf, Date dateSup) throws Exception {
        List<Stock> retour = new ArrayList<Stock>();
        Connection con = DBConnection.createDataSource().getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT s.idstock, s.idproduit, s.prixunitaire, s.quantite, s.datestock FROM stock s JOIN produit p ON s.idproduit=p.idproduit";
            int ajout = 0;
            if(produit != null){
                requete += " WHERE p.intitule LIKE '%"+produit.getIntitule()+"%' ";
                ajout ++;
            }
            DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
            if(dateInf != null) {
                if(ajout == 0) requete += " WHERE ";
                if(ajout != 0) requete += " AND ";
                requete += " datestock > '"+df.format(dateInf)+"' ";
                ajout ++ ;
            }
            if(dateSup != null) {
                if(ajout == 0) requete += " WHERE ";
                if(ajout != 0) requete += " AND ";
                requete += " datestock < '"+df.format(dateSup)+"' ";
            }
            System.out.println(requete);
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Stock s = new Stock();
                s.setIdStock(rs.getInt("idstock"));
                Produit p = new Produit();
                p.setIdProduit(rs.getInt("idProduit"));
                p = p.select(con);
                s.setProduit(p);
                s.setPrixUnitaire(rs.getDouble("prixUnitaire"));
                s.setDateStock(rs.getDate("dateStock"));
                s.setQuantite(rs.getInt("quantite"));
                retour.add(s);
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public void insert() throws Exception {
        Connection con = DBConnection.createDataSource().getConnection();
        try {
            Statement stmt = con.createStatement();
            DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
            String requete = "INSERT INTO stock(idproduit, prixunitaire, datestock, quantite) VALUES( " + this.produit.getIdProduit() + ", " + this.prixUnitaire + ", '" + df.format(this.dateStock) + "', " + this.quantite + " )";
            Boolean rs = stmt.execute(requete);
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
    }

    public static List<Stock> selectAll() throws Exception {
        List<Stock> retour = new ArrayList<Stock>();
        Connection con = DBConnection.createDataSource().getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM stock";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Stock s = new Stock();
                s.setIdStock(rs.getInt("idstock"));
                Produit p = new Produit();
                p.setIdProduit(rs.getInt("idProduit"));
                p = p.select(con);
                s.setProduit(p);
                s.setPrixUnitaire(rs.getDouble("prixUnitaire"));
                s.setDateStock(rs.getDate("dateStock"));
                s.setQuantite(rs.getInt("quantite"));
                retour.add(s);
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public int getIdStock() {
        return idStock;
    }

    public void setIdStock(int idStock) {
        this.idStock = idStock;
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

    public Date getDateStock() {
        return dateStock;
    }

    public void setDateStock(Date dateStock) {
        this.dateStock = dateStock;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

}
