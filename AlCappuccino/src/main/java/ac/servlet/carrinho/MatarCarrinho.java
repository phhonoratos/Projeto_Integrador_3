/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.carrinho;

import ac.dao.DetalheVendaDAO;
import ac.dao.EstabelecimentoDAO;
import ac.dao.ProdutoDAO;
import ac.dao.VendaDAO;
import ac.entidade.Cliente;
import ac.entidade.DetalheVenda;
import ac.entidade.Estabelecimento;
import ac.entidade.Funcionario;
import ac.entidade.Produto;
import ac.entidade.Venda;
import ac.servlet.venda.CadastrarVenda;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paulo
 */
public class MatarCarrinho extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        
        httpResponse.sendRedirect(httpRequest.getContextPath() + "/CadastrarVenda");
        HttpSession sessao = request.getSession();
        sessao.removeAttribute("carrinho");
        sessao.removeAttribute("totalCarrinho");     
    }

}
