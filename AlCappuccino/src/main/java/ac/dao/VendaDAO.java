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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author joao
 */
public class VendaDAO {

    private static ResultSet rs = null;

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
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                venda.setId(rs.getInt(1));
            }

            retorno = true;
        }

        return retorno;
    }
}
