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
<<<<<<< HEAD
        <title>JSP Page</title>
=======
        <title>Relatório</title>
        <link rel="stylesheet" href="./relatorio.css">
        <script src="./relatorio.js"></script>
>>>>>>> f667c55f7afef1140cb7ebb5cd7de72e02b881ce
    </head>
    <body class="container">
        <%@include file="../header.jsp" %>

        <h1>Relatório</h1>
        
<<<<<<< HEAD
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
        
=======
        <br>
        
        <form method="POST" action="">
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
            
            <input id="dateInicial" class="form-control-sm" type="date" name="inicio">
            <input id="dateDataFinal" class="form-control-sm" type="date" name="final">

            <button type="submit" class="btn btn-primary">Pesquisar</button>
        </form>
        
        <br>
        
>>>>>>> f667c55f7afef1140cb7ebb5cd7de72e02b881ce
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
<<<<<<< HEAD
                        <td>${venda.data_venda}</td>
                        <td>${venda.cpf_funcionario}</td>
                        <td>${venda.cpf_cliente}</td>
                        <td>${venda.tipo_pagamento}</td>
                        <td>${venda.total}</td>
                    </tr>
                </c:forEach>
<!--                    <tr>
=======
<<<<<<< HEAD
                        <td>${venda.data}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
                        <td>${venda}</td>
=======
>>>>>>> 3333e6ec0b0f182bf80bb69e17732400c1b972ff
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
<<<<<<< HEAD
                    </tr>-->
=======
>>>>>>> f667c55f7afef1140cb7ebb5cd7de72e02b881ce
                    </tr>
>>>>>>> 3333e6ec0b0f182bf80bb69e17732400c1b972ff
            </tbody>
        </table>
        
<<<<<<< HEAD
        <p>Total</p>
=======
        <p id="pTotal">Total</p>
>>>>>>> f667c55f7afef1140cb7ebb5cd7de72e02b881ce
        
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
<<<<<<< HEAD
                    <tr>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
                        <td>${objeto}</td>
=======
                
<!--                    <tr>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
                        <td>teste</td>
<<<<<<< HEAD
                    </tr>-->
=======
>>>>>>> f667c55f7afef1140cb7ebb5cd7de72e02b881ce
                    </tr>
>>>>>>> 3333e6ec0b0f182bf80bb69e17732400c1b972ff
            </tbody>
        </table>
    </body>
</html>
