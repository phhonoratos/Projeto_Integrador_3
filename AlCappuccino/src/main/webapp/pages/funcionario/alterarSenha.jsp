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
        <link rel="stylesheet" href="../../resources/css/front.css">
        <title>Alterar Senha</title>
    </head>
    <body class="container">
        <br/>
        <form method="POST" action="AlterarSenha">
            <table class="table">
                <input name="email" id="email" placeholder="Email" class="form-control"/>
                <br/>
                <input name="senhaAntiga" id="senhaAntiga" placeholder="Senha Antiga" class="form-control"/>
                <br/>
                <input type="password" name="senha" id="senha" placeholder="Nova senha" class="form-control"/>
                <br/>
                <input type="password" name="senha" id="novaSenha" placeholder="Confirme a nova senha" class="form-control"/>
                <br/>
                <button type="submit" class="btn btn-primary">Confirmar</button>
            </table>
        </form>
        
    </body>
</html>
