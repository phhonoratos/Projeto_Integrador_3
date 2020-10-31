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

    private int id;
    private Date dataVenda;
    private Float valorTotal;
    private String tipoPagamento;
    private Time horarioVenda;
    private Cliente cliente;
    private Funcionario funcionario;

    public Venda(int id, Date data_venda, Float total, String tipo_pagamento, Time hora, Cliente cliente, Funcionario funcionario) {
        this.id = id;
        this.dataVenda = data_venda;
        this.valorTotal = total;
        this.tipoPagamento = tipo_pagamento;
        this.horarioVenda = hora;
        this.cliente = cliente;
        this.funcionario = funcionario;
    }

    public Venda() {
    }

    @Override
    public String toString() {
        return "Venda{" + "id=" + id + ", data_venda=" + dataVenda + ", "
                + "total=" + valorTotal + ", tipo_pagamento=" + tipoPagamento + ", "
                + "cliente=" + cliente + ", funcionario=" + funcionario + ", "
                + "hora=" + horarioVenda + '}';
    }
}
