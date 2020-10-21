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
        <h1>Alteração de Cadastro: ${produto.id}</h1>
        <form method="POST" action="AlterarProduto">
            <p>ID</p>
            <input name="id" value="${produto.id}" readonly="true"/><br/>
            <p>Tipo do Produto</p>
            <input name="tipo" value="${produto.tipo}"/><br/>
            <p>Nome</p>
            <input name="nome" value="${produto.nome}" ><br/>
            <p>Quantidade em Estoque</p>
            <input name="qtd_estoque" value="${produto.qtd_estoque}"/><br/>
            <p>Preço de Compra do Produto</p>
            <input name="preco" value="${produto.preco}"/><br/>
            <p>Procentagem de Lucro</p>
            <input name="porcentagem" value="${produto.porcentagem}"/><br/>
             <p>Valor de Venda do Produto</p>
            <input name="valor_venda" value="${produto.valor_venda}"/><br/>
                        
            <button type="submit">Enviar</button>
            
        </form>
    </body>
</html>
