<%-- 
    Document   : listarVendas
    Created on : Oct 25, 2020, 9:32:40 AM
    Author     : joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/listarVendas.css">
        <link rel="stylesheet" href="./resources/css/front.css">
        <title>Vendas</title>

        <script>

            function detalheVenda(id) {
            <c:forEach items="${detalheVendas}" var="detalhe">
                if (${detalhe.venda.id} == id) {
                    console.log(${detalhe.produto.id})
                    document.getElementById("produto" + ${detalhe.id}).innerHTML = "Produto: " + ${detalhe.produto.id}
                    document.getElementById("quantidade" + ${detalhe.id}).innerHTML = "Quantidade: " + ${detalhe.quantidade}
                    document.getElementById("valor" + ${detalhe.id}).innerHTML = "Valor: " + ${detalhe.valorTotal}
                }
            </c:forEach>

            }

        </script>
    </head>
    <body>
        <div class="container">
            <h1>Vendas</h1>

            <c:forEach items="${vendas}" var="venda">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${venda.id}" aria-expanded="true" aria-controls="collapseOne">
                                    <label id="data"><b>Data</b></label>
                                    <label id="hora"><b>Hora</b></label>
                                    <label id="total"><b>Total</b></label>
                                    <label id="vendedor"><b>Vendedor</b></label>
                                    <hr>
                                    <label id="data1">${venda.dataVenda}</label> 
                                    <label id="hora1">${venda.horarioVenda}</label>
                                    <label id="total1">${venda.valorTotal}</label>
                                    <label id="vendedor1">${venda.funcionario.cpf}</label>
                                </button>
                            </h2>
                        </div>
                        <div id="collapse${venda.id}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <c:forEach items="${detalheVendas}" var="detalheVendas">
                                <c:if test="${detalheVendas.venda.id == venda.id}">
                                    <div class="card-body">
                                        <label id="produto"><b>Produto:</b> ${detalheVendas.produto.id}</label>
                                        <label id="quantidade"><b>Quantidade:</b> ${detalheVendas.quantidade}</label>
                                        <label id="valorTotal"><b>Valor Total:</b> ${detalheVendas.valorTotal}</label>
                                        <br/>
                                    </div>
                                </c:if>

                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach> 
        </div>

    </body>
</html>
