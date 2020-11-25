/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(".carrinho").on('click', function (e) {

    $.get({
        url: "/AlCappuccino/Carrinho",
        success: function () {
            console.log('oi');
            $('#modalCarrinho').show();
        },
        complete: function (xhr, textStatus) {
            console.log(xhr.status);
            xhr.status === 200 ? $('#modalCarrinho').show() : console.log('ops');
        }
    });
    e.preventDefault();
});