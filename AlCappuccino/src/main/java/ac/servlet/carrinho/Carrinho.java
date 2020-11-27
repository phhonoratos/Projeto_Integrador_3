/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.carrinho;

import ac.dao.ClienteDAO;
import ac.dao.ProdutoDAO;
import ac.entidade.Cliente;
import ac.entidade.Produto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
        } else {
            HttpSession sessao = request.getSession();
            if (sessao.getAttribute("carrinho") != null) {
                List<Produto> listaCarrinho;
                listaCarrinho = (List<Produto>) sessao.getAttribute("carrinho");
                double total = 0;
                for (Produto produto : listaCarrinho) {
                    total += produto.getValorVenda();
                }
                sessao.setAttribute("totalCarrinho", total);
            }

        }
        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher("/pages/venda/cadastrarVenda.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        String[] id = request.getParameterValues("id");
//        String[] nomeProduto = request.getParameterValues("produto");
//        String[] categoria = request.getParameterValues("categoria");
        String[] estoque = request.getParameterValues("estoque");
//        String[] valor_venda = request.getParameterValues("valor_venda");
        String[] quantidade = request.getParameterValues("quantidade");
        String[] valores = request.getParameterValues("valorTotal");

        String[] porcentagem = request.getParameterValues("porcentagem");
        
        String cliente = request.getParameter("cliente");
        
        if (cliente.trim().equals("")){
            cliente="11111111111";
        }
        
        Cliente c = ClienteDAO.getCliente(cliente);
        
        List<Produto> listaCarrinho=null;
        HttpSession sessao = request.getSession();
        double soma=0;
        for (int i = 0; i < valores.length; i++) {
            if (!valores[i].trim().equals("") && Float.parseFloat(valores[i]) > 0) {
                Double valorTotal = Double.parseDouble(valores[i]);
                Produto produto = ProdutoDAO.getProduto(Integer.parseInt(id[i]));
                produto.setValorVenda(valorTotal);
                produto.setQuantidadeEstoque(Integer.parseInt(estoque[i]));
                soma += valorTotal;
                
                if (sessao.getAttribute("carrinho") == null) {
                    listaCarrinho = new ArrayList<>();
                } else {
                    listaCarrinho = (List<Produto>) sessao.getAttribute("carrinho");
                }
                if (!listaCarrinho.contains(produto)) {
                    listaCarrinho.add(produto);
                }

                sessao.setAttribute("carrinho", listaCarrinho);
                sessao.setAttribute("totalCarrinho", soma);

            }
        }
        sessao.setAttribute("carrinho", listaCarrinho);
        sessao.setAttribute("quantidade", quantidade);
        sessao.setAttribute("cliente", c);

        httpResponse.sendRedirect(httpRequest.getContextPath() + "/CadastrarVenda");
    }

}
