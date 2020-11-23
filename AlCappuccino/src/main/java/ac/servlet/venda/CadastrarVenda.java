/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.venda;

import ac.servlet.*;
import ac.dao.ClienteDAO;
import ac.dao.DetalheVendaDAO;
import ac.dao.EstabelecimentoDAO;
import ac.dao.FuncionarioDAO;
import ac.dao.ProdutoDAO;
import ac.dao.VendaDAO;
import ac.entidade.Cliente;
import ac.entidade.DetalheVenda;
import ac.entidade.Funcionario;
import ac.entidade.Produto;
import ac.entidade.Venda;
import ac.entidade.Estabelecimento;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
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
        
        for (Produto produto : listaProduto) {
            produto.setPreco((float) Math.round(produto.getPreco() * 100.0) / 100.0);
        }
                
        request.setAttribute("listaProduto", listaProduto); 

        List<Funcionario> listaFuncionarios = FuncionarioDAO.getFuncionarios();
        request.setAttribute("listaFuncionarios", listaFuncionarios);

        List<Cliente> listaClientes = ClienteDAO.getClientes();
        request.setAttribute("listaClientes", listaClientes);

        RequestDispatcher requestDispatcher = getServletContext()
                .getRequestDispatcher("/pages/venda/cadastrarVenda.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
        Date date = new Date(System.currentTimeMillis());
        Time hora = new Time(date.getTime());
        
        int id_estabelecimento = Integer.parseInt(request.getParameter("id_estabelecimento"));
        String vendedor = request.getParameter("vendedor");
        String cliente = request.getParameter("cliente");
        
        if (cliente.trim().equals("")){
            cliente="11111111111";
        }

        String[] id = request.getParameterValues("id");
        String[] produto = request.getParameterValues("produto");
        String[] categoria = request.getParameterValues("categoria");
        String[] estoque = request.getParameterValues("estoque");
        String[] valor_venda = request.getParameterValues("valor_venda");
        String[] quantidade = request.getParameterValues("quantidade");
        String[] valores = request.getParameterValues("valorTotal");

        String[] porcentagem = request.getParameterValues("porcentagem");

        float soma = 0;
        for (String valorTotal : valores) {
            if (!valorTotal.trim().equals("")) {
                soma += Float.parseFloat(valorTotal);
            }
        }

        //Persistindo para Venda
        Venda venda = new Venda();
        
        //sillas
        Cliente c = new Cliente();
        c.setCpf(cliente);
        venda.setCliente(c);
        //sillas
        Funcionario f = new Funcionario();
        f.setCpf(vendedor);
        venda.setFuncionario(f);
        venda.setDataVenda(date);
        venda.setHorarioVenda(hora);
        venda.setValorTotal(soma);

        boolean retornoVenda = false;
        Estabelecimento estabelecimento=null;
        try {
            estabelecimento = EstabelecimentoDAO.buscarEstabelecimentoPeloId(id_estabelecimento);
            retornoVenda = VendaDAO.addVenda(venda);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastrarVenda.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastrarVenda.class.getName()).log(Level.SEVERE, null, ex);
        }

        //Persistindo DetalheVenda
        int retornoProdutoAtualizado = 0;
        int retornoInsereDetalheVenda = 0;
        for (int i = 0; i < valores.length; i++) {
            if (!valores[i].trim().equals("") && Float.parseFloat(valores[i]) > 0) {
                DetalheVenda dv = new DetalheVenda();

                int idproduto = Integer.parseInt(id[i]);
                //sillas
                Produto p = new Produto();
                p.setId(idproduto);
                dv.setProduto(p);

                //sillas
                dv.setVenda(venda);

                int quantidadeProduto = Integer.parseInt(quantidade[i]);
                dv.setQuantidade(quantidadeProduto);

                float valorTotal = (Float.parseFloat(quantidade[i]) * Float.parseFloat(valor_venda[i]));
                dv.setValorTotal(valorTotal);

                int novoEstoque = Integer.parseInt(estoque[i]) - Integer.parseInt(quantidade[i]);

                Produto atualizarEstoque = new Produto(
                        Integer.parseInt(id[i]),
                        categoria[i], 
                        produto[i], 
                        novoEstoque,
                        Float.parseFloat(valor_venda[i]),
                        Float.parseFloat(porcentagem[i]),
                        Float.parseFloat(valor_venda[i]),
                        estabelecimento
                );

                try {
                    retornoProdutoAtualizado = ProdutoDAO.updateProduto(atualizarEstoque);
                    retornoInsereDetalheVenda = DetalheVendaDAO.addDetalheVenda(dv);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(CadastrarVenda.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(CadastrarVenda.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }

        if (retornoVenda && retornoProdutoAtualizado > 0 && retornoInsereDetalheVenda > 0) {
            response.sendRedirect("sucesso.jsp");
        } else {
            request.setAttribute("msgErro", "Erro");
            RequestDispatcher requestDispatcher
                    = getServletContext().getRequestDispatcher("/erro.jsp");
            requestDispatcher.forward(request, response);
        }

    }

}
