package ac.entidade;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Paulo Costa
 */
@Getter
@Setter
public class PessoaFisica extends Pessoa {

    public PessoaFisica() {
    }

    protected String cpf;
    protected String estadoCivil;
    protected String sexo;
    protected Date dataNascimento;

    public PessoaFisica(
            String nome,
            String cpf,
            String estadoCivil,
            Date dataNascimento,
            String sexo,
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

        this.cpf = cpf;
        this.estadoCivil = estadoCivil;
        this.dataNascimento = dataNascimento;
        this.sexo = sexo;
    }

}
