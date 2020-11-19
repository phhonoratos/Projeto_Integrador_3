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
        <div class="container-fluid">
            <h1 style="text-align: center">Lista de Clientes</h1>

            <form method="GET" action="ListarCliente?cpf=${"#cpf"}.val()">
                <input id ="cpf" name="cpf" placeholder="Digite o cpf" list="exampleList"></input>
                <datalist id="exampleList">
                    <c:forEach var="cliente" items="${listaClientes}">
                        <option value=${cliente.cpf}></option>
                    </c:forEach>
                </datalist>
                <button type="submit" id="pesq">Pesquisar</button>
                <a class="btn btn-primary" href="CadastrarCliente" role="button">Cadastrar Cliente</a>
            </form>
            <br>
            <span>Total de clientes cadastrados: ${listaClientes.size()}</span>
            <table class="table table-sm">
                <thead>
                <th>Nome</th>
                <th>Email</th>
                <th>CPF</th>
                <th>Telefone</th>
                <th>Estado Civil</th>
                <th>Sexo</th>
                <th>Logradouro</th>
                <th>Número</th>
                <th>Complemento</th>
                <th>Bairro</th>
                <th>Cidade</th>
                <th>UF</th>
                <th>CEP</th>
                <th>Data de nascimento</th>
                </thead>
                <tbody> 
                    <c:forEach var="cliente" items="${listaClientes}">
                        <tr>
                            <td>${cliente.nome}</td>
                            <td>${cliente.email}</td>
                            <td>${cliente.cpf}</td>
                            <td>${cliente.telefone}</td>
                            <td>${cliente.estadoCivil}</td>
                            <td>${cliente.sexo}</td>
                            <td>${cliente.logradouro}</td>
                            <td>${cliente.numeroEndereco}</td>
                            <td>${cliente.complemento}</td>
                            <td>${cliente.bairro}</td>
                            <td>${cliente.cidade}</td>
                            <td>${cliente.unidadeFederativa}</td>
                            <td>${cliente.cep}</td>
                            <td>${cliente.dataNascimento}</td>
                            <td><a class="btn btn-warning" href="AtualizarCliente?cpf=${cliente.cpf}" role="button">Alterar</a></td>
                            <td><a class="btn btn-danger" onclick="mostrarModalExclusao(${cliente.cpf}, '${cliente.nome}')" role="button">Excluir</a></td>
                        </tr>
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
