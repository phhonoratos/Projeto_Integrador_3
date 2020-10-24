<%-- 
    Document   : cadastrarVenda
    Created on : Oct 22, 2020, 6:10:11 PM
    Author     : joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendas</title>


        <script lang="text/javascript">

            function calcularTotal(nome, id, precoVenda) {
                var qtd = $("#" + nome + id).val()
                var total = qtd * precoVenda

                $("#" + nome + id + id).html(total)
            }


            function myFunction(nome, id) {
                var table = document.getElementById("carrinho");
                var row = table.insertRow(-1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                cell1.innerHTML = document.getElementById("produtos tbody tr:eq(0) td");
                cell2.innerHTML = "NEW CELL2";
                cell3.innerHTML = "NEW CELL2";
            }
            
            function adicionarCarrinho(produto,quantidade,valor){
                var table = document.getElementById("carrinho");
                var row = table.insertRow(-1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                
                var nome = document.createElement("input")
                nome.name="prodNome"
                nome.value=produto
                
                var nome = document.createElement("input")
                nome.name="prodQtde"
                nome.value=quantidade
                
                var total = document.createElement("input")
                total.name="prodTotal"
                total.value=valor
                
                cell1.innerHTML = nome
                cell2.innerHTML = quantidade;
                cell3.innerHTML = total;
            }


        </script>

    </head>
    <body>

        <!--
        <div class="container">
            <h1 style="text-align: center">Vendas</h1>

            <div class="row">
                <div class="col-8">
                    <table class="table" id="produtos">
                        <thead>
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
                <td>${produto.nome}</td>
                <td>${produto.tipo}</td>
                <td>${produto.qtd_estoque}</td>
                <td>${produto.valor_venda}</td>
                <td><input type="number" id="${produto.nome}${produto.id}" name="quantity" min="0" max="${produto.qtd_estoque}" onchange="calcularTotal('${produto.nome}', '${produto.id}', ${produto.valor_venda})"></td>
                <td><label id="${produto.nome}${produto.id}${produto.id}" name="valorTotal"></label></td>
                <td><a class="btn btn-success" role="button" onclick="myFunction('${produto.nome}', '${produto.id}')">Inserir</a></td>
            </tr>
        </c:forEach>

    </tbody>
</table>
</div>

<div class="col-4" style="border: 1px solid red">
<h3>Carrinho</h3>
<table class="table" id="carrinho">
    <thead>
    <th>Produto</th>
    <th>Quantidade</th>
    <th>Total (R$)</th>
    </thead>

    <tbody>


    </tbody>
</table>
</div>
</div>
        -->


        <div class="row">
            <div class="col-8">
                <c:forEach var="produto" items="${listaProduto}">
                    <div class="col-3"  style="margin-bottom: 20px; display: inline-block; max-width: 30%">
                        <div class="card" style="height: 250px">
                            <img src="../../../images/'${produto.nome}'.jpg" class="card-img-top" alt="${produto.nome}">
                            <div style="position: relative" class="card-body">
                                <h5 class="card-title">${produto.nome}</h5>
                                <h6 class="card-subtitle mb-2 text-muted">${produto.tipo}</h6>
                                <hr>
                                <p class="card-subtitle mb-2 text-muted">Disponível: ${produto.qtd_estoque}</p>
                                <p class="card-subtitle mb-2 text-muted">R$ ${produto.valor_venda}</p>

                                <input style="position: absolute;right: 80px; bottom: 15px" type="number" id="quantity" name="quantity" min="0" max="${produto.qtd_estoque}">
                                <button style="position: absolute;right: 10px; bottom: 15px" onclick="adicionarCarrinho('${produto.nome}', )">
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
                        
                    <table class="table" id="produtos">
                        <thead>
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th>Total (R$)</th>
                        </thead>

                        <tbody id="carrinho">
                            
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

</body>
</html>
