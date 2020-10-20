/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

import java.sql.Date;


public class Cliente extends Pessoa{
    
    public Cliente(String nome, String email, String cpf, String telefone, String estado_civil, String sexo, String cep, String logradouro, String numero, String complemento, String uf, String bairro, String cidade, Date dt_nascimento) {
        super(nome, email, cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, uf, bairro, cidade, dt_nascimento);
    }

}
