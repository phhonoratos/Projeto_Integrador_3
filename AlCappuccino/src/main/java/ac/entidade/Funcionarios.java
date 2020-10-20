/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

import java.sql.Date;

/**
 *
 * @author paulo
 */
public class Funcionarios extends Pessoa{
    
    private String rg;
    private String cargo;
    private String salario;
    private String comissao;
    private String filial;
    private String data_admissao;
    private String data_demissao;
    private boolean status;

//    public Funcionarios(String rg, String cargo, String salario, String comissao, String filial, String data_admissao, String data_demissao, boolean status) {
//        this.rg = rg;
//        this.cargo = cargo;
//        this.salario = salario;
//        this.comissao = comissao;
//        this.filial = filial;
//        this.data_admissao = data_admissao;
//        this.data_demissao = data_demissao;
//        this.status = status;
//    } 

    public Funcionarios(String rg, String cargo, String salario, String comissao, String filial, String data_admissao, String data_demissao, boolean status, String nome, String email, String cpf, String telefone, String estado_civil, String sexo, String cep, String logradouro, String numero, String complemento, String uf, String bairro, String cidade, Date dt_nascimento) {
        super(nome, email, cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, uf, bairro, cidade, dt_nascimento);
        this.rg = rg;
        this.cargo = cargo;
        this.salario = salario;
        this.comissao = comissao;
        this.filial = filial;
        this.data_admissao = data_admissao;
        this.data_demissao = data_demissao;
        this.status = status;
    }
    

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }

    public String getComissao() {
        return comissao;
    }

    public void setComissao(String comissao) {
        this.comissao = comissao;
    }

    public String getFilial() {
        return filial;
    }

    public void setFilial(String filial) {
        this.filial = filial;
    }

    public String getData_admissao() {
        return data_admissao;
    }

    public void setData_admissao(String data_admissao) {
        this.data_admissao = data_admissao;
    }

    public String getData_demissao() {
        return data_demissao;
    }

    public void setData_demissao(String data_demissao) {
        this.data_demissao = data_demissao;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
        
    
}
