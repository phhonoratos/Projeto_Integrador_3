package ac.entidade;

import java.sql.Date;

public class Cliente extends PessoaFisica {

    public Cliente() {
    }

    public Cliente(
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
            String cidade) {
        super(
                cpf, 
                estadoCivil, 
                sexo, 
                dataNascimento, 
                nome, 
                email, 
                telefone, 
                cep, 
                logradouro, 
                numero, 
                complemento, 
                unidadeFederativa, 
                bairro, 
                cidade
        );
    }
    
}
