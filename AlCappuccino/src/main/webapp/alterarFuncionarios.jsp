<%-- 
    Document   : alterarFuncionarios
    Created on : 18/10/2020, 18:30:13
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualização de Funcionários</title>
    </head>
    <body>
        <h1>Atualização de Funcionários</h1>
        <form method="POST" action="AlterarFuncionarios">
            <p>CPF</p>
            <input name="cpf" value="${funcionarios.cpf}" readonly="true"></input>
            <p>Nome</p>
            <input name="nome" value="${funcionarios.nome}"></input>
            <p>RG</p>
            <input name="rg" value="${funcionarios.rg}"></input>
            <p>Data Nasc.</p>
            <input name="dt_nascimento" value="${funcionarios.dt_nascimento}"></input>
            <p>Sexo</p>
            <input name="sexo" value="${funcionarios.sexo}"></input>
            <p>Estado civil</p>
            <input name="estado_civil" value="${funcionarios.estado_civil}"></input>
            <p>Telefone</p>
            <input name="telefone" value="${funcionarios.telefone}"></input>
            <p>E-mail</p>
            <input name="email" value="${funcionarios.email}"></input>
            <p>Logradouro</p>
            <input name="logradouro" value="${funcionarios.logradouro}"></input>
            <p>Número</p>
            <input name="numero" value="${funcionarios.numero}"></input>
            <p>Complemento</p>
            <input name="complemento" value="${funcionarios.complemento}"></input>
            <p>CEP</p>
            <input name="cep" value="${funcionarios.cep}"></input>
            <p>UF</p>
            <input name="uf" value="${funcionarios.uf}"></input>
            <p>Bairro</p>
            <input name="bairro" value="${funcionarios.bairro}"></input>
            <p>Cidade</p>
            <input name="cidade" value="${funcionarios.cidade}"></input>
            <p>Cargo</p>
            <input name="cargo" value="${funcionarios.cargo}"></input>
            <p>Salário</p>
            <input name="salario" value="${funcionarios.salario}"></input>
            <p>Filial</p>
            <input name="filial" value="${funcionarios.filial}"></input>
            <p>Data de admissão</p>
            <input name="dt_adm" value="${funcionarios.dt_adm}"></input>
            <p>Data de demissão</p>
            <input name="dt_dem" value="${funcionarios.dt_dem}"></input>
            </br>
            </br>
            <button type="submit">Enviar</button>
            
        </form>
    </body>
</html>
