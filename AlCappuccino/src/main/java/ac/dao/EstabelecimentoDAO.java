package ac.dao;

import ac.bd.ConexaoDB;
import ac.entidade.Estabelecimento;
import ac.entidade.Funcionario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Paulo Costa
 */
public class EstabelecimentoDAO {

    private static final String SQL_SELECT_FILIAIS = "SELECT * FROM estabelecimento";
    private static final String SQL_SELECT_MATRIZ = "SELECT * FROM estabelecimento WHERE matriz = 1";
    private static final String SQL_SELECT_ESTABELECIMENTO_PELO_ID = "SELECT * FROM estabelecimento WHERE id = ?";
    private static final String SQL_INSERT_ESTABELECIMENTO = "INSERT INTO estabelecimento (nome, cnpj, inscricao_estadual, uf, logradouro, bairro, email, cidade, telefone, numero_endereco, complemento, cep, matriz) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_DELETE_ESTABELECIMENTO = "DELETE FROM estabelecimento WHERE id = ?";
    private static final String SQL_UPDATE_ESTABELECIMENTO = "UPDATE estabelecimento set nome = ?, cnpj = ?, inscricao_estadual = ?, email = ?, telefone = ?, cep = ?, logradouro = ?, numero_endereco = ?, complemento = ?, uf = ?, bairro = ?, cidade = ? WHERE id = ?";

