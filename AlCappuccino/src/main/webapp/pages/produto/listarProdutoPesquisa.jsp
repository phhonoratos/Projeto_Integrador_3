<%-- 
    Document   : listarProdutoPesquisa
    Created on : 23/10/2020, 12:43:08
    Author     : danil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>

        <script>

            function mostrarModalExclusao(id) {
                $("#idProduto").html(id);
                $("#idProduto").val(id);
                $('#modalExclusao').modal('show');
            }

            function excluirProduto() {
                var id = $("#idProduto").val();
                $.get("ExcluirProduto?id=" + id, function (resposta) {
                    $('#modalExclusao').modal('hide');
                    if (resposta === "true") {
                        console.log("Produto Excluído!");
                    } else {
                        console.log("Erro na exclusão!");
                    }
                    window.location.reload();
                });
            }
        </script>
    </head>
    <body class="container">
        <br>
        <h1>Lista de Produtos</h1>
        <br>
        <br>
        <table class="table">
            <thead>
            <th>ID</th>
            <th>Tipo</th>
            <th>Nome</th>
            <th>Quantidade em Estoque</th>
            <th>Preço</th>
            <th>Porcentagem</th>
            <th>Valor de Venda</th>
        </thead>
        <tbody> 

            <tr>
                <td>${produto.id}</td>
                <td>${produto.tipo}</td>
                <td>${produto.nome}</td>
                <td>${produto.quantidadeEstoque}</td>
                <td>${produto.preco}</td>
                <td>${produto.porcentagem}</td>
                <td>${produto.valorVenda}</td>
                <td><a href="AlterarProduto?id=${produto.id}">Alterar</a></td>
                <td><button type="button" class="btn btn-primary" onclick="mostrarModalExclusao('${produto.id}')">Excluir</button></td>
            </tr>


        </tbody>

    </table>
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
                    Confirmar exclusão do Produto  <label id="idProduto"></label> ?


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="excluirProduto()">Confirmar</button>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <a href="index.jsp">Voltar</a>
</body>
</html>
