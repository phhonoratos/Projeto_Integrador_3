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
    </head>
    <body>
        <h1>Funcionário: ${funcionario.nome}</h1>
        <br/>
        <button><a href="cadastrarFuncionarios.jsp">Cadastrar Funcionário</a></button>
        <table>
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
                    <td><button><a href="ExcluirFuncionarios?cpf=${funcionario.cpf}">Excluir</a></button></td>
            <br/>
        </tr>
    </div>
    </tbody>
</table>
        <br/>
        <button><a href="index.jsp">Voltar</a></button>
</body>
</html>
