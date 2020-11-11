/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.cliente;

import ac.dao.ClienteDAO;
import ac.entidade.Cliente;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joao
 */
public class CadastrarCliente extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher("/pages/cliente/cadastrarCliente.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String estadoCivil = request.getParameter("estado_civil");
        String sexo = request.getParameter("sexo");
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String unidadeFederativa = request.getParameter("uf");
        String cidade = request.getParameter("cidade");
        Date dataNascimento = Date.valueOf(request.getParameter("data_nascimento"));

//        SimpleDateFormat formatter1=new SimpleDateFormat("yyyy/MM/dd");
//        Date data_nascimento=null;  
//        try {
//            data_nascimento = new java.util.Date(formatter1.parse(request.getParameter("data_nascimento")));
//        } catch (ParseException ex) {
//            Logger.getLogger(CadastrarCliente.class.getName()).log(Level.SEVERE, null, ex);
//        }

        Cliente cliente = new Cliente(cpf, estadoCivil, sexo, dataNascimento, nome, email, telefone, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade);

        try {
            ClienteDAO.addCliente(cliente);
            response.sendRedirect("sucesso.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastrarCliente.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastrarCliente.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("msgErro", ex.getMessage());
            RequestDispatcher requestDispatcher
                    = getServletContext().getRequestDispatcher("/erro.jsp");
            requestDispatcher.forward(request, response);
        }
    }

}
