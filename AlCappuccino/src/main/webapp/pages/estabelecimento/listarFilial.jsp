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
        <h3>In Progress...</h3> </br> </br>
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Razão Social</th>
                    <th scope="col">CNPJ</th>
                    <th scope="col">Inscrição Estadual</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Telefone</th>
                    <th scope="col">CEP</th>
                    <th scope="col">Logradouro</th>
                    <th scope="col">Número Endereço</th>
                    <th scope="col">Complemento</th>
                    <th scope="col">Unidade Federativa</th>
                    <th scope="col">Bairro</th>
                    <th scope="col">Cidade</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="estabelecimento" items="${listaEstabelecimento}">
                    <tr>
                        <td>${estabelecimento.id}</td>
                        <td>${estabelecimento.nome}</td>
                        <td>${estabelecimento.cnpj}</td>
                        <td>${estabelecimento.inscricaoEstadual}</td>
                        <td>${estabelecimento.telefone}</td>
                        <td>${estabelecimento.cep}</td>
                        <td>${estabelecimento.logradouro}</td>
                        <td>${estabelecimento.numeroEndereco}</td>
                        <td>${estabelecimento.complemento}</td>
                        <td>${estabelecimento.unidadeFederativa}</td>
                        <td>${estabelecimento.bairro}</td>
                        <td>${estabelecimento.cidade}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
