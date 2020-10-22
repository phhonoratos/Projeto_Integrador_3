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
        <title>Cadastro de Funcionários</title>
    </head>
    <body class="container">
        <h1>Cadastro de funcionários</h1>
        <br/>
        <table class="table">
            <form method="POST" action="CadastrarCliente">
                <div class="row">
                    <div class="col-8">
                        <p><b>Dados Pessoais</b></p>
                        <input name="cpf" placeholder="Digite o CPF" style="text-align: center" required="true"></input>
                        <button>Pesquisar</button>
                        <br/>
                        <br/>
                        <input name="nome" placeholder="Nome" style="text-align: center" required="true"></input>
                        <input name="rg" placeholder="RG" style="text-align: center" required="true"></input>
                        <br/>
                        <br/>
                        <select name="sexo">
                            <option value="masculino">Masculino</option>
                            <option value="feminino">Feminino</option>
                            <option value="lgbt">LGBTQI+</option>
                        </select>
                        <input type="date" name="dt_nascimento" placeholder="Data de nasc." style="text-align: center" required="true"></input>
                        <select name="estado_civil">
                            <option value="Solteiro(a)">Solteiro(a)</option>
                            <option value="Casado(a)">Casado(a)</option>
                            <option value="Divorciado(a)">Divorciado(a)</option>
                            <option value="Viuvo(a)">Viuvo(a)</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <p><b>Contatos</b></p>
                        <br/>
                        <input name="telefone" class="form-control" placeholder="Telefone" style="text-align: center" required="true"></input>
                        <br/>
                        <input name="email" class="form-control" placeholder="Digite o email" style="text-align: center" required="true"></input>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-8">
                        <p><b>Endereço</b></p>
                        <input name="logradouro" placeholder="Logradouro" style="text-align: center" required="true"></input>
                        <input name="numero" placeholder="Número" style="text-align: center" required="true"></input>
                        <br/>
                        <br/>
                        <input name="complemento" placeholder="Complemento" style="text-align: center" required="true"></input>
                        <input name="cep" placeholder="CEP" style="text-align: center" required="true"></input>
                        <br/>
                        <br/>
                        <input name="bairro" placeholder="Bairro" style="text-align: center" required="true"></input>
                        <input name="cidade" placeholder="cidade" style="text-align: center" required="true"></input>
                        <select name="uf">
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
                        <input name="cargo" class="form-control" placeholder="Cargo" style="text-align: center" required="true"></input>
                        <input name="salario" class="form-control" placeholder="Salário" style="text-align: center" required="true"></input>
                        <input name="filial" class="form-control" placeholder="Filial" style="text-align: center" required="true"></input>
                    </div>
                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-4">
                        <p><b>Admissão / Demissão / Observações</b></p>
                        <br/>
                        <label>Data Admissão: </label>
                        <input type="date" name="dt_adm" placeholder="Data Adm." style="text-align: center" required="true"></input>
                        <br/>
                        <label>Data Demissão: </label>
                        <input type="date" name="dt_dem" placeholder="Data Dem." style="text-align: center" required="true"></input>
                    </div>
                    <div class="col-1">
                    </div>
                    <div class="col-7">
                        <br/>
                        <br/>
                        <textarea name="observacao" class="form-control" placeholder="Observações" aria-label="With textarea" required="true"></textarea>
                    </div>
                </div>
            </form>
        </table>
        <button><a href="index.jsp">Cancelar</a></button>
        <button type="submit">Enviar</button>
            
        </form>
    </body>
</html>
