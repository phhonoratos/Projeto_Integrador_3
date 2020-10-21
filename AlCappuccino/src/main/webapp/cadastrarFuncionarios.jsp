<%-- 
    Document   : cadastrarFuncionarios
    Created on : 16/10/2020, 14:30:26
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Funcionários</title>
    </head>
    <body>
        <h1>Cadastro de funcionários</h1>
        <form method="POST" action="CadastrarFuncionarios">
            <p>CPF</p>
            <input name="cpf"></input>
            <p>Nome</p>
            <input name="nome"></input>
            <p>RG</p>
            <input name="rg"></input>
            <p>Data Nasc.</p>
            <input name="dt_nascimento"></input>
            <p>Sexo</p>
            <input name="sexo"></input>
            <p>Estado civil</p>
            <input name="estado_civil"></input>
            <p>Telefone</p>
            <input name="telefone"></input>
            <p>E-mail</p>
            <input name="email"></input>
            <p>Logradouro</p>
            <input name="logradouro"></input>
            <p>Número</p>
            <input name="numero"></input>
            <p>Complemento</p>
            <input name="complemento"></input>
            <p>CEP</p>
            <input name="cep"></input>
            <p>UF</p>
            <input name="uf"></input>
            <p>Bairro</p>
            <input name="bairro"></input>
            <p>Cidade</p>
            <input name="cidade"></input>
            <p>Cargo</p>
            <input name="cargo"></input>
            <p>Salário</p>
            <input name="salario"></input>
            <p>Filial</p>
            <input name="filial"></input>
            <p>Data de admissão</p>
            <input name="dt_adm"></input>
            <p>Data de demissão</p>
            <input name="dt_dem"></input>
            </br>
            </br>
            <button type="submit">Enviar</button>
            
        </form>
    </body>
</html>
