/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

import java.sql.Date;

/**
 *
 * @author joao
 */
public class Venda {
    
    int id;
    Date data_venda;
    Float total;
    String tipo_pagamento;
    String cpf_cliente;
    String cpf_funcionario;

    public Venda() {
    }

    public Venda(int id, Date data_venda, Float total, String tipo_pagamento, String cpf_cliente, String cpf_funcionario) {
        this.id = id;
        this.data_venda = data_venda;
        this.total = total;
        this.tipo_pagamento = tipo_pagamento;
        this.cpf_cliente = cpf_cliente;
        this.cpf_funcionario = cpf_funcionario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getData_venda() {
        return data_venda;
    }

    public void setData_venda(Date data_venda) {
        this.data_venda = data_venda;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public String getTipo_pagamento() {
        return tipo_pagamento;
    }

    public void setTipo_pagamento(String tipo_pagamento) {
        this.tipo_pagamento = tipo_pagamento;
    }

    public String getCpf_cliente() {
        return cpf_cliente;
    }

    public void setCpf_cliente(String cpf_cliente) {
        this.cpf_cliente = cpf_cliente;
    }

    public String getCpf_funcionario() {
        return cpf_funcionario;
    }

    public void setCpf_funcionario(String cpf_funcionario) {
        this.cpf_funcionario = cpf_funcionario;
    }

    @Override
    public String toString() {
        return "Venda{" + "id=" + id + ", data_venda=" + data_venda + ", total=" + total + ", tipo_pagamento=" + tipo_pagamento + ", cpf_cliente=" + cpf_cliente + ", cpf_funcionario=" + cpf_funcionario + '}';
    }

       
}
