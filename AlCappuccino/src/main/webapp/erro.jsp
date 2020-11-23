<%-- 
    Document   : Erro
    Created on : 16/10/2020, 11:40:29
    Author     : danil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/front.css">
        <title>Erro!</title>
    </head>
    <body class="container">
        <h1>Erro!</h1>
        <br/>
        ${msgErro}
        <br/>
        <a href="index.jsp">Voltar</a>
    </body>
</html>
