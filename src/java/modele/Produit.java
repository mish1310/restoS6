package modele;

import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author User
 */
public class Produit {

    private int idProduit;
    private String intitule;
    private Double prixUnitaire;
    private Categorie categorie;
    private String unite;
    
    public void insert()throws Exception {
        Connection con = DBConnection.createDataSource().getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "INSERT INTO produit(intitule, idCategorie, prixUnitaire, unite) VALUES ('"+ this.intitule +"', "+ this.categorie.getIdCategorie() +", "+ this.prixUnitaire +", '"+ this.getUnite() +"'  )";
            Boolean insert = stmt.execute(requete);
            ResultSet rs = stmt.executeQuery("SELECT MAX(idproduit) FROM produit");
            while (rs.next()) {
                this.idProduit = rs.getInt("max");
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } 
    }
    
    public static List<Produit> selectAllIngredients() throws Exception {
        Connection con = DBConnection.createDataSource().getConnection();
        List<Produit> retour = new ArrayList<Produit>();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM produit WHERE idCategorie IS NULL ORDER BY intitule ";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select(con);
                p.setCategorie(c);
                retour.add(p);
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        } 
        return retour;
    }
    
    public static void insertRecette(Produit produitConstitue, Produit produitConstituant, Double quantite) throws Exception {
        Connection con = DBConnection.createDataSource().getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "INSERT INTO ingredientplat(idProduitConstitue, idProduitConstituant, quantite) VALUES("+produitConstitue.getIdProduit()+", "+produitConstituant.getIdProduit()+", "+quantite+" )";
            System.out.println(requete);
            Boolean rs = stmt.execute(requete);
            con.close();
        }
        catch(Exception ex){
            con.close();
            throw ex;
        }
    }
    
    public static void supprimerRecette(Produit produitConstitue, Produit produitConstituant) throws Exception {
        Connection con = DBConnection.createDataSource().getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "DELETE FROM ingredientplat WHERE idProduitConstituant="+produitConstituant.getIdProduit()+" AND idProduitConstitue="+produitConstitue.getIdProduit();
            Boolean rs = stmt.execute(requete);
            con.close();
        }
        catch(Exception ex){
            con.close();
            throw ex;
        }
    }
    
    public static void updateRecette(Produit produitConstitue, Produit produitConstituant, Double quantite) throws Exception {
        Connection con = DBConnection.createDataSource().getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "UPDATE ingredientplat SET quantite="+quantite+" WHERE idProduitConstituant="+produitConstituant.getIdProduit()+" AND idProduitConstitue="+produitConstitue.getIdProduit();
            Boolean rs = stmt.execute(requete);
            con.close();
        }
        catch(Exception ex){
            con.close();
            throw ex;
        }
    }
    
    public static List<Produit> selectAllOrderByIntitule() throws Exception {
        Connection con = DBConnection.createDataSource().getConnection();
        List<Produit> retour = new ArrayList<Produit>();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM produit ORDER BY intitule";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select(con);
                p.setCategorie(c);
                retour.add(p);
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        } 
        return retour;
    }
    
    public static List<Produit> selectAll(Connection con) throws Exception {
        List<Produit> retour = new ArrayList<Produit>();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM produit";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select(con);
                p.setCategorie(c);
                retour.add(p);
            }
        } catch (Exception ex) {
            throw ex;
        } 
        return retour;
    }
    
    public static List<Produit> selectAll() throws Exception {
        List<Produit> retour = new ArrayList<Produit>();
        Connection con = DBConnection.createDataSource().getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM produit";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select(con);
                p.setCategorie(c);
                retour.add(p);
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return retour;
    }

    
    public static List<Produit> getAllIngredients() throws Exception {
        List<Produit> retour = new ArrayList<Produit>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT p.idProduit, p.intitule, p.prixUnitaire, p.idCategorie FROM ingredientPlat iP JOIN produit p ON iP.idProduitConstituant=p.idProduit WHERE p.idCategorie IS NULL  ";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select(con);
                p.setCategorie(c);
                retour.add(p);
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return retour;
    }

    public static List<Object[]> getIngredientsUtilises(List<DetailCommande> listePlats, Connection con) throws Exception {
        List<Object[]> retour = new ArrayList<Object[]>();
        for (int i = 0; i < listePlats.size(); i++) {
            List<Object[]> ingredientsProduit = listePlats.get(i).getProduit().getRecette(con);
            retour.addAll(ingredientsProduit);
        }
        // correction doublon
        for (int i = 0; i < retour.size(); i++) {
            Produit p1 = (Produit) retour.get(i)[0];
            for (int j = i; j < retour.size(); j++) {
                Produit p2 = (Produit) retour.get(j)[0];
                if (p1.getIdProduit() == p2.getIdProduit()) {
                    double nouvelleQuantite = (double) retour.get(i)[1] + (double) retour.get(j)[1];
                    retour.get(i)[1] = nouvelleQuantite;
                    retour.remove(j);
                    j--;
                }
            }
        }
        // ajout du prix
        for (int i = 0; i < retour.size(); i++) {
            Object[] ingredient = retour.get(i);
            Produit produitIngredient = (Produit) ingredient[0];
            double quantite = (double) ingredient[1];
            double prixUnitaireProduit = produitIngredient.getPrixUnitaireFromStock(con);
            Object [] ingredientAvecPrix = new Object[3];
            ingredientAvecPrix[0] = ingredient[0];
            ingredientAvecPrix[1] = ingredient[1];
            ingredientAvecPrix[2] = prixUnitaireProduit;
            retour.set(i, ingredientAvecPrix);
        }
        return retour;
    }

    public double getPrixUnitaireFromStock(Connection con) throws Exception {
        double retour = 0;
        Statement stmt = con.createStatement();
        String requete = "SELECT prixUnitaire FROM stock WHERE idProduit = " + this.idProduit;
        ResultSet rs = stmt.executeQuery(requete);
        while (rs.next()) {
            retour = rs.getDouble("prixUnitaire");
        }
        return retour;
    }

    public List<Object[]> getRecette(Connection con) throws Exception {
        List<Object[]> retour = new ArrayList<Object[]>();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT p.idProduit, p.intitule, p.prixUnitaire, p.idCategorie, iP.quantite, p.unite FROM ingredientPlat iP JOIN produit p ON iP.idProduitConstituant=p.idProduit WHERE idProduitConstitue = " + this.idProduit;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"), rs.getString("unite"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select();
                p.setCategorie(c);
                Double quantite = rs.getDouble("quantite");
                Object[] ligne = new Object[2];
                ligne[0] = p;
                ligne[1] = quantite;
                retour.add(ligne);
            }
        } catch (Exception ex) {
            throw ex;
        }
        return retour;
    }

    public List<Object[]> getRecette() throws Exception {
        List<Object[]> retour = new ArrayList<Object[]>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT p.idProduit, p.intitule, p.prixUnitaire, p.idCategorie, iP.quantite, p.unite FROM ingredientPlat iP JOIN produit p ON iP.idProduitConstituant=p.idProduit WHERE idProduitConstitue = " + this.idProduit;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"), rs.getString("unite"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select();
                p.setCategorie(c);
                Double quantite = rs.getDouble("quantite");
                Object[] ligne = new Object[2];
                ligne[0] = p;
                ligne[1] = quantite;
                retour.add(ligne);
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public void update(Connection con) throws Exception {
        try {
            Statement stmt = con.createStatement();
            String requete = "UPDATE produit SET prixUnitaire = " + this.prixUnitaire + " WHERE idProduit=" + this.idProduit;
            Boolean rs = stmt.execute(requete);
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
    }

    public List<Object> suggestionPrix(double montantInf, double montantSup, double pourcentageSuggestion) throws Exception {
        List retour = new ArrayList();
        Connection con = null;
        try {
            con = DBConnection.getConnection();
            List<Produit> listeProduit = new Produit().selectAllVendable();
            for (int i = 0; i < listeProduit.size(); i++) {
                Produit p = listeProduit.get(i);
                double coutFabrication = p.getCoutFabrication();
                double suggestionPrix = 0;
                if (montantInf == -1) {
                    if (coutFabrication <= montantSup) {
                        suggestionPrix += coutFabrication * pourcentageSuggestion / 100;
                    }
                } else if (montantSup == -1) {
                    if (coutFabrication >= montantInf) {
                        suggestionPrix += coutFabrication * pourcentageSuggestion / 100;
                    }
                } else {
                    if (montantInf <= coutFabrication && coutFabrication <= montantSup) {
                        suggestionPrix += coutFabrication * pourcentageSuggestion / 100;
                    }
                }
                p.setPrixUnitaire(suggestionPrix);
                p.update(con);
                Object[] r = new Object[2];
                r[0] = p;
                r[1] = pourcentageSuggestion;
                retour.add(r);
            }
            con.close();
        } catch (Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public List<Produit> getAllConstituant() throws Exception {
        List<Produit> retour = new ArrayList<Produit>();
        Connection con = DBConnection.createDataSource().getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT p.idProduit, p.intitule, p.prixUnitaire, p.idCategorie FROM ingredientPlat iP JOIN produit p ON iP.idProduitConstituant=p.idProduit WHERE idProduitConstitue = " + this.idProduit;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select(con);
                p.setCategorie(c);
                retour.add(p);
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return retour;
    }
    
    public Produit select() throws Exception {
        Produit retour = null;
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM produit WHERE idProduit=" + this.idProduit;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select(con);
                p.setCategorie(c);
                retour = p;
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return retour;
    }

    public Produit select(Connection con) throws Exception {
        Produit retour = null;
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM produit WHERE idProduit=" + this.idProduit;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select();
                p.setCategorie(c);
                retour = p;
            }
        } catch (Exception ex) {
            throw ex;
        }
        return retour;
    }

    public double getCoutFabrication() throws Exception {
        double retour = 0;
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT prixTotalFabrication FROM prixFabricationPlat WHERE plat = " + this.idProduit;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                retour = rs.getDouble("prixTotalFabrication");
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return retour;
    }

    public List<Produit> selectAllByCategorie(int idCategorie) throws Exception {
        List<Produit> retour = new ArrayList<Produit>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT idProduit, intitule, prixUnitaire, c.idCategorie, c.nomCategorie FROM produit p JOIN categorie c ON p.idCategorie=c.idCategorie WHERE c.idCategorie = " + idCategorie;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select();
                p.setCategorie(c);
                retour.add(p);
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return retour;
    }

    public List<Produit> selectAllVendable() throws Exception {
        List<Produit> retour = new ArrayList<Produit>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT idProduit, intitule, prixUnitaire, c.idCategorie, c.nomCategorie FROM produit p JOIN categorie c ON p.idCategorie=c.idCategorie WHERE p.idCategorie IS NOT NULL";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Produit p = new Produit(rs.getInt("idProduit"), rs.getString("intitule"), rs.getDouble("prixUnitaire"));
                Categorie c = new Categorie(rs.getInt("idCategorie"));
                c = c.select();
                p.setCategorie(c);
                retour.add(p);
            }
        } catch (Exception ex) {
            con.close();
            throw ex;
        } finally {
            con.close();
        }
        return retour;
    }

    public Produit() {

    }

    public Produit(int idProduit) {
        this.idProduit = idProduit;
    }

    public Produit(int idProduit, String intitule, Double prixUnitaire, String unite) {
        this.idProduit = idProduit;
        this.intitule = intitule;
        this.prixUnitaire = prixUnitaire;
        this.unite = unite;
    }

    public Produit(int idProduit, String intitule, Double prixUnitaire) {
        this.idProduit = idProduit;
        this.intitule = intitule;
        this.prixUnitaire = prixUnitaire;
    }

    /**
     * @return the idProduit
     */
    public int getIdProduit() {
        return idProduit;
    }

    /**
     * @param idProduit the idProduit to set
     */
    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    /**
     * @return the intitule
     */
    public String getIntitule() {
        return intitule;
    }

    /**
     * @param intitule the intitule to set
     */
    public void setIntitule(String intitule) {
        this.intitule = intitule;
    }

    /**
     * @return the prixUnitaire
     */
    public Double getPrixUnitaire() {
        return prixUnitaire;
    }

    /**
     * @param prixUnitaire the prixUnitaire to set
     */
    public void setPrixUnitaire(Double prixUnitaire) {
        this.prixUnitaire = prixUnitaire;
    }

    /**
     * @return the categorie
     */
    public Categorie getCategorie() {
        return categorie;
    }

    /**
     * @param categorie the categorie to set
     */
    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public String getUnite() {
        return unite;
    }

    public void setUnite(String unite) {
        this.unite = unite;
    }

}
