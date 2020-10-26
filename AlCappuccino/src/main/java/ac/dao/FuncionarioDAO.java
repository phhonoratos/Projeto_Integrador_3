/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Funcionario;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author paulo
 */
public class FuncionarioDAO {

    public static void addFuncionario(Funcionario funcionario) throws ClassNotFoundException, SQLException {

        Connection conexao = ConexaoDB.getConexao();
        final String SQL_INSERT_FUNCIONARIO = "insert into funcionarios(nome, email, cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, uf, bairro, "
                + "cidade, dt_nascimento, rg, cargo, salario, filial, dt_adm, dt_dem, observacao) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conexao.prepareStatement(SQL_INSERT_FUNCIONARIO);
        ps.setString(1, funcionario.getNome());
        ps.setString(2, funcionario.getEmail());
        ps.setString(3, funcionario.getCpf());
        ps.setString(4, funcionario.getTelefone());
        ps.setString(5, funcionario.getEstadoCivil());
        ps.setString(6, funcionario.getSexo());
        ps.setString(7, funcionario.getCep());
        ps.setString(8, funcionario.getLogradouro());
        ps.setString(9, funcionario.getNumeroEndereco());
        ps.setString(10, funcionario.getComplemento());
        ps.setString(11, funcionario.getUnidadeFederativa());
        ps.setString(12, funcionario.getBairro());
        ps.setString(13, funcionario.getCidade());
        ps.setDate(14, funcionario.getDataNascimento());
        ps.setString(15, funcionario.getNumeroRg());
        ps.setString(16, funcionario.getCargo());
        ps.setDouble(17, funcionario.getSalario());
        ps.setString(18, funcionario.getFilial());
        ps.setDate(19, funcionario.getDataAdmissao());
        ps.setDate(20, funcionario.getDataDemissao());
        ps.setString(21, funcionario.getObservacao());
        ps.execute();
    }

