<%-- 
    Document   : header
    Created on : 16/10/2020, 11:41:12
    Author     : danilo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            li{
                margin-left: 3px;
            }
        </style>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>

        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <img id="logo" src="<c:url value="/resources/img/logo 2.png"/>" class="navbar-brand">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="<c:url value="/pages/index.jsp"/>">AlCappuccino</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="material-icons">
                                    assignment_ind
                                </span>
                                Funcionários
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<c:url value="/ListarFuncionarios"/>">Ver todos</a>
                                <c:if test="${sessionScope.usuario.admin}">
                                    <a class="dropdown-item" href="<c:url value="/CadastrarFuncionarios"/>">Cadastrar</a>
                                </c:if>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="material-icons">
                                    add_location_alt
                                </span>
                                Filiais
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<c:url value="/ListarFiliais"/>">Ver todos</a>
                                <c:if test="${sessionScope.usuario.admin}">
                                    <a class="dropdown-item" href="<c:url value="/IncluirFiliais"/>">Cadastrar</a>
                                </c:if>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="material-icons">
                                    person_add
                                </span>
                                Clientes
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<c:url value="/ListarCliente"/>">Ver todos</a>
                                <a class="dropdown-item" href="<c:url value="/CadastrarCliente"/>">Cadastrar</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="material-icons">
                                    attach_money
                                </span>
                                Vendas
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<c:url value="/ListarVenda"/>">Ver todos</a>
                                <a class="dropdown-item" href="<c:url value="/CadastrarVenda"/>">Cadastrar</a>
                            </div>
                        </li>



                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="material-icons">
                                    free_breakfast
                                </span>
                                Produtos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<c:url value="/ListarProduto"/>">Ver todos</a>
                                <c:if test="${sessionScope.usuario.admin}">
                                    <a class="dropdown-item" href="<c:url value="/CadastrarProduto"/>">Cadastrar</a>
                                </c:if>
                            </div>
                        </li>
                        
                        <c:if test="${sessionScope.usuario.admin}">
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value="/Relatorio?chamada=total"/>" id="navbarDropdownMenuLink" aria-haspopup="true" aria-expanded="false">
                                    <span class="material-icons">
                                        data_usage
                                    </span>
                                    Relatórios
                                </a>
                            </li>
                        </c:if>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="material-icons">
                                    person
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<c:url value="/AlterarSenha"/>">Trocar senha</a>
                                <a class="dropdown-item" href="<c:url value="/LogoutServlet"/>">SAIR</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>


    </body>
</html>