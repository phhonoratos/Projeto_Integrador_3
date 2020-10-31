/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Cliente;
import ac.entidade.DetalheVenda;
import ac.entidade.Estabelecimento;
import ac.entidade.Funcionario;
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

            String query = "select * from detalhe_venda_join ";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("p_id"));
                p.setTipo(rs.getString("p_tipo"));
                p.setNome(rs.getString("p_nome"));
                p.setQuantidadeEstoque(rs.getInt("p_qtd_estoque"));
                p.setPreco(rs.getDouble("p_preco"));
                p.setPorcentagem(rs.getDouble("p_porcentagem"));
                p.setValorVenda(rs.getDouble("p_valor_venda"));

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

                Venda v = new Venda();
                v.setId(rs.getInt("v_id"));
                v.setDataVenda(rs.getDate("v_data"));
                v.setHorarioVenda(rs.getTime("v_hora"));
                v.setValorTotal(rs.getFloat("v_total"));
                v.setTipoPagamento(rs.getString("v_tipo_pagamento"));
                v.setCliente(c);
                v.setFuncionario(f);

                DetalheVenda dv = new DetalheVenda();
                dv.setId(rs.getInt("d_id"));
                dv.setQuantidade(rs.getInt("d_qtd_produto"));
                dv.setValorTotal(rs.getFloat("d_valor"));
                dv.setProduto(p);
                dv.setVenda(v);

                listaDetalheVenda.add(dv);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaDetalheVenda;
    }

    public static List<DetalheVenda> listaDetalheVenda(Date dataInicial, Date dataFinal, String clienteString, String produtoString)
            throws SQLException, ClassNotFoundException {
        List<DetalheVenda> listaDetalheVenda = new ArrayList();
        try {
            Connection con = ConexaoDB.getConexao();

            String query = "select * from detalhe_venda_join "
                    + "where v.data between ? and ? "
                    + "and   c.nome like    ? "
                    + "and   p.nome like    ? ";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setDate(1, dataInicial);
            ps.setDate(2, dataFinal);
            ps.setString(3, "%" + clienteString + "%");
            ps.setString(4, "%" + produtoString + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();
                p.setId(rs.getInt("p_id"));
                p.setTipo(rs.getString("p_tipo"));
                p.setNome(rs.getString("p_nome"));
                p.setQuantidadeEstoque(rs.getInt("p_qtd_estoque"));
                p.setPreco(rs.getDouble("p_preco"));
                p.setPorcentagem(rs.getDouble("p_porcentagem"));
                p.setValorVenda(rs.getDouble("p_valor_venda"));

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

                Venda v = new Venda();
                v.setId(rs.getInt("v_id"));
                v.setDataVenda(rs.getDate("v_data"));
                v.setHorarioVenda(rs.getTime("v_hora"));
                v.setValorTotal(rs.getFloat("v_total"));
                v.setTipoPagamento(rs.getString("v_tipo_pagamento"));
                v.setCliente(c);
                v.setFuncionario(f);

                DetalheVenda dv = new DetalheVenda();
                dv.setId(rs.getInt("d_id"));
                dv.setQuantidade(rs.getInt("d_qtd_produto"));
                dv.setValorTotal(rs.getFloat("d_valor"));
                dv.setProduto(p);
                dv.setVenda(v);

                listaDetalheVenda.add(dv);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ServletBD.class.getName()).
                    log(Level.SEVERE, null, ex);
        }
        return listaDetalheVenda;
    }
}
