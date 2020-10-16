<%-- 
    Document   : listaClientes
    Created on : 16/10/2020, 11:46:18
    Author     : danil
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
            
            function mostrarModalExclusao(preco, nome){
                $("#nomeProduto").html(nome);
                $("#precoProduto").val(preco);
                $('#modalExclusao').modal('show');
            }
            
            function excluirProduto() {
                var preco = $("#precoProduto").val();
                $.get( "ExcluirProduto?preco="+preco, function( resposta ) {
                    $('#modalExclusao').modal('hide')
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
        <h1>Lista de Produtos</h1>
        <table class="table">
            <thead>
                <th>Nome</th>
                <th>Quantidade em Estoquel</th>
                <th>Preço</th>
            </thead>
            <tbody> 
                <c:forEach var="produto" items="${listaProduto}">
                    <tr>
                        <td>${produto.nome}</td>
                        <td>${produto.qtdEstoque}</td>
                        <td>${produto.preco}</td>
                        <td><a href="alterarProduto?nome=${produto.nome}">Alterar</a></td>
                        <td><button type="button" class="btn btn-primary" onclick="mostrarModalExclusao(${produto.preco}, '${produto.nome}')">Excluir</button></td>
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
                    <input id="precoProduto" hidden="true" />
                 
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                  <button type="button" class="btn btn-primary" onclick="excluirCliente()">Confirmar</button>
                </div>
              </div>
            </div>
          </div>
        <br/>
        <a href="menu.jsp">Voltar</a>
    </body>
</html>
