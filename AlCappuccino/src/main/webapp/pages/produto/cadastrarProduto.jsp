<%-- 
    Document   : cadastrarProduto
    Created on : 16/10/2020, 11:37:51
    Author     : danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./resources/js/produto.js"></script>
        <title>Cadastrar Produto</title>
    </head>
    <body class="container">
        <br>
        <div style="text-align: center">
            <h1 >Cadastro de Produto</h1>
        </div>
        <br>
        <br>
        <form method="POST" action="CadastrarProduto">
            <div class="row">
                <div class="col-sm">
                    <label for="tipo">Tipo do Produto</label>
                    <input type="tipo" name="tipo" class="form-control" required="true"/><br/>
                </div>

                <div class="col-sm">
                    <label for="nome">Nome</label>
                    <input type="nome" name="nome" class="form-control" required="true"/><br/>
                </div>

                <div class="col-sm">
                    <label for="qtdEstoque">Quantidade em Estoque</label>
                    <input type="qtdEstoque" name="qtd_estoque" class="form-control" required="true"/><br/>
                </div>
            </div>

            <div class="row">
                <div class="col-sm">
                    <label for="preco">Preço de Compra do Produto</label>
                    <input id="preco" type="preco" name="preco" class="form-control" required="true"/><br/>
                </div>

                <div class="col-sm">
                    <label>Porcentagem de Lucro</label>
                    <input id="porcentagem" type="porcentagem" name="porcentagem" class="form-control" required="true" /><br/>
                </div>

                <div class="col-sm">
                    <label>Valor de Venda do Produto</label>
                    <input id="valorTotal" type="valor" name="valor_venda" class="form-control" required="true" onfocus="calcularVendaProduto()"/><br/>
                </div>
            </div>
            <br>
            <div style="text-align: center">
            <button type="submit" class="btn btn-primary">Enviar</button>
            </div>

        </form>
    </body>
</html>
