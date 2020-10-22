<%-- 
    Document   : listarFuncionario
    Created on : 21/10/2020, 21:35:15
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionário</title>
    </head>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionário</title>
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
        <h1>Funcionário: ${funcionario.nome}</h1>
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
        </thead>
        <tbody>
            <div>
                <tr>
                    <td>${funcionario.cpf}</td>
                    <td>${funcionario.nome}</td>
                    <td>${funcionario.rg}</td>
                    <td>${funcionario.dt_nascimento}</td>
                    <td>${funcionario.email}</td>
                    <td>${funcionario.telefone}</td>
                    <td>${funcionario.estado_civil}</td>
                    <td>${funcionario.sexo}</td>
                    <td>${funcionario.cep}</td>
                    <td>${funcionario.logradouro}</td>
                    <td>${funcionario.numero}</td>
                    <td>${funcionario.complemento}</td>
                    <td>${funcionario.bairro}</td>
                    <td>${funcionario.cidade}</td>
                    <td>${funcionario.uf}</td>
                    <td>${funcionario.cargo}</td>
                    <td>${funcionario.salario}</td>
                    <td>${funcionario.filial}</td>
                    <td>${funcionario.dt_adm}</td>
                    <td>${funcionario.dt_dem}</td>
                    <td><button><a href="AlterarFuncionarios?cpf=${funcionario.cpf}">Alterar</a></button></td>
                    <td><button type="button" class="btn btn-primary" 
                                onclick="confirmarDelete(${funcionario.cpf})">Excluir</button></td>
            <br/>
        </tr>
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
