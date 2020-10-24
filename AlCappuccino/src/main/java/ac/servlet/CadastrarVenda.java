/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet;

import ac.dao.ClienteDAO;
import ac.dao.FuncionariosDAO;
import ac.dao.ProdutoDAO;
import ac.dao.VendaDAO;
import ac.entidade.Cliente;
import ac.entidade.Funcionarios;
import ac.entidade.Produto;
import ac.entidade.Venda;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
 * @author joao
 */
public class CadastrarVenda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Produto> listaProduto = ProdutoDAO.getProduto();
        request.setAttribute("listaProduto", listaProduto);

        List<Funcionarios> listaFuncionarios = FuncionariosDAO.getFuncionarios();
        request.setAttribute("listaFuncionarios", listaFuncionarios);
        
        List<Cliente> listaClientes = ClienteDAO.getClientes();
        request.setAttribute("listaClientes", listaClientes);

        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher("/cadastrarVenda.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
        Date date = new Date(System.currentTimeMillis());
        
        String vendedor = request.getParameter("vendedor");
        
        String cliente = request.getParameter("cliente");
        
 
        
        
        String[] produto = request.getParameterValues("produto");
        String[] categoria = request.getParameterValues("categoria");
        String[] estoque = request.getParameterValues("estoque");
        String[] valor_venda = request.getParameterValues("valor_venda");
        String[] quantidade = request.getParameterValues("quantidade");
        String[] valores = request.getParameterValues("valorTotal");
        
        float soma=0;
        for (String valorTotal : valores) {
            if (!valorTotal.trim().equals("")){
                soma+= Float.parseFloat(valorTotal);
            }
        }
        
        //Persistindo para Venda
        
        Venda venda = new Venda();
        venda.setCpf_cliente(cliente);
        venda.setCpf_funcionario(vendedor);
        venda.setData_venda(date);
        venda.setTotal(soma);
        
        
        try {
            VendaDAO.addVenda(venda);
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
