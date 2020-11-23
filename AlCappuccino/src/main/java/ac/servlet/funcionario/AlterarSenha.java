/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.funcionario;

import ac.dao.EstabelecimentoDAO;
import ac.dao.FuncionarioDAO;
import ac.entidade.Estabelecimento;
import ac.entidade.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paulo
 */
public class AlterarSenha extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/funcionario/alterarSenha.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String novaSenha = request.getParameter("novaSenha");

        Funcionario funcionario = FuncionarioDAO.getUsuario(email);

        if (senha.equalsIgnoreCase(novaSenha)) {
            funcionario.setSenha(senha);

            try {
                FuncionarioDAO.updateSenha(funcionario);
                response.sendRedirect("sucesso.jsp");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(AlterarFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(AlterarFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("msgErro", ex.getMessage());
                RequestDispatcher requestDispatcher
                        = getServletContext().getRequestDispatcher("/erro.jsp");
                requestDispatcher.forward(request, response);
            }
        } else {
            response.sendRedirect("divergeNovaSenha.jsp");
        }

    }

}
