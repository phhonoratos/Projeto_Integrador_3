/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Venda;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joao
 */
public class VendaDAO {

    public static boolean addVenda(Venda venda) throws SQLException, ClassNotFoundException {
        boolean adicionou = false;

        Connection conexao = ConexaoDB.getConexao();

        PreparedStatement ps = conexao.prepareStatement("insert into venda(data, hora,total,tipo_pagamento, "
                + "cpf_cliente,cpf_funcionario) values (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
        ps.setDate(1, venda.getDataVenda());
        ps.setTime(2, venda.getHorarioVenda());
        ps.setFloat(3, venda.getValorTotal());
        ps.setString(4, venda.getTipoPagamento());
        ps.setString(5, venda.getCpfCliente());
        ps.setString(6, venda.getCpfFuncionario());

        int linhasAfetadas = ps.executeUpdate();
        if (linhasAfetadas > 0) {
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                venda.setId(rs.getInt(1));
            }
            adicionou = true;
        }

        return adicionou;
    }

    public static List<Venda> select() throws ClassNotFoundException, SQLException {
        Connection conexao = ConexaoDB.getConexao();
        final String SQL_SELECT_VENDA = "select * "//data, cpf_funcionario, cpf_cliente, tipo_pagamento, total"
                + "from venda";

        PreparedStatement ps = conexao.prepareStatement(SQL_SELECT_VENDA);

        ResultSet rs = ps.executeQuery();

        List<Venda> vendas = new ArrayList<>();
        while (rs.next()) {
            Venda venda = new Venda();
            venda.setId(rs.getInt("id"));
            venda.setDataVenda(rs.getDate("data"));
            venda.setHorarioVenda(rs.getTime("hora"));
            venda.setValorTotal(rs.getFloat("total"));
            venda.setTipoPagamento(rs.getString("tipo_pagamento"));
            venda.setCpfFuncionario(rs.getString("cpf_funcionario"));
            venda.setCpfCliente(rs.getString("cpf_cliente"));

            vendas.add(venda);
        }

        return vendas;
    }

    public static List<Venda> select(Date dataInicial, Date dataFinal) throws ClassNotFoundException, SQLException {
        Connection conexao = ConexaoDB.getConexao();
        final String SQL_SELECT_VENDA_POR_DATA = "select * "//data, cpf_funcionario, cpf_cliente, tipo_pagamento, total"
                + "from venda "
                + "where data between ? and ?";

        PreparedStatement ps = conexao.prepareStatement(SQL_SELECT_VENDA_POR_DATA);
        ps.setDate(1, dataInicial);
        ps.setDate(2, dataFinal);

        ResultSet rs = ps.executeQuery();

        List<Venda> vendas = new ArrayList<>();
        while (rs.next()) {
            Venda venda = new Venda();
            venda.setId(rs.getInt("id"));
            venda.setDataVenda(rs.getDate("data"));
            venda.setHorarioVenda(rs.getTime("hora"));
            venda.setValorTotal(rs.getFloat("total"));
            venda.setTipoPagamento(rs.getString("tipo_pagamento"));
            venda.setCpfFuncionario(rs.getString("cpf_funcionario"));
            venda.setCpfCliente(rs.getString("cpf_cliente"));

            vendas.add(venda);
        }

        return vendas;
    }
}
