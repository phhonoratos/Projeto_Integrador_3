/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.DetalheVenda;
import ac.entidade.Produto;
import ac.entidade.Venda;
import ac.servlet.ServletBD;
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
 * @author joao
 */
public class DetalheVendaDAO {
    public static int addDetalheVenda(DetalheVenda detalheVenda) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.getConexao();
        String query = "insert into detalhevenda(id_produto,qtd_produto,valor,id_venda) values (?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, detalheVenda.getProduto().getId());
        ps.setInt(2, detalheVenda.getQuantidade());
        ps.setFloat(3, detalheVenda.getValorTotal());
        ps.setInt(4, detalheVenda.getVenda().getId());
      
        int retorno = ps.executeUpdate();
        return retorno;
    }
    
    public static List<DetalheVenda> listaDetalheVenda() throws SQLException, ClassNotFoundException {
        List<DetalheVenda> listaDetalheVenda = new ArrayList();
        try {
            Connection con = ConexaoDB.getConexao();
            String query = "select * from detalhevenda";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                               
                int id = rs.getInt("id");
                int idProduto = rs.getInt("id_produto");
                int quantidade = rs.getInt("qtd_produto");
                int idVenda = rs.getInt("id_venda");
                float valor = rs.getFloat("valor");
                
                Produto produto = new Produto();
                produto.setId(idProduto);
                Venda venda = new Venda();
                venda.setId(idVenda);
                
                listaDetalheVenda.add(new DetalheVenda(id, quantidade, produto, venda, valor));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaDetalheVenda;
    }
    
    public static List<DetalheVenda> listaDetalheVenda(int idVenda) throws SQLException, ClassNotFoundException {
        List<DetalheVenda> listaDetalheVenda = new ArrayList();
        try {
            Connection con = ConexaoDB.getConexao();
            String query = "select * from detalhevenda where id_venda = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idVenda);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                               
                int id = Integer.parseInt(rs.getString("id"));
                int id_produto = Integer.parseInt(rs.getString("id_produto"));
                int qtd_produto = Integer.parseInt(rs.getString("qtd_produto"));
                int id_venda = Integer.parseInt(rs.getString("id_venda"));
                float valor = Float.parseFloat(rs.getString("valor"));
                
                Produto produto = new Produto();
                produto.setId(id_produto);
                Venda venda = new Venda();
                venda.setId(id_venda);
                
                listaDetalheVenda.add(new DetalheVenda(id, qtd_produto, produto, venda, valor));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaDetalheVenda;
    }
}