    public static boolean cadastrarEstabelecimento(Estabelecimento estabelecimento) {
        boolean cadastrou = false;

        try (Connection conexao = ConexaoDB.getConexao();
                PreparedStatement SQL = conexao.prepareStatement(SQL_INSERT_ESTABELECIMENTO)) {

            SQL.setString(1, estabelecimento.getNome());
            SQL.setString(2, estabelecimento.getCnpj());
            SQL.setString(3, estabelecimento.getInscricaoEstadual());
            SQL.setString(4, estabelecimento.getUnidadeFederativa());
            SQL.setString(5, estabelecimento.getLogradouro());
            SQL.setString(6, estabelecimento.getBairro());
            SQL.setString(7, estabelecimento.getEmail());
            SQL.setString(8, estabelecimento.getCidade());
            SQL.setString(9, estabelecimento.getTelefone());
            SQL.setString(10, estabelecimento.getNumeroEndereco());
            SQL.setString(11, estabelecimento.getComplemento());
            SQL.setString(12, estabelecimento.getCep());
            SQL.setBoolean(13, estabelecimento.isMatriz());
            //SQL.setString(14, estabelecimento.getGerenteRegional().getNome());

            cadastrou = SQL.executeUpdate() > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EstabelecimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cadastrou;
    }

    public static List<Estabelecimento> obterFiliais() {
        List<Estabelecimento> listaEstabelecimentos = new ArrayList<>();

        try (Connection conexao = ConexaoDB.getConexao();
                PreparedStatement SQL = conexao.prepareStatement(SQL_SELECT_FILIAIS);
                ResultSet result = SQL.executeQuery()) {

            while (result.next()) {

                int id = result.getInt("id");
                boolean matriz = result.getBoolean("matriz");
                String nome = result.getString("nome");
                String cnpj = result.getString("cnpj");
                String inscricaoEstadual = result.getString("inscricao_estadual");
                String email = result.getString("email");
                String telefone = result.getString("telefone");
                String cep = result.getString("cep");
                String logradouro = result.getString("logradouro");
                String numeroEndereco = result.getString("numero_endereco");
                String complemento = result.getString("complemento");
                String unidadeFederativa = result.getString("uf");
                String bairro = result.getString("bairro");
                String cidade = result.getString("cidade");

                Funcionario gerenteRegional = new Funcionario();
                gerenteRegional.setCpf(result.getString("cpf_gerente_regional"));
                
                Estabelecimento estabelecimento = new Estabelecimento(matriz, gerenteRegional, nome, cnpj, inscricaoEstadual, email, telefone, cep, logradouro, numeroEndereco, complemento, unidadeFederativa, bairro, cidade);
                estabelecimento.setId(id);

                listaEstabelecimentos.add(estabelecimento);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EstabelecimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listaEstabelecimentos;
    }

    public static Estabelecimento obterMatriz() {

        try (Connection conexao = ConexaoDB.getConexao();
                PreparedStatement SQL = conexao.prepareStatement(SQL_SELECT_MATRIZ);
                ResultSet result = SQL.executeQuery()) {

            if (result.next()) {

                int id = result.getInt("id");
                boolean matriz = result.getBoolean("matriz");
                String nome = result.getString("nome");
                String cnpj = result.getString("cnpj");
                String inscricaoEstadual = result.getString("inscricao_estadual");
                String email = result.getString("email");
                String telefone = result.getString("telefone");
                String cep = result.getString("cep");
                String logradouro = result.getString("logradouro");
                String numeroEndereco = result.getString("numero_endereco");
                String complemento = result.getString("complemento");
                String unidadeFederativa = result.getString("uf");
                String bairro = result.getString("bairro");
                String cidade = result.getString("cidade");

                /*Funcionario gerenteRegional = new Funcionario();
                //gerenteRegional.setId(Integer.parseInt(fkGerenteRegional)); */
                Estabelecimento estabelecimento = new Estabelecimento(matriz, null, nome, cnpj, inscricaoEstadual, email, telefone, cep, logradouro, numeroEndereco, complemento, unidadeFederativa, bairro, cidade);
                estabelecimento.setId(id);

                return estabelecimento;
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EstabelecimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static boolean excluirEstabelecimento(String id) {
        boolean excluiu = false;

        try (Connection conexao = ConexaoDB.getConexao();
                PreparedStatement SQL = conexao.prepareStatement(SQL_DELETE_ESTABELECIMENTO)) {

            SQL.setString(1, id);

            excluiu = SQL.executeUpdate() > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EstabelecimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return excluiu;
    }

    public static boolean alterarEstabelecimento(Estabelecimento estabelecimento) {
        boolean alterou = false;

        try (Connection conexao = ConexaoDB.getConexao();
                PreparedStatement SQL = conexao.prepareStatement(SQL_UPDATE_ESTABELECIMENTO)) {

            SQL.setString(1, estabelecimento.getNome());
            SQL.setString(2, estabelecimento.getCnpj());
            SQL.setString(3, estabelecimento.getInscricaoEstadual());
            SQL.setString(4, estabelecimento.getEmail());
            SQL.setString(5, estabelecimento.getTelefone());
            SQL.setString(6, estabelecimento.getCep());
            SQL.setString(7, estabelecimento.getLogradouro());
            SQL.setString(8, estabelecimento.getNumeroEndereco());
            SQL.setString(9, estabelecimento.getComplemento());
            SQL.setString(10, estabelecimento.getUnidadeFederativa());
            SQL.setString(11, estabelecimento.getBairro());
            SQL.setString(12, estabelecimento.getCidade());
            SQL.setInt(13, estabelecimento.getId());

            alterou = SQL.executeUpdate() > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EstabelecimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return alterou;
    }

    public static Estabelecimento buscarEstabelecimentoPeloId(int idEstabelecimento) {
        Estabelecimento estabelecimento;

        try (Connection conexao = ConexaoDB.getConexao();
                PreparedStatement SQL = conexao.prepareStatement(SQL_SELECT_ESTABELECIMENTO_PELO_ID)) {

            SQL.setInt(1, idEstabelecimento);

            ResultSet result = SQL.executeQuery();

            if (result.next()) {
                int id = result.getInt("id");
                boolean matriz = result.getBoolean("matriz");
                String nome = result.getString("nome");
                String cnpj = result.getString("cnpj");
                String inscricaoEstadual = result.getString("inscricao_estadual");
                String email = result.getString("email");
                String telefone = result.getString("telefone");
                String cep = result.getString("cep");
                String logradouro = result.getString("logradouro");
                String numeroEndereco = result.getString("numero_endereco");
                String complemento = result.getString("complemento");
                String unidadeFederativa = result.getString("uf");
                String bairro = result.getString("bairro");
                String cidade = result.getString("cidade");

                //Funcionario gerenteRegional = new Funcionario();
                estabelecimento = new Estabelecimento(matriz, null, nome, cnpj, inscricaoEstadual, email, telefone, cep, logradouro, numeroEndereco, complemento, unidadeFederativa, bairro, cidade);
                estabelecimento.setId(id);

                if (result != null || !result.isClosed()) {
                    result.close();
                }
                return estabelecimento;
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EstabelecimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
}
