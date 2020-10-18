/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet;

import ac.dao.FuncionariosDAO;
import ac.entidade.Funcionarios;
import java.io.IOException;
import java.sql.SQLException;
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
public class CadastrarFuncionarios extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String rg = request.getParameter("rg");
        
        Funcionarios funcionarios = new Funcionarios(cpf, nome, rg);
        
        try {
            FuncionariosDAO.addFuncionario(funcionarios);
            response.sendRedirect("sucesso.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastrarFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastrarFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("msgErro", ex.getMessage());
            RequestDispatcher requestDispatcher
                    = getServletContext().getRequestDispatcher("/erro.jsp");
            requestDispatcher.forward(request, response);
        }
    }

}
