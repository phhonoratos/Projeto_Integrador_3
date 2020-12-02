/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.estabelecimento;

import ac.dao.EstabelecimentoDAO;
import ac.entidade.Funcionario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Paulo Costa
 * @WebServlet( name = "ListarFiliais", description = "Acessa a página de controle de Filiais", urlPatterns = "/ListarFiliais" )
 */
public class ListarFiliaisServlet extends HttpServlet {

    private String LISTAR_FILIAL;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("listaEstabelecimento", EstabelecimentoDAO.obterFiliais());

        LISTAR_FILIAL = usuarioComPermissao(request)
                ? "/pages/admin/estabelecimento/listarFilialAdmin.jsp"
                : "/pages/estabelecimento/listarFilial.jsp";

        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher(LISTAR_FILIAL);

        requestDispatcher.forward(request, response);
    }

    private boolean usuarioComPermissao(HttpServletRequest httpRequest) {
        HttpSession sessao = httpRequest.getSession();
        Funcionario funcionario = (Funcionario) sessao.getAttribute("usuario");
        return funcionario.isAdmin();
    }
}
