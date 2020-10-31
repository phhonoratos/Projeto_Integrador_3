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
    Estabelecimento estabelecimento;

    public Produto(int id, String tipo, String nome, int quantidadeEstoque, double preco, double porcentagem, double valorVenda, Estabelecimento estabelecimento) {
        this.id = id;
        this.tipo = tipo;
        this.nome = nome;
        this.quantidadeEstoque = quantidadeEstoque;
        this.preco = preco;
        this.porcentagem = porcentagem;
        this.valorVenda = valorVenda;
        this.estabelecimento=estabelecimento;
    }

    public Produto() {}

    @Override
    public String toString() {
        return "Produto{" + "id=" + id + ", tipo=" + tipo + ", "
                + "nome=" + nome + ", quantidadeEstoque=" + quantidadeEstoque + ", "
                + "preco=" + preco + ", porcentagem=" + porcentagem + ", "
                + "valorVenda=" + valorVenda + ", estabelecimento=" + estabelecimento + '}';
    }
}
