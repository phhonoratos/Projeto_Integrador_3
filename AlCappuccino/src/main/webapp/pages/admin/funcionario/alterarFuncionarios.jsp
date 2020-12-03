<%-- 
    Document   : cadastrarFuncionarios
    Created on : 16/10/2020, 14:30:26
    Author     : paulo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/cadastrarFuncionarios.css">
        <link rel="stylesheet" href="resources/css/front.css">
        <title>Atualização de Funcionário</title>
    </head>
    <body class="container">
        <br/>
        <h1 style="text-align: center">Atualização: ${funcionarios.nome}</h1>
        <br/>
        <br/>
        <form method="POST" action="AlterarFuncionarios">
            <table class="table">
                <div class="row">
                        <div class="col-8">
                            <p><b>Dados Pessoais</b></p>
                            <label>Nome</label>
                            <br/>
                            <input type="text" id="nome" name="nome" title="Digite o nome completo" value="${funcionarios.nome}" required="true"/>
                            <br/>
                            <label name="cpf">CPF</label>
                            <label>RG</label>
                            <br/>
                            <input id="cpf" minlength="11" maxlength="11" type="number" name="cpf" title="Digite apenas números" readonly value="${funcionarios.cpf}"/>
                            <input pattern="[a-zA-Z0-9]+" type="text" name="rg" style="text-align: center" title="Digite apenas números" readonly  value="${funcionarios.numeroRg}"/>
                            <br/>
                            <label name="sexo">Sexo</label>
                            <label name="dt_nascimento">Data Nascimento</label>
                            <label>Estado civil</label>
                            <br/>
                            <select id="sexo" name="sexo">
                                <option value="${funcionarios.sexo}">${funcionarios.sexo}</option>
                                <option value="masculino">Masculino</option>
                                <option value="feminino">Feminino</option>
                                <option value="lgbt">LGBTQI+</option>
                            </select>
                            <input id="dt_nascimento" type="date" name="dt_nascimento" required="true"/>
                            <select name="estado_civil">
                                <option value="${funcionarios.estadoCivil}">${funcionarios.estadoCivil}</option>
                                <option value="Solteiro(a)">Solteiro(a)</option>
                                <option value="Casado(a)">Casado(a)</option>
                                <option value="Divorciado(a)">Divorciado(a)</option>
                                <option value="Viuvo(a)">Viuvo(a)</option>
                            </select>
                        </div>
                        <div class="col-4">
                            <p><b>Contatos</b></p>
                            <br/>
                            <label>Telefone</label>
                            <input id="telefone" minlength="10" maxlength="12" name="telefone" value="${funcionarios.telefone}"/>
                            <br/>
                            <label name="email">E-mail</label>
                            <input id="email" type="email" name="email" value="${funcionarios.email}"/>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-8">
                            <p><b>Endereço</b></p>
                            <label name="cep">CEP</label>
                            <label>Logradouro</label>
                            <br/>
                            <input type="number" name="cep" id="cep" value="${funcionarios.cep}"/>
                            <input type="text" name="logradouro" id="rua" value="${funcionarios.logradouro}" required="true"/>
                            <br/>
                            <label name="numero">Número</label>
                            <label name="bairro">Bairro</label>
                            <label>Cidade</label>
                            <br/>
                            <input type="number" name="numero" id="numero" value="${funcionarios.numeroEndereco}" required="true"/>
                            <input type="text" name="bairro" id="bairro" value="${funcionarios.bairro}" required="true"/>
                            <input type="text" name="cidade" id="cidade" value="${funcionarios.cidade}" required="true"/>
                            <br/>
                            <label name="uf">UF</label>
                            <label>Complemento</label>
                            <br/>
                            <select name="uf" id="uf">
                                <option value="${funcionarios.unidadeFederativa}">${funcionarios.unidadeFederativa}</option>
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
                            <input type="text" name="complemento" id="complemento" value="${funcionarios.complemento}"/>
                        </div>
                        <div class="col-4">
                            <p><b>Função</b></p>
                            <label>Cargo</label>
                            <select name="cargo" id="cargo" required="true">
                                <option value="${funcionarios.cargo}">${funcionarios.cargo}</option>
                                <option value="Gerente">Gerente</option>
                                <option value="Vendedor(a)">Vendedor(a)</option>
                                <option value="TI">TI</option>
                            </select>
                            <label>Salário</label>
                            <input type="number" name="salario" value="${funcionarios.salario}" required="true"/>
                            <label>Estabelecimento</label>
                            <input id="listFilial" name="filial" value="${funcionarios.estabelecimento.id}" list="filiais">
                            <datalist id="filiais">
                                <c:forEach items="${filiais}" var="filial">
                                    <option value="${filial.id}">${filial.nome}</option>
                                </c:forEach>
                            </datalist>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-4">
                            <p><b>Admissão / Demissão / Observações</b></p>
                            <br/>
                            <label>Data Admissão: </label>
                            <input type="date" name="dt_adm" value="${funcionarios.dataAdmissao}" required="true"/>
                            <br/>
                            <label>Data Demissão: </label>
                            <input type="date" name="dt_dem" value="${funcionarios.dataDemissao}"/>
                        </div>
                        <div class="col-1">
                        </div>
                        <div class="col-7">
                            <br/>
                            <label>Observações</label>
                            <textarea name="observacao" placeholder="Observações" class="form-control">${funcionarios.observacao}</textarea>
                        </div>
                    </div>
                        <div class="col-4">
                            <button id="atualizar" type="submit" class="btn btn-success">Atualizar</button>
                        </div>
                    <br/>
            </table>
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