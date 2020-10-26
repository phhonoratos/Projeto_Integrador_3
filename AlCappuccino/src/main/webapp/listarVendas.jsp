<%-- 
    Document   : listarVendas
    Created on : Oct 25, 2020, 9:32:40 AM
    Author     : joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="pages/header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendas</title>

        <script>

            function detalheVenda(id) {
            <c:forEach items="${detalheVendas}" var="detalhe">
                if (${detalhe.idVenda} == id) {
                    console.log(${detalhe.idProduto})
                    document.getElementById("produto" + ${detalhe.id}).innerHTML = "Produto: " + ${detalhe.idProduto}
                    document.getElementById("quantidade" + ${detalhe.id}).innerHTML = "Quantidade: " + ${detalhe.quantidade}
                    document.getElementById("valor" + ${detalhe.id}).innerHTML = "Valor: " + ${detalhe.valorTotal}
                }
            </c:forEach>

            }

        </script>
    </head>
    <body>
        <h1>Vendas</h1>

        <div class="accordion" id="accordionExample">
            <c:forEach var="venda" items="${vendas}">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left" onclick="detalheVenda(${venda.id})" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <td>Dia: ${venda.dataVenda}</td>
                                            <td>Hora: ${venda.horarioVenda}</td>
                                            <td>Total: R$ ${venda.valorTotal}</td>
                                            <td>Vendedor: ${venda.cpfFuncionario}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </button>
                        </h2>
                    </div>

                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-bordered">
                                <tbody>
                                    <c:forEach var="detalhe" items="${detalheVendas}">
                                        <tr>
                                            <td id="produto${detalhe.id}"></td>
                                            <td id="quantidade${detalhe.id}"></td>
                                            <td id="valor${detalhe.id}"></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>   
    </body>
</html>
