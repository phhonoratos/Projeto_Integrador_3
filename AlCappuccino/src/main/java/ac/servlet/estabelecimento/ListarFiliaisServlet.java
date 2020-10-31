/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.estabelecimento;

import ac.dao.EstabelecimentoDAO;
import ac.entidade.Estabelecimento;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Paulo Costa
 * @WebServlet( name = "ListarFiliais", description = "Acessa a página de controle de Filiais", urlPatterns = "/ListarFiliais" )
 */
public class ListarFiliaisServlet extends HttpServlet {

    private static final String LISTAR_FILIAL = "/pages/estabelecimento/listarFilial.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("listaEstabelecimento", EstabelecimentoDAO.obterFiliais());

        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher(LISTAR_FILIAL);

        requestDispatcher.forward(request, response);
    }
}
