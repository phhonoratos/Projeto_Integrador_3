/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.filter;

import ac.dao.FuncionarioDAO;
import ac.entidade.Funcionario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paulo
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        
        //Query no banco
        Funcionario funcionario = FuncionarioDAO.getUsuario(login);
        if(funcionario == null || !funcionario.validarSenha(senha)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?erro=UserNotFound");            
        } else {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("usuario", funcionario); 
            response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
        }
    }

}
