<%-- 
    Document   : cadastrarCliente
    Created on : 19/10/2020, 17:58:24
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/cadastrarCliente.css">
        <title>Cadastrar Cliente</title>
    </head>
    <body>
        <h1>Cadastro de Cliente</h1>

        <form method="POST" action="CadastrarCliente">

            <div class="container">

                <div class="cpf">
                    <label for="">cpf</label>
                    <input type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57" name="cpf" required="true">
                </div>

                <div class="nome">
                    <label for="">nome</label>
                    <input type="text" name="nome">
                </div>
                
                <div class="dt_nascimento">
                    <label for="">nascimento</label>
                    <input type="date" name="data_nascimento">
                </div>
                
                <div class="sexo">
                    <label for="">sexo</label>
                    <input type="text" name="sexo">
                </div>
                
                <div class="estado_civil">
                    <label for="">estado civil</label>
                    <input name="estado_civil" list="exampleList"></input>
                    <datalist id="exampleList">
                        <option value="Solteiro(a)">Solteiro(a)</option>
                        <option value="Casado(a)">Casado(a)</option>
                        <option value="Divorciado(a)">Divorciado(a)</option>
                        <option value="Viuvo(a)">Viuvo(a)</option>
                    </datalist>
                </div>
                
                <div class="telefone">
                    <label for="">telefone</label>
                    <input type="text" name="telefone">
                </div>

                <div class="email">
                    <label for="">e-mail</label>
                    <input type="text" name="email">
                </div>                

                <div class="cep">
                    <label for="">cep</label>
                    <input type="text" name="cep"  id="cep">
                </div>

                <div class="logradouro">
                    <label for="">logradouro</label>
                    <input type="text" name="logradouro" id="rua">
                </div>

                <div class="numero">
                    <label for="">numero</label>
                    <input type="text" name="numero">
                </div>

                <div class="complemento">
                    <label for="">complemento</label>
                    <input type="text" name="complemento">
                </div>

                <div class="bairro">
                    <label for="">bairro</label>
                    <input type="text" name="bairro" id="bairro">
                </div>

                <div class="cidade">
                    <label for="">cidade</label>
                    <input type="text" name="cidade" id="cidade">
                </div>

                <div class="uf">
                    <label for="">uf</label>
                    <input type="text" name="uf" id="uf">
                </div>
                <button type="submit" required="true">Cadastrar</button>
            </div>

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
