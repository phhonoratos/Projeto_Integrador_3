/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

/**
 *
 * @author danilo
 */
public class Produto {

    private int id;
    private String tipo;
    private String nome;
    private int qtd_estoque;
    private double preco;
    private double porcentagem;
    private double valor_venda;

    public Produto() {
    }

    public Produto(int id, String tipo, String nome, int qtd_estoque, double preco, double porcentagem, double valor_venda) {
        this.id = id;
        this.tipo = tipo;
        this.nome = nome;
        this.qtd_estoque = qtd_estoque;
        this.preco = preco;
        this.porcentagem = porcentagem;
        this.valor_venda = valor_venda;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getQtd_estoque() {
        return qtd_estoque;
    }

    public void setQtd_estoque(int qtd_estoque) {
        this.qtd_estoque = qtd_estoque;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public double getPorcentagem() {
        return porcentagem;
    }

    public void setPorcentagem(double porcentagem) {
        this.porcentagem = porcentagem;
    }

    public double getValor_venda() {
        return valor_venda;
    }

    public void setValor_venda(double valor_venda) {
        this.valor_venda = valor_venda;
    }

    @Override
    public String toString() {
        return String.format("Id %s <br/> Tipo %s <br/> Nome %s <br/> Quantidade em estoque %s <br/> Preço %s <br/> Porcentagem %s <br/> Valor de Venda %d",
                this.getId(), this.getTipo(), this.getNome(), this.getQtd_estoque(), this.getPreco(), this.getPorcentagem(), this.getValor_venda());
    }
}
