/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet;

import ac.dao.ProdutoDAO;
import ac.entidade.Produto;
import ac.utils.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author danilo
 */
public class AlterarProduto extends HttpServlet {

       @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        Produto produto = ProdutoDAO.getProduto(nome);
        request.setAttribute("produto", produto);
         RequestDispatcher rd = 
                 getServletContext().getRequestDispatcher("/alterarProduto.jsp");
         rd.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idS = request.getParameter("id");
        int id = Integer.parseInt(idS);
        String tipo = request.getParameter("tipo");
        String nome = request.getParameter("nome");
        String qtd_estoque = request.getParameter("qtd_estoque");
        String precoS = request.getParameter("preco");
        double preco = Double.parseDouble(precoS);
        String porcentagemS = request.getParameter("porcentagem");
        double porcentagem = Double.parseDouble(porcentagemS);
        String valor_vendaS = request.getParameter("valor_venda");
        double valor_venda = Double.parseDouble(valor_vendaS);
        
        Produto produto = new Produto();
        
        produto.setId(id);
        produto.setTipo(tipo);
        produto.setQtd_estoque(qtd_estoque);
        produto.setPreco(preco);
        produto.setPorcentagem(porcentagem);
        produto.setValor_venda(valor_venda);
         
         try {
             ProdutoDAO.updateProduto(produto);
             response.sendRedirect("sucesso.jsp");
         } catch (ClassNotFoundException | SQLException ex) {
             Logger.getLogger(AlterarProduto.class.getName()).log(Level.SEVERE, null, ex);
             Utils.mostrarTelaErro(ex, request, response);
         } 
        
    }
}
