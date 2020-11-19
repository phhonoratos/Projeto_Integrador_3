<%-- 
    Document   : index
    Created on : 16/10/2020, 23:08:05
    Author     : joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header/header.jsp" %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="../resources/css/front.css">
        <title>Menu</title>
    </head>
    <body class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Produto</h5>
                        <c:if test="${sessionScope.usuario.admin}">
                            <p class="card-text">Adicionar</p>
                            <a href="<c:url value="/CadastrarProduto"/>" class="btn btn-primary">
                                <span class="material-icons">
                                    free_breakfast
                                </span>
                            </a>
                            <hr>
                        </c:if>
                        <p class="card-text">Listar</p>
                        <a href="<c:url value="/ListarProduto"/>" class="btn btn-primary">
                            <span class="material-icons">
                                list
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.usuario.admin}">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Vendas</h5>
                            <p class="card-text">Adicionar</p>
                            <a href="<c:url value="/CadastrarVenda"/>" class="btn btn-primary">
                                <span class="material-icons">
                                    attach_money
                                </span>
                            </a>
                            <hr>
                            <p class="card-text">Listar</p>
                            <a href="<c:url value="/ListarVenda"/>" class="btn btn-primary">
                                <span class="material-icons">
                                    list
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Funcionários</h5>
                        <c:if test="${sessionScope.usuario.admin}">
                            <p class="card-text">Adicionar</p>
                            <a href="<c:url value="/CadastrarFuncionarios"/>" class="btn btn-primary">
                                <span class="material-icons">
                                    person_add
                                </span> 
                            </a>
                            <hr>
                        </c:if>                
                        <p class="card-text">Listar</p>
                        <a href="<c:url value="/ListarFuncionarios"/>" class="btn btn-primary">
                            <span class="material-icons">
                                list
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
                            
        <div class="row" style="margin-top: 20px">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Filiais</h5>
                        <c:if test="${sessionScope.usuario.admin}">
                            <p class="card-text">Adicionar</p>
                            <a href="<c:url value="/IncluirFiliaisServlet"/>" class="btn btn-primary">
                                <span class="material-icons">
                                    business
                                </span>
                            </a>
                            <hr>
                        </c:if>
                        <p class="card-text">Listar</p>
                        <a href="<c:url value="/ListarFiliaisServlet"/>" class="btn btn-primary">
                            <span class="material-icons">
                                list
                            </span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Clientes</h5>
                        <p class="card-text">Adicionar</p>
                        <a href="<c:url value="/CadastrarCliente"/>" class="btn btn-primary">
                            <span class="material-icons">
                                person_add
                            </span>
                        </a>
                        <hr>
                        <p class="card-text">Listar</p>
                        <a href="<c:url value="/ListarCliente"/>" class="btn btn-primary">
                            <span class="material-icons">
                                list
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.usuario.admin}">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Relatórios</h5>
                            <p class="card-text">Listar</p>
                            <a href="<c:url value="/Relatorio?chamada=total"/>" class="btn btn-primary">
                                <span class="material-icons">
                                    list
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>                
        </div>
    </body>
</html>
