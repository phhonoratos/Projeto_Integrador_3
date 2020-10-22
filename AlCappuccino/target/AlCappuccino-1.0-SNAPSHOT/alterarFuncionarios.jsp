<%-- 
    Document   : cadastrarFuncionarios
    Created on : 16/10/2020, 14:30:26
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="cadastrarFuncionarios.css">
        <title>Atualização de Funcionário</title>
    </head>
    <body class="container">
        <h1>Atualização. Funcionário: ${funcionarios.nome}</h1>
        <br/>
        <table class="table">
            <form method="POST" action="AlterarFuncionarios">
                <div class="row">
                    <div class="col-8">
                        <p><b>Dados Pessoais</b></p>
                        <input name="cpf" value="${funcionarios.cpf}" readonly="true"></input>
                        <button>Pesquisar</button>
                        <br/>
                        <br/>
                        <input name="nome" value="${funcionarios.nome}"></input>
                        <input name="rg" value="${funcionarios.rg}"></input>
                        <br/>
                        <br/>
                        <select name="sexo" value="${funcionarios.sexo}">
                            <option value="masculino">Masculino</option>
                            <option value="feminino">Feminino</option>
                            <option value="lgbt">LGBTQI+</option>
                        </select>
                        <input type="date" name="dt_nascimento" value="${funcionarios.dt_nascimento}"></input>
                        <select name="estado_civil" value="${funcionarios.estado_civil}">
                            <option value="Solteiro(a)">Solteiro(a)</option>
                            <option value="Casado(a)">Casado(a)</option>
                            <option value="Divorciado(a)">Divorciado(a)</option>
                            <option value="Viuvo(a)">Viuvo(a)</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <p><b>Contatos</b></p>
                        <br/>
                        <input name="telefone" class="form-control" value="${funcionarios.telefone}"></input>
                        <br/>
                        <input name="email" class="form-control" value="${funcionarios.email}"></input>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-8">
                        <p><b>Endereço</b></p>
                        <input name="logradouro" value="${funcionarios.logradouro}"></input>
                        <input name="numero" value="${funcionarios.numero}"></input>
                        <br/>
                        <br/>
                        <input name="complemento" value="${funcionarios.complemento}"></input>
                        <input name="cep" value="${funcionarios.cep}"></input>
                        <br/>
                        <br/>
                        <input name="bairro" value="${funcionarios.bairro}"></input>
                        <input name="cidade" value="${funcionarios.cidade}"></input>
                        <select name="uf" value="${funcionarios.uf}">
                            <option value="options">UF</option>
                            <option value="acre">AC</option>
                            <option value="alagoas">AL</option>
                            <option value="amapa">AP</option>
                            <option value="amazonas">AM</option>
                            <option value="bahia">BA</option>
                            <option value="ceara">CE</option>
                            <option value="distrito_federal">DF</option>
                            <option value="espirito_santo">ES</option>
                            <option value="goias">GO</option>
                            <option value="maranhao">MA</option>
                            <option value="mato_grosso">MT</option>
                            <option value="mato_grosso_sul">MS</option>
                            <option value="minas-gerais">MG</option>
                            <option value="para">PA</option>
                            <option value="paraiba">PB</option>
                            <option value="parana">PR</option>
                            <option value="pernambuco">PE</option>
                            <option value="piaui">PI</option>
                            <option value="rio_de_janeiro">RJ</option>
                            <option value="rio_grande_norte">RN</option>
                            <option value="rio_grande_sul">RS</option>
                            <option value="rondonia">RO</option>
                            <option value="roraima">RR</option>
                            <option value="santa_catarina">SC</option>
                            <option value="sao_paulo">SP</option>
                            <option value="sergipe">SE</option>
                            <option value="tocantins">TO</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <p><b>Função</b></p>
                        <input name="cargo" class="form-control" value="${funcionarios.cargo}"></input>
                        <input name="salario" class="form-control" value="${funcionarios.salario}"></input>
                        <input name="filial" class="form-control" value="${funcionarios.filial}"></input>
                    </div>
                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-4">
                        <p><b>Admissão / Demissão / Observações</b></p>
                        <br/>
                        <label>Data Admissão: </label>
                        <input type="date" name="dt_adm" value="${funcionarios.dt_adm}"></input>
                        <br/>
                        <label>Data Demissão: </label>
                        <input type="date" name="dt_dem" value="${funcionarios.dt_dem}"></input>
                    </div>
                    <div class="col-1">
                    </div>
                    <div class="col-7">
                        <br/>
                        <br/>
                        <textarea name="observacao" class="form-control" value="${funcionarios.observacao}"></textarea>
                    </div>
                </div>
            </form>
        </table>
        <button><a href="index.jsp">Cancelar</a></button>
        <button type="submit">Atualizar</button>
            
        </form>
    </body>
</html>