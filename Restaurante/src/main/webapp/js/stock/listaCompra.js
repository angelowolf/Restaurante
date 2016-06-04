(function ($) {

    $("#nombre").autocomplete({
        source: "/stock/postBuscarInsumoAutoComplete?" + $('#categoria').val(),
        minLength: 2,
        select: function (event, ui) {
            console.log(ui.item.value);
        }});


    $('#nombre').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/stock/postBuscarInsumoAutoComplete",
                type: "POST",
                data: {
                    term: request.term,
                    idCategoria: $('#categoria').val()
                },
                dataType: "json",
                success: function (data) {
                    response(data);
                }
            });
        },
        select: function (event, ui) {
            console.log(ui.item.value);
        }
    });

})(jQuery);