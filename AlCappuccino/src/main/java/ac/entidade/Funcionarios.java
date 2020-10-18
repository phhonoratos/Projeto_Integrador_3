/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

/**
 *
 * @author paulo
 */
public class Funcionarios {
    
    private String cpf;
    private String nome;
    private String rg;

    public Funcionarios(String cpf, String nome, String rg) {
        this.cpf = cpf;
        this.nome = nome;
        this.rg = rg;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    @Override
    public String toString() {
        return String.format("<br/>CPF: %s <br/> Nome: %s <br/> RG: %s ", this.getCpf(), this.getNome(), this.getRg());
    }

    
        
    
}
