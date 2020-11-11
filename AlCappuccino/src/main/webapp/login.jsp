<%-- 
    Document   : login
    Created on : 11/11/2020, 15:24:00
    Author     : paulo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login AlCappuccino</title>
    </head>
    <body>
        <%--<%@include file="pages/header/header.jsp" %>--%>
        <c:if test="${not empty param.erro}">
            <div class="alert alert-danger" role="alert">
                Usuário / Senha inválidos!
            </div>
        </c:if>
        <form method="POST" action="LoginServlet">
            <div class="form-group">
                <label>Login</label>
                <input name="login" required class="form-control"/>
            </div>
            <div class="form-group">
                <label>Senha</label>
                <input type="password" name="senha" required class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">Enviar</button>
        </form>
    </body>
</html>
