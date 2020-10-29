function enviarExclusao(id) {
    var urlExclusao = `${excluirFilialURL()}?id=${id}`;

    $.ajax({
        url: urlExclusao, // TODO: TOKEN de Login / ADMIN
        type: "POST",
        success: function () {
            $('.info-success').show();
        },
        complete: function (xhr, textStatus) {
            console.log(xhr.status);

            xhr.status == '200' ? modalSuccess() : modalFailed();
        }
    });
}

$("#btn-confirm-update-ajax-form").on('click', function (e) {

    var formData = {
        'nome': $('input[name=nome]').val(),
        'email': $('input[name=email]').val(),
        'unidadeFederativa': $('input[name=unidadeFederativa]').val(),
        'telefone': $('input[name=telefone]').val(),
        'cep': $('input[name=cep]').val(),
        'cidade': $('input[name=cidade]').val(),
        'complemento': $('input[name=complemento]').val(),
        'bairro': $('input[name=bairro]').val(),
        'numeroEndereco': $('input[name=numeroEndereco]').val(),
        'logradouro': $('input[name=logradouro]').val(),
        'inscricaoEstadual': $('input[name=inscricaoEstadual]').val(),
        'cnpj': $('input[name=cnpj]').val(),
        'id': $('input[name=id]').val()
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
            xhr.status === '200' ? modalSuccess() : modalFailed();
        }
    });
    e.preventDefault();
});

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





