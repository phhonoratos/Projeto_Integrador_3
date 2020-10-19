<%-- 
    Document   : cadastrarProduto
    Created on : 16/10/2020, 11:37:51
    Author     : danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Produto</title>
    </head>
    <body class="container">
        <h1>Cadastro de Produto</h1>
        <form action="cadastrarProduto" method="POST">
            <p>Nome</p>
            <input name="nome" class="form-control" required="true"/><br/>
            <p>Quantidade em Estoque</p>
            <input name="qtdEstoque" class="form-control" required="true"/><br/>
            <p>Preço</p>
            <input name="preco" class="form-control" required="true"/><br/>
            
            <button type="submit" class="btn btn-primary">Enviar</button>
            
        </form>
    </body>
</html>
