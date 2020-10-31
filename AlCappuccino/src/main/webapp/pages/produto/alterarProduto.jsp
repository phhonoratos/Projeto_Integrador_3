<%-- 
    Document   : alterarProduto
    Created on : 16/10/2020, 11:30:28
    Author     : danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/listarProduto.css">
         <script src="./resources/js/produto.js"></script>
        <title>Alterar Produto</title>
    </head>
    <body class="container">
        <div style="text-align: center">
            <h1>Alteração de Cadastro: ${produto.id}</h1>
        </div>
        <br>
        <br>
        <form method="POST" action="AlterarProduto">
            <div class="row">

                <div class="col-sm">
                    <label for="id">ID</label>
                    <input type="id" name="id" value="${produto.id}" class="form-control" readonly="true"/>
                </div>

                <div class="col-sm">
                    <label for="tipo">Tipo do Produto</label>
                    <input  id="tipo" type="tipo" name="tipo" value="${produto.tipo}" class="form-control"/>
                </div>

                <div class="col-sm">
                    <label for="nome">Nome</label>
                    <input id="nome" type="nome" name="nome" value="${produto.nome}" class="form-control"></br>
                </div>
            </div>

            <div class="row">    
                <div class="col-sm">
                    <label for="qtd_estoque">Quantidade em Estoque</label>
                    <input id="qtdEstoque" type="qtd_Estoque" name="qtd_estoque" value="${produto.quantidadeEstoque}" class="form-control"/>
                </div>

                <div class="col-sm">
                    <label for="preco">Preço de Compra do Produto</label>
                    <input id="preco" type="preco" name="preco" value="${produto.preco}" class="form-control"/>
                </div>

                <div class="col-sm"> 
                    <label for="porcentagem">Procentagem de Lucro</label>
                    <input id="porcentagem" type="porcentagem" name="porcentagem" value="${produto.porcentagem}" class="form-control"/><br/>
                </div>
            </div>

            <div class="row">    
                <div class="col-sm">
                    <label for="valor">Valor de Venda do Produto</label>
                    <input id="valorTotal" type="valor" name="valor_venda" value="${produto.valorVenda}" class="form-control" onfocus="calcularVendaProduto()"/><br/>
                </div>
            </div>
            <br>

            <div style="text-align: center">
            <button type="submit" class="btn btn-primary">Enviar</button>
            </div>

        </form>
    </body>
</html>
