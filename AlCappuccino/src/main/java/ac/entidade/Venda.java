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

    public Venda() {
    }

    public Venda(int id, Date data_venda, Float total) {
        this.id = id;
        this.data_venda = data_venda;
        this.total = total;
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

    @Override
    public String toString() {
        return "Venda{" + "id=" + id + ", data_venda=" + data_venda + ", total=" + total + '}';
    }
    
    
    
    
    
}
