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
 * @author danilo
 */
@Getter
@Setter
public class Produto {

    int id;
    String tipo;
    String nome;
    int quantidadeEstoque;
    double preco;
    double porcentagem;
    double valorVenda;

    public Produto(int id, String tipo, String nome, int quantidadeEstoque, double preco, double porcentagem, double valorVenda) {
        this.id = id;
        this.tipo = tipo;
        this.nome = nome;
        this.quantidadeEstoque = quantidadeEstoque;
        this.preco = preco;
        this.porcentagem = porcentagem;
        this.valorVenda = valorVenda;
    }

    public Produto() {}

    @Override
    public String toString() {
        return String.format("Id %s <br/> Tipo %s <br/> Nome %s <br/> qtd_estoque %s <br/> Preço %s <br/> Porcentagem %s <br/> Valor de Venda %f",
                this.getId(), this.getTipo(), this.getNome(), this.getQuantidadeEstoque(), this.getPreco(), this.getPorcentagem(), this.getValorVenda());
    }
}
