<%-- 
    Document   : index
    Created on : 16/10/2020, 23:08:05
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="pages/header/header.jsp" %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Menu</title>
    </head>
    <body class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Produto</h5>
                        <p class="card-text">Adicionar</p>
                        <a href="cadastrarProduto.jsp" class="btn btn-primary">
                            <span class="material-icons">
                                free_breakfast
                            </span>
                        </a>
                        <hr>
                        <p class="card-text">Listar</p>
                        <a href="ListarProduto" class="btn btn-primary">
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
                        <h5 class="card-title">Vendas</h5>
                        <p class="card-text">Adicionar</p>
                        <a href="CadastrarVenda" class="btn btn-primary">
                            <span class="material-icons">
                                attach_money
                            </span>
                        </a>
                        <hr>
                        <p class="card-text">Listar</p>
                        <a href="ListarVenda" class="btn btn-primary">
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
                        <h5 class="card-title">Funcionários</h5>
                        <p class="card-text">Adicionar</p>
                        <a href="cadastrarFuncionarios.jsp" class="btn btn-primary">
                            <span class="material-icons">
                                person_add
                            </span>
                        </a>
                        <hr>
                        <p class="card-text">Listar</p>
                        <a href="ListarFuncionarios" class="btn btn-primary">
                            <span class="material-icons">
                                list
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Filiais</h5>
                        <p class="card-text">Adicionar</p>
                        <a href="IncluirFiliais" class="btn btn-primary">
                            <span class="material-icons">
                                business
                            </span>
                        </a>
                        <hr>
                        <p class="card-text">Listar</p>
                        <a href="ListarFiliais" class="btn btn-primary">
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
                        <a href="cadastrarCliente.jsp" class="btn btn-primary">
                            <span class="material-icons">
                                person_add
                            </span>
                        </a>
                        <hr>
                        <p class="card-text">Listar</p>
                        <a href="ListarCliente" class="btn btn-primary">
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
                        <h5 class="card-title">Relatórios</h5>
                        <p class="card-text">Listar</p>
                        <a href="ListarVendaRelatorio" class="btn btn-primary">
                            <span class="material-icons">
                                list
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
