<%-- 
    Document   : alterarFuncionarios
    Created on : 18/10/2020, 18:30:13
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Atualização de Funcionários</h1>
        <form method="POST" action="AlterarFuncionarios">
            <p>CPF</p>
            <input name="cpf" value="${funcionarios.cpf}" readonly="true"></input>
            <p>Nome</p>
            <input name="nome" value="${funcionarios.nome}"></input>
            <p>RG</p>
            <input name="rg" value="${funcionarios.rg}"></input>
            </br>
            <button type="submit">Enviar</button>
            
        </form>
    </body>
</html>
