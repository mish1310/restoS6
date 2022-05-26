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
 * @author P3B-1222
 */
public class Table {
    int idTable;
    int numero;
    int placeDispo;

    public Table(int idTable, int numero, int placeDispo) {
        this.idTable = idTable;
        this.numero = numero;
        this.placeDispo = placeDispo;
    }

    public Table() {
    }

    
    public int getIdTable() {
        return idTable;
    }

    public void setIdTable(int idTable) {
        this.idTable = idTable;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getPlaceDispo() {
        return placeDispo;
    }

    public void setPlaceDispo(int placeDispo) {
        this.placeDispo = placeDispo;
    }
    
    public List<Table> selectAll()throws Exception
    {
        List retour=new ArrayList();
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            String requete = "SELECT * FROM Tables";
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                Table c = new Table(rs.getInt("idTable"), rs.getInt("numero"),rs.getInt("placeDispo"));
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
    
}
