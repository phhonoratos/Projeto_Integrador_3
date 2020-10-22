/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet;

import ac.dao.ProdutoDAO;
import ac.entidade.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joao
 */
public class CadastrarVenda extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Produto> listaProduto = ProdutoDAO.getProduto();
        request.setAttribute("listaProduto", listaProduto);
        
         RequestDispatcher requestDispatcher = getServletContext()
                 .getRequestDispatcher("/cadastrarVenda.jsp");
         requestDispatcher.forward(request, response);
    }

}
