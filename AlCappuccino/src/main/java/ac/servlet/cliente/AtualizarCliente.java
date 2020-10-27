/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.cliente;

import ac.dao.ClienteDAO;
import ac.entidade.Cliente;
import ac.utils.Utils;
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
 * @author joao
 */
public class AtualizarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cpf = request.getParameter("cpf");
        Cliente cliente = ClienteDAO.getCliente(cpf);
        request.setAttribute("atualizar", cliente);
        RequestDispatcher rd
                = getServletContext().getRequestDispatcher("/pages/cliente/atualizarCliente.jsp");
        rd.forward(request, response);
    }

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
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String estado_civil = request.getParameter("estado_civil");
        String sexo = request.getParameter("sexo");
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String uf = request.getParameter("uf");
        String cidade = request.getParameter("cidade");
        Date data_nascimento = Date.valueOf(request.getParameter("data_nascimento"));

        Cliente cliente = ClienteDAO.getCliente(cpf);

        cliente.setNome(nome);
        cliente.setEmail(email);
        cliente.setBairro(bairro);
        cliente.setCep(cep);
        cliente.setCidade(cidade);
        cliente.setComplemento(complemento);
        cliente.setDataNascimento(data_nascimento);
        cliente.setEstadoCivil(estado_civil);
        cliente.setLogradouro(logradouro);
        cliente.setNumeroEndereco(numero);
        cliente.setSexo(sexo);
        cliente.setUnidadeFederativa(uf);
        cliente.setTelefone(telefone);

        try {
            ClienteDAO.updateCliente(cliente);
            response.sendRedirect("sucesso.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AtualizarCliente.class.getName()).log(Level.SEVERE, null, ex);
            Utils.mostrarTelaErro(ex, request, response);
        }
    }

}
