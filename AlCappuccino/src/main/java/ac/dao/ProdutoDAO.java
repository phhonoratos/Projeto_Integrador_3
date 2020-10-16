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
                double preco = rs.getDouble("preco");
                double porcentagem = rs.getDouble("porcentagem");
                double valor_venda = rs.getDouble("valor_venda");
                listaProduto.add(new Produto(id, tipo, nome, preco, porcentagem, valor_venda));
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
        
        public static void addProduto(Produto produto) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.getConexao();
        String query = "insert into Produto(id, tipo, nome, preco, porcentagem, valor_venda) values (?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, produto.getId());
        ps.setString(2, produto.getTipo());
        ps.setString(2, produto.getNome());
        ps.setDouble(3, produto.getPreco());
        ps.setDouble(3, produto.getPorcentagem());
        ps.setDouble(3, produto.getValor_venda());
        ps.execute();
    }
        
        public static void updateProduto(Produto produto) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "update cliente set id=?, tipo=?, nome=?, preco=?, porcentagem=?, valor_venda=? where cpf=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, produto.getId());
        ps.setString(2, produto.getTipo());
        ps.setString(2, produto.getNome());
        ps.setDouble(3, produto.getPreco());
        ps.setDouble(3, produto.getPorcentagem());
        ps.setDouble(3, produto.getValor_venda());
        ps.execute();
    }
}
