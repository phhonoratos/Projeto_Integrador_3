<%-- 
    Document   : cadastrarFuncionarios
    Created on : 16/10/2020, 14:30:26
    Author     : paulo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../resources/css/cadastrarFuncionarios.css">
        <title>Cadastrar Funcionário</title>
    </head>
    <body class="container">
        <h1>Cadastrar Funcionário</h1>
        <br/>
        <table class="table">
            <form method="POST" action="../../CadastrarFuncionarios">
                <div class="row">
                    <div class="col-8">
                        <p><b>Dados Pessoais</b></p>
                        <input type="text" name="nome" placeholder="Nome" style="text-align: center" title="Digite o nome completo" required="true"></input>
                        <br/>
                        <br/>
                        <input minlength="11" maxlength="11" type="number" name="cpf" placeholder="CPF" style="text-align: center" title="Digite apenas números" required="true"></input>
                        <input pattern="[a-zA-Z0-9]+" type="text" name="rg" placeholder="RG" style="text-align: center" title="Digite apenas números" required="true"></input>
                        <br/>
                        <br/>
                        <select name="sexo">
                            <option value="masculino">Masculino</option>
                            <option value="feminino">Feminino</option>
                            <option value="lgbt">LGBTQI+</option>
                        </select>
                        <input type="date" name="dt_nascimento" placeholder="Data de nasc." style="text-align: center" required="true"></input>
                        <select name="estado_civil">
                            <option value="Solteiro(a)">Solteiro(a)</option>
                            <option value="Casado(a)">Casado(a)</option>
                            <option value="Divorciado(a)">Divorciado(a)</option>
                            <option value="Viuvo(a)">Viuvo(a)</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <p><b>Contatos</b></p>
                        <br/>
                        <input minlength="10" maxlength="12" name="telefone" class="form-control" placeholder="Telefone" style="text-align: center"></input>
                        <br/>
                        <input type="email" name="email" class="form-control" placeholder="E-mail" style="text-align: center"></input>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-8">
                        <p><b>Endereço</b></p>
                        <input type="number" name="cep" id="cep" placeholder="CEP" style="text-align: center" required="true"></input>
                        <input type="text" name="logradouro" id="rua" placeholder="Logradouro" style="text-align: center" required="true"></input>
                        <br/>
                        <br/>
                        <input type="number" name="numero" id="numero" placeholder="Número" style="text-align: center" required="true"></input>
                        <input type="text" name="bairro" id="bairro" placeholder="Bairro" style="text-align: center" required="true"></input>
                        <input type="text" name="cidade" id="cidade" placeholder="cidade" style="text-align: center" required="true"></input>
                        <br/>
                        <br/>
                        <select name="uf" id="uf">
                            <option value="UF">UF</option>
                            <option value="AC">AC</option>
                            <option value="AL">AL</option>
                            <option value="AP">AP</option>
                            <option value="AM">AM</option>
                            <option value="BA">BA</option>
                            <option value="CE">CE</option>
                            <option value="DF">DF</option>
                            <option value="ES">ES</option>
                            <option value="GO">GO</option>
                            <option value="MA">MA</option>
                            <option value="MT">MT</option>
                            <option value="MS">MS</option>
                            <option value="MG">MG</option>
                            <option value="PA">PA</option>
                            <option value="PB">PB</option>
                            <option value="PR">PR</option>
                            <option value="PE">PE</option>
                            <option value="PI">PI</option>
                            <option value="RJ">RJ</option>
                            <option value="RN">RN</option>
                            <option value="RS">RS</option>
                            <option value="RO">RO</option>
                            <option value="RR">RR</option>
                            <option value="SC">SC</option>
                            <option value="SP">SP</option>
                            <option value="SE">SE</option>
                            <option value="TO">TO</option>
                        </select>
                        <input type="text" name="complemento" id="complemento" placeholder="Complemento" style="text-align: center"></input>
                    </div>
                    <div class="col-4">
                        <p><b>Função</b></p>
                        <input type="text" name="cargo" class="form-control" placeholder="Cargo" style="text-align: center" required="true"></input>
                        <br/>
                        <input type="number" name="salario" class="form-control" placeholder="Salário" style="text-align: center" required="true"></input>
                        <br/>
                        <input id="listFilial" class="form-control" name="filial" placeholder="Digite o nome da filial" list="filiais">
                        <datalist id="filiais">
                            <c:forEach items="${filiais}" var="filial">
                                <option>${filial.nome}</option>
                            </c:forEach>
                        </datalist>
                    </div>
                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-4">
                        <p><b>Admissão / Demissão / Observações</b></p>
                        <br/>
                        <label>Data Admissão: </label>
                        <input type="date" name="dt_adm" placeholder="Data Adm." style="text-align: center" required="true"></input>
                        <br/>
                        <label>Data Demissão: </label>
                        <input type="date" name="dt_dem" placeholder="Data Dem." style="text-align: center"></input>
                    </div>
                    <div class="col-1">
                    </div>
                    <div class="col-7">
                        <br/>
                        <br/>
                        <textarea name="observacao" class="form-control" placeholder="Observações" aria-label="With textarea"></textarea>
                    </div>
                </div>
                <button><a href="../../index.jsp">Cancelar</a></button>
            <button type="submit">Cadastrar</button>
            </form>
        </table>
        
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
