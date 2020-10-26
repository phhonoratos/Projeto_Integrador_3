/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.estabelecimento;

import ac.dao.EstabelecimentoDAO;
import java.io.IOException;
import ac.entidade.Estabelecimento;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Paulo Costa
@WebServlet(
        name = "ListarFiliais",
        description = "Acessa a página de controle de Filiais",
        urlPatterns = "/ListarFiliais"
)
 */

// TODO: Alteração, exclusão
public class ListarFiliaisServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Estabelecimento> listaEstabelecimento = EstabelecimentoDAO.obterFiliais();

        request.setAttribute("listaEstabelecimento", listaEstabelecimento);

        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher("/pages/estabelecimento/listarFilial.jsp");

        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
