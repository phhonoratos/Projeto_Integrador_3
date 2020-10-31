/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.funcionario;

import ac.dao.FuncionarioDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paulo
 */
public class ExcluirFuncionarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cpf = request.getParameter("cpf");
        try {
            FuncionarioDAO.deleteFuncionario(cpf);
            response.getWriter().print("ok");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExcluirFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex.getMessage());
        }
    }

}
