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
        <h3 style="margin-left: 200px">Atualização: ${funcionarios.nome}</h3>
        <br/>
        <form method="POST" action="AlterarFuncionarios">
            <table class="table">
                <div class="row">
                    <div class="col-8">
                        <p><b>Dados Pessoais</b></p>
                        <input type="text" title="Digite o nome completo" name="nome" value="${funcionarios.nome}"/>
                        <br/>
                        <br/>
                        <input pattern="^\d{11}$" type="number" name="cpf" title="Digite apenas números" value="${funcionarios.cpf}" readonly="true"/>
                        <input pattern="[a-zA-Z0-9]+" type="text" name="rg" title="Digite apenas números" value="${funcionarios.numeroRg}" required="true"/>
                        <br/>
                        <br/>
                        <select name="sexo">
                            <option value="${funcionarios.sexo}">${funcionarios.sexo}</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Feminino">Feminino</option>
                            <option value="LGBTQI+">LGBTQI+</option>
                        </select>
                        <input type="date" name="dt_nascimento" value="${funcionarios.dataNascimento}" required="true"/>
                        <select name="estado_civil" >
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
                        <input name="telefone" class="form-control" value="${funcionarios.telefone}"/>
                        <br/>
                        <input name="email" class="form-control" value="${funcionarios.email}"/>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-8">
                        <p><b>Endereço</b></p>
                        <input type="number" name="cep" id="cep" value="${funcionarios.cep}"/>
                        <input type="text" name="logradouro" id="rua" value="${funcionarios.logradouro}"/>
                        <br/>
                        <br/>
                        <input type="number" name="numero" id="numero" value="${funcionarios.numeroEndereco}"/>
                        <input type="text" name="bairro" id="bairro" value="${funcionarios.bairro}"/>
                        <input type="text" name="cidade" id="cidade" value="${funcionarios.cidade}"/>
                        <br/>
                        <br/>
                        <select name="uf" id="uf">
                            <option value="${funcionarios.unidadeFederativa}">${funcionarios.unidadeFederativa}</option>
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
                        <input type="text" name="complemento" value="${funcionarios.complemento}"></input>
                    </div>
                    <div class="col-4">
                        <p><b>Função</b></p>
                        <select name="cargo" id="cargo" required="true" class="form-control">
                            <option value="${funcionarios.cargo}">${funcionarios.cargo}</option>
                            <option value="Gerente">Gerente</option>
                            <option value="Vendedor(a)">Vendedor(a)</option>
                            <option value="TI">TI</option>
                        </select>
                        <input type="number" name="salario" class="form-control" value="${funcionarios.salario}"/>
                        <input id="listFilial" class="form-control" name="filial" value="${funcionarios.estabelecimento.id}" list="filiais">
                        <datalist id="filiais">
                            <c:forEach items="${filiais}" var="filial">
                                <option>${filial.id} - ${filial.nome}</option>
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
                        <input type="date" name="dt_adm" value="${funcionarios.dataAdmissao}"/>
                        <br/>
                        <label>Data Demissão: </label>
                        <input type="date" name="dt_dem" value="${funcionarios.dataDemissao}"/>
                    </div>
                    <div class="col-1">
                    </div>
                    <div class="col-7">
                        <br/>
                        <br/>
                        <textarea name="observacao" placeholder="Observações" class="form-control">${funcionarios.observacao}</textarea>
                    </div>
                </div>
                <br/>
                <br/>
                <div class="col-4">
                    <button id="cad" type="submit" class="btn btn-primary">Atualizar</button>
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