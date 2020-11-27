<%-- 
    Document   : cadastrarVenda
    Created on : Oct 22, 2020, 6:10:11 PM
    Author     : joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="./resources/css/front.css">
        <link rel="stylesheet" href="./resources/css/cadastrarVenda.css">
        <title>Vendas</title>
    </head>
    <body>

        <div class="container">
            <h1 style="text-align: center">Vendas</h1>

            <form method="POST" action="Carrinho">
                <div class="cliente">
                    <span>Cliente: </span>
                    <input type="text" name="cliente" placeholder="Escolha um cliente" list="cliente"/>
                    <datalist id="cliente">
                        <c:forEach var="cliente" items="${listaClientes}">
                            <option value=${cliente.cpf}></option>
                        </c:forEach>
                    </datalist>
                </div>


                <div class="row card-produtos">
                    <c:forEach var="produto" items="${listaProduto}">
                        <c:if test="${sessionScope.usuario.estabelecimento.id == produto.estabelecimento.id}">

                            <div class="card col-4 card-produto">
                                <!--<img src="..." class="card-img-top" alt="...">-->
                                <div class="card-body">
                                    <input class="card-title" readonly="true" value="${produto.nome}" name="produto"></input>
                                    <input class="card-subtitle mb-2 text-muted" name="categoria" value="${produto.tipo}" readonly="true"></input>
                                    <div class="card-text">
                                        <input name="id" value="${produto.id}" hidden/>

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Estoque</span>
                                            </div>
                                            <input type="text" 
                                                   class="form-control" 
                                                   aria-label="Default" 
                                                   aria-describedby="inputGroup-sizing-default"
                                                   value="${produto.quantidadeEstoque}" 
                                                   name="estoque" 
                                                   id="estoque" 
                                                   readonly>
                                        </div>

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Preço (R$)</span>
                                            </div>

                                            <input type="text" class="form-control" 
                                                   aria-label="Default" 
                                                   aria-describedby="inputGroup-sizing-default"
                                                   value="${produto.valorVenda}" 
                                                   name="valor_venda" 
                                                   id="valor_venda" 
                                                   step="any" 
                                                   class="two-decimals"
                                                   readonly>
                                        </div>

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Quantidade</span>
                                            </div>
                                            <input type="number" 
                                                   class="form-control" 
                                                   aria-label="Default" 
                                                   aria-describedby="inputGroup-sizing-default"
                                                   name="quantidade" 
                                                   id="${produto.tipo}${produto.id}" 
                                                   min="0" 
                                                   max="${produto.quantidadeEstoque}" 
                                                   onchange="calcularTotal('${produto.tipo}', '${produto.id}', ${produto.valorVenda})">
                                        </div>

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Valor Total (R$)</span>
                                            </div>
                                            <input type="number" 
                                                   class="form-control" 
                                                   aria-label="Default" 
                                                   aria-describedby="inputGroup-sizing-default"
                                                   name="valorTotal"
                                                   id="${produto.tipo}${produto.id}${produto.id}" 
                                                   step="any" 
                                                   class="two-decimals"
                                                   readonly>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </c:if>
                    </c:forEach>
                </div>
                <!--

                <table class="table table-striped" id="produtos">
                    <thead>
                    <th>Id</th>
                    <th>Produto</th>
                    <th>Categoria</th>
                    <th>Qtd Disponível</th>
                    <th>Preço (R$)</th>
                    <th>Quantidade</th>
                    <th>Total (R$)</th>
                    </thead>

                    <tbody>
                <c:forEach var="produto" items="${listaProduto}">
                    <c:if test="${sessionScope.usuario.estabelecimento.id == produto.estabelecimento.id}">
                        <tr>
                            <td><input name="id" value="${produto.id}"/></td>
                            <td><input name="produto" value="${produto.nome}"/></td>
                            <td><input name="categoria" value="${produto.tipo}"/></td>
                            <td><input name="estoque" value="${produto.quantidadeEstoque}"/></td>
                            <td><input name="valor_venda" type="currency" value="${produto.valorVenda}"/></td>

                            <td><input type="number" id="${produto.nome}${produto.id}" name="quantidade" min="0" max="${produto.quantidadeEstoque}" onchange="calcularTotal('${produto.nome}', '${produto.id}', ${produto.valorVenda})"></td>
                            <td><input type="number" step="0.01" id="${produto.nome}${produto.id}${produto.id}" name="valorTotal"/></td>
                        </tr>
                    </c:if>
                </c:forEach>

            </tbody>
            <tfoot>

            </tfoot>
        </table>
                -->
                <c:forEach var="produto" items="${listaProduto}">
                    <input name="porcentagem" value="${produto.porcentagem}" hidden="true"/>
                </c:forEach>
                <input name="id_estabelecimento" value="${sessionScope.usuario.estabelecimento.id}" hidden="true"/>
                <div class="row">
                    <div class="col-6">
                        <button type="submit" class="btn btn-success">Incluir</button>
                    </div>
                    <div class="col-6 btn-vender">
                        <label>Total R$ </label>
                        <label id="labelTotal">0.0</label>
                    </div>
                </div>

            </form>

            <script>

                function adicionarCarrinho(tipo, idProduto, valorTotal) {

                    var quantidade = $("#" + tipo + "" + idProduto).val();
                    var total = quantidade * valorTotal;
                    $.get("Carrinho?idProduto=" + idProduto + "&quantidade=" + quantidade + "&valorTotal=" + total, function (resposta) {
                        console.log('foi');
                    });
                    window.location.reload();
                }

                function calcularTotal(nome, id, precoVenda) {
                    var valorTotal = parseFloat($("#labelTotal").html());
                    var qtd = $("#" + nome + id).val();
                    var total = qtd * precoVenda;
                    console.log(qtd, total);
                    $("#" + nome + id + id).val(total.toFixed(2));
                    $("#labelTotal").html(valorTotal + parseFloat(precoVenda));
                    console.log($("#labelTotal").html());
                }

            </script>
    </body>
</html>
