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
        <form method="POST" action="CadastrarProduto">
            <p>ID</p>
            <input name="id" class="form-control" required="true"/><br/>
            <p>Tipo do Produto</p>
            <input name="tipo" class="form-control" required="true"/><br/>
            <p>Nome</p>
            <input name="nome" class="form-control" required="true"/><br/>
            <p>Quantidade em Estoque</p>
            <input name="qtd_estoque" class="form-control" required="true"/><br/>
            <p>Preço de Compra do Produto</p>
            <input name="preco" class="form-control" required="true"/><br/>
            <p>Porcentagem de Lucro</p>
            <input name="porcentagem" class="form-control" required="true"/><br/>
            <p>Valor de Venda do Produto</p>
            <input name="valor_venda" class="form-control" required="true"/><br/>
            <br>
            <button type="submit" class="btn btn-primary">Enviar</button>
                        
        </form>
    </body>
</html>
