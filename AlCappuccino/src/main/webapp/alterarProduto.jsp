<%-- 
    Document   : alterarProduto
    Created on : 16/10/2020, 11:30:28
    Author     : danilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
    </head>
    <body>
        <h1>Alteração de Cadastro: ${produto.nome}</h1>
        <form action="alterarProduto" method="POST">
            <p>Nome</p>
            <input name="nome" value="${produto.nome}"/><br/>
            <p>Quantidade em Estoque</p>
            <input name="qteEstoque" value="${produto.qtd_estoquel}"/><br/>
            <p>Preço</p>
            <input name="preco" value="${produto.preco}" readonly="true"/><br/>
                        
            <button type="submit">Enviar</button>
            
        </form>
    </body>
</html>
