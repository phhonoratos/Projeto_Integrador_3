<%-- 
    Document   : cadastrarFuncionarios
    Created on : 16/10/2020, 14:30:26
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="pages/header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/cadastrarFuncionarios.css">
        <title>Atualização de Funcionário</title>
    </head>
    <body class="container">
        <h1>Atualização. Funcionário: ${funcionarios.nome}</h1>
        <br/>
        <form method="POST" action="AlterarFuncionarios">
            <table class="table">
                <div class="row">
                    <div class="col-8">
                        <p><b>Dados Pessoais</b></p>
                        <input name="cpf" value="${funcionarios.cpf}" readonly="true"></input>
                        <button>Pesquisar</button>
                        <br/>
                        <br/>
                        <input name="nome" value="${funcionarios.nome}"></input>
                        <input name="rg" value="${funcionarios.numeroRg}"></input>
                        <br/>
                        <br/>
                        <select name="sexo" value="${funcionarios.sexo}">
                            <option value="masculino">Masculino</option>
                            <option value="feminino">Feminino</option>
                            <option value="lgbt">LGBTQI+</option>
                        </select>
                        <input type="date" name="dt_nascimento" value="${funcionarios.dataNascimento}"></input>
                        <select name="estado_civil" value="${funcionarios.estadoCivil}">
                            <option value="Solteiro(a)">Solteiro(a)</option>
                            <option value="Casado(a)">Casado(a)</option>
                            <option value="Divorciado(a)">Divorciado(a)</option>
                            <option value="Viuvo(a)">Viuvo(a)</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <p><b>Contatos</b></p>
                        <br/>
                        <input name="telefone" class="form-control" value="${funcionarios.telefone}"></input>
                        <br/>
                        <input name="email" class="form-control" value="${funcionarios.email}"></input>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-8">
                        <p><b>Endereço</b></p>
                        <input name="logradouro" value="${funcionarios.logradouro}"></input>
                        <input name="numero" value="${funcionarios.numeroEndereco}"></input>
                        <br/>
                        <br/>
                        <input name="complemento" value="${funcionarios.complemento}"></input>
                        <input name="cep" value="${funcionarios.cep}"></input>
                        <br/>
                        <br/>
                        <input name="bairro" value="${funcionarios.bairro}"></input>
                        <input name="cidade" value="${funcionarios.cidade}"></input>
                        <select name="uf" value="${funcionarios.unidadeFederativa}">
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
                    </div>
                    <div class="col-4">
                        <p><b>Função</b></p>
                        <input name="cargo" class="form-control" value="${funcionarios.cargo}"></input>
                        <input name="salario" class="form-control" value="${funcionarios.salario}"></input>
                        <input name="filial" class="form-control" value="${funcionarios.filial}"></input>
                    </div>
                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-4">
                        <p><b>Admissão / Demissão / Observações</b></p>
                        <br/>
                        <label>Data Admissão: </label>
                        <input type="date" name="dt_adm" value="${funcionarios.dataAdmissao}"></input>
                        <br/>
                        <label>Data Demissão: </label>
                        <input type="date" name="dt_dem" value="${funcionarios.dataDemissao}"></input>
                    </div>
                    <div class="col-1">
                    </div>
                    <div class="col-7">
                        <br/>
                        <br/>
                        <textarea name="observacao" class="form-control" value="${funcionarios.observacao}"></textarea>
                    </div>
                </div>
                <button><a href="index.jsp">Cancelar</a></button>
                <button type="submit">Atualizar</button>
            </table>
        </form>

    </form>
</body>
</html>