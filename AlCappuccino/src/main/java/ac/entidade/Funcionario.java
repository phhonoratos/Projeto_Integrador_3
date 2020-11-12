/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author paulo
 */
@Getter
@Setter
public class Funcionario extends PessoaFisica {

    private int id;
    private String numeroRg;
    private String cargo;
    private String observacao;
    private Date dataAdmissao;
    private Date dataDemissao;
    private double salario;
    private Estabelecimento estabelecimento;
    private String login;
    private String senha;

    public Funcionario(int id, String numeroRg, String cargo, String observacao, Date dataAdmissao, Date dataDemissao, double salario, Estabelecimento estabelecimento, String login, String senha, String cpf, String estadoCivil, String sexo, Date dataNascimento, String nome, String email, String telefone, String cep, String logradouro, String numero, String complemento, String unidadeFederativa, String bairro, String cidade) {
        super(cpf, estadoCivil, sexo, dataNascimento, nome, email, telefone, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade);
        this.id = id;
        this.numeroRg = numeroRg;
        this.cargo = cargo;
        this.observacao = observacao;
        this.dataAdmissao = dataAdmissao;
        this.dataDemissao = dataDemissao;
        this.salario = salario;
        this.estabelecimento = estabelecimento;
        this.login = login;
        this.senha = senha;
    }
//
//    public Funcionario(int id, String numeroRg, String cargo, String observacao, Date dataAdmissao, Date dataDemissao, double salario, Estabelecimento estabelecimento, String login, String senha) {
//        this.id = id;
//        this.numeroRg = numeroRg;
//        this.cargo = cargo;
//        this.observacao = observacao;
//        this.dataAdmissao = dataAdmissao;
//        this.dataDemissao = dataDemissao;
//        this.salario = salario;
//        this.estabelecimento = estabelecimento;
//        this.login = login;
//        this.senha = senha;
//    }

    
    
    public Funcionario() {
    }
}
