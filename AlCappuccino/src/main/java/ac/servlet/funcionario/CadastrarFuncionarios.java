/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.funcionario;

import ac.dao.EstabelecimentoDAO;
import ac.entidade.Estabelecimento;
import ac.dao.FuncionarioDAO;
import ac.entidade.Funcionario;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
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
 * @author paulo
 */
public class CadastrarFuncionarios extends HttpServlet {

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
        
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String estadoCivil = request.getParameter("estado_civil");
        String sexo = request.getParameter("sexo");
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String unidadeFederativa = request.getParameter("uf");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        Date dataNascimento = Date.valueOf(request.getParameter("dt_nascimento"));
        String numeroRg = request.getParameter("rg");
        String cargo = request.getParameter("cargo");
        String salarioStr = request.getParameter("salario");
        double salario = Double.parseDouble(salarioStr);
        String filial = request.getParameter("filial");
        Estabelecimento estabelecimento = new Estabelecimento();
        estabelecimento.setId(Integer.parseInt(filial));
        Date dataAdmissao = Date.valueOf(request.getParameter("dt_adm"));
        String dt_dem = request.getParameter("dt_dem").equals("") ? "1000-01-01" : request.getParameter("dt_dem");
        Date dataDemissao = null;
        if(!dt_dem.equals("1000-01-01")) {
            dataDemissao = Date.valueOf(dt_dem);
        }
        String observacao = request.getParameter("observacao");
        
        Funcionario funcionario = new Funcionario(nome, numeroRg, cargo, salario, dataAdmissao, dataDemissao, observacao, email, cpf, telefone, estadoCivil, sexo, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade, dataNascimento, estabelecimento);
        
        try {
            FuncionarioDAO.addFuncionario(funcionario);
            response.sendRedirect("sucesso.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CadastrarFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CadastrarFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("msgErro", ex.getMessage());
            RequestDispatcher requestDispatcher
                    = getServletContext().getRequestDispatcher("/erro.jsp");
            requestDispatcher.forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Estabelecimento> filiais = EstabelecimentoDAO.obterFiliais();
        
        request.setAttribute("filiais", filiais);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/funcionario/cadastrarFuncionarios.jsp");
            rd.forward(request, response);
    }

}
