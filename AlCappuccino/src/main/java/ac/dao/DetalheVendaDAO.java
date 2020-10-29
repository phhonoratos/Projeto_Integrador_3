/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Cliente;
import ac.entidade.Funcionario;
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
    
    public static List<DetalheVenda> listaDetalheVenda(Date dataInicial, Date dataFinal, String clienteString, String produtoString) 
            throws SQLException, ClassNotFoundException {
        List<DetalheVenda> listaDetalheVenda = new ArrayList();
        try {
            Connection con = ConexaoDB.getConexao();
            
            String selectDetalhe = "d.id as d_id, d.qtd_produto as d_qtd_produto, d.valor as d_valor";
            
            String selectProduto = "p.id as p_id, p.tipo as p_tipo, p.nome as p_nome, "
                                 + "p.qtd_estoque as p_qtd_estoque, p.preco as p_preco, "
                                 + "p.porcentagem as p_porcentagem, p.valor_venda as p_valor_venda";
            
            String selectVenda = "v.id as v_id, v.data as v_data, v.hora as v_hora, "
                               + "v.total as v_total, v.tipo_pagamento as v_tipo_pagamento";
            
            String selectCliente = "c.cpf as c_cpf, c.nome as c_nome, c.email as c_email, "
                                 + "c.telefone as c_telefone, c.estado_civil as c_estado_civil, "
                                 + "c.sexo as c_sexo, c.cep as c_cep, c.logradouro as c_logradouro, "
                                 + "c.numero as c_numero, c.complemento as c_complemento, c.uf as c_uf, "
                                 + "c.bairro as c_bairro, c.cidade as c_cidade, "
                                 + "c.data_nascimento as c_data_nascimento";
            
            String selectFuncionario = "f.cpf as f_cpf, f.nome as f_nome, f.email as f_email, "
                                     + "f.telefone as f_telefone, f.estado_civil as f_estado_civil, "
                                     + "f.sexo as f_sexo, f.cep as f_cep, f.logradouro as f_logradouro, "
                                     + "f.numero as f_numero, f.complemento as f_complemento, f.uf as f_uf, "
                                     + "f.bairro as f_bairro, f.cidade as f_cidade, "
                                     + "f.dt_nascimento as f_dt_nascimento, f.rg as f_rg, "
                                     + "f.cargo as f_cargo, f.salario as f_salario, f.filial as f_filial, "
                                     + "f.dt_adm as f_dt_adm, f.dt_dem as f_dt_dem, "
                                     + "f.observacao as f_observacao";
            
            String query = "select " 
                         + selectDetalhe + ", "
                         + selectProduto + ", " 
                         + selectVenda +  ", " 
                         + selectCliente + ", " 
                         + selectFuncionario + " " 
                         + "from detalhevenda as d "
                         + "join produto      as p on p.id  = d.id_produto "
                         + "join venda        as v on v.id  = d.id_venda "
                         + "join cliente      as c on c.cpf = v.cpf_cliente "
                         + "join funcionarios as f on f.cpf = v.cpf_funcionario "
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
                f.setFilial(rs.getString("f_filial"));
                f.setDataAdmissao(rs.getDate("f_dt_adm"));
                f.setDataDemissao(rs.getDate("f_dt_dem"));
                f.setObservacao(rs.getString("f_observacao"));
                
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
