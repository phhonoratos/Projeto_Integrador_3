/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author joao
 */
@Getter
@Setter
public abstract class Pessoa {

    protected String nome;
    protected String email;
    protected String telefone;
    protected String cep;            
    protected String logradouro;
    protected String numeroEndereco;
    protected String complemento;
    protected String unidadeFederativa;
    protected String bairro;
    protected String cidade;

    public Pessoa(String nome, String email, String telefone, String cep, String logradouro, String numero, String complemento, String unidadeFederativa, String bairro, String cidade) {
        this.nome = nome;
        this.email = email;
        this.telefone = telefone;
        this.cep = cep;
        this.logradouro = logradouro;
        this.numeroEndereco = numero;
        this.complemento = complemento;
        this.unidadeFederativa = unidadeFederativa;
        this.bairro = bairro;
        this.cidade = cidade;
    }
    
    public Pessoa() {
    }
}
