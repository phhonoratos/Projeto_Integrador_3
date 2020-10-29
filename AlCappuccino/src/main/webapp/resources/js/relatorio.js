function listarVendas() {
    var url = "Relatorio?chamada=listarVendas";
    $.get(url, function (data) {
        console.log(data);
    });;
}