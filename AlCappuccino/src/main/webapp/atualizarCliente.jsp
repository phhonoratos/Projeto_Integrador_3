<%-- 
    Document   : alterarCliente
    Created on : 20/10/2020, 21:55:57
    Author     : joao
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="pages/header/header.jsp" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

    <style>
        .container {
            grid-template-columns: auto auto auto auto auto;
            grid-template-rows: auto auto auto auto auto;
            display: grid;
        }

        h1 {
            text-align: center;
            margin-bottom: 50px;
        }

        div {
            margin-bottom: 20px;
        }

        label {
            color: rgb(97, 97, 97);
        }

        input {
            border: none;
            border-bottom: 1px solid black;
            width: 95%;
        }
        input:focus {
            border: none;
            border-bottom: 1px solid black;
            width: 95%;
        }

        .nome {
            grid-column-start: 1;
            grid-column-end: 4;
            grid-row-start: 1;
        }

        .cpf {
            grid-column-start: 5;
            grid-column-end: 6;
            grid-row-start: 1;
        }

        .email {
            grid-column-start: 4;
            grid-column-end: 6;
            grid-row-start: 2;
        }

        .telefone {
            grid-column-start: 3;
            grid-column-end: 3;
            grid-row-start: 2;
        }

        .estado_civil {
            grid-column-start: 2;
            grid-column-end: 2;
            grid-row-start: 2;
        }

        .sexo {
            grid-column-start: 1;
            grid-column-end: 1;
            grid-row-start: 2;
        }

        .dt_nascimento {
            grid-column-start: 4;
            grid-column-end: 5;
            grid-row-start: 1;
        }

        .cep {
            grid-column-start: 5;
            grid-column-end: 5;
            grid-row-start: 4;
        }

        .logradouro {
            grid-column-start: 1;
            grid-column-end: 4;
            grid-row-start: 3;
        }

        .numero {
            grid-column-start: 4;
            grid-column-end: 5;
            grid-row-start: 3;
        }

        .complemento {
            grid-column-start: 5;
            grid-column-end: 6;
            grid-row-start: 3;
        }

        .bairro {
            grid-column-start: 1;
            grid-column-end: 3;
            grid-row-start: 4;
        }

        .cidade {
            grid-column-start: 3;
            grid-column-end: 3;
            grid-row-start: 4;
        }

        .uf {
            grid-column-start: 4;
            grid-column-end: 4;
            grid-row-start: 4;
        }

        button{
            
        }
    </style>

</head>

<body>

    <h1>Alterando ${atualizar.nome}</h1>

    <form action="AtualizarCliente" method="POST">
        <div class="container">

            <div class="nome">
                <label for="">nome</label>
                <input type="text" value="${atualizar.nome}" name="nome">
            </div>

            <div class="cpf">
                <label for="">cpf</label>
                <input type="text" value="${atualizar.cpf}" readonly="true" name="cpf">
            </div>

            <div class="email">
                <label for="">e-mail</label>
                <input type="text" value="${atualizar.email}" name="email">
            </div>

            <div class="telefone">
                <label for="">telefone</label>
                <input type="text" value="${atualizar.telefone}" name="telefone">
            </div>

            <div class="estado_civil">
                <label for="">estado civil</label>
                <input type="text" value="${atualizar.estadoCivil}" name="estado_civil">
            </div>

            <div class="sexo">
                <label for="">sexo</label>
                <input type="text" value="${atualizar.sexo}" name="sexo">
            </div>

            <div class="dt_nascimento">
                <label for="">nascimento</label>
                <input type="text" value="${atualizar.dataNascimento}" name="data_nascimento">
            </div>

            <div class="cep">
                <label for="">cep</label>
                <input type="text" value="${atualizar.cep}" name="cep">
            </div>

            <div class="logradouro">
                <label for="">logradouro</label>
                <input type="text" value="${atualizar.logradouro}" name="logradouro">
            </div>

            <div class="numero">
                <label for="">numero</label>
                <input type="text" value="${atualizar.numeroEndereco}" name="numero">
            </div>

            <div class="complemento">
                <label for="">complemento</label>
                <input type="text" value="${atualizar.complemento}" name="complemento">
            </div>

            <div class="bairro">
                <label for="">bairro</label>
                <input type="text" value="${atualizar.bairro}" name="bairro">
            </div>

            <div class="cidade">
                <label for="">cidade</label>
                <input type="text" value="${atualizar.cidade}" name="cidade">
            </div>

            <div class="uf">
                <label for="">uf</label>
                <input type="text" value="${atualizar.unidadeFederativa}" name="uf">
            </div>
            
            <button class="btn btn-success" type="submit">Alterar</button>
            <a class="btn btn-primary" href="index.jsp" role="button">Voltar</a>
        </div>
    </form>

</body>

</html>