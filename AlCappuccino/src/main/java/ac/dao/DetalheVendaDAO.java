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
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
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
            String query = "select d.id as d_id, d.qtd_produto as d_qtd_produto, d.valor as d_valor, "
                    + "p.id as p_id, p.tipo as p_tipo, p.nome as p_nome, p.qtd_estoque as p_qtd_estoque, p.preco as p_preco, p.porcentagem as p_porcentagem, p.valor_venda as p_valor_venda, "
                    + "v.id as v_id, v.data as v_data, v.hora as v_hora, v.total as v_total, v.tipo_pagamento as v_tipo_pagamento "
                    + "from detalhevenda as d "
                    + "join produto as p on p.id = d.id_produto "
                    + "join venda as v on v.id = d.id_venda ";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                               
                int id = rs.getInt("d_id");
                int quantidade = rs.getInt("d_qtd_produto");
                float valor = rs.getFloat("d_valor");
                
                int idProduto = rs.getInt("p_id");
                String tipo = rs.getString("p_tipo");
                String nome = rs.getString("p_nome");
                int quantidadeEstoque = rs.getInt("p_qtd_estoque");
                float preco = rs.getFloat("p_preco");
                float porcentagem = rs.getFloat("p_porcentagem");
                float valorVenda = rs.getFloat("p_valor_venda");
                
                int idVenda = rs.getInt("v_id");
                Date dataVenda = rs.getDate("v_data");
                Time horarioVenda = rs.getTime("v_hora");
                float valorTotal = rs.getFloat("v_total");
                String tipoPagamento = rs.getString("v_tipo_pagamento");
                
                //sillas
                Produto produto = new Produto(idProduto, tipo, nome, quantidadeEstoque, preco, porcentagem, valorVenda);
                Venda venda = new Venda(idVenda, dataVenda, valorTotal, tipoPagamento, null, null, horarioVenda);
                
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
