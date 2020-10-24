<%-- 
    Document   : index
    Created on : 16/10/2020, 23:08:05
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Menu</title>
    </head>
    <body class="container">

        <h1 style="text-align: center;">Menu</h1>

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
                        <a href="#" class="btn btn-primary">
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
                        <a href="#" class="btn btn-primary">
                            <span class="material-icons">
                                business
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
        </div>

        <a href="ListarProduto">Listar Produtos</a><br />
        <a href="cadastrarProduto.jsp">Cadastrar Produtos</a><br />
        <a href="ListarCliente">Clientes</a><br />
        <a href="cadastrarFuncionarios.jsp">Cadastrar Funcionarios</a><br />
        <a href="ListarFuncionarios">Listar Funcionarios</a><br />
        <a href="cadastrarCliente.jsp">Cadastrar Cliente</a><br />
        <a href="ListarVenda">Listar Venda</a>
    </body>
</html>
