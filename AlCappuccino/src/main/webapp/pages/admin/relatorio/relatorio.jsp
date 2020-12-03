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
        <link rel="stylesheet" href="./resources/css/front.css">
        <script src="../../../resources/js/relatorio.js"></script>
    </head>
    <body class="container">
        <%@include file="../../../header/header.jsp" %>
        <br/>
        <h1>Relatório</h1>
        <br>
        <form method="GET" action="Relatorio">
            <c:choose>
                <c:when test="${(sessionScope.usuario.estabelecimento.matriz) && (sessionScope.usuario.cargo == 'Gerente')}">
                    <input id="listFilial" name="filial" placeholder="Selecione uma filial" list="filiais">
                    <datalist id="filiais">
                        <c:forEach items="${filiais}" var="filial">
                            <option>${filial.nome}</option>

                        </c:forEach>
                    </datalist>
                    <br>
                    <br>
                </c:when>
                <c:otherwise>
                    <input id="listFilial" name="filial" value="${sessionScope.usuario.estabelecimento.nome}" list="filiais">
                </c:otherwise>
            </c:choose>
            <div class="row">
                <div class="col-12">
                    <label name="labelDataInicial" id="labelDataInicial" for="dateInicial">De</label>
                    <label name="labelDataFinal" id="labelDataFinal" for="dateDataFinal">Até</label>
                    <label name="labelCliente" id="labelCliente" for="textCliente">Cliente</label>
                    <label name="labelProduto" id="labelProduto" for="textProduto">Produto</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <input id="dateInicial" type="date" name="inicio">
                    <input id="dateDataFinal" type="date" name="final">
                    <input id="textCliente" type="text" name="cliente" list="clientes" placeholder="Nome do cliente">
                    <datalist id="clientes">
                        <c:forEach items="${clientes}" var="cliente">
                            <option>${cliente.nome}</option>
                        </c:forEach>
                    </datalist>
                    <input id="textProduto" type="text" name="produto" list="produtos" placeholder="Nome do produto">
                    <datalist id="produtos">
                        <c:forEach items="${produtos}" var="produto">
                            <option>${produto.nome}</option>
                        </c:forEach>
                    </datalist>
                    <input type="hidden" value="listarVendas" name="chamada">
                    <button id="pesq" class="btn btn-primary" type="submit">Pesquisar</button>
                </div>
            </div>
        </form>
        <br>
        <c:choose>
            <c:when test="${(sessionScope.usuario.estabelecimento.matriz) && (sessionScope.usuario.cargo == 'Gerente')}">
                <c:if test="${vendas != null}">
                    <c:forEach items="${vendas}" var="venda">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${venda.id}" aria-expanded="true" aria-controls="collapseOne">
                                            <div class="row">
                                                <label class="col-2" style="text-align: center">Estabelecimento</label>
                                                <label class="col-2" style="text-align: center">Data da venda</label>
                                                <label class="col-2" style="text-align: center">Nome Funcionário</label>
                                                <label class="col-2" style="text-align: center">Nome Cliente</label>
                                                <label class="col-2" style="text-align: center">Tipo de pagamento</label>
                                                <label class="col-2" style="text-align: center">Valor total</label>
                                                <br>
                                                <label class="col-2" style="text-align: center">${venda.funcionario.estabelecimento.nome}</label>
                                                <label class="col-2" style="text-align: center">${venda.dataVenda}</label>
                                                <label class="col-2" style="text-align: center">${venda.funcionario.nome}</label>
                                                <label class="col-2" style="text-align: center">${venda.cliente.nome}</label>
                                                <label class="col-2" style="text-align: center">${venda.tipoPagamento}</label>
                                                <label class="col-2" style="text-align: center">${venda.valorTotal}</label>
                                            </div>
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapse${venda.id}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <c:if test="${detalhes != null}">
                                            <div class="row">
                                                <label class="col-1">Id</label>
                                                <label class="col-3">Nome do produto</label>
                                                <label class="col-3">Valor unitário</label>
                                                <label class="col-2">Quantidade</label>
                                                <label class="col-3">Total produto</label>
                                                <br>
                                                <c:forEach items="${detalhes}" var="detalhe">
                                                    <c:if test="${detalhe.venda.id == venda.id}">
                                                        <label class="col-1">${detalhe.produto.id}</label>
                                                        <label class="col-3">${detalhe.produto.nome}</label>
                                                        <label class="col-3">${detalhe.produto.valorVenda}</label>
                                                        <label class="col-2">${detalhe.quantidade}</label>
                                                        <label class="col-3">${detalhe.valorTotal}</label>
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
            </c:when>
            <c:otherwise>
                <c:if test="${vendas != null}">
                    <c:forEach items="${vendas}" var="venda">
                        <c:if test="${sessionScope.usuario.estabelecimento.id == venda.funcionario.estabelecimento.id}">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-header" id="headingOne">
                                        <h2 class="mb-0">
                                            <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${venda.id}" aria-expanded="true" aria-controls="collapseOne">
                                                <div class="row">
                                                    <label class="col-2" style="text-align: center">Estabelecimento</label>
                                                    <label class="col-2" style="text-align: center">Data da venda</label>
                                                    <label class="col-2" style="text-align: center">Nome Funcionário</label>
                                                    <label class="col-2" style="text-align: center">Nome Cliente</label>
                                                    <label class="col-2" style="text-align: center">Tipo de pagamento</label>
                                                    <label class="col-2" style="text-align: center">Valor total</label>
                                                    <br>
                                                    <label class="col-2" style="text-align: center">${venda.funcionario.estabelecimento.nome}</label>
                                                    <label class="col-2" style="text-align: center">${venda.dataVenda}</label>
                                                    <label class="col-2" style="text-align: center">${venda.funcionario.nome}</label>
                                                    <label class="col-2" style="text-align: center">${venda.cliente.nome}</label>
                                                    <label class="col-2" style="text-align: center">${venda.tipoPagamento}</label>
                                                    <label class="col-2" style="text-align: center">${venda.valorTotal}</label>
                                                </div>
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapse${venda.id}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:if test="${detalhes != null}">
                                                <div class="row">
                                                    <label class="col-1">Id</label>
                                                    <label class="col-3">Nome do produto</label>
                                                    <label class="col-3">Valor unitário</label>
                                                    <label class="col-2">Quantidade</label>
                                                    <label class="col-3">Total Produto</label>
                                                    <br>
                                                    <c:forEach items="${detalhes}" var="detalhe">
                                                        <c:if test="${detalhe.venda.id == venda.id}">
                                                            <label class="col-1">${detalhe.produto.id}</label>
                                                            <label class="col-3">${detalhe.produto.nome}</label>
                                                            <label class="col-3">${detalhe.produto.valorVenda}</label>
                                                            <label class="col-2">${detalhe.quantidade}</label>
                                                            <label class="col-3">${detalhe.valorTotal}</label>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:otherwise>
        </c:choose>
        <br/>
        <label name="labelTtl" style="border: 1px solid #ced4da; background-color: #e9ecef; padding: .375rem .75rem; border-radius: .25rem">Total R$ </label>
        <label id="labelTotal" style="border: 1px solid #ced4da; padding: .375rem .75rem">${totalVendas}</label>
    </body>
</html>
