<%-- 
    Document   : listarFuncionarios
    Created on : 18/10/2020, 16:14:37
    Author     : paulo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Funcionários</title>
        <script lang="text/javascript">
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
        <h1>Lista de Funcionários</h1>
        <br/>
        <form method="GET" action="ListarFuncionario?cpf='${"#cpf"}.val()'">
            <input id ="cpf" name="cpf" placeholder="Digite o cpf"></input>
        <button type="submit">Pesquisar</button>
        </form>
            <br/>
        <button><a href="cadastrarFuncionarios.jsp">Cadastrar Funcionário</a></button>
        <table class="table">
            <thead>
            <th>CPF</th>
            <th>Nome</th>
            <th>RG</th>
            <th>Data Nasc.</th>
            <th>E-mail</th>
            <th>Telefone</th>
            <th>Estado civil</th>
            <th>Sexo</th>
            <th>CEP</th>
            <th>Logradouro</th>
            <th>Numero</th>
            <th>Complemento</th>
            <th>Bairro</th>
            <th>Cidade</th>
            <th>UF</th>
            <th>Cargo</th>
            <th>Salário</th>
            <th>Filial</th>
            <th>Data Adm</th>
            <th>Data Dem</th>
            <th>Observações</th>
        </thead>
        <tbody>
            <c:forEach items="${listaFuncionarios}" var="funcionarios">
                <tr>
                    <td>${funcionarios.cpf}</td>
                    <td>${funcionarios.nome}</td>
                    <td>${funcionarios.rg}</td>
                    <td>${funcionarios.dt_nascimento}</td>
                    <td>${funcionarios.email}</td>
                    <td>${funcionarios.telefone}</td>
                    <td>${funcionarios.estado_civil}</td>
                    <td>${funcionarios.sexo}</td>
                    <td>${funcionarios.cep}</td>
                    <td>${funcionarios.logradouro}</td>
                    <td>${funcionarios.numero}</td>
                    <td>${funcionarios.complemento}</td>
                    <td>${funcionarios.bairro}</td>
                    <td>${funcionarios.cidade}</td>
                    <td>${funcionarios.uf}</td>
                    <td>${funcionarios.cargo}</td>
                    <td>${funcionarios.salario}</td>
                    <td>${funcionarios.filial}</td>
                    <td>${funcionarios.dt_adm}</td>
                    <td>${funcionarios.dt_dem}</td>
                    <td>${funcionarios.observacao}</td>
                    <td><button><a href="AlterarFuncionarios?cpf=${funcionarios.cpf}">Alterar</a></button></td>
                    <td><button type="button" class="btn btn-primary" 
                                onclick="confirmarDelete(${funcionarios.cpf})">Excluir</button></td>
                </tr>
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
                    <button type="button" class="btn btn-primary" onclick="deletarCliente()">Confirmar</button>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <button><a href="index.jsp">Voltar</a></button>
</body>
</html>
