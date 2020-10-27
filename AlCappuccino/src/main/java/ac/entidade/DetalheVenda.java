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

    int id;
    int quantidade;
    Produto produto;
    float valorTotal;
    Venda venda;

    public DetalheVenda() {
    }

    public DetalheVenda(
            int id, 
            int quantidade, 
            Produto produto, 
            Venda venda, 
            float valorTotal
    ) {
        this.id = id;
        this.quantidade = quantidade;
        this.produto = produto;
        this.venda = venda;
        this.valorTotal = valorTotal;
    }

    @Override
    public String toString() {
        return "DetalheVenda{" + "id=" + id + ", quantidade=" + quantidade + ", idProduto=" + produto + ", idVenda=" + venda + ", valorTotal=" + valorTotal + '}';
    }

}
