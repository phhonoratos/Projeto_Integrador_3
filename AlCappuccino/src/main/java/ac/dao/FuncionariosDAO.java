/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Funcionarios;
import java.sql.Connection;
import java.sql.Date;
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
        String query = "insert into funcionarios(nome, email, cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, uf, bairro, "
                + "cidade, dt_nascimento, rg, cargo, salario, filial, dt_adm, dt_dem) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, funcionarios.getNome());
        ps.setString(2, funcionarios.getEmail());
        ps.setString(3, funcionarios.getCpf());
        ps.setString(4, funcionarios.getTelefone());
        ps.setString(5, funcionarios.getEstado_civil());
        ps.setString(6, funcionarios.getSexo());
        ps.setString(7, funcionarios.getCep());
        ps.setString(8, funcionarios.getLogradouro());
        ps.setString(9, funcionarios.getNumero());
        ps.setString(10, funcionarios.getComplemento());
        ps.setString(11, funcionarios.getUf());
        ps.setString(12, funcionarios.getBairro());
        ps.setString(13, funcionarios.getCidade());
        ps.setDate(14, funcionarios.getDt_nascimento());
        ps.setString(15, funcionarios.getRg());
        ps.setString(16, funcionarios.getCargo());
        ps.setDouble(17, funcionarios.getSalario());
        ps.setString(18, funcionarios.getFilial());
        ps.setDate(19, funcionarios.getDt_adm());
        ps.setDate(20, funcionarios.getDt_dem());
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
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String cpf = rs.getString("cpf");
                String telefone = rs.getString("telefone");
                String estado_civil = rs.getString("estado_civil");
                String sexo = rs.getString("sexo");
                String cep = rs.getString("cep");
                String logradouro = rs.getString("logradouro");
                String numero = rs.getString("numero");
                String complemento = rs.getString("complemento");
                String uf = rs.getString("uf");
                String bairro = rs.getString("bairro");
                String cidade = rs.getString("cidade");
                Date dt_nascimento = rs.getDate("dt_nascimento");
                String rg = rs.getString("rg");
                String cargo = rs.getString("cargo");
                double salario = rs.getDouble("salario");
                String filial = rs.getString("filial");
                Date dt_adm = rs.getDate("dt_adm");
                Date dt_dem = rs.getDate("dt_dem");
                
                listaFuncionarios.add(new Funcionarios(rg, cargo, salario, filial, dt_adm, dt_dem, nome, email, cpf, telefone, 
                        estado_civil, sexo, cep, logradouro, numero, complemento, uf, bairro, cidade, dt_nascimento));
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
        String query = "update funcionarios set nome = ?, email = ?, telefone = ?, estado_civil = ?, sexo = ?, cep = ?, logradouro = ?, numero = ?, "
                + "complemento = ?, uf = ?, bairro = ?, cidade = ?, dt_nascimento = ?, rg = ?, cargo = ?, salario = ?, filial = ?, dt_adm = ?, dt_dem = ? "
                + "where cpf = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, funcionario.getNome());
        ps.setString(2, funcionario.getEmail());
        ps.setString(3, funcionario.getTelefone());
        ps.setString(4, funcionario.getEstado_civil());
        ps.setString(5, funcionario.getSexo());
        ps.setString(6, funcionario.getCep());
        ps.setString(7, funcionario.getLogradouro());
        ps.setString(8, funcionario.getNumero());
        ps.setString(9, funcionario.getComplemento());
        ps.setString(10, funcionario.getUf());
        ps.setString(11, funcionario.getBairro());
        ps.setString(12, funcionario.getCidade());
        ps.setDate(13, funcionario.getDt_nascimento());
        ps.setString(14, funcionario.getRg());
        ps.setString(15, funcionario.getCargo());
        ps.setDouble(16, funcionario.getSalario());
        ps.setString(17, funcionario.getFilial());
        ps.setDate(18, funcionario.getDt_adm());
        ps.setDate(19, funcionario.getDt_dem());
        ps.setString(20, funcionario.getCpf());
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
                String email = rs.getString("email");
                String telefone = rs.getString("telefone");
                String estado_civil = rs.getString("estado_civil");
                String sexo = rs.getString("sexo");
                String cep = rs.getString("cep");
                String logradouro = rs.getString("logradouro");
                String numero = rs.getString("numero");
                String complemento = rs.getString("complemento");
                String uf = rs.getString("uf");
                String bairro = rs.getString("bairro");
                String cidade = rs.getString("cidade");
                Date dt_nascimento = rs.getDate("dt_nascimento");
                String rg = rs.getString("rg");
                String cargo = rs.getString("cargo");
                double salario = rs.getDouble("salario");
                String filial = rs.getString("filial");
                Date dt_adm = rs.getDate("dt_adm");
                Date dt_dem = rs.getDate("dt_dem");
                funcionario = new Funcionarios(rg, cargo, salario, filial, dt_adm, dt_dem, nome, email, cpf, telefone, 
                        estado_civil, sexo, cep, logradouro, numero, complemento, uf, bairro, cidade, dt_nascimento);
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
