/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.venda;

import ac.dao.DetalheVendaDAO;
import ac.dao.VendaDAO;
import ac.entidade.DetalheVenda;
import ac.entidade.Venda;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Comparator;
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
 * @author sillas.clpinto
 */
public class ListarVenda extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Venda> vendas = VendaDAO.select();
            request.setAttribute("vendas", vendas);
            
            List<DetalheVenda> detalheVendas = DetalheVendaDAO.listaDetalheVenda("");
            request.setAttribute("detalheVendas", detalheVendas);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/venda/listarVendas.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ListarVenda.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}