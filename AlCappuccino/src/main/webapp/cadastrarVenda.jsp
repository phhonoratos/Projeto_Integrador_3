<%-- 
    Document   : cadastrarVenda
    Created on : Oct 22, 2020, 6:10:11 PM
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
                <div>
                    <span>Vendedor: </span>
                    <input type="text" name="vendedor" value="${listaClientes[0].cpf}"/>
                </div>
                <div>
                    <span>Cliente: </span>
                    <input type="text" name="cliente" value="${listaClientes[0].cpf}"/>
                </div>
                <table class="table" id="produtos">
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



            <!--
            <div class="row">
                <div class="col-8">
            <c:forEach var="produto" items="${listaProduto}">
                <div class="col-3"  style="margin-bottom: 20px; display: inline-block; max-width: 30%">
                    <div class="card" style="height: 250px">
                        <img src="../../../images/'${produto.nome}'.jpg" class="card-img-top" alt="${produto.nome}">
                        <div style="position: relative" class="card-body">
                            <h5 class="card-title" id="${produto.nome}${produto.id}">${produto.nome}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">${produto.tipo}</h6>
                            <hr>
                            <p class="card-subtitle mb-2 text-muted">Disponível: ${produto.quantidadeEstoque}</p>
                            <p class="card-subtitle mb-2 text-muted" id="${produto.nome}${produto.id}${produto.id}">${produto.valorVenda}</p>

                            <input style="position: absolute;right: 80px; bottom: 15px" type="number" id="${produto.nome}${produto.tipo}${produto.id}" name="quantity" min="0" max="${produto.quantidadeEstoque}">
                            <button style="position: absolute;right: 10px; bottom: 15px" onclick="adicionarCarrinho('${produto.nome}','${produto.tipo}','${produto.id}')">
                                Inserir
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="col-3" style="border: 1px solid red">
            <form method="POST" action="CadastrarVenda">
                <h3>Carrinho</h3>

                <table class="table" id="carrinho" style="font-size: 10px">
                    <thead>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Total (R$)</th>
                    </thead>

                    <tbody>

                    </tbody>
                </table>
                <button type="submit">Cadastrar</button>
            </form>
        </div>

    </div>

    <div class="modal fade" id="modalExclusao" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirmar Exclusão</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Confirmar exclusão do cliente  <label id="nomeCliente"></label> ?
                    <input id="cpfCliente" hidden="true" />

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="excluirCliente()">Confirmar</button>
                </div>
            </div>
        </div>
    </div>

    <a class="btn btn-primary" href="index.jsp" role="button">Voltar</a>
</div>
            -->

    </body>
</html>
