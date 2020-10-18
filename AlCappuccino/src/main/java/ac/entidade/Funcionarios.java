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
public class Funcionarios {
    
    private long cpf;
    private String nome;
    private long rg;
    private String sexo;
    private String dt_nasc;
    private String estado_civil;
    private long telefone1;
    private long telefone2;
    private String email;
    private String endereco;
    private String complemento;
    private String cidade;
    private String estado;
    private String cargo;
    private double salario;
    private float comissao;
    private String filial;
    private String dt_adm;
    private String dt_dem;
    private boolean status;

    public Funcionarios(long cpf, String nome, long rg, String sexo, String dt_nasc, String estado_civil, 
            long telefone1, long telefone2, String email, String endereco, String complemento, String cidade, String estado, String cargo, double salario, 
            float comissao, String filial, String dt_adm, String dt_dem, boolean status) {
        this.cpf = cpf;
        this.nome = nome;
        this.rg = rg;
        this.sexo = sexo;
        this.dt_nasc = dt_nasc;
        this.estado_civil = estado_civil;
        this.telefone1 = telefone1;
        this.telefone2 = telefone2;
        this.email = email;
        this.endereco = endereco;
        this.complemento = complemento;
        this.cidade = cidade;
        this.estado = estado;
        this.cargo = cargo;
        this.salario = salario;
        this.comissao = comissao;
        this.filial = filial;
        this.dt_adm = dt_adm;
        this.dt_dem = dt_dem;
        this.status = status;
    }

    public long getCpf() {
        return cpf;
    }

    public void setCpf(long cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public long getRg() {
        return rg;
    }

    public void setRg(long rg) {
        this.rg = rg;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDt_nasc() {
        return dt_nasc;
    }

    public void setDt_nasc(String dt_nasc) {
        this.dt_nasc = dt_nasc;
    }

    public String getEstado_civil() {
        return estado_civil;
    }

    public void setEstado_civil(String estado_civil) {
        this.estado_civil = estado_civil;
    }

    public long getTelefone1() {
        return telefone1;
    }

    public void setTelefone1(long telefone1) {
        this.telefone1 = telefone1;
    }

    public long getTelefone2() {
        return telefone2;
    }

    public void setTelefone2(long telefone2) {
        this.telefone2 = telefone2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public float getComissao() {
        return comissao;
    }

    public void setComissao(float comissao) {
        this.comissao = comissao;
    }

    public String getFilial() {
        return filial;
    }

    public void setFilial(String filial) {
        this.filial = filial;
    }

    public String getDt_adm() {
        return dt_adm;
    }

    public void setDt_adm(String dt_adm) {
        this.dt_adm = dt_adm;
    }

    public String getDt_dem() {
        return dt_dem;
    }

    public void setDt_dem(String dt_dem) {
        this.dt_dem = dt_dem;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return String.format("<br/>CPF: %s <br/> Nome: %s <br/> RG: %s <br/> Sexo: %s <br/> Data Nasc: %s <br/> Estado Civil: %s "
                + "<br/> Telefone 1: %s <br/> Telefone 2: %s <br/> E-mail: %s <br/> Endereço: %s <br/> Complemento: %s <br/> Cidade: %s <br/> "
                + "Estado: %s <br/> Cargo: %s <br/> Salário: %s <br/> Comissao: %s <br/> Filial: %s <br/> Data Admissão: %s <br/> Data Demissão: %s <br/> Status: %s", 
                this.getCpf(), this.getNome(), this.getRg(), this.getSexo(), this.getDt_nasc(), this.getEstado_civil(), this.getTelefone1(), 
                this.getTelefone2(), this.getEmail(), this.getEndereco(), this.getComplemento(), this.getCidade(), this.getEstado(), this.getCargo(), 
                this.getSalario(), this.getComissao(), this.getDt_adm(), this.getDt_dem(), this.isStatus());
    }

    
        
    
}
