/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Manda
 */
public class TypePaiement {
    
    private int idTypePayement;

    public static List<TypePaiement> selectAll() throws Exception{
        List<TypePaiement> listeTypePaiement = new ArrayList<TypePaiement>();
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM typePaiement";
            ResultSet rs = stmt.executeQuery(requete);
            while(rs.next()){
                TypePaiement tp = new TypePaiement(rs.getInt("idtypepaiement"), rs.getString("mode"));
                listeTypePaiement.add(tp);
            }
            con.close();
        }
        catch(Exception ex) {
            if(con != null) con.close();
            throw ex;
        }
        return listeTypePaiement;
    }
    
    
    public TypePaiement(int idTypePayement, String nomTypePayement) {
        this.idTypePayement = idTypePayement;
        this.nomTypePayement = nomTypePayement;
    }
    
    public TypePaiement(int idTypePayement) {
        this.idTypePayement = idTypePayement;
    }
    
    private String nomTypePayement;

    public int getIdTypePayement() {
        return idTypePayement;
    }

    public void setIdTypePayement(int idTypePayement) {
        this.idTypePayement = idTypePayement;
    }

    public String getNomTypePayement() {
        return nomTypePayement;
    }

    public void setNomTypePayement(String nomTypePayement) {
        this.nomTypePayement = nomTypePayement;
    }
    
}
