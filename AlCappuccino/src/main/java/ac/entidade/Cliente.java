package ac.entidade;

import java.sql.Date;

public class Cliente extends PessoaFisica {

    public Cliente(
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

        super(nome, cpf, estadoCivil, dataNascimento, sexo, email, telefone, cep, logradouro, numero, complemento, unidadeFederativa, bairro, cidade);
    }

    public Cliente(){}
}
