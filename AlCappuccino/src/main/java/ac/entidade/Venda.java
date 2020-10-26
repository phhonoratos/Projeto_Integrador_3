/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

import java.sql.Date;
import java.sql.Time;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author joao
 */
@Getter
@Setter
public class Venda {

    int id;
    Date dataVenda;
    Float valorTotal;
    String tipoPagamento;
    String cpfCliente;
    String cpfFuncionario;
    Time horarioVenda;

    public Venda() {
    }

    public Venda(int id, Date data_venda, Float total, String tipo_pagamento, String cpfCliente, String cpfFuncionario, Time hora) {
        this.id = id;
        this.dataVenda = data_venda;
        this.valorTotal = total;
        this.tipoPagamento = tipo_pagamento;
        this.cpfCliente = cpfCliente;
        this.cpfFuncionario = cpfFuncionario;
        this.horarioVenda = hora;
    }

    @Override
    public String toString() {
        return "Venda{" + "id=" + id + ", data_venda=" + dataVenda + ", total=" + valorTotal + ", tipo_pagamento=" + tipoPagamento + ", cpf_cliente=" + cpfCliente + ", cpf_funcionario=" + cpfFuncionario + ", hora=" + horarioVenda + '}';
    }
}
