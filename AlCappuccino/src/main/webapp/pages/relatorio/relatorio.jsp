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
            <input id="radioMatriz" type="radio" name="opcao" value="matriz">
            <label for="radioMatriz">Matriz</label>

            <input id="radioFilial" type="radio" name="opcao" value="filial">
            <label for="radioFilial">Filial</label>

            <input id="listFilial" name="filial" placeholder="Digite o nome da filial" list="filiais">
            <datalist id="filiais">
                <c:forEach items="${filiais}" var="filial">
                    <option>${filial.nome}</option>
                </c:forEach>
            </datalist>
                
            <br><br>

            <label id="labelDataInicial" for="txtDataInicial">De</label>
            <label id="labelDataFinal" for="txtDataFinal">Até</label>

            <br>
            
            <input id="dateInicial" class="form-control-sm" type="date" name="inicio">
            <input id="dateDataFinal" class="form-control-sm" type="date" name="final">
            <input id="textCliente" class="form-control-sm" type="text" name="cliente" list="clientes">
            <datalist id="clientes">
                <c:forEach items="${filiais}" var="filial">
                    <option>${filial.nome}</option>
                </c:forEach>
            </datalist>
            
            <button class="btn btn-primary" onclick="listarVendas()">Pesquisar</button>
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
                                        <label class="col-3">Id do produto</label>
                                        <label class="col-3">Valor unitário</label>
                                        <label class="col-3">Quantidade</label>
                                        <label class="col-3">Valor total</label>
                                        <br>
                                        <c:forEach items="${detalhes}" var="detalhe">
                                            <c:if test="${detalhe.venda.id == venda.id}">
                                                <label class="col-3">${detalhe.produto.id}</label>
                                                <label class="col-3">${detalhe.produto.valorVenda}</label>
                                                <label class="col-3">${detalhe.quantidade}</label>
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
        
        <p id="pTotal">${totalVendas}</p>
        
<!--        <table class="table">
                <thead>
                    <th>Data</th>
                    <th>Vendedor</th>
                    <th>Cliente</th>
                    <th>Tipo de pagamento</th>
                    <th>Total</th>
                </thead>
                <tbody>-->
                    <%--<c:forEach items="${vendas}" var="venda">--%>
<!--                        <tr>
                            <td>${venda.dataVenda}</td>
                            <td>${venda.cpfFuncionario}</td>
                            <td>${venda.cpfCliente}</td>
                            <td>${venda.tipoPagamento}</td>
                            <td>${venda.valorTotal}</td>
                        </tr>-->
                    <%--</c:forEach>--%>
                <%--</c:if>--%>
<!--            </tbody>
            </table>-->
        
<!--        <p id="pTotal">${totalVendas}</p>-->
        
<!--    <table class="table">
            <thead>
                <th>Produto</th>
                <th>Valor Unitário R$</th>
                <th>Quantidade</th>
                <th>Total</th>
            </thead>
            <tbody>
                <%--<c:if test="${detalhes != null}">--%>
                    <%--<c:forEach items="${detalhes}" var="detalhe">--%>
                        <tr>
                            <td>${detalhe.idProduto}</td>
                            <td>00.00</td>
                            <td>${detalhe.quantidade}</td>
                            <td>${detalhe.valorTotal}</td>
                        </tr>
                    <%--</c:forEach>--%>
                <%--</c:if>--%>
            </tbody>
        </table>-->
        <!--</div>-->
        <!--<button onclick="teste()">teste</button>-->
    </body>
</html>
