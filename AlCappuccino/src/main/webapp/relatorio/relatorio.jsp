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
        <title>Relatório</title>
        <link rel="stylesheet" href="./relatorio.css">
        <script src="./relatorio.js"></script>
    </head>
    <body class="container">
        <%@include file="../header.jsp" %>

        <h1>Relatório</h1>
        
        <br>
        
        <form method="GET" action="ListarVenda">
            <input id="radioMatriz" type="radio" name="opcao" value="matriz">
            <label for="radioMatriz">Matriz</label>

            <input id="radioFilial" type="radio" name="opcao" value="filial">
            <label for="labelFilial">Filial</label>

            <select id="selectFilial" class="form-control-sm">
                <option>Small select</option>
            </select>

            <br><br>

            <label id="labelDataInicial" for="txtDataInicial">De</label>
            <label id="labelDataFinal" for="txtDataFinal">Até</label>

            <br>
            
            <input id="dateInicial" class="form-control-sm" type="text" name="inicio">
            <input id="dateDataFinal" class="form-control-sm" type="text" name="final">

            <button type="submit" class="btn btn-primary">Pesquisar</button>
        </form>
        
        <br>
        
        <table class="table">
            <thead>
                <th>Data</th>
                <th>Vendedor</th>
                <th>Cliente</th>
                <th>Tipo de pagamento</th>
                <th>Total</th>
            </thead>
            <tbody>
                <c:forEach items="${vendas}" var="venda">
                    <tr>
                        <td>${venda.data_venda}</td>
                        <td>${venda.cpf_funcionario}</td>
                        <td>${venda.cpf_cliente}</td>
                        <td>${venda.tipo_pagamento}</td>
                        <td>${venda.total}</td>
                    </tr>
                </c:forEach>
<!--                    <tr>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
                    </tr>-->
            </tbody>
        </table>
        
        <p id="pTotal">${totalVendas}</p>
        
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
                
<!--                    <tr>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
                    </tr>-->
            </tbody>
        </table>
                
                <button onclick="teste()">teste</button>
                
    </body>
</html>
