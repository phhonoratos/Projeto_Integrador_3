<%-- 
    Document   : IncluirFiliais
    Author     : Paulo Costa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header/header.jsp" %>
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
                <!-- SEARCH BOX -->
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

            <!-- CARDS -->
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
                                    <button class="btn btn-primary btn-block" 
                                            onclick="mostrarModal('alteracao', ${estabelecimento.id});">
                                        Alterar Filial
                                    </button> 
                                    </br>
                                    <button class="btn btn-danger mt-1 btn-block" id="deleteEstabelecimento"
                                            onclick="mostrarModal('exclusao', ${estabelecimento.id});">
                                        Realizar exclusão
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- MODAL DE EXCLUSÃO - POP-UP -->
                <div class="modal fade" id="modalExclusao${estabelecimento.id}" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Exclusão</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Confirma a exclusão da Filial <span class="font-weight-bolder">${estabelecimento.nome}</span>, de CNPJ <span class="font-weight-bolder">${estabelecimento.cnpj}</span> do sistema?</p>
                            </div>
                            <div class="alert alert-success info-success" role="alert">
                                Filial excluída com sucesso.
                            </div>
                            <div class="alert alert-danger info-failed" role="alert">
                                Ocorreu um erro. Não foi possível excluir esta filial.
                            </div>
                            <div class="text-center info-back-button mb-3">
                                <button class="btn btn-outline-primary" 
                                        onclick="window.location.href = listarFiliaisURL();">
                                    Voltar
                                </button>
                            </div>
                            <div class="modal-footer text-center">
                                <button type="button" class="btn btn-primary btn-danger"
                                        id="btn-confirm-delete" onclick="enviarExclusao(`${estabelecimento.id}`);">
                                    Excluir
                                </button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- MODAL DE ALTERAÇÃO - POP-UP -->
                <div class="modal fade" id="modalAlteracao${estabelecimento.id}" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Atualizar Dados</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="form-alteracao" action="AlterarFiliais" onsubmit="return false;">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">ID</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.id}" name="id" id="id" readonly>
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Razão Social</span>
                                        </div>
                                        <input type="text" class="form-control" id="nome" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.nome}" name="nome">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">CNPJ</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.cnpj}" name="cnpj" id="cnpj">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Inscrição Estadual</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.inscricaoEstadual}" name="inscricaoEstadual" id="inscricaoEstadual">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Rua</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.logradouro}" name="logradouro" id="logradouro">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Número</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.numeroEndereco}" name="numeroEndereco" id="numeroEndereco">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Bairro</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.bairro}" name="bairro">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Complemento</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.complemento}" name="complemento">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Cidade</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.cidade}" name="cidade">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Estado</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.unidadeFederativa}" name="unidadeFederativa">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">CEP</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.cep}" name="cep">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">Telefone</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.telefone}" name="telefone">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroup-sizing-default">E-mail</span>
                                        </div>
                                        <input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                               value="${estabelecimento.email}" name="email">
                                    </div>
                                </form>
                            </div>
                            <div class="alert alert-success info-success" role="alert">
                                Filial alterada com sucesso.
                            </div>
                            <div class="alert alert-danger info-failed" role="alert">
                                Ocorreu um erro. Não foi possível alterar esta filial.
                            </div>
                            <div class="text-center info-back-button mb-3">
                                <button class="btn btn-outline-primary" 
                                        onclick="window.location.href = listarFiliaisURL();">
                                    Voltar
                                </button>
                            </div>
                            <div class="modal-footer text-center">
                                <button type="button" class="btn btn-primary btn-success"
                                        id="btn-confirm-update-ajax-form" type="submit">
                                    Alterar
                                </button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>

    <script>
        $(document).ready(function () {
            $('.info-success').hide();
            $('.info-failed').hide();
            $('.info-back-button').hide();
            $('.modal-footer').show();
        });

        function mostrarModal(tipo, id) {
            let modal = tipo === 'exclusao' ? '#modalExclusao'+id : '#modalAlteracao'+id;
            $(modal).modal('show');
            $('.modal-footer').show();
        }

        function modalSuccess() {
            $('.modal-footer').hide();
            $('.info-success').show();
            $('.info-back-button').show();
        }

        function modalFailed() {
            $('.modal-footer').hide();
            $('.info-failed').show();
            $('.info-back-button').show();
        }

        // Provisório (SearchBox TBD).
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
    <script src="./resources/js/FilialScript.js"></script>
</html>
