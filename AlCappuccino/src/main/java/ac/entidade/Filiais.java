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
public class Filiais {
    
    private String razao_social;
    private String insc_estadual;
    private String cnpj;
    private String logradouro;
    private String numero;
    private String bairro;
    private String cep;
    private String complememto;
    private String cidade;
    private String uf;
    private String telefone;
    private String email;

    public Filiais(String razao_social, String insc_estadual, String cnpj, String logradouro, String numero, String bairro, String cep, String complememto, String cidade, String uf, String telefone, String email) {
        this.razao_social = razao_social;
        this.insc_estadual = insc_estadual;
        this.cnpj = cnpj;
        this.logradouro = logradouro;
        this.numero = numero;
        this.bairro = bairro;
        this.cep = cep;
        this.complememto = complememto;
        this.cidade = cidade;
        this.uf = uf;
        this.telefone = telefone;
        this.email = email;
    }

    public String getRazao_social() {
        return razao_social;
    }

    public void setRazao_social(String razao_social) {
        this.razao_social = razao_social;
    }

    public String getInsc_estadual() {
        return insc_estadual;
    }

    public void setInsc_estadual(String insc_estadual) {
        this.insc_estadual = insc_estadual;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getComplememto() {
        return complememto;
    }

    public void setComplememto(String complememto) {
        this.complememto = complememto;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
