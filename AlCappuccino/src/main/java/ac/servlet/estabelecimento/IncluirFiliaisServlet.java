/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.estabelecimento;

import ac.dao.EstabelecimentoDAO;
import ac.entidade.Estabelecimento;
import ac.utils.Utils;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Paulo Costa
@WebServlet(
        name = "IncluirFiliais",
        description = "Acessa a página de cadastro de Filiais",
        urlPatterns = "/IncluirFilial"
)
 */
public class IncluirFiliaisServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher("/pages/estabelecimento/incluirFilial.jsp");

        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cnpj = request.getParameter("cnpj");
        String inscricaoEstadual = request.getParameter("inscricaoEstadual");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String logradouro = request.getParameter("logradouro");
        String complemento = request.getParameter("complemento");
        String unidadeFederativa = request.getParameter("unidadeFederativa");
        String cep = request.getParameter("cep");
        String numeroEndereco = request.getParameter("numeroEndereco");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");

        Estabelecimento estabelecimento
                = new Estabelecimento(
                        false,
                        null,
                        nome,
                        cnpj,
                        inscricaoEstadual,
                        email,
                        telefone,
                        cep,
                        logradouro,
                        numeroEndereco,
                        complemento,
                        unidadeFederativa,
                        bairro,
                        cidade);

        try {
            boolean cadastrou = EstabelecimentoDAO.cadastrarEstabelecimento(estabelecimento);

            if (cadastrou) {
                response.sendRedirect("sucesso.jsp");
            } else {
                response.sendRedirect("erro.jsp");
            }
        } catch (IOException e) {
            Utils.mostrarTelaErro(e, request, response);
        }
    }
}
