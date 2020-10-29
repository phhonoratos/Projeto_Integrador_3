
function calcularVendaProduto() {
    var preco = parseFloat($("#preco").val());
    var porcentagem = parseFloat($("#porcentagem").val());
    var total = (preco * porcentagem / 100) + preco;
    $("#valorTotal").val(total.toFixed(2));


}

