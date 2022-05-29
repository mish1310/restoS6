/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author User
 */
public class DBConnection {
    
    public static Connection getConnection() throws Exception {
        Class.forName("org.postgresql.Driver");
	    
        String url = "jdbc:postgresql://localhost:8082/resto";    
        String user = "postgres";
        String pwd = "mdpprom";
	    
        Connection connection = DriverManager.getConnection(url, user, pwd);
        return connection;
    }
    
}
