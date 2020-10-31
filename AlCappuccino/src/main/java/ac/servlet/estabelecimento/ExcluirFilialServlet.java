package ac.servlet.estabelecimento;

import ac.dao.EstabelecimentoDAO;
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
@WebServlet(name = "ExcluirFilialServlet", urlPatterns = {"/ExcluirFilial"})
public class ExcluirFilialServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // int tokenId; TODO: Token to Admin Login

        String id = req.getParameter("id");

        boolean excluiu = EstabelecimentoDAO.excluirEstabelecimento(id);

        if (excluiu) {
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

}
