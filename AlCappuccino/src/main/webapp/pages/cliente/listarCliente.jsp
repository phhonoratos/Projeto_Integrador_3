<%-- 
    Document   : listarCliente
    Created on : 16/10/2020, 23:06:42
    Author     : joao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/front.css">
        <title>Clientes</title>

        <script>

            function mostrarModalExclusao(cpf, nome) {
                $("#nomeCliente").html(nome);
                $("#cpfCliente").val(cpf);
                $('#modalExclusao').modal('show');
            }

            function excluirCliente() {
                var cpf = $("#cpfCliente").val();
                $.get("ExcluirCliente?cpf=" + cpf, function (resposta) {
                    $('#modalExclusao').modal('hide')
                    if (resposta === "true") {
                        console.log("Funfou!");
                    } else {
                        console.log("Ops!");
                    }
                    window.location.reload();
                });
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1 style="text-align: center">Lista de Clientes</h1>

            <form method="GET" action="ListarCliente?cpf=${"#cpf"}.val()">
                <input id ="cpf" name="cpf" placeholder="Digite o cpf" list="exampleList"></input>
                <datalist id="exampleList">
                    <c:forEach var="cliente" items="${listaClientes}">
                        <option value=${cliente.cpf}></option>
                    </c:forEach>
                </datalist>
                <button type="submit" id="pesq">Pesquisar</button>
                <a id="cad" class="btn btn-primary" href="CadastrarCliente" role="button">Cadastrar Cliente</a>
            </form>
            <br>
            <span>Total de clientes cadastrados: ${listaClientes.size()}</span>
            <table class="table table-sm">
                <tbody> 
                    <c:forEach var="cliente" items="${listaClientes}">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${cliente.cpf}" aria-expanded="true" aria-controls="collapseOne">
                                            <div class="row">
                                                <label class="col-4" id="nome1"><b>Nome</b></label>
                                                <label class="col-4" id="cargo1"><b>Email</b></label>
                                                <label class="col-4" id="filial1"><b>Telefone</b></label>
                                            </div>
                                            <div class="row">
                                                <br/>
                                                <label class="col-4" id="nome">${cliente.nome}</label>
                                                <label class="col-4" id="cargo">${cliente.email}</label>
                                                <label class="col-4" id="filial">${cliente.telefone}</label>
                                            </div>
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapse${cliente.cpf}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="row">
                                            <label class="col-3" id="cpf"><b>CPF:</b> ${cliente.cpf}</label>
                                            <label class="col-3" id="dt_nasc"><b>Data Nasc.:</b> ${cliente.dataNascimento}</label>
                                            <label class="col-3" id="estado_civil"><b>Estado civil:</b> ${cliente.estadoCivil}</label>
                                            <label class="col-3" id="sexo"><b>Sexo:</b> ${cliente.sexo}</label>
                                        </div>
                                        <br/>
                                        <div class="row">
                                            <label class="col-3" id="cep"><b>CEP:</b> ${cliente.cep}</label>
                                            <label class="col-6" id="logradouro"><b>Logradouro:</b> ${cliente.logradouro}</label>
                                            <label class="col-1" id="numero"><b>Número:</b> ${cliente.numeroEndereco}</label>
                                        </div>
                                        <br/>
                                        <div class="row">
                                            <label class="col-3" id="bairro"><b>Bairro:</b> ${cliente.bairro}</label>
                                            <label class="col-3" id="complemento"><b>Complemento:</b> ${cliente.complemento}</label>
                                            <label class="col-3" id="cidade"><b>Cidade:</b> ${cliente.cidade}</label>
                                            <label class="col-3" id="uf"><b>UF:</b> ${cliente.unidadeFederativa}</label>
                                        </div>
                                        <br/>
                                        <br/>
                                        <a class="btn btn-warning" style="margin-left: 900px" href="AtualizarCliente?cpf=${cliente.cpf}" role="button">Alterar</a>
                                        <a class="btn btn-danger" onclick="mostrarModalExclusao(${cliente.cpf}, '${cliente.nome}')" role="button">Excluir</a>
                                    </div>
                                </div>       
                            </div>
                        </div>
                    </c:forEach>

                </tbody>

            </table>
            
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
                            <span id="cpfCliente"></span> <!-- use display: none ou jquery -->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary" onclick="excluirCliente()">Confirmar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
