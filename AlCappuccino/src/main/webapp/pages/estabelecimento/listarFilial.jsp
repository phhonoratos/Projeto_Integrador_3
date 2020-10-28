<%-- 
    Document   : IncluirFiliais
    Author     : Paulo Costa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Filiais</title>
    </head>
    <body>

        <div class="container p-2 mb-4">
            <div class="text-center page-title">
                <h3>Filiais</h3> 
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="input-group mb-3">
                        <div class="input-group-btn search-panel">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span id="search_concept">Filtrar por</span> <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#filtrar_nome">Nome</a></li>
                                <li><a href="#filtrar_cnpj">CNPJ</a></li>
                                <li><a href="#filtrar_estado">Estado</a></li>
                            </ul>
                        </div>
                        <input type="hidden" name="search_param" value="all" id="search_param">         
                        <input type="text" class="form-control" name="x" placeholder="Pesquisar">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                        </span>
                    </div>
                </div>

            </div>

            <c:forEach var="estabelecimento" items="${listaEstabelecimento}">
                <div class="card shadow-sm p-3 mb-4 rounded">
                    <h5 class="card-title text-center">${estabelecimento.nome}</h5>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <label class="font-weight-bolder">ID: </label><span> ${estabelecimento.id}</span> </br>
                                <label class="font-weight-bolder">Razão Social: </label><span> ${estabelecimento.nome}</span> </br>
                                <label class="font-weight-bolder">CNPJ: </label><span> ${estabelecimento.cnpj}</span> </br>
                                <label class="font-weight-bolder">Inscrição Estadual: </label><span> ${estabelecimento.inscricaoEstadual}</span> </br>
                            </div>
                            <div class="col">
                                <label class="font-weight-bolder">Rua: </label><span> ${estabelecimento.logradouro}</span> </br>
                                <label class="font-weight-bolder">Número: </label><span> ${estabelecimento.numeroEndereco}</span> </br>
                                <label class="font-weight-bolder">Bairro: </label><span> ${estabelecimento.bairro}</span> </br>
                                <label class="font-weight-bolder">Complemento: </label><span> ${estabelecimento.complemento}</span> </br>
                                <label class="font-weight-bolder">Cidade: </label><span> ${estabelecimento.cidade}</span> </br>
                                <label class="font-weight-bolder">Cidade: </label><span> ${estabelecimento.cidade}</span> </br>
                                <label class="font-weight-bolder">Estado: </label><span> ${estabelecimento.unidadeFederativa}</span> </br>
                                <label class="font-weight-bolder">CEP: </label><span> ${estabelecimento.cep}</span> </br>
                            </div>
                            <div class="col">
                                <label class="font-weight-bolder">Telefone: </label><span> ${estabelecimento.telefone}</span> </br>
                                <label class="font-weight-bolder">E-mail: </label><span> ${estabelecimento.email}</span> </br>
                                <div class="button-group mt-5 p-3">
                                    <button class="btn btn-primary btn-block" type="submit">Alterar Filial</button> </br>
                                    <button class="btn btn-danger mt-1 btn-block">Realizar exclusão</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>

    <script>
        // Provisório.
        $(document).ready(function (e) {
            $('.search-panel .dropdown-menu').find('a').click(function (e) {
                e.preventDefault();
                var param = $(this).attr("href").replace("#", "");
                var concept = $(this).text();
                $('.search-panel span#search_concept').text(concept);
                $('.input-group #search_param').val(param);
            });
        });

    </script>

</html>
