<%-- 
    Document   : cadastrarFuncionarios
    Created on : 16/10/2020, 14:30:26
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            </br>
            <button type="submit">Enviar</button>
            
        </form>
    </body>
</html>
