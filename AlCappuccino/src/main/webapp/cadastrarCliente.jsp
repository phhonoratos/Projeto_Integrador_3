<%-- 
    Document   : cadastrarCliente
    Created on : 19/10/2020, 17:58:24
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="pages/header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Cliente</title>
    </head>
    <body class="container">
        <h1>Cadastro de Cliente</h1>

        <form method="POST" action="CadastrarCliente">

            <p>CPF</p>
            <input name="cpf"></input>
            <br/>

            <p>Nome</p>
            <input name="nome"></input>
            <br/>

            <p>E-mail</p>
            <input name="email" type="email"></input>
            <br/>

            <p>Telefone</p>
            <input name="telefone" type="tel"></input>
            <br/>

            <p>Estado civil</p>
            <select name="estado_civil">
                <option value="Solteiro(a)">Solteiro(a)</option>
                <option value="Casado(a)">Casado(a)</option>
                <option value="Divorciado(a)">Divorciado(a)</option>
                <option value="Viuvo(a)">Viuvo(a)</option>
            </select>
            <br/>

            <p>Sexo</p>
            <input type="radio" id="male" name="sexo" value="masculino">
            <label for="male">Masculino</label><br>
            
            <input type="radio" id="female" name="sexo" value="feminino">
            <label for="female">Feminino</label><br>
            
            <input type="radio" id="other" name="sexo" value="outro">
            <label for="other">Outro</label>
            <br/>

            <p>CEP</p>
            <input name="cep" id="cep"></input>
            <br/>

            <p>Logradouro</p>
            <input name="logradouro" id="rua"></input>
            <br/>

            <p>Número</p>
            <input name="numero"></input>
            <br/>

            <p>Complemento</p>
            <input name="complemento" id="complemento"></input>
            <br/>

            <p>UF</p>
            <input name="uf" id="uf"></input>
            <br/>

            <p>Bairro</p>
            <input name="bairro" id="bairro"></input>
            <br/>

            <p>Cidade</p>
            <input name="cidade" id="cidade"></input>
            <br/>

            <p>Data de nascimento</p>
            <input name="data_nascimento" type="date" id="data_nascimento"></input>
            <br/>

            <button type="submit">Cadastrar</button>

        </form>

        <script type="text/javascript">
            $("#cep").blur(function () {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#rua").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#uf").val("...");
                        $("#ibge").val("...");

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#rua").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#uf").val(dados.uf);
                                $("#ibge").val(dados.ibge);
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        </script>

    </body>
</html>
