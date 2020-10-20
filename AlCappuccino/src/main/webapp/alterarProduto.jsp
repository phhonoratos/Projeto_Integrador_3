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
        <form action="AlterarProduto" method="POST">
            <p>ID</p>
            <input name="id" value="${produto.nome}" readonly="true"/><br/>
            <p>Tipo do Produto</p>
            <input name="tipo" value="${produto.qtd_estoquel}"/><br/>
            <p>Nome</p>
            <input name="nome" value="${produto.preco}" readonly="true"/><br/>
            <p>Quantidade em Estoque</p>
            <input name="qtd_estoque" value="${produto.nome}"/><br/>
            <p>Preço de Compra do Produto</p>
            <input name="preco" value="${produto.qtd_estoquel}"/><br/>
            <p>Procentagem de Lucro</p>
            <input name="porcentagem" value="${produto.preco}"/><br/>
             <p>Valor de Venda do Produto</p>
            <input name="valor_venda" value="${produto.preco}"/><br/>
                        
            <button type="submit">Enviar</button>
            
        </form>
    </body>
</html>
