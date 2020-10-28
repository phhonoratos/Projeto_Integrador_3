<%-- 
    Document   : cadastrarVenda
    Created on : Oct 22, 2020, 6:10:11 PM
    Author     : joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/cadastrarVenda.css">
        <title>Vendas</title>


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

    </head>
    <body>

        <div class="container-fluid">
            <h1 style="text-align: center">Vendas</h1>

            <form method="POST" action="CadastrarVenda">
                <div class="vendedor">
                    <span>Vendedor: </span>
                    <input type="text" name="vendedor" placeholder="Escolha um funcionário" list="funcionario" required/>
                    <datalist id="funcionario">
                        <c:forEach var="funcionario" items="${listaFuncionarios}">
                            <option value=${funcionario.cpf}></option>
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
                            <tr>
                                <td><input name="id" value="${produto.id}"/></td>
                                <td><input name="produto" value="${produto.nome}"/></td>
                                <td><input name="categoria" value="${produto.tipo}"/></td>
                                <td><input name="estoque" value="${produto.quantidadeEstoque}"/></td>
                                <td><input name="valor_venda" value="${produto.valorVenda}"/></td>

                                <td><input type="number" id="${produto.nome}${produto.id}" name="quantidade" min="0" max="${produto.quantidadeEstoque}" onchange="calcularTotal('${produto.nome}', '${produto.id}', ${produto.valorVenda})"></td>
                                <td><input type="number" step="0.01" id="${produto.nome}${produto.id}${produto.id}" name="valorTotal"/></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                    <tfoot>

                    </tfoot>
                </table>
                <c:forEach var="produto" items="${listaProduto}">
                    <input name="porcentagem" value="${produto.porcentagem}" hidden="true"/>
                </c:forEach>
                <button type="submit" class="btn btn-success">Vender</button>
            </form>
    </body>
</html>
