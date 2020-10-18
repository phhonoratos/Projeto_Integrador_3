<%-- 
    Document   : listarFuncionarios
    Created on : 18/10/2020, 16:14:37
    Author     : paulo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Funcionários</title>
    </head>
    <body>
        <h1>Lista de Funcionários</h1>
        <table>
            <thead>
            <th>CPF</th>
            <th>Nome</th>
            <th>RG</th>
        </thead>
        <tbody>
            <c:forEach items="${listaFuncionarios}" var="funcionarios">
                <tr>
                    <td>${funcionarios.cpf}</td>
                    <td>${funcionarios.nome}</td>
                    <td>${funcionarios.rg}</td>
                    <td><a href="AlterarFuncionarios?cpf=${funcionarios.cpf}"</td>
                    <td><a href="ExcluirFuncionarios?cpf=${funcionarios.cpf}"</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
