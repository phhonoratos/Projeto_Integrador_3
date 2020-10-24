<%-- 
    Document   : relatorio
    Created on : 22/10/2020, 22:05:51
    Author     : sillas.clpinto
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="container">
        <%@include file="../header.jsp" %>

        <h1>Relatório</h1>
        
        <form method="POST" action="">
            <input id="rdnMatriz" type="radio" name="opcao" value="matriz">
            <label for="rdnMatriz">Matriz</label>

            <input id="rdnFilial" type="radio" name="opcao" value="filial">
            <label for="rdnFilial">Filial</label>

            <select class="form-control form-control-sm">
                <option>Small select</option>
            </select>

            <br>

            <label for="txtDataInicial">De</label>
            <input id="txtDataInicial" class="form-control-sm" type="text" name="inicio">
            <label for="txtDataFinal">Até</label>
            <input id="txtDataFinal" class="form-control-sm" type="text" name="final">
            <button type="submit" class="btn btn-primary">Pesquisar</button>
        </form>
        
        <table class="table">
            <thead>
                <th>Data</th>
                <th>Vendedor</th>
                <th>Cliente</th>
                <th>Tipo de pagamento</th>
                <th>Total</th>
            </thead>
            <tbody>
                <%--<c:forEach items="listaVenda" var="venda">--%>
<!--                    <tr>
                        <td>${venda.data}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
                    </tr>-->
                <%--</c:forEach>--%>
                    <tr>
                        <td>${venda.data}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
                    </tr>
            </tbody>
        </table>
        
        <p>Total</p>
        
        <table class="table">
            <thead>
                <th>Produto</th>
                <th>Valor Unitário R$</th>
                <th>Quantidade</th>
                <th>Total</th>
            </thead>
            <tbody>
                <%--<c:forEach items="listaObjetos" var="objeto">--%>
<!--                    <tr>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
                    </tr>-->
                <%--</c:forEach>--%>
                    <tr>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
                    </tr>
            </tbody>
        </table>
    </body>
</html>
