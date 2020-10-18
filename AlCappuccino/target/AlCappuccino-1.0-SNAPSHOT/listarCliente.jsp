<%-- 
    Document   : listarCliente
    Created on : 16/10/2020, 23:06:42
    Author     : joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
    </head>
    <body>
        <div class="container">
            <h1 style="text-align: center">Lista de Clientes</h1>
            <table class="table">
                <thead>
                <th>Nome</th>
                <th>Email</th>
                <th>CPF</th>
                </thead>
                <tbody> 
                <c:forEach var="cliente" items="${listaClientes}">
                    <tr>
                        <td>${cliente.nome}</td>
                        <td>${cliente.email}</td>
                        <td>${cliente.cpf}</td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>

            <a href="index.jsp">Voltar</a>
        </div>

    </body>
</html>
