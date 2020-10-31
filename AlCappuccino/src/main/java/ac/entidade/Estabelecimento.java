package ac.entidade;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Paulo Costa
 */
@Getter
@Setter
public class Estabelecimento extends PessoaJuridica {

    private int id;
    private boolean matriz;
    private Funcionario gerenteRegional;

    public Estabelecimento(
            boolean matriz,
            Funcionario gerenteRegional,
            String nome,
            String cnpj,
            String inscricaoEstadual,
            String email,
            String telefone,
            String cep,
            String logradouro,
            String numeroEndereco,
            String complemento,
            String unidadeFederativa,
            String bairro,
            String cidade   
    ) {
        super(nome, cnpj, inscricaoEstadual, email, telefone, cep, logradouro, numeroEndereco, complemento, unidadeFederativa, bairro, cidade);

        this.matriz = matriz;
        this.gerenteRegional = gerenteRegional;
    }
    
    public Estabelecimento() {
    }

    public boolean isMatriz() {
        return matriz == true;
    }

    public boolean isFilial() {
        return matriz == false;
    }
}
