/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;
import java.sql.Connection;
import java.util.List;
import modele.DBConnection;
import modele.DetailCommande;
import modele.Serveur;
/**
 *
 * @author Dx2Big
 */
public class main {
    public static void main(String[] args)throws Exception
    {
        Connection c=DBConnection.getConnection();
        
        Serveur s=new Serveur(1);
        float ret=s.getPourBoireServeur(c,"2022-03-21","2022-03-19");
        System.out.println(ret);
    }
}
