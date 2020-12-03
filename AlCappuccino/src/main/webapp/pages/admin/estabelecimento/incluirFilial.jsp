<%-- 
    Document   : IncluirFiliais
    Author     : Paulo Costa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../../header/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/front.css">
        <title>Incluir Filial</title>
    </head>
    <body>
        <br/>
        <h1 style="text-align: center">Cadastro de filiais</h1>
        <br/>
        <br/>
        <form method="POST" action="IncluirFiliais">
            <div class="container">
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationDefault01">Razão Social</label>
                        <input name="nome" type="text" class="form-control" id="validationDefault01"  required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationDefault02">CNPJ</label>
                        <input name="cnpj" type="text" class="form-control" id="validationDefault02" required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationDefaultUsername">Inscrição Estadual</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend2"></span>
                            </div>
                            <input name="inscricaoEstadual"  class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" required>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationDefault03">E-mail</label>
                        <input name="email" type="text" class="form-control" id="validationDefault03" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationDefault04">Telefone</label>
                        <input name="telefone" type="text" class="form-control" id="validationDefault04" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationDefault04">Logradouro</label>
                        <input name="logradouro" type="text" class="form-control" id="validationDefault04" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label for="validationDefault04">Complemento</label>
                        <input name="complemento" type="text" class="form-control" id="validationDefault04" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationDefault04">Unidade Federativa</label>
                        <input name="unidadeFederativa" type="text" class="form-control" id="validationDefault04" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationDefault05">CEP</label>
                        <input name="cep" type="text" class="form-control" id="validationDefault05" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label for="validationDefault04">Número</label>
                        <input name="numeroEndereco" type="text" class="form-control" id="validationDefault04" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationDefault05">Bairro</label>
                        <input name="bairro" type="text" class="form-control" id="validationDefault05" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationDefault04">Cidade</label>
                        <input name="cidade" type="text" class="form-control" id="validationDefault04" required>
                    </div>
                </div>

                <button class="btn btn-primary" type="submit">Cadastrar</button>
                <button class="btn btn-primary">Consultar Filiais</button>
            </div>
        </form>
    </body>
</html>