    public static List<Funcionario> getFuncionarios() {
        List<Funcionario> listaFuncionarios = new ArrayList();
        try {
            Connection con = ConexaoDB.getConexao();
            final String SQL_SELECT_FUNCIONARIOS = "select * from funcionarios";
            PreparedStatement ps = con.prepareStatement(SQL_SELECT_FUNCIONARIOS);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String cpf = rs.getString("cpf");
                String telefone = rs.getString("telefone");
                String estado_civil = rs.getString("estado_civil");
                String sexo = rs.getString("sexo");
                String cep = rs.getString("cep");
                String logradouro = rs.getString("logradouro");
                String numero = rs.getString("numero");
                String complemento = rs.getString("complemento");
                String unidadeFederativa = rs.getString("uf");
                String bairro = rs.getString("bairro");
                String cidade = rs.getString("cidade");
                Date dataNascimento = rs.getDate("dt_nascimento");
                String numeroRg = rs.getString("rg");
                String cargo = rs.getString("cargo");
                double salario = rs.getDouble("salario");
                String filial = rs.getString("filial");
                Date dataAdmissao = rs.getDate("dt_adm");
                Date dataDemissao = rs.getDate("dt_dem");
                String observacao = rs.getString("observacao");

                listaFuncionarios.add(new Funcionario(nome, numero, cargo, salario, filial, dataAdmissao, dataDemissao, observacao, email, cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, cidade, bairro, cidade, dataNascimento));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaFuncionarios;
    }

    public static void updateFuncionario(Funcionario funcionario) throws ClassNotFoundException, SQLException {
        Connection con = ConexaoDB.getConexao();
        final String SQL_UPDATE_FUNCIONARIO = "update funcionarios set nome = ?, email = ?, telefone = ?, estado_civil = ?, sexo = ?, cep = ?, logradouro = ?, numero = ?, "
                + "complemento = ?, uf = ?, bairro = ?, cidade = ?, dt_nascimento = ?, rg = ?, cargo = ?, salario = ?, filial = ?, dt_adm = ?, dt_dem = ?, "
                + "observacao = ? where cpf = ?";

        PreparedStatement ps = con.prepareStatement(SQL_UPDATE_FUNCIONARIO);
        ps.setString(1, funcionario.getNome());
        ps.setString(2, funcionario.getEmail());
        ps.setString(3, funcionario.getTelefone());
        ps.setString(4, funcionario.getEstadoCivil());
        ps.setString(5, funcionario.getSexo());
        ps.setString(6, funcionario.getCep());
        ps.setString(7, funcionario.getLogradouro());
        ps.setString(8, funcionario.getNumeroEndereco());
        ps.setString(9, funcionario.getComplemento());
        ps.setString(10, funcionario.getUnidadeFederativa());
        ps.setString(11, funcionario.getBairro());
        ps.setString(12, funcionario.getCidade());
        ps.setDate(13, funcionario.getDataNascimento());
        ps.setString(14, funcionario.getNumeroRg());
        ps.setString(15, funcionario.getCargo());
        ps.setDouble(16, funcionario.getSalario());
        ps.setString(17, funcionario.getFilial());
        ps.setDate(18, funcionario.getDataAdmissao());
        ps.setDate(19, funcionario.getDataDemissao());
        ps.setString(20, funcionario.getObservacao());
        ps.setString(21, funcionario.getCpf());
        ps.execute();
    }

    public static Funcionario getFuncionario(String cpf) {
        Funcionario funcionario = null;
        try {
            Connection con = ConexaoDB.getConexao();
            final String SQL_SELECT_FUNCIONARIO = "select * from funcionarios where cpf = ?";
            PreparedStatement ps = con.prepareStatement(SQL_SELECT_FUNCIONARIO);
            ps.setString(1, cpf);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String telefone = rs.getString("telefone");
                String estado_civil = rs.getString("estado_civil");
                String sexo = rs.getString("sexo");
                String cep = rs.getString("cep");
                String logradouro = rs.getString("logradouro");
                String numero = rs.getString("numero");
                String complemento = rs.getString("complemento");
                String unidadeFederativa = rs.getString("uf");
                String bairro = rs.getString("bairro");
                String cidade = rs.getString("cidade");
                Date dataNascimento = rs.getDate("dt_nascimento");
                String numeroRg = rs.getString("rg");
                String cargo = rs.getString("cargo");
                double salario = rs.getDouble("salario");
                String filial = rs.getString("filial");
                Date dataAdmissao = rs.getDate("dt_adm");
                Date dataDemissao = rs.getDate("dt_dem");
                String observacao = rs.getString("observacao");

                funcionario = new Funcionario(nome, numero, cargo, salario, filial, dataAdmissao, dataDemissao, observacao, email, cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade, dataNascimento);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FuncionarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return funcionario;
    }

    public static void deleteFuncionario(String cpf) throws ClassNotFoundException, SQLException {
        Connection conexao = ConexaoDB.getConexao();
        final String SQL_DELETE_FUNCIONARIO = "delete from funcionarios where cpf = ?";
        PreparedStatement ps = conexao.prepareStatement(SQL_DELETE_FUNCIONARIO);
        ps.setString(1, cpf);
        ps.execute();
    }

    // <Não testado>
    public static Funcionario obterGerenteRegional(String id) {
        // Talvez Atributo Admin
        final String SQL_SELECT_GERENTE_REGIONAL = "SELECT * FROM funcionario WHERE id = ? AND cargo = ?";

        try (Connection conexao = ConexaoDB.getConexao();
                PreparedStatement SQL = conexao.prepareStatement(SQL_SELECT_GERENTE_REGIONAL);
                ResultSet result = SQL.executeQuery()) {

            SQL.setString(1, id);
            SQL.setString(2, "gerente");

            if (result.next()) {
                String nome = result.getString("nome");
                String email = result.getString("email");
                String cpf = result.getString("cpf");
                String telefone = result.getString("telefone");
                String estado_civil = result.getString("estado_civil");
                String sexo = result.getString("sexo");
                String cep = result.getString("cep");
                String logradouro = result.getString("logradouro");
                String numero = result.getString("numero");
                String complemento = result.getString("complemento");
                String unidadeFederativa = result.getString("uf");
                String bairro = result.getString("bairro");
                String cidade = result.getString("cidade");
                Date dataNascimento = result.getDate("dt_nascimento");
                String numeroRg = result.getString("rg");
                String cargo = result.getString("cargo");
                double salario = result.getDouble("salario");
                String filial = result.getString("filial");
                Date dataAdmissao = result.getDate("dt_adm");
                Date dataDemissao = result.getDate("dt_dem");
                String observacao = result.getString("observacao");

                return new Funcionario(nome, numeroRg, cargo, salario, filial, dataAdmissao, dataDemissao, observacao, email, cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade, dataNascimento);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EstabelecimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

}
