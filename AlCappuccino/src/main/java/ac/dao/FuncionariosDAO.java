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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public static List<Funcionarios> getFuncionarios() {
        List<Funcionarios> listaFuncionarios = new ArrayList();
        try {
            Connection con = ConexaoDB.getConexao();
            String query = "select * from funcionarios";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                String cpf = rs.getString("cpf");
                String nome = rs.getString("nome");
                String rg = rs.getString("rg");
                listaFuncionarios.add(new Funcionarios(cpf, nome, rg));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionariosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FuncionariosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaFuncionarios;
    }
    
    public static void updateFuncionario(Funcionarios funcionario) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "update funcionarios set nome = ?, rg = ? where cpf = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, funcionario.getNome());
        ps.setString(2, funcionario.getRg());
        ps.setString(3, funcionario.getCpf());
        ps.execute();
    }
    
    public static Funcionarios getFuncionario(String cpf) {
        Funcionarios funcionario = null;
        try {
            Connection con = ConexaoDB.getConexao();
            String query = "select * from funcionarios where cpf = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                String nome = rs.getString("nome");
                String rg = rs.getString("rg");
                funcionario = new Funcionarios(cpf, nome, rg);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FuncionariosDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FuncionariosDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return funcionario;
    }
    
    public static void deleteFuncionario(String cpf) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "delete from funcionarios where cpf = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cpf);
        ps.execute();
    }
    
}
