/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.produto;

import ac.dao.ProdutoDAO;
import ac.entidade.Produto;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author danil
 */
public class ListarProdutosPesquisa extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produto produto = ProdutoDAO.getProduto(id);

        request.setAttribute("produto", produto);

        RequestDispatcher requestDispatcher
                = getServletContext().getRequestDispatcher("/pages/produto/listarProdutoPesquisa.jsp");
        requestDispatcher.forward(request, response);
    }

}
