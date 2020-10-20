/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet;

import ac.dao.FuncionariosDAO;
import ac.entidade.Funcionarios;
import java.io.IOException;
import java.sql.Date;
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
        
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String estado_civil = request.getParameter("estado_civil");
        String sexo = request.getParameter("sexo");
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String uf = request.getParameter("uf");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        Date dt_nascimento = Date.valueOf(request.getParameter("dt_nascimento"));
        String rg = request.getParameter("rg");
        String cargo = request.getParameter("cargo");
        String salarioStr = request.getParameter("salario");
        double salario = Double.parseDouble(salarioStr);
        String filial = request.getParameter("filial");
        Date dt_adm = Date.valueOf(request.getParameter("dt_adm"));
        Date dt_dem = Date.valueOf(request.getParameter("dt_dem"));
        
        Funcionarios funcionarios = new Funcionarios(rg, cargo, salario, filial, dt_adm, dt_dem, nome, email, 
                cpf, telefone, estado_civil, sexo, cep, logradouro, numero, complemento, uf, bairro, cidade, dt_nascimento);
        
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
