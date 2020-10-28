/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet;

import ac.dao.ProdutoDAO;
import ac.entidade.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author danil
 */
public class ExcluirProduto extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produto produto = ProdutoDAO.getProduto(id);
      
        try {
           ProdutoDAO.deleteProduto(id);
           response.getWriter().print(true);
       } catch (ClassNotFoundException | SQLException ex) {
           Logger.getLogger(ExcluirProduto.class.getName()).log(Level.SEVERE, null, ex);
           response.getWriter().print(false);
       } 
        
    }
}
