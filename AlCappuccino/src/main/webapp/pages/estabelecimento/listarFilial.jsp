<%-- 
    Document   : IncluirFiliais - Sem Admin
    Author     : Paulo Costa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/front.css">
        <title>Listar Filiais</title>
    </head>
    <body>
        <div class="container p-2 mb-4">
            <div class="text-center page-title">
                <h3>Filiais</h3> 
            </div>
            <div class="row">
                <!-- SEARCH BOX -->
                <div class="col-md-4">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-outline-secondary">Filtrar</button>
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="">Nome</a>
                            </div>
                        </div>
                        <input type="text" class="form-control" placeholder="Pesquisar nome" id="search-input">
                    </div>
                </div>
            </div>

            <!-- CARDS -->
            <c:forEach var="estabelecimento" items="${listaEstabelecimento}">
                <div class="card shadow-sm p-3 mb-4 rounded estabelecimento-card">
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
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
    <script>
        // Filtro por Nome
        $('#search-input').keyup(function () {
            var filter = this.value.toLowerCase();

            $('#estabelecimento-container').each(function () {
                var _this = $(this);
                var title = _this.find('h5').text().toLowerCase();

                _this.show();
                if (title.indexOf(filter) < 0) {
                    _this.hide();
                }
            });
        });
    </script>
    <script src="./resources/js/FilialScript.js"></script>
</html>
