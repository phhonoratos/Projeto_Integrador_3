/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.entidade;

/**
 *
 * @author joao
 */
public class DetalheVenda {
    
    int id;
    int quantidade;
    int idProduto;
    float valorTotal;
    int idVenda;
    

    public DetalheVenda() {
    }

    public DetalheVenda(int id, int quantidade, int idProduto, int idVenda, float valorTotal) {
        this.id = id;
        this.quantidade = quantidade;
        this.idProduto = idProduto;
        this.idVenda = idVenda;
        this.valorTotal = valorTotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public int getIdVenda() {
        return idVenda;
    }

    public void setIdVenda(int idVenda) {
        this.idVenda = idVenda;
    }

    public float getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(float valorTotal) {
        this.valorTotal = valorTotal;
    }

    @Override
    public String toString() {
        return "DetalheVenda{" + "id=" + id + ", quantidade=" + quantidade + ", idProduto=" + idProduto + ", idVenda=" + idVenda + ", valorTotal=" + valorTotal + '}';
    }
    
    
}
