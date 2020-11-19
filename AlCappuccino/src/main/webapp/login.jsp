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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="resources/css/login.css">
        <title>Login AlCappuccino</title>
    </head>
    <body>
        <c:if test="${not empty param.erro}">
            <div class="alert alert-danger" role="alert">
                Usuário/Senha inválidos!
            </div>
        </c:if>
        <form method="POST" action="LoginServlet">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-8">
                        
                    </div>
                    <div class="col-4">
                        <div class="card" style="width: 400px; margin-top: 130px" >
                            <img src="resources/img/person.jpg">
                            <div class="form-group">
                                <input placeholder="email" style="width: 350px; margin-left: 25px; margin-top: 50px" type="email" name="login" required class="material-icons"/>
                            </div>
                            <div class="form-group">
                                <input placeholder="password" style="width: 350px; margin-left: 25px" type="password" name="senha" required class="material-icons"/>
                                <br/>
                                <br/>
                                <button style="margin-left: 170px" type="submit" class="btn btn-primary">Entrar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
