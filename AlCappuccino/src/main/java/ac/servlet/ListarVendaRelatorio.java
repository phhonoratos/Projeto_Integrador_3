/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet;

import ac.dao.DetalheVendaDAO;
import ac.dao.VendaDAO;
import ac.entidade.DetalheVenda;
import ac.entidade.Venda;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
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
public class ListarVendaRelatorio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String chamada = request.getParameter("chamada");

        if (chamada == null) {
            listarVendasTotal(request, response);
        } else if (chamada.equals("listarDetalhes")) {
            listarDetalhes(request, response);
        } else {
            listarVendas(request, response);
        }

//        switch (chamada) {
//        case "listarVendas":
//            listarVendas(request, response);
//            break;
//        case "listarDetalhes":
//            listarDetalhes(request, response);
//            break;
//        default:
//            listarVendasTotal(request, response);
//            break;
//        }
    }

    private void listarVendasTotal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Venda> vendas = VendaDAO.select();
            float total = totalVendas(vendas);

            request.setAttribute("vendas", vendas);
            request.setAttribute("totalVendas", total);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/relatorio/relatorio.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ListarVendaRelatorio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void listarVendas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dataInicialStr = request.getParameter("inicio");
        String dataFinalStr = request.getParameter("final");

        Date dataInicial = Date.valueOf(dataInicialStr);
        Date dataFinal = Date.valueOf(dataFinalStr);

        try {
            List<Venda> vendas = VendaDAO.select(dataInicial, dataFinal);
            float total = totalVendas(vendas);

            request.setAttribute("vendas", vendas);
            request.setAttribute("totalVendas", total);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/relatorio/relatorio.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ListarVendaRelatorio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void listarDetalhes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idVendaStr = request.getParameter("idVenda");
        int idVenda = Integer.parseInt(idVendaStr);

        try {
            List<DetalheVenda> detalhes = DetalheVendaDAO.listaDetalheVenda(idVenda);

            request.setAttribute("detalhes", detalhes);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/relatorio/relatorio.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ListarVendaRelatorio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private float totalVendas(List<Venda> vendas) {
        float total = 0;
        for (Venda venda : vendas) {
            total += venda.getValorTotal();
        }

        return total;
    }
}
