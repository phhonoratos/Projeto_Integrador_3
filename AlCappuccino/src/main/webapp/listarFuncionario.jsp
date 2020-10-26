<%-- 
    Document   : listarFuncionarios
    Created on : 18/10/2020, 16:14:37
    Author     : paulo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="pages/header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/listagemFuncionarios.css">
        <title>Funcionário</title>

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

        <h1>Funcionário ${funcionario.nome}</h1>
        <br/>

        <form method="GET" action="ListarFuncionario?cpf='${"#cpf"}.val()'">
            <input id ="cpf" name="cpf" placeholder="Digite o cpf"></input>
            <button type="submit" id="pesq">Pesquisar</button>
            <button><a href="cadastrarFuncionarios.jsp">Cadastrar Funcionário</a></button>
        </form>
        <br/>

        <table class="table" id="tabelaFuncionarios">
            <tbody>
                <div>
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse${funcionario.cpf}" aria-expanded="true" aria-controls="collapseOne">
                                    <label id="cpf1"><b>CPF</b></label>
                                    <label id="nome1"><b>Nome</b></label>
                                    <label id="cargo1"><b>Cargo</b></label>
                                    <label id="filial1"><b>Filial</b></label>
                                    <br/>
                                    <label id="cpf">${funcionario.cpf}</label> 
                                    <label id="nome">${funcionario.nome}</label>
                                    <label id="cargo">${funcionario.cargo}</label>
                                    <label id="filial">${funcionario.filial}</label>
                                </button>
                            </h2>
                        </div>
                        <div id="collapse${funcionario.cpf}" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div class="card-body">
                                <label id="rg"><b>RG:</b> ${funcionario.cpf}</label>
                                <label id="sexo"><b>Sexo:</b> ${funcionario.sexo}</label>
                                <label id="dt_nasc"><b>Data Nasc.:</b> ${funcionario.dataNascimento}</label>
                                <label id="estado_civil"><b>Estado civil:</b> ${funcionario.estadoCivil}</label>
                                <br/>
                                <label id="cep"><b>CEP:</b> ${funcionario.cep}</label>
                                <label id="logradouro"><b>Logradouro:</b> ${funcionario.logradouro}</label>
                                <label id="numero"><b>Número:</b> ${funcionario.numeroEndereco}</label>
                                <br/>
                                <label id="complemento"><b>Complemento:</b> ${funcionario.complemento}</label>
                                <label id="bairro"><b>Bairro:</b> ${funcionario.bairro}</label>
                                <label id="cidade"><b>Cidade:</b> ${funcionario.cidade}</label>
                                <label id="uf"><b>UF:</b> ${funcionario.unidadeFederativa}</label>
                                <br/>
                                <label id="salario"><b>Salário:</b> R$ ${funcionario.salario}</label>
                                <label id="dt_adm"><b>Data Adm.:</b> ${funcionario.dataAdmissao}</label>
                                <label id="dt_dem"><b>Data Dem.:</b> ${funcionario.dataDemissao}</label>
                                <br/>
                                <label id="telefone"><b>Telefone:</b> ${funcionario.telefone}</label>
                                <label id="email"><b>E-mail:</b> ${funcionario.email}</label>
                                <br/>
                                <label id="obs"><b>Observações:</b> ${funcionario.observacao}</label>
                                <br/>
                                <br/>
                                <button><a href="AlterarFuncionarios?cpf=${funcionario.cpf}">Alterar</a></button>
                                <button type="button" class="btn btn-primary" 
                                        onclick="confirmarDelete(${funcionario.cpf})">Excluir</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                    <button type="button" class="btn btn-primary" onclick="deletarCliente()">Confirmar</button>
                </div>
            </div>
        </div>
    </div>
    <br/>

    <button><a href="index.jsp">Voltar</a></button>
</body>
</html>