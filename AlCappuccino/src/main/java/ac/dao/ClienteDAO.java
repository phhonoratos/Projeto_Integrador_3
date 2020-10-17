/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Cliente;
import ac.servlet.ServletBD;
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
 * @author joao
 */
public class ClienteDAO {
    
    public static List<Cliente> getClientes() {
        List<Cliente> listaClientes = new ArrayList();
        try {
            Connection con = ConexaoDB.getConexao();
            String query = "select * from cliente";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                               
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
                Date dt_nascimento = rs.getDate("data_nascimento");
                
                
                listaClientes.add(new Cliente(nome, email, cpf, telefone, 
                        estado_civil, sexo, cep, logradouro, numero, 
                        complemento, uf, bairro, cidade, dt_nascimento));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaClientes;
    }
    
    public static void addCliente(Cliente cliente) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.getConexao();
        String query = "insert into cliente(cpf, nome, email, telefone,"
                + "estado_civil, sexo, cep, logradouro, numero, complemento, uf,"
                + "bairro, cidade, data_nascimento) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cliente.getCpf());
        ps.setString(2, cliente.getNome());
        ps.setString(3, cliente.getEmail());
        ps.setString(4, cliente.getTelefone());
        ps.setString(5, cliente.getEstado_civil());
        ps.setString(6, cliente.getSexo());
        ps.setString(7, cliente.getCep());
        ps.setString(8, cliente.getLogradouro());
        ps.setString(9, cliente.getNumero());
        ps.setString(10, cliente.getComplemento());
        ps.setString(11, cliente.getUf());
        ps.setString(12, cliente.getBairro());
        ps.setString(13, cliente.getCidade());
        ps.setDate(14, cliente.getDt_nascimento());
        ps.execute();
    }
    
    public static void updateCliente(Cliente cliente) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "update cliente set nome=?,email=?,telefone=?,"
                + "estado_civil=?, sexo=?, cep=?, logradouro=?, numero=?, "
                + "complemento=?, uf=?, bairro=?, cidade=?, data_nascimento=? "
                + "where cpf=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cliente.getNome());
        ps.setString(2, cliente.getEmail());
        ps.setString(3, cliente.getTelefone());
        ps.setString(4, cliente.getEstado_civil());
        ps.setString(5, cliente.getSexo());
        ps.setString(6, cliente.getCep());
        ps.setString(7, cliente.getLogradouro());
        ps.setString(8, cliente.getNumero());
        ps.setString(9, cliente.getComplemento());
        ps.setString(10, cliente.getUf());
        ps.setString(11, cliente.getBairro());
        ps.setString(12, cliente.getCidade());
        ps.setDate(13, cliente.getDt_nascimento());
        ps.setString(14, cliente.getCpf());
        ps.execute();
    }
    
    public static void deleteCliente(String cpf) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "delete from cliente where cpf=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, cpf);
        ps.execute();
    }
    
    public static Cliente getCliente(String cpf) {
        Cliente cliente = null;
        try {
            Connection con = ConexaoDB.getConexao();
            String query = "select * from cliente where cpf=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
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
                Date dt_nascimento = rs.getDate("data_nascimento");
                
                
                cliente = (new Cliente(nome, email, cpf, telefone, 
                        estado_civil, sexo, cep, logradouro, numero, 
                        complemento, uf, bairro, cidade, dt_nascimento));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return cliente;
    }
}
