/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet.funcionario;

import ac.dao.FuncionarioDAO;
import ac.entidade.Funcionario;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class AlterarFuncionarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cpf = request.getParameter("cpf");
        Funcionario funcionario = FuncionarioDAO.getFuncionario(cpf);
        request.setAttribute("funcionarios", funcionario);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/pages/funcionario/alterarFuncionarios.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String estado_civil = request.getParameter("estado_civil");
        String sexo = request.getParameter("sexo");
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String uf = request.getParameter("uf");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        Date dt_nascimento = Date.valueOf(request.getParameter("dt_nascimento"));
        String rg = request.getParameter("rg");
        String cargo = request.getParameter("cargo");
        String salarioStr = request.getParameter("salario");
        double salario = Double.parseDouble(salarioStr);
        String filial = request.getParameter("filial");
        Date dt_adm = Date.valueOf(request.getParameter("dt_adm"));
        String data_dem = request.getParameter("dt_dem").equals("") ? "1000-01-01" : request.getParameter("dt_dem");
        Date dt_dem = null;
        if(!data_dem.equals("1000-01-01")) {
            dt_dem = Date.valueOf(data_dem);
        }        
        String observacao = request.getParameter("observacao");
        
        Funcionario funcionario = FuncionarioDAO.getFuncionario(cpf);
        
        funcionario.setNome(nome);
        funcionario.setEmail(email);
        funcionario.setCpf(cpf);
        funcionario.setTelefone(telefone);
        funcionario.setEstadoCivil(estado_civil);
        funcionario.setSexo(sexo);
        funcionario.setCep(cep);
        funcionario.setLogradouro(logradouro);
        funcionario.setNumeroEndereco(numero);
        funcionario.setComplemento(complemento);
        funcionario.setUnidadeFederativa(uf);
        funcionario.setBairro(bairro);
        funcionario.setCidade(cidade);
        funcionario.setDataNascimento(dt_nascimento);
        funcionario.setNumeroRg(rg);
        funcionario.setCargo(cargo);
        funcionario.setSalario(salario);
        funcionario.setFilial(filial);
        funcionario.setDataAdmissao(dt_adm);
        funcionario.setDataDemissao(dt_dem);
        funcionario.setObservacao(observacao);
        
        try {
            FuncionarioDAO.updateFuncionario(funcionario);
            response.sendRedirect("sucesso.jsp");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlterarFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AlterarFuncionarios.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("msgErro", ex.getMessage());
            RequestDispatcher requestDispatcher
                    = getServletContext().getRequestDispatcher("/erro.jsp");
            requestDispatcher.forward(request, response);
        }
    }

}
