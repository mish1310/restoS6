/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Manda
 */
public class Profil {
    
    private int idProfil;
    private String nomProfil;
    private String motDePasse;
    
    public static boolean authentifier(int idProfil, HttpServletRequest request) throws Exception{
        boolean retour = true;
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            Profil profilSession = new Profil();
            HttpSession session = request.getSession();
            profilSession = (Profil)session.getAttribute("profil");
            if(profilSession == null){
                retour = false;
            }
            if(idProfil != profilSession.getIdProfil()){
                retour = false;
            }
        }
        catch(Exception ex){
            con.close();
            ex.printStackTrace();
        }
        con.close();
        //return retour;
        return true;
    }
    
    public boolean login() throws Exception{
        boolean retour = false;
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM profil WHERE idProfil="+this.idProfil+" AND motDePasse='"+this.motDePasse+"'";
            ResultSet rs = stmt.executeQuery(requete);
            while(rs.next()){
                return true;
            }
            con.close();
        } catch(Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }
    
    public static List<Profil> selectAll() throws Exception {
        List<Profil> retour = new ArrayList<Profil>();
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM profil";
            ResultSet rs = stmt.executeQuery(requete);
            while(rs.next()){
                Profil profil = new Profil(rs.getInt("idProfil"), rs.getString("nomProfil"));
                retour.add(profil);
            }
            con.close();
        } catch(Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public Profil(int idProfil, String nomProfil, String motDePasse) {
        this.idProfil = idProfil;
        this.nomProfil = nomProfil;
        this.motDePasse = motDePasse;
    }
    
    public Profil(int idProfil, String nomProfil) {
        this.idProfil = idProfil;
        this.nomProfil = nomProfil;
    }
    
    public Profil() {
        
    }
    
    public int getIdProfil() {
        return idProfil;
    }

    public void setIdProfil(int idProfil) {
        this.idProfil = idProfil;
    }

    public String getNomProfil() {
        return nomProfil;
    }

    public void setNomProfil(String nomProfil) {
        this.nomProfil = nomProfil;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }
    
    
    
}
