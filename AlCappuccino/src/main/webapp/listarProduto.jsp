<%-- 
    Document   : listaProduto
    Created on : 16/10/2020, 11:46:18
    Author     : danilo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>

        <script lang="text/javascript">

            function mostrarModalExclusao(nome) {
                $("#nomeProduto").html(nome);
                $("#nomeProduto").val(nome);
                $('#modalExclusao').modal('show');
            }

            function excluirProduto() {
                var nome = $("#nomeProduto").val();
                $.get("ExcluirProduto?nome=" + nome, function (resposta) {
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
        <div id="divBusca">
            <form method="GET" action="ListarProdutosPesquisa?nome='${"#nome"}.val()'">
                <input type="text" name ="nome" id=nome" placeholder="Digite o nome..."/>
                <button type="submit">Buscar</button>
            </form>
        </div>
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
            <c:forEach var="produto" items="${listaProduto}">
                <tr>
                    <td>${produto.id}</td>
                    <td>${produto.tipo}</td>
                    <td>${produto.nome}</td>
                    <td>${produto.qtd_estoque}</td>
                    <td>${produto.preco}</td>
                    <td>${produto.porcentagem}</td>
                    <td>${produto.valor_venda}</td>
                    <td><a href="AlterarProduto?nome=${produto.nome}">Alterar</a></td>
                    <td><button type="button" class="btn btn-primary" onclick="mostrarModalExclusao('${produto.nome}')">Excluir</button></td>
                </tr>
            </c:forEach>

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
                    Confirmar exclusão do Produto  <label id="nomeProduto"></label> ?


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
