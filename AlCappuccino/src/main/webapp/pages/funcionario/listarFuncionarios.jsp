<%-- 
    Document   : listarFuncionarios
    Created on : 18/10/2020, 16:14:37
    Author     : paulo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/front.css">
        <title>Lista de Funcionários</title>

        <script>
            function confirmarDelete(cpf) {
                $('#cpfDelete').html(cpf);
                $('#exampleModal').modal('show');
            }

            function deletarCliente() {
                var cpf = $('#cpfDelete').html();
                var url = "ExcluirFuncionarios?cpf=" + cpf;
                $.get(url, function (data) {
                    if (data == 'ok') {
                        $('#exampleModal').modal('hide');
                        $('.toast').toast('show');
                    } else {
                        //Mostrar modal de erro
                    }
                });
            }
        </script>
    </head>

    <body class="container">
        <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="1500">
            <div class="toast-header">
                <strong class="mr-auto">Sucesso</strong>
            </div>
            <div class="toast-body">
                Funcionário excluído com sucesso!
            </div>
        </div>

        <h1 style="margin-left: 450px; margin-top: -50px;">Funcionários</h1>
        <br/>

        <form method="GET" action="ListarFuncionarios?cpf='${"#cpf"}.val()'">
            <input id ="cpf" name="cpf" placeholder="Digite o cpf" list="exampleList"/>
            <datalist id="exampleList">
                <c:forEach var="funcionarios" items="${listaFuncionarios}">
                    <option value="${funcionarios.cpf}"></option>
                </c:forEach>
            </datalist>
            <button type="submit" id="pesq" class="btn btn-primary">Pesquisar</button>
            <c:if test="${sessionScope.usuario.admin}">
                <button id="cad" class="btn btn-success"><a id="bt" href="CadastrarFuncionarios">Cadastrar Funcionário</a></button>
            </c:if>
        </form>   
        <br/>

        <table class="table" id="tabelaFuncionarios">
            <tbody>
                <c:forEach items="${listaFuncionarios}" var="funcionarios">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h2 class="mb-0">
                                <button class="btn btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${funcionarios.cpf}" aria-expanded="true" aria-controls="collapseOne">
                                    <div class="row">
                                        <label class="col-4" id="nome1"><b>Nome</b></label>
                                        <label class="col-4" id="cargo1"><b>Cargo</b></label>
                                        <label class="col-4" id="filial1"><b>Estabelecimento</b></label>
                                    </div>
                                    <div class="row">
                                        <br/>
                                        <label class="col-4" id="nome">${funcionarios.nome}</label>
                                        <label class="col-4" id="cargo">${funcionarios.cargo}</label>
                                        <label class="col-4" id="filial">${funcionarios.estabelecimento.id}</label>
                                    </div>
                                </button>
                            </h2>
                        </div>
                        <c:if test="${sessionScope.usuario.admin}">
                            <div id="collapse${funcionarios.cpf}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row">
                                        <label class="col-3" id="cpf"><b>CPF:</b> ${funcionarios.cpf}</label>
                                        <label class="col-3" id="rg"><b>RG:</b> ${funcionarios.numeroRg}</label>
                                        <label class="col-3" id="dt_nasc"><b>Data Nasc.:</b> ${funcionarios.dataNascimento}</label>
                                        <label class="col-3" id="estado_civil"><b>Estado civil:</b> ${funcionarios.estadoCivil}</label>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <label class="col-3" id="sexo"><b>Sexo:</b> ${funcionarios.sexo}</label>
                                        <label class="col-3" id="cep"><b>CEP:</b> ${funcionarios.cep}</label>
                                        <label class="col-3" id="logradouro"><b>Logradouro:</b> ${funcionarios.logradouro}</label>
                                        <label class="col-3" id="numero"><b>Número:</b> ${funcionarios.numeroEndereco}</label>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <label class="col-3" id="bairro"><b>Bairro:</b> ${funcionarios.bairro}</label>
                                        <label class="col-3" id="complemento"><b>Complemento:</b> ${funcionarios.complemento}</label>
                                        <label class="col-3" id="cidade"><b>Cidade:</b> ${funcionarios.cidade}</label>
                                        <label class="col-3" id="uf"><b>UF:</b> ${funcionarios.unidadeFederativa}</label>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <label class="col-3" id="salario"><b>Salário:</b> R$ ${funcionarios.salario}</label>
                                        <label class="col-3" id="dt_adm"><b>Data Adm.:</b> ${funcionarios.dataAdmissao}</label>
                                        <label class="col-6" id="dt_dem"><b>Data Dem.:</b> ${funcionarios.dataDemissao}</label>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <label class="col-3" id="telefone"><b>Telefone:</b> ${funcionarios.telefone}</label>
                                        <label class="col-3" id="email"><b>E-mail:</b> ${funcionarios.email}</label>
                                    </div>
                                    <br/>
                                    <label id="obs"><b>Observações:</b> ${funcionarios.observacao}</label>
                                    <br/>
                                    <br/>
                                    <button class="btn btn-warning" style="margin-left: 900px"><a href="<c:url value="/AlterarFuncionarios?cpf=${funcionarios.cpf}"/>" style="color: white">Alterar</a></button>
                                    <button type="button" class="btn btn-danger" 
                                            onclick="confirmarDelete(${funcionarios.cpf})">Excluir</button>
                                </div>
                            </div>
                        </c:if>            
                    </div>
                </div>
            </c:forEach>
        </tbody>
    </table>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label>Confirmar exclusão do cpf: </label>
                    <span id="cpfDelete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-success" onclick="deletarCliente()">Confirmar</button>
                </div>
            </div>
        </div>
    </div>
    <br/>
</body>
</html>