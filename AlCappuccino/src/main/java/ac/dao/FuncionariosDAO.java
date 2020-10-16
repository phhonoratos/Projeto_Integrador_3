/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Funcionarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author paulo
 */
public class FuncionariosDAO {
    
    public static void addFuncionario(Funcionarios funcionarios) throws ClassNotFoundException, SQLException {
        
        Connection con = ConexaoDB.getConexao();
        String query = "insert into funcionarios(cpf, nome, rg, sexo, dt_nasc, estado_civil, telefone1, telefone2, email, endereco, "
                + "complemento, cidade, estado, cargo, salario, comissao, filial, dt_adm, dt_dem, status) values(?, ?, ?, ?, ?, ?, "
                + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setLong(1, funcionarios.getCpf());
        ps.setString(2, funcionarios.getNome());
        ps.setLong(3, funcionarios.getRg());
        ps.setString(4, funcionarios.getSexo());
        ps.setString(5, funcionarios.getDt_nasc());
        ps.setString(6, funcionarios.getEstado_civil());
        ps.setLong(7, funcionarios.getTelefone1());
        ps.setLong(8, funcionarios.getTelefone2());
        ps.setString(9, funcionarios.getEmail());
        ps.setString(10, funcionarios.getEndereco());
        ps.setString(11, funcionarios.getComplemento());
        ps.setString(12, funcionarios.getCidade());
        ps.setString(13, funcionarios.getEstado());
        ps.setString(14, funcionarios.getCargo());
        ps.setDouble(15, funcionarios.getSalario());
        ps.setFloat(16, funcionarios.getComissao());
        ps.setString(17, funcionarios.getFilial());
        ps.setString(18, funcionarios.getDt_adm());
        ps.setString(19, funcionarios.getDt_dem());
        ps.setBoolean(20, funcionarios.isStatus());
        ps.execute();
    }
    
}
