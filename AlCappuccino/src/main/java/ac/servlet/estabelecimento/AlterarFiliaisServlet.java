package ac.servlet.estabelecimento;

import ac.dao.EstabelecimentoDAO;
import ac.entidade.Estabelecimento;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Paulo Costa
 */
@WebServlet(name = "AlterarFiliaisServlet", urlPatterns = {"/AlterarFiliais"},
        description = "Altera os dados cadastrais das Filiais no Sistema.")
public class AlterarFiliaisServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String id = req.getParameter("id");
        String nome = req.getParameter("nome");
        String cnpj = req.getParameter("cnpj");
        String inscricaoEstadual = req.getParameter("inscricaoEstadual");
        String email = req.getParameter("email");
        String telefone = req.getParameter("telefone");
        String logradouro = req.getParameter("logradouro");
        String complemento = req.getParameter("complemento");
        String unidadeFederativa = req.getParameter("unidadeFederativa");
        String cep = req.getParameter("cep");
        String numeroEndereco = req.getParameter("numeroEndereco");
        String bairro = req.getParameter("bairro");
        String cidade = req.getParameter("cidade");
        
        Estabelecimento estabelecimento
                = new Estabelecimento(
                        false,
                        null,
                        nome,
                        cnpj,
                        inscricaoEstadual,
                        email,
                        telefone,
                        cep,
                        logradouro,
                        numeroEndereco,
                        complemento,
                        unidadeFederativa,
                        bairro,
                        cidade);
        
        estabelecimento.setId(Integer.parseInt(id));
        
        boolean atualizou = EstabelecimentoDAO.alterarEstabelecimento(estabelecimento);
        
        if (atualizou) {
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="Info methods. Click on the + sign on the left to edit the code.">
    @Override
    public String getServletInfo() {
        return "Alterar dados das Filiais cadastradas no sistema.";
    }// </editor-fold>

}
