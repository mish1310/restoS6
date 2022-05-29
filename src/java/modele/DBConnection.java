/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.sql.DataSource;

/**
 *
 * @author User
 */
public class DBConnection {
    
    private static final String url = "jdbc:postgresql://localhost:5432/restoS6";
    private static final String user = "postgres";
    private static final String pwd = "mdpprom13";

    public static DataSource createDataSource() {
        /* use a data source with connection pooling */
        org.postgresql.ds.PGPoolingDataSource ds = new org.postgresql.ds.PGPoolingDataSource();
        ds.setUrl(url);
        ds.setUser(user);
        ds.setPassword(pwd);
        /* the connection pool will have 10 to 20 connections */
        ds.setInitialConnections(10);
        ds.setMaxConnections(20);
        /* use SSL connections without checking server certificate */

        return ds;
    }

    public static Connection getConnection() throws Exception {
        Class.forName("org.postgresql.Driver");

        Connection connection = DriverManager.getConnection(url, user, pwd);
        return connection;
    }

}
