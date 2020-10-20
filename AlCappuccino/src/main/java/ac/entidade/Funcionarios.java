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
    private Double salario;
    private String filial;
    private Date dt_adm;
    private Date dt_dem;

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

    public Funcionarios(String rg, String cargo, Double salario, String filial, Date dt_adm, Date dt_dem, String nome, String email, String cpf, 
            String telefone, String estado_civil, String sexo, String cep, String logradouro, String numero, String complemento, String uf, String bairro,
            String cidade, Date dt_nascimento) {
        super(nome, email, cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, uf, bairro, cidade, dt_nascimento);
        this.rg = rg;
        this.cargo = cargo;
        this.salario = salario;
        this.filial = filial;
        this.dt_adm = dt_adm;
        this.dt_dem = dt_dem;
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

    public Double getSalario() {
        return salario;
    }

    public void setSalario(Double salario) {
        this.salario = salario;
    }

    public String getFilial() {
        return filial;
    }

    public void setFilial(String filial) {
        this.filial = filial;
    }

    public Date getDt_adm() {
        return dt_adm;
    }

    public void setDt_adm(Date dt_adm) {
        this.dt_adm = dt_adm;
    }

    public Date getDt_dem() {
        return dt_dem;
    }

    public void setDt_dem(Date dt_dem) {
        this.dt_dem = dt_dem;
    }
    
}
