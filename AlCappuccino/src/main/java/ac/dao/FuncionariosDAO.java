/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Funcionarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author paulo
 */
public class FuncionariosDAO {
    
    public static void addFuncionario(Funcionarios funcionarios) throws ClassNotFoundException, SQLException {
        
        Connection con = ConexaoDB.getConexao();
        String query = "insert into funcionarios(cpf, nome, rg) values(?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, funcionarios.getCpf());
        ps.setString(2, funcionarios.getNome());
        ps.setString(3, funcionarios.getRg());
        ps.execute();
    }
    
}
