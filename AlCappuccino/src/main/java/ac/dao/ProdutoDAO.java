/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Produto;
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
 * @author danil
 */
public class ProdutoDAO {

    public static List<Produto> getProduto() {
        List<Produto> listaProduto = new ArrayList();
        try {
            Connection con = ConexaoDB.getConexao();
            String query = "select * from Produto";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tipo = rs.getString("tipo");
                String nome = rs.getString("nome");
                int qtd_estoque = rs.getInt("qtd_estoque");
                double preco = rs.getDouble("preco");
                double porcentagem = rs.getDouble("porcentagem");
                double valor_venda = rs.getDouble("valor_venda");
                listaProduto.add(new Produto(id, tipo, nome, qtd_estoque, preco, porcentagem, valor_venda));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaProduto;
    }

    public static int addProduto(Produto produto) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.getConexao();
        String query = "insert into Produto(id, tipo, nome, qtd_estoque, preco, porcentagem, valor_venda) values (?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, produto.getId());
        ps.setString(2, produto.getTipo());
        ps.setString(3, produto.getNome());
        ps.setInt(4, produto.getQtd_estoque());
        ps.setDouble(5, produto.getPreco());
        ps.setDouble(6, produto.getPorcentagem());
        ps.setDouble(7, produto.getValor_venda());
        return ps.executeUpdate();

    }

    public static int updateProduto(Produto produto) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "update produto set tipo=?, nome=?, qtd_estoque=?, preco=?, porcentagem=?, valor_venda=? where id=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, produto.getTipo());
        ps.setString(2, produto.getNome());
        ps.setInt(3, produto.getQtd_estoque());
        ps.setDouble(4, produto.getPreco());
        ps.setDouble(5, produto.getPorcentagem());
        ps.setDouble(6, produto.getValor_venda());
        ps.setInt(7, produto.getId());
        return ps.executeUpdate();
    }

    public static void deleteProduto(String nome) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "delete from produto where nome=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, nome);
        ps.execute();
    }

    public static Produto getProduto(String nome) {
        Produto produto = null;
        try {
            Connection con = ConexaoDB.getConexao();
            String query = "select * from produto where nome=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nome);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String tipo = rs.getString("tipo");
                int qtd_estoque = rs.getInt("qtd_estoque");
                double preco = rs.getDouble("preco");
                double porcentagem = rs.getDouble("porcentagem");
                double valor_venda = rs.getDouble("valor_venda");
                
                produto = new Produto(id, tipo, nome, qtd_estoque, preco, porcentagem, valor_venda);

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return produto;
    }
}
