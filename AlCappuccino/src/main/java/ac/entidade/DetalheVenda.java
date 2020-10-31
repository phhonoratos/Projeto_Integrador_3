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
public class DetalheVenda {

    private int id;
    private int quantidade;
    private float valorTotal;
    private Produto produto;
    private Venda venda;

    public DetalheVenda(
            int id,
            int quantidade,
            float valorTotal,
            Produto produto,
            Venda venda
    ) {
        this.id = id;
        this.quantidade = quantidade;
        this.valorTotal = valorTotal;
        this.produto = produto;
        this.venda = venda;
    }

    public DetalheVenda() {
    }

    @Override
    public String toString() {
        return "DetalheVenda{" + "id=" + id + ", quantidade=" + quantidade + ", produto=" + produto + ", venda=" + venda + ", valorTotal=" + valorTotal + '}';
    }
}
