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
    </head>
    <body>
        <div class="container">
            <h1 style="text-align: center">Vendas</h1>

            <div class="container">

                <div class="row">
                    <c:forEach var="produto" items="${listaProduto}">
                        <div class="col-4">
                            <div class="card">
                                <img src="../../../images/'${produto.nome}'.jpg" class="card-img-top" alt="${produto.nome}">
                                <div class="card-body">
                                    <h5 class="card-title">${produto.nome}</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">${produto.tipo}</h6>
                                    <a href="#" class="card-link">Card link</a>
                                    <a href="#" class="card-link">Another link</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
