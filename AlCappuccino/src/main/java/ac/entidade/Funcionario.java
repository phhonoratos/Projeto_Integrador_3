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

    public Funcionario(
            String nome,
            String numeroRg,
            String cargo,
            double salario,
            Date   dataAdmissao,
            Date   dataDemissao,
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
            Date   dataNascimento,
            Estabelecimento estabelecimento
    ) {
        super(nome, cpf, estadoCivil, dataNascimento, sexo, email, telefone, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade);

        this.numeroRg = numeroRg;
        this.cargo = cargo;
        this.salario = salario;
        this.estabelecimento = estabelecimento;
        this.dataAdmissao = dataAdmissao;
        this.dataDemissao = dataDemissao;
        this.observacao = observacao;
    }
    
    public Funcionario() {
    }
}
