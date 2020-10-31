package ac.entidade;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Paulo Costa
 */
@Getter
@Setter
public abstract class PessoaJuridica extends Pessoa {

    protected String cnpj;
    protected String inscricaoEstadual;

    public PessoaJuridica(
            String nome,
            String cnpj,
            String inscricaoEstadual,
            String email,
            String telefone,
            String cep,
            String logradouro,
            String numero,
            String complemento,
            String unidadeFederativa,
            String bairro,
            String cidade) {
        super(nome, email, telefone, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade);

        this.cnpj = cnpj;
        this.inscricaoEstadual = inscricaoEstadual;
    }
    
    public PessoaJuridica() {
    }
}
