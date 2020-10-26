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
        
        <form method="GET" action="ListarVendaRelatorio?chamada=listarVendas">
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
            
            <input id="dateInicial" class="form-control-sm" type="text" name="inicio" value="2020-11-15">
            <input id="dateDataFinal" class="form-control-sm" type="text" name="final" value="2020-12-31">

            <button type="submit" class="btn btn-primary" onclick="teste()">Pesquisar</button>
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
                <c:if test="${vendas != null}">
                    <c:forEach items="${vendas}" var="venda">
                        <tr>
                            <td>${venda.data_venda}</td>
                            <td><a href="ListarVendaRelatorio?chamada=listarDetalhes&idVenda=${venda.id}">${venda.cpf_funcionario}</a></td>
                            <td>${venda.cpf_cliente}</td>
                            <td>${venda.tipo_pagamento}</td>
                            <td>${venda.total}</td>
                        </tr>
                    </c:forEach>
                </c:if>
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
                <c:if test="${detalhes != null}">
                    <c:forEach items="${detalhes}" var="detalhe">
                        <tr>
                            <td>${detalhe.idProduto}</td>
                            <td>00.00</td>
                            <td>${detalhe.quantidade}</td>
                            <td>${detalhe.valorTotal}</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </tbody>
        </table>
    </body>
</html>
