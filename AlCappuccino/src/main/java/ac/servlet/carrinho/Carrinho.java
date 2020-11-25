/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.carrinho;

import ac.dao.ProdutoDAO;
import ac.entidade.Produto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author joao
 */
public class Carrinho extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idProduto = request.getParameter("idProduto");
        if (idProduto != null) {
            Double valorTotal = Double.parseDouble(request.getParameter("valorTotal"));
            int quantidade = Integer.parseInt(request.getParameter("quantidade"));
            Produto produto = ProdutoDAO.getProduto(Integer.parseInt(idProduto));
            produto.setValorVenda(valorTotal);
            produto.setQuantidadeEstoque(quantidade);

            HttpSession sessao = request.getSession();
            List<Produto> listaCarrinho;
            if (sessao.getAttribute("carrinho") == null) {
                listaCarrinho = new ArrayList<>();
            } else {
                listaCarrinho = (List<Produto>) sessao.getAttribute("carrinho");
            }
            if (!listaCarrinho.contains(produto)) {
                listaCarrinho.add(produto);
            }

            sessao.setAttribute("carrinho", listaCarrinho);
        }else{
            List<Produto> listaCarrinho;
            HttpSession sessao = request.getSession();
            listaCarrinho = (List<Produto>) sessao.getAttribute("carrinho");
            double total=0;
            for (Produto produto : listaCarrinho) {
                total += produto.getValorVenda();
            }
            sessao.setAttribute("totalCarrinho", total);
        }

    }

}
