/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Cliente;
import ac.entidade.Estabelecimento;
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
                + "f.dt_nascimento, f.rg, f.cargo, f.salario, f.id_estabelecimento, f.dt_adm, "
                + "f.dt_dem, f.observacao, "
                + "c.cpf as c_cpf, c.nome as c_nome, c.email as c_email, c.telefone as c_telefone, c.estado_civil as c_estado_civil, c.sexo as c_sexo, c.cep as c_cep, "
                + "c.logradouro as c_logradouro, c.numero as c_numero, c.complemento as c_complemento, c.uf as c_uf, c.bairro as c_bairro, c.cidade as c_cidade, "
                + "c.data_nascimento as c_data_nascimento, "
		+ "e.id as e_id, e.nome as e_nome, e.cnpj as e_cnpj, e.inscricao_estadual as e_inscricao_estadual, e.uf as e_uf, e.logradouro as e_logradouro, "
		+ "e.bairro as e_bairro, e.email as e_email, e.cidade as e_cidade, e.telefone as e_telefone, e.numero_endereco as e_numero_endereco, "
		+ "e.complemento as e_complemento, e.cep as e_cep, e.matriz as e_matriz "
                + "from venda as v "
                + "join funcionarios as f on f.cpf = v.cpf_funcionario "
		+ "join estabelecimento as e on e.id = f.id_estabelecimento "
                + "join cliente as c on c.cpf = v.cpf_cliente";

        PreparedStatement ps = conexao.prepareStatement(SQL_SELECT_VENDA);

        ResultSet rs = ps.executeQuery();

        List<Venda> vendas = new ArrayList<>();
        while (rs.next()) {
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getDate("data"));
            v.setHorarioVenda(rs.getTime("hora"));
            v.setValorTotal(rs.getFloat("total"));
            v.setTipoPagamento(rs.getString("tipo_pagamento"));

            Estabelecimento e = new Estabelecimento();
            e.setId(rs.getInt("e_id"));
            e.setNome(rs.getString("e_nome"));
            e.setCnpj(rs.getString("e_cnpj"));
            e.setInscricaoEstadual(rs.getString("e_inscricao_estadual"));
            e.setUnidadeFederativa(rs.getString("e_uf"));
            e.setLogradouro(rs.getString("e_logradouro"));
            e.setBairro(rs.getString("e_bairro"));
            e.setEmail(rs.getString("e_email"));
            e.setCidade(rs.getString("e_cidade"));
            e.setTelefone(rs.getString("e_telefone"));
            e.setNumeroEndereco(rs.getString("e_numero_endereco"));
            e.setComplemento(rs.getString("e_complemento"));
            e.setCep(rs.getString("e_cep"));
            e.setMatriz(rs.getBoolean("e_matriz"));

            Funcionario f = new Funcionario();
            f.setCpf(rs.getString("cpf"));
            f.setNome(rs.getString("nome"));
            f.setEmail(rs.getString("email"));
            f.setTelefone(rs.getString("telefone"));
            f.setEstadoCivil(rs.getString("estado_civil"));
            f.setSexo(rs.getString("sexo"));
            f.setCep(rs.getString("cep"));
            f.setLogradouro(rs.getString("logradouro"));
            f.setNumeroEndereco(rs.getString("numero"));
            f.setComplemento(rs.getString("complemento"));
            f.setUnidadeFederativa(rs.getString("uf"));
            f.setBairro(rs.getString("bairro"));
            f.setCidade(rs.getString("cidade"));
            f.setDataNascimento(rs.getDate("dt_nascimento"));
            f.setNumeroRg(rs.getString("rg"));
            f.setCargo(rs.getString("cargo"));
            f.setSalario(rs.getDouble("salario"));
            f.setDataAdmissao(rs.getDate("dt_adm"));
            f.setDataDemissao(rs.getDate("dt_dem"));
            f.setObservacao(rs.getString("observacao"));
            f.setEstabelecimento(e);

            v.setFuncionario(f);

            Cliente c = new Cliente();
            c.setCpf(rs.getString("c_cpf"));
            c.setNome(rs.getString("c_nome"));
            c.setEmail(rs.getString("c_email"));
            c.setTelefone(rs.getString("c_telefone"));
            c.setEstadoCivil(rs.getString("c_estado_civil"));
            c.setSexo(rs.getString("c_sexo"));
            c.setCep(rs.getString("c_cep"));
            c.setLogradouro(rs.getString("c_logradouro"));
            c.setNumeroEndereco(rs.getString("c_numero"));
            c.setComplemento(rs.getString("c_complemento"));
            c.setUnidadeFederativa(rs.getString("c_uf"));
            c.setBairro(rs.getString("c_bairro"));
            c.setCidade(rs.getString("c_cidade"));
            c.setDataNascimento(rs.getDate("c_data_nascimento"));

            v.setCliente(c);

            vendas.add(v);
        }

        return vendas;
    }

    public static List<Venda> select(Date dataInicial, Date dataFinal) throws ClassNotFoundException, SQLException {
        Connection conexao = ConexaoDB.getConexao();
        final String SQL_SELECT_VENDA_POR_DATA = "select v.id, v.data, v.hora, v.total, v.tipo_pagamento, "
                + "f.cpf, f.nome, f.email, f.telefone, f.estado_civil, f.sexo, f.cep, "
                + "f.logradouro, f.numero, f.complemento, f.uf, f.bairro, f.cidade, "
                + "f.dt_nascimento, f.rg, f.cargo, f.salario, f.id_estabelecimento, f.dt_adm, "
                + "f.dt_dem, f.observacao, "
                + "c.cpf as c_cpf, c.nome as c_nome, c.email as c_email, c.telefone as c_telefone, c.estado_civil as c_estado_civil, c.sexo as c_sexo, c.cep as c_cep, "
                + "c.logradouro as c_logradouro, c.numero as c_numero, c.complemento as c_complemento, c.uf as c_uf, c.bairro as c_bairro, c.cidade as c_cidade, "
                + "c.data_nascimento as c_data_nascimento "
                + "from venda as v "
                + "join funcionarios as f on f.cpf = v.cpf_funcionario "
                + "join cliente as c on c.cpf = v.cpf_cliente "
                + "where data between ? and ?";

        PreparedStatement ps = conexao.prepareStatement(SQL_SELECT_VENDA_POR_DATA);
        ps.setDate(1, dataInicial);
        ps.setDate(2, dataFinal);

        ResultSet rs = ps.executeQuery();

        List<Venda> vendas = new ArrayList<>();
        while (rs.next()) {
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setDataVenda(rs.getDate("data"));
            v.setHorarioVenda(rs.getTime("hora"));
            v.setValorTotal(rs.getFloat("total"));
            v.setTipoPagamento(rs.getString("tipo_pagamento"));

            Estabelecimento e = new Estabelecimento();
            e.setId(rs.getInt("e_id"));
            e.setNome(rs.getString("e_nome"));
            e.setCnpj(rs.getString("e_cnpj"));
            e.setInscricaoEstadual(rs.getString("e_inscricao_estadual"));
            e.setUnidadeFederativa(rs.getString("e_uf"));
            e.setLogradouro(rs.getString("e_logradouro"));
            e.setBairro(rs.getString("e_bairro"));
            e.setEmail(rs.getString("e_email"));
            e.setCidade(rs.getString("e_cidade"));
            e.setTelefone(rs.getString("e_telefone"));
            e.setNumeroEndereco(rs.getString("e_numero_endereco"));
            e.setComplemento(rs.getString("e_complemento"));
            e.setCep(rs.getString("e_cep"));
            e.setMatriz(rs.getBoolean("e_matriz"));

            Funcionario f = new Funcionario();
            f.setCpf(rs.getString("f_cpf"));
            f.setNome(rs.getString("f_nome"));
            f.setEmail(rs.getString("f_email"));
            f.setTelefone(rs.getString("f_telefone"));
            f.setEstadoCivil(rs.getString("f_estado_civil"));
            f.setSexo(rs.getString("f_sexo"));
            f.setCep(rs.getString("f_cep"));
            f.setLogradouro(rs.getString("f_logradouro"));
            f.setNumeroEndereco(rs.getString("f_numero"));
            f.setComplemento(rs.getString("f_complemento"));
            f.setUnidadeFederativa(rs.getString("f_uf"));
            f.setBairro(rs.getString("f_bairro"));
            f.setCidade(rs.getString("f_cidade"));
            f.setDataNascimento(rs.getDate("f_dt_nascimento"));
            f.setNumeroRg(rs.getString("f_rg"));
            f.setCargo(rs.getString("f_cargo"));
            f.setSalario(rs.getDouble("f_salario"));
            f.setDataAdmissao(rs.getDate("f_dt_adm"));
            f.setDataDemissao(rs.getDate("f_dt_dem"));
            f.setObservacao(rs.getString("f_observacao"));
            f.setEstabelecimento(e);

            v.setFuncionario(f);

            Cliente c = new Cliente();
            c.setCpf(rs.getString("c_cpf"));
            c.setNome(rs.getString("c_nome"));
            c.setEmail(rs.getString("c_email"));
            c.setTelefone(rs.getString("c_telefone"));
            c.setEstadoCivil(rs.getString("c_estado_civil"));
            c.setSexo(rs.getString("c_sexo"));
            c.setCep(rs.getString("c_cep"));
            c.setLogradouro(rs.getString("c_logradouro"));
            c.setNumeroEndereco(rs.getString("c_numero"));
            c.setComplemento(rs.getString("c_complemento"));
            c.setUnidadeFederativa(rs.getString("c_uf"));
            c.setBairro(rs.getString("c_bairro"));
            c.setCidade(rs.getString("c_cidade"));
            c.setDataNascimento(rs.getDate("c_data_nascimento"));

            v.setCliente(c);

            vendas.add(v);
        }

        return vendas;
    }
}
