function listarVendas() {
    var url = "Relatorio?chamada=listarVendas";
    $.get(url, function (data) {
        console.log(data);
        location.reload();
    });
}

function teste(nome) {
    console.log(nome);
}