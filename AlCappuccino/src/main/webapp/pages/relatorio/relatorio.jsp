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
        <link rel="stylesheet" href="./resources/css/relatorio.css">
        <script src="./resources/js/relatorio.js"></script>
    </head>
    <body class="container">
        <%@include file="/pages/header/header.jsp" %>

        <h1>Relatório</h1>

        <br>

        <!--<form method="GET" action="Relatorio?chamada=listarVendas">-->
        <input id="radioMatriz" type="radio" name="opcao">
        <label for="radioMatriz">Matriz</label>

        <input id="radioFilial" type="radio" name="opcao">
        <label for="radioFilial">Filial</label>

        <input id="listFilial" name="filial" placeholder="Digite o nome da filial" list="filiais">
        <datalist id="filiais">
            <c:forEach items="${filiais}" var="filial">
                <option>${filial.nome}</option>
            </c:forEach>
        </datalist>

        <br><br>

        <form method="GET" action="Relatorio">
            <div class="row">
                <label class="col-3" id="labelDataInicial" for="dateInicial">De</label>
                <label class="col-3" id="labelDataFinal" for="dateDataFinal">Até</label>
                <label class="col-3" id="labelCliente" for="textCliente">Cliente</label>
                <label class="col-3" id="labelDataFinal" for="textProduto">Produto</label>
            </div>
            <div class="row">
                <input class="col-3" id="dateInicial" class="form-control-sm" type="date" name="inicio">
                <input class="col-3" id="dateDataFinal" class="form-control-sm" type="date" name="final">
                <input class="col-3" id="textCliente" class="form-control-sm" type="text" name="cliente" list="clientes" placeholder="Nome do cliente">
                <datalist id="clientes">
                    <c:forEach items="${clientes}" var="cliente">
                        <option>${cliente.nome}</option>
                    </c:forEach>
                </datalist>
                <input class="col-3" id="textProduto" class="form-control-sm" type="text" name="produto" list="produtos" placeholder="Nome do produto">
                <datalist id="produtos">
                    <c:forEach items="${produtos}" var="produto">
                        <option>${produto.nome}</option>
                    </c:forEach>
                </datalist>
            </div>
            <input type="hidden" value="listarVendas" name="chamada">
            <button class="btn btn-primary" type="submit">Pesquisar</button>
        </form>

        <!--</form>-->

        <br>


        <c:if test="${vendas != null}">
            <c:forEach items="${vendas}" var="venda">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${venda.id}" aria-expanded="true" aria-controls="collapseOne">
                                    <div class="row">
                                        <label class="col-2">Data da venda</label>
                                        <label class="col-2">CPF Funcionário</label>
                                        <label class="col-2">CPF Cliente</label>
                                        <label class="col-3">Tipo de pagamento</label>
                                        <label class="col-3">Valor total</label>
                                        <br>
                                        <label class="col-2">${venda.dataVenda}</label>
                                        <label class="col-2">${venda.funcionario.cpf}</label>
                                        <label class="col-2">${venda.cliente.cpf}</label>
                                        <label class="col-3">${venda.tipoPagamento}</label>
                                        <label class="col-3">${venda.valorTotal}</label>
                                    </div>
                                </button>
                            </h2>

                        </div>
                        <div id="collapse${venda.id}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div class="card-body">
                                <c:if test="${detalhes != null}">
                                    <div class="row">
                                        <label class="col-2">Id</label>
                                        <label class="col-3">Nome do produto</label>
                                        <label class="col-3">Valor unitário</label>
                                        <label class="col-2">Quantidade</label>
                                        <label class="col-2">Valor total</label>
                                        <br>
                                        <c:forEach items="${detalhes}" var="detalhe">
                                            <c:if test="${detalhe.venda.id == venda.id}">
                                                <label class="col-2">${detalhe.produto.id}</label>
                                                <label class="col-3">${detalhe.produto.nome}</label>
                                                <label class="col-3">${detalhe.produto.valorVenda}</label>
                                                <label class="col-2">${detalhe.quantidade}</label>
                                                <label class="col-2">${detalhe.valorTotal}</label>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>

        <p id="pTotal">Total: ${totalVendas}</p>
    </body>
</html>
