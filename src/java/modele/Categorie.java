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
 * @author User
 */
public class Categorie {
    
    private int idCategorie;
    private String nomCategorie;
    
    
    public List<Categorie> selectAll() throws Exception{
        List<Categorie> retour = new ArrayList<Categorie>();
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM categorie ";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Categorie c = new Categorie(rs.getInt("idCategorie"), rs.getString("nomCategorie"));
                retour.add(c);
            }
        }
        catch(Exception ex){
            throw ex;
        }
        finally{
            con.close();
        }
        return retour;
    }
    
    public Categorie select(Connection con) throws Exception{
        Categorie retour = new Categorie();
        try{
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM categorie WHERE idCategorie="+this.idCategorie;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Categorie c = new Categorie(rs.getInt("idCategorie"), rs.getString("nomCategorie"));
                return c;
            }
        }
        catch(Exception ex){
            throw ex;
        }
        return retour;
    }
    
    public Categorie select() throws Exception{
        Categorie retour = new Categorie();
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM categorie WHERE idCategorie="+this.idCategorie;
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Categorie c = new Categorie(rs.getInt("idCategorie"), rs.getString("nomCategorie"));
                return c;
            }
        }
        catch(Exception ex){
            throw ex;
        }
        finally{
            con.close();
        }
        return retour;
    }

    public Categorie(){
        
    }
    
    public Categorie(int idCategorie, String nomCategorie){
        this.idCategorie = idCategorie;
        this.nomCategorie = nomCategorie;
    }
    
    public Categorie(int idCategorie){
        this.idCategorie = idCategorie;
    }
    
    public int getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public String getNomCategorie() {
        return nomCategorie;
    }

    public void setNomCategorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }
    
}
