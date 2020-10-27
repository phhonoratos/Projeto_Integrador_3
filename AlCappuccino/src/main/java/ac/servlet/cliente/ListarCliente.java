/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.cliente;

import ac.dao.ClienteDAO;
import ac.entidade.Cliente;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joao
 */
public class ListarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cpf = request.getParameter("cpf");
        if (cpf != "" && cpf != null) {
            Cliente cliente = ClienteDAO.getCliente(cpf);
            List list = java.util.Arrays.asList(cliente);
            request.setAttribute("listaClientes", list);
        } else {
            List<Cliente> listaClientes = ClienteDAO.getClientes();
            request.setAttribute("listaClientes", listaClientes);
        }

        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher("/pages/cliente/listarCliente.jsp");
        requestDispatcher.forward(request, response);
    }

}
