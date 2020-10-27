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
    int idProduto;
    float valorTotal;
    int idVenda;

    public DetalheVenda() {
    }

    public DetalheVenda(
            int id, 
            int quantidade, 
            int idProduto, 
            int idVenda, 
            float valorTotal
    ) {
        this.id = id;
        this.quantidade = quantidade;
        this.idProduto = idProduto;
        this.idVenda = idVenda;
        this.valorTotal = valorTotal;
    }

    @Override
    public String toString() {
        return "DetalheVenda{" + "id=" + id + ", quantidade=" + quantidade + ", idProduto=" + idProduto + ", idVenda=" + idVenda + ", valorTotal=" + valorTotal + '}';
    }

}
