<%-- 
    Document   : header
    Created on : 16/10/2020, 11:41:12
    Author     : danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <style>
            li{
                margin-left: 30px;
            }
        </style>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.jsp">AlCappuccino</a>
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
                            <a class="dropdown-item" href="ListarFuncionarios">Ver todos</a>
                            <a class="dropdown-item" href="cadastrarFuncionarios.jsp">Cadastrar</a>
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
                            <a class="dropdown-item" href="ListarFiliais">Ver todos</a>
                            <a class="dropdown-item" href="IncluirFiliais">Cadastrar</a>
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
                            <a class="dropdown-item" href="ListarCliente">Ver todos</a>
                            <a class="dropdown-item" href="cadastrarCliente.jsp">Cadastrar</a>
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
                            <a class="dropdown-item" href="ListarVenda">Ver todos</a>
                            <a class="dropdown-item" href="CadastrarVenda">Cadastrar</a>
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
                            <a class="dropdown-item" href="ListarProduto">Ver todos</a>
                            <a class="dropdown-item" href="cadastrarProduto.jsp">Cadastrar</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link" href="ListarVendaRelatorio" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="material-icons">
                                data_usage
                            </span>
                            Relatórios
                        </a>

                    </li>
                </ul>
            </div>
        </nav>
    </body>
</html>