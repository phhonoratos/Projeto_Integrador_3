/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Cliente;
import ac.entidade.Funcionario;
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
        ps.setString(5, venda.getCliente().getCpf());
        ps.setString(6, venda.getFuncionario().getCpf());

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
        final String SQL_SELECT_VENDA = "select v.id, v.data, v.hora, v.total, v.tipo_pagamento, "
                                      + "f.cpf, f.nome, f.email, f.telefone, f.estado_civil, f.sexo, f.cep, "
                                      + "f.logradouro, f.numero, f.complemento, f.uf, f.bairro, f.cidade, "
                                      + "f.dt_nascimento, f.rg, f.cargo, f.salario, f.filial, f.dt_adm, "
                                      + "f.dt_dem, f.observacao, "
                                      + "c.cpf, c.nome, c.email, c.telefone, c.estado_civil, c.sexo, c.cep, "
                                      + "c.logradouro, c.numero, c.complemento, c.uf, c.bairro, c.cidade, "
                                      + "c.data_nascimento "
                                      + "from venda as v "
                                      + "join funcionarios as f on f.cpf = v.cpf_funcionario "
                                      + "join cliente as c on c.cpf = v.cpf_cliente";

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
            
            Funcionario funcionario = new Funcionario();
            funcionario.setCpf(rs.getString("f.cpf"));
            funcionario.setNome(rs.getString("f.nome"));
            funcionario.setTelefone(rs.getString("f.telefone"));
            funcionario.setEstadoCivil(rs.getString("f.estado_civil"));
            funcionario.setSexo(rs.getString("f.sexo"));
            funcionario.setCep(rs.getString("f.cep"));
            funcionario.setLogradouro(rs.getString("f.logradouro"));
            funcionario.setNumeroEndereco(rs.getString("f.numero"));
            funcionario.setComplemento(rs.getString("f.complemento"));
            funcionario.setUnidadeFederativa(rs.getString("f.uf"));
            funcionario.setBairro(rs.getString("f.bairro"));
            funcionario.setCidade(rs.getString("f.cidade"));
            funcionario.setDataNascimento(rs.getDate("f.dt_nascimento"));
            funcionario.setNumeroRg(rs.getString("f.rg"));
            funcionario.setCargo(rs.getString("f.cargo"));
            funcionario.setSalario(rs.getDouble("f.salario"));
            funcionario.setFilial(rs.getString("f.filial"));
            funcionario.setDataAdmissao(rs.getDate("f.dt_adm"));
            funcionario.setDataDemissao(rs.getDate("f.dt_dem"));
            funcionario.setObservacao(rs.getString("f.observacao"));
            
            venda.setFuncionario(funcionario);
            
            Cliente cliente = new Cliente();
            cliente.setCpf(rs.getString("c.cpf"));
            cliente.setNome(rs.getString("c.nome"));
            cliente.setEmail(rs.getString("c.email"));
            cliente.setTelefone(rs.getString("c.telefone"));
            cliente.setEstadoCivil(rs.getString("c.estado_civil"));
            cliente.setSexo(rs.getString("c.sexo"));
            cliente.setCep(rs.getString("c.cep"));
            cliente.setLogradouro(rs.getString("c.logradouro"));
            cliente.setNumeroEndereco(rs.getString("c.numero"));
            cliente.setComplemento(rs.getString("c.complemento"));
            cliente.setUnidadeFederativa(rs.getString("c.uf"));
            cliente.setBairro(rs.getString("c.bairro"));
            cliente.setCidade(rs.getString("c.cidade"));
            cliente.setDataNascimento(rs.getDate("c.data_nascimento"));
            
            venda.setCliente(cliente);

            vendas.add(venda);
        }

        return vendas;
    }

    public static List<Venda> select(Date dataInicial, Date dataFinal) throws ClassNotFoundException, SQLException {
        Connection conexao = ConexaoDB.getConexao();
        final String SQL_SELECT_VENDA_POR_DATA = "select v.id, v.data, v.hora, v.total, v.tipo_pagamento, "
                                               + "f.cpf, f.nome, f.email, f.telefone, f.estado_civil, f.sexo, f.cep, "
                                               + "f.logradouro, f.numero, f.complemento, f.uf, f.bairro, f.cidade, "
                                               + "f.dt_nascimento, f.rg, f.cargo, f.salario, f.filial, f.dt_adm, "
                                               + "f.dt_dem, f.observacao, "
                                               + "c.cpf, c.nome, c.email, c.telefone, c.estado_civil, c.sexo, c.cep, "
                                               + "c.logradouro, c.numero, c.complemento, c.uf, c.bairro, c.cidade, "
                                               + "c.data_nascimento "
                                               + "from venda as v "
                                               + "join funcionarios as f on f.cpf = v.cpf_funcionario "
                                               + "join cliente as c on c.cpf = v.cpf_cliente"
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
            
            Funcionario funcionario = new Funcionario();
            funcionario.setCpf(rs.getString("f.cpf"));
            funcionario.setNome(rs.getString("f.nome"));
            funcionario.setTelefone(rs.getString("f.telefone"));
            funcionario.setEstadoCivil(rs.getString("f.estado_civil"));
            funcionario.setSexo(rs.getString("f.sexo"));
            funcionario.setCep(rs.getString("f.cep"));
            funcionario.setLogradouro(rs.getString("f.logradouro"));
            funcionario.setNumeroEndereco(rs.getString("f.numero"));
            funcionario.setComplemento(rs.getString("f.complemento"));
            funcionario.setUnidadeFederativa(rs.getString("f.uf"));
            funcionario.setBairro(rs.getString("f.bairro"));
            funcionario.setCidade(rs.getString("f.cidade"));
            funcionario.setDataNascimento(rs.getDate("f.dt_nascimento"));
            funcionario.setNumeroRg(rs.getString("f.rg"));
            funcionario.setCargo(rs.getString("f.cargo"));
            funcionario.setSalario(rs.getDouble("f.salario"));
            funcionario.setFilial(rs.getString("f.filial"));
            funcionario.setDataAdmissao(rs.getDate("f.dt_adm"));
            funcionario.setDataDemissao(rs.getDate("f.dt_dem"));
            funcionario.setObservacao(rs.getString("f.observacao"));
            
            venda.setFuncionario(funcionario);
            
            Cliente cliente = new Cliente();
            cliente.setCpf(rs.getString("c.cpf"));
            cliente.setNome(rs.getString("c.nome"));
            cliente.setEmail(rs.getString("c.email"));
            cliente.setTelefone(rs.getString("c.telefone"));
            cliente.setEstadoCivil(rs.getString("c.estado_civil"));
            cliente.setSexo(rs.getString("c.sexo"));
            cliente.setCep(rs.getString("c.cep"));
            cliente.setLogradouro(rs.getString("c.logradouro"));
            cliente.setNumeroEndereco(rs.getString("c.numero"));
            cliente.setComplemento(rs.getString("c.complemento"));
            cliente.setUnidadeFederativa(rs.getString("c.uf"));
            cliente.setBairro(rs.getString("c.bairro"));
            cliente.setCidade(rs.getString("c.cidade"));
            cliente.setDataNascimento(rs.getDate("c.data_nascimento"));
            
            venda.setCliente(cliente);

            vendas.add(venda);
        }

        return vendas;
    }
}
