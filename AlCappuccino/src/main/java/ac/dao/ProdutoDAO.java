/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Estabelecimento;
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
            Connection conexao = ConexaoDB.getConexao();
            final String SQL_SELECT_PRODUTO = "select * from Produto";
            PreparedStatement ps = conexao.prepareStatement(SQL_SELECT_PRODUTO);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tipo = rs.getString("tipo");
                String nome = rs.getString("nome");
                int quantidadeEstoque = rs.getInt("qtd_estoque");
                double preco = rs.getDouble("preco");
                double porcentagem = rs.getDouble("porcentagem");
                double valor_venda = rs.getDouble("valor_venda");
                int id_estabelecimento = rs.getInt("id_estabelecimento");
                
                Estabelecimento estabelecimento = new Estabelecimento();
                estabelecimento.setId(id_estabelecimento);
                
                listaProduto.add(new Produto(id, tipo, nome, quantidadeEstoque, preco, porcentagem, valor_venda, estabelecimento));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }

        return listaProduto;
    }

    public static int addProduto(Produto produto) throws SQLException, ClassNotFoundException {
        Connection conexao = ConexaoDB.getConexao();
        final String SQL_INSERT_PRODUTO = "insert into Produto(tipo, nome, qtd_estoque, preco, porcentagem, valor_venda, id_estabelecimento) values (?,?,?,?,?,?,?)";
        PreparedStatement ps = conexao.prepareStatement(SQL_INSERT_PRODUTO);
        ps.setString(1, produto.getTipo());
        ps.setString(2, produto.getNome());
        ps.setInt(3, produto.getQuantidadeEstoque());
        ps.setDouble(4, produto.getPreco());
        ps.setDouble(5, produto.getPorcentagem());
        ps.setDouble(6, produto.getValorVenda());
        ps.setInt(7, produto.getEstabelecimento().getId());

        return ps.executeUpdate();
    }

    public static int updateProduto(Produto produto) throws ClassNotFoundException, SQLException {
        Connection conexao = ConexaoDB.getConexao();
        final String SQL_UPDATE_PRODUTO = "update produto set tipo=?, nome=?, qtd_estoque=?, preco=?, porcentagem=?, valor_venda=?, id_estabelecimento = ? where id=?";
        PreparedStatement ps = conexao.prepareStatement(SQL_UPDATE_PRODUTO);
        ps.setString(1, produto.getTipo());
        ps.setString(2, produto.getNome());
        ps.setInt(3, produto.getQuantidadeEstoque());
        ps.setDouble(4, produto.getPreco());
        ps.setDouble(5, produto.getPorcentagem());
        ps.setDouble(6, produto.getValorVenda());
         ps.setInt(7, produto.getEstabelecimento().getId());
        ps.setInt(8, produto.getId());

        return ps.executeUpdate();
    }

    public static void deleteProduto(int id) throws ClassNotFoundException, SQLException {
        Connection conexao = ConexaoDB.getConexao();
        final String SQL_DELETE_PRODUTO = "delete from produto where id=?";
        PreparedStatement ps = conexao.prepareStatement(SQL_DELETE_PRODUTO);
        ps.setInt(1, id);
        ps.execute();
    }

    public static Produto getProduto(int id) {
        Produto produto = null;
        try {
            Connection conexao = ConexaoDB.getConexao();
            final String SQL_SELECT_PRODUTO = "select * from produto where id=?";
            PreparedStatement ps = conexao.prepareStatement(SQL_SELECT_PRODUTO);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                
                String tipo = rs.getString("tipo");
                String nome = rs.getString("nome");
                int quantidadeEstoque = rs.getInt("qtd_estoque");
                double preco = rs.getDouble("preco");
                double porcentagem = rs.getDouble("porcentagem");
                double valorVenda = rs.getDouble("valor_venda");
                int id_estabelecimento = rs.getInt("id_estabelecimento");
                
                Estabelecimento estabelecimento = new Estabelecimento();
                estabelecimento.setId(id_estabelecimento);                

                produto = new Produto(id, tipo, nome, quantidadeEstoque, preco, porcentagem, valorVenda, estabelecimento);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return produto;
    }
}
