/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Venda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author joao
 */
public class VendaDAO {
    public static void addVenda(Venda venda) throws SQLException, ClassNotFoundException {
        Connection con = ConexaoDB.getConexao();
        String query = "insert into venda(data, hora,total,tipo_pagamento, "
                + "cpf_cliente,cpf_funcionario) values (?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setDate(1, venda.getData_venda());
        ps.setTime(2, venda.getHora());
        ps.setFloat(3, venda.getTotal());
        ps.setString(4, venda.getTipo_pagamento());
        ps.setString(5, venda.getCpf_cliente());
        ps.setString(6, venda.getCpf_funcionario());
      
        ps.execute();
    }
}
