(function ($) {
    $('#alta-categoria-insumo-form').submit( function (e) {
        var $boton = $(this).find('.confirmar');
        var data = $(this).serialize();
        toggleBoton($boton);
        $.post('/insumo/categoria/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/categoria/listar');
            } else {
                erroresM.mostrarErrores('alta-categoria-insumo-form', response);
                toggleBoton($boton);
            }
        });
        return false;
    });
})(jQuery);