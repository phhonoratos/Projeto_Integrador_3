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
public abstract class PessoaFisica extends Pessoa {

    protected String cpf;
    protected String estadoCivil;
    protected String sexo;
    protected Date dataNascimento;

    public PessoaFisica(
            String cpf,
            String estadoCivil,
            String sexo,
            Date dataNascimento,
            String nome,
            String email,
            String telefone,
            String cep,
            String logradouro,
            String numero,
            String complemento,
            String unidadeFederativa,
            String bairro,
            String cidade
    ) {
        super(nome, email, telefone, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade);
        this.cpf = cpf;
        this.estadoCivil = estadoCivil;
        this.sexo = sexo;
        this.dataNascimento = dataNascimento;
    }
    
    public PessoaFisica() {
    }
}
