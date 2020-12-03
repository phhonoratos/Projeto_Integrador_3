function enviarExclusao(id) {
    var urlExclusao = `${excluirFilialURL()}?id=${id}`;

    $.ajax({
        url: urlExclusao,
        type: "POST",
        success: function () {
            $('.info-success').show();
        },
        complete: function (xhr, textStatus) {
            console.log(xhr.status);

            xhr.status === 200 ? modalSuccess() : modalFailed();
        }
    });
}

function enviarAlteracaoFilial(id) {
    var modalDiv = document.getElementById(id);

    var formData = {
        'nome': modalDiv.querySelector('input[name=nome]').value,
        'email': modalDiv.querySelector('input[name=email]').value,
        'unidadeFederativa': modalDiv.querySelector('input[name=unidadeFederativa]').value,
        'telefone': modalDiv.querySelector('input[name=telefone]').value,
        'cep': modalDiv.querySelector('input[name=cep]').value,
        'cidade': modalDiv.querySelector('input[name=cidade]').value,
        'complemento': modalDiv.querySelector('input[name=complemento]').value,
        'bairro': modalDiv.querySelector('input[name=bairro]').value,
        'numeroEndereco': modalDiv.querySelector('input[name=numeroEndereco]').value,
        'logradouro': modalDiv.querySelector('input[name=logradouro]').value,
        'inscricaoEstadual': modalDiv.querySelector('input[name=inscricaoEstadual]').value,
        'cnpj': modalDiv.querySelector('input[name=cnpj]').value,
        'id': modalDiv.querySelector('input[name=id]').value
    };

    $.ajax({
        type: "POST",
        url: alterarFilialURL(),
        data: formData,
        success: function (data) {
            $('.info-success').show();
        },
        complete: function (xhr, textStatus) {
            console.log(xhr.status);
            xhr.status === 200 ? modalSuccess() : modalFailed();
        }
    });
}

const listarFiliaisURL = () => {
    return "/AlCappuccino/ListarFiliais";
}

const incluirFiliaisURL = () => {
    return "/AlCappuccino/IncluirFiliais";
}

const excluirFilialURL = () => {
    return "/AlCappuccino/ExcluirFilial";
}

const alterarFilialURL = () => {
    return "/AlCappuccino/AlterarFiliais";
}





