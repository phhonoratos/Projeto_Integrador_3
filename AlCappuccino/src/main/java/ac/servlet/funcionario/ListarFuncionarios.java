/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.funcionario;

import ac.dao.FuncionarioDAO;
import ac.entidade.Funcionario;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paulo
 */
public class ListarFuncionarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cpf = request.getParameter("cpf");
        if(cpf != "" && cpf != null) {
            Funcionario funcionario = FuncionarioDAO.getFuncionario(cpf);
            List list = java.util.Arrays.asList(funcionario);
            request.setAttribute("listaFuncionarios", list);
        } else {
            List<Funcionario> funcionarios = FuncionarioDAO.getFuncionarios();
            request.setAttribute("listaFuncionarios", funcionarios);
        }
        
        RequestDispatcher requestDispatcher = 
                getServletContext().getRequestDispatcher("/pages/funcionario/listarFuncionarios.jsp");
        requestDispatcher.forward(request, response);
    }

}
