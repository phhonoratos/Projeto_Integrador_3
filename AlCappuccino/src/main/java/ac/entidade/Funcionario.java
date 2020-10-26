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

    public Funcionario() {
    }

    protected int id;
    protected String numeroRg;
    protected String cargo;
    protected String filial;
    protected String observacao;
    protected Date dataAdmissao;
    protected Date dataDemissao;
    protected double salario;

    public Funcionario(
            String nome,
            String numeroRg,
            String cargo,
            double salario,
            String filial,
            Date dataAdmissao,
            Date dataDemissao,
            String observacao,
            String email,
            String cpf,
            String telefone,
            String estadoCivil,
            String sexo,
            String cep,
            String logradouro,
            String numero,
            String complemento,
            String unidadeFederativa,
            String bairro,
            String cidade,
            Date dataNascimento) {
        super(nome, cpf, estadoCivil, dataNascimento, sexo, email, telefone, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade);

        this.numeroRg = numeroRg;
        this.cargo = cargo;
        this.salario = salario;
        this.filial = filial;
        this.dataAdmissao = dataAdmissao;
        this.dataDemissao = dataDemissao;
        this.observacao = observacao;
    }
}
