/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.produto;

import ac.dao.ProdutoDAO;
import ac.entidade.Estabelecimento;
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
        int id = Integer.parseInt(request.getParameter("id"));
        Produto produto = ProdutoDAO.getProduto(id);
        request.setAttribute("produto", produto);
         RequestDispatcher rd = 
                 getServletContext().getRequestDispatcher("/pages/admin/produto/alterarProduto.jsp");
         rd.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idS = request.getParameter("id");
        int id = Integer.parseInt(idS);
        String tipo = request.getParameter("tipo");
        String nome = request.getParameter("nome");
        String qtd_estoqueS = request.getParameter("qtd_estoque");
        int qtd_estoque = Integer.parseInt(qtd_estoqueS);
        String precoS = request.getParameter("preco");
        double preco = Double.parseDouble(precoS);
        String porcentagemS = request.getParameter("porcentagem");
        double porcentagem = Double.parseDouble(porcentagemS);
        String valor_vendaS = request.getParameter("valor_venda");
        double valor_venda = Double.parseDouble(valor_vendaS);
        Estabelecimento estabelecimento = new Estabelecimento();
        String filial = request.getParameter("filial");
        estabelecimento.setId(Integer.parseInt(filial));

        Produto produto = new Produto(id, tipo, nome, qtd_estoque, preco, porcentagem, valor_venda, estabelecimento);
        
         
         try {
             int linhasAfetadas = ProdutoDAO.updateProduto(produto);
             response.sendRedirect("sucesso.jsp");
         } catch (ClassNotFoundException | SQLException ex) {
             Logger.getLogger(AlterarProduto.class.getName()).log(Level.SEVERE, null, ex);
             Utils.mostrarTelaErro(ex, request, response);
         } 
        
    }
}
