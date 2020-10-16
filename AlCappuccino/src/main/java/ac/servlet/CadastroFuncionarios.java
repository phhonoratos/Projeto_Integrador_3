/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.servlet;

import ac.entidade.Funcionarios;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author paulo
 */
@WebServlet(name = "CadastrarFuncionarios", urlPatterns = {"/CadastrarFuncionarios"})
public class CadastroFuncionarios extends HttpServlet {

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
       
        String cpfStr = request.getParameter("cpf");
        Long cpf = Long.parseLong(cpfStr);
        String nome = request.getParameter("nome");
        String rgStr = request.getParameter("rg");
        Long rg = Long.parseLong(rgStr);
        String sexo = request.getParameter("sexo");
        String dt_nasc = request.getParameter("dt_nasc");
        String estado_civil = request.getParameter("estado_civil");
        String telefone1Str = request.getParameter("telefone1");
        Long telefone1 = Long.parseLong(telefone1Str);
        String telefone2Str = request.getParameter("telefone2");
        Long telefone2 = Long.parseLong(telefone2Str);
        String email = request.getParameter("email");
        String endereco = request.getParameter("endereco");
        String complemento = request.getParameter("complemento");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String cargo = request.getParameter("cargo");
        String salarioStr = request.getParameter("salario");
        Double salario = Double.parseDouble(salarioStr);
        String comissaoStr = request.getParameter("comissao");
        Float comissao = Float.parseFloat(comissaoStr);
        String filial = request.getParameter("filial");
        String dt_adm = request.getParameter("dt_adm");
        String dt_dem = request.getParameter("dt_dem");
        String statusStr = request.getParameter("status");
        boolean status = Boolean.getBoolean(statusStr);
        
        Funcionarios funcionarios = new Funcionarios(cpf, nome, rg, sexo, dt_nasc, estado_civil, telefone1, telefone2, email, endereco, 
                complemento, cidade, estado, cargo, salario, comissao, filial, dt_adm, dt_dem, status);
    }

}
