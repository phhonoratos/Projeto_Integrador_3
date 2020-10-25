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
        boolean retorno = false;
        Connection con = ConexaoDB.getConexao();

        PreparedStatement ps = con.prepareStatement("insert into venda(data, hora,total,tipo_pagamento, "
                + "cpf_cliente,cpf_funcionario) values (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
        ps.setDate(1, venda.getData_venda());
        ps.setTime(2, venda.getHora());
        ps.setFloat(3, venda.getTotal());
        ps.setString(4, venda.getTipo_pagamento());
        ps.setString(5, venda.getCpf_cliente());
        ps.setString(6, venda.getCpf_funcionario());
        
        int linhasAfetadas = ps.executeUpdate();
        if (linhasAfetadas > 0) {
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                venda.setId(rs.getInt(1));
            }

            retorno = true;
        }

        return retorno;
    }
    
    public static List<Venda> select() throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "select * "//data, cpf_funcionario, cpf_cliente, tipo_pagamento, total"
                     + "from venda";
        
        PreparedStatement ps = con.prepareStatement(query);
        
        ResultSet rs = ps.executeQuery();
        
        List<Venda> vendas = new ArrayList<>();
        while (rs.next()) {            
            Venda venda = new Venda();
            venda.setId(rs.getInt("id"));
            venda.setData_venda(rs.getDate("data"));
            venda.setHora(rs.getTime("hora"));
            venda.setTotal(rs.getFloat("total"));
            venda.setTipo_pagamento(rs.getString("tipo_pagamento"));
            venda.setCpf_funcionario(rs.getString("cpf_funcionario"));
            venda.setCpf_cliente(rs.getString("cpf_cliente"));
            
            vendas.add(venda);
        }
        
        return vendas;
    }
    
    public static List<Venda> select(Date dataInicial, Date dataFinal) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        String query = "select * "//data, cpf_funcionario, cpf_cliente, tipo_pagamento, total"
                     + "from venda "
                     + "where data between ? and ?";
        
        PreparedStatement ps = con.prepareStatement(query);
        ps.setDate(1, dataInicial);
        ps.setDate(2, dataFinal);
        
        ResultSet rs = ps.executeQuery();
        
        List<Venda> vendas = new ArrayList<>();
        while (rs.next()) {            
            Venda venda = new Venda();
            venda.setId(rs.getInt("id"));
            venda.setData_venda(rs.getDate("data"));
            venda.setHora(rs.getTime("hora"));
            venda.setTotal(rs.getFloat("total"));
            venda.setTipo_pagamento(rs.getString("tipo_pagamento"));
            venda.setCpf_funcionario(rs.getString("cpf_funcionario"));
            venda.setCpf_cliente(rs.getString("cpf_cliente"));
            
            vendas.add(venda);
        }
        
        return vendas;
    }
}
