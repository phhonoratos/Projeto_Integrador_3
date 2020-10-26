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
import jdk.nashorn.internal.codegen.CompilerConstants;

/**
 *
 * @author paulo
 */
public class ConexaoDB {

    private static Connection CONEXAO;

    static {
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexaoDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Connection getConexao()
            throws ClassNotFoundException, SQLException {
        String url = "jdbc:derby://localhost:1527/alcapuccino";
        String user = "alcapuccino";
        String password = "alcapuccino";

        if (CONEXAO == null || CONEXAO.isClosed()) {
            CONEXAO = DriverManager.getConnection(url, user, password);
        }
        return CONEXAO;
    }

    protected void disconnect() throws SQLException {
        if (CONEXAO != null && !CONEXAO.isClosed()) {
            CONEXAO.close();
        }
    }

}
