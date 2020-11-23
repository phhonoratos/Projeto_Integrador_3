<%-- 
    Document   : alterarSenha
    Created on : 22/11/2020, 15:59:24
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../header/header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/front.css">
        <title>Alterar Senha</title>
    </head>
    <body class="container">
        <br/>
        <form method="POST" action="AlterarSenha">
            <h1 style="margin-left: 330px">Alterar senha: ${sessionScope.usuario.nome}</h1>
            <br/>
            <br/>
            <table class="table">
                <input name="email" id="email" class="form-control" value="${sessionScope.usuario.email}" readonly="true" style="width: 400px; margin-left: 350px"/>
                <br/>
                <input type="password" name="senha" id="senha" placeholder="Nova senha" class="form-control" style="width: 400px; margin-left: 350px"/>
                <br/>
                <input type="password" name="novaSenha" id="novaSenha" placeholder="Confirme a nova senha" class="form-control" style="width: 400px; margin-left: 350px"/>
                <br/>
                <button type="submit" class="btn btn-primary" style="margin-left: 490px">Confirmar</button>
            </table>
        </form>
        
    </body>
</html>
