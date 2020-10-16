/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paulo
 */
public class ConexaoDB {
    
    static {
        try {
            Class.forName("org.apache.derby.jdc.EmbeddedDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexaoDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Connection getConexao() 
            throws ClassNotFoundException, SQLException {
        String url = "jdbc:derby://localhost:1527/alcapuccino";
        String user = "alcapuccino";
        String password = "alcapuccino";
        return DriverManager.getConnection(url, user, password);
    }
    
}
