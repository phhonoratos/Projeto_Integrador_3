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
        <link rel="stylesheet" href="./resources/css/cadastrarVenda.css">
        <link rel="stylesheet" href="./resources/css/front.css">
        <title>Vendas</title>
    </head>
    <body>

        <div class="container">
            <h1 style="text-align: center">Vendas</h1>

            <form method="POST" action="CadastrarVenda">
                <div class="vendedor">
                    <span>Vendedor: </span>
                    <input type="text" name="vendedor" placeholder="Escolha um funcionário" list="funcionario" required/>
                    <datalist id="funcionario">
                        <c:forEach var="funcionario" items="${listaFuncionarios}">
                            <c:if test="${sessionScope.usuario.estabelecimento.id == funcionario.estabelecimento.id}">
                                <option value=${funcionario.cpf}></option>
                            </c:if>
                        </c:forEach>
                    </datalist>
                </div>
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

                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Estoque</span>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                                   value="${produto.quantidadeEstoque}" name="estoque" id="estoque" readonly>
                                        </div>
                                        
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Preço (R$)</span>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                                   value="${produto.valorVenda}" name="valor_venda" id="valor_venda" readonly>
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
                                                   id="${produto.nome}${produto.id}" 
                                                   min="0" 
                                                   max="${produto.quantidadeEstoque}" 
                                                   onchange="calcularTotal('${produto.nome}', '${produto.id}', ${produto.valorVenda})">
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
                                                   id="${produto.nome}${produto.id}${produto.id}" 
                                                   readonly>
                                        </div>

                                    </div>
                                    <a href="#" class="btn btn-primary">Incluir</a>
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
                <button type="submit" class="btn btn-success">Vender</button>
            </form>

            <script>

                function calcularTotal(nome, id, precoVenda) {
                    var qtd = $("#" + nome + id).val()
                    var total = qtd * precoVenda

                    console.log(qtd, total)

                    $("#" + nome + id + id).val(total.toFixed(2))
                }

                function adicionarCarrinho(nome, tipo, id) {
                    var qtd_total = $("#" + nome + tipo + id).val()
                    var produto = $("#" + nome + id).html()
                    var valor = $("#" + nome + id + id).html()
                    valor = valor * qtd_total;

                    console.log(qtd_total, valor);
                    console.log(produto)

                    var table = document.getElementById("carrinho");
                    var row = table.insertRow(-1);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);

                    cell1.innerHTML = produto;
                    cell2.innerHTML = qtd_total;
                    cell3.innerHTML = valor;
                }

            </script>
    </body>
</html>
