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
        <!--<link rel="stylesheet" href="./resources/css/header.css">-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>

        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 1150px; margin-left: -20px">
                <a href="<c:url value="/pages/index.jsp"/>"><img id="logo" src="<c:url value="/resources/img/logo 2.png"/>" class="navbar-brand"></a>
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
                                <a class="nav-link" href="<c:url value="/Relatorio?chamada=${sessionScope.usuario.estabelecimento.nome}"/>" id="navbarDropdownMenuLink" aria-haspopup="true" aria-expanded="false">
                                    <span class="material-icons">
                                        data_usage
                                    </span>
                                    Relatórios
                                </a>
                            </li>
                        </c:if>

                        <li class="nav-item dropdown">
                            <a class="nav-link carrinho" data-toggle="modal" data-target="#modalCarrinho" id="navbarDropdownMenuLink" aria-haspopup="true" aria-expanded="false">
                                <span class="material-icons">
                                    add_shopping_cart
                                </span>
                            </a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="<c:url value="/Carrinho"/>" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="material-icons">
                                    person
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a style="margin-left: 25px">${sessionScope.usuario.nome}</a>
                                <hr>
                                <a class="dropdown-item" href="<c:url value="/AlterarSenha"/>">Trocar senha</a>
                                <a class="dropdown-item" href="<c:url value="/AlCappuccinoInstitucional.jsp"/>">AlCappuccino Institucional</a>
                                <a class="dropdown-item" href="<c:url value="/LogoutServlet"/>">SAIR</a>
                            </div>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>



        <!-- Modal -->
        <div class="modal fade" id="modalCarrinho" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Carrinho de compras de ${sessionScope.cliente.nome}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="POST" action="CadastrarVenda">
                        <div class="modal-body">
                            <input hidden name="id_estabelecimento" value="${sessionScope.usuario.estabelecimento.id}">
                            <input hidden name="cliente" value="${sessionScope.cliente.cpf}">
                            <input hidden name="vendedor" value="${sessionScope.usuario.cpf}">
                            <c:forEach var="lista" items="${sessionScope.carrinho}" varStatus="status">
                                <div class="row produtos-carrinho">
                                    <input name="id" value="${lista.id}" hidden>
                                    <input name="categoria" value="${lista.tipo}" hidden>
                                    <div class="col-2">
                                        <input name="quantidade" value="${lista.quantidadeEstoque}">
                                    </div>
                                    <div class="col-5">
                                        <input id="produto" name="produto" value="${lista.nome}">
                                    </div>
                                    <div class="col-3">
                                        <input name="valorTotal" value="${lista.valorVenda}">
                                    </div>
                                </div>
                                <hr>
                            </c:forEach>
                        </div>
                        <div class="row" style="margin: 5px">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Total R$</span>
                                </div>
                                <input type="number" 
                                       class="form-control two-decimals" 
                                       aria-label="Default" 
                                       aria-describedby="inputGroup-sizing-default"
                                       step=0.01
                                       value="${sessionScope.totalCarrinho}"
                                       readonly>
                            </div>
                            <div class="col-6">
                                <label for="">Forma de pagamento</label>

                                <input type="text" name="formaDePagamento" list="formaDePagamento" required>
                                <datalist id="formaDePagamento">
                                    <option value="dinheiro"></option>
                                    <option value="debito"></option>
                                    <option value="credito"></option>
                                    <option value="vr"></option>
                                </datalist>
                            </div>
                            <div class="col-6" style="text-align: right">
                                <button class="btn btn-danger"><a href="<c:url value="/MatarCarrinho"/>" style="color: white">Cancelar venda</a></button>
                                <button type="submit" class="btn btn-success">Finalizar venda</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <c:if test="${sessionScope.totalCarrinho > 0}">
            <input id="verificarValorCarrinho" valeu="true" hidden>
        </c:if>

        <script src="./resources/js/header.js"></script>
    </body>

</html>