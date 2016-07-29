(function ($) {
    $('#alta-categoria-receta-form').submit( function (e) {
        var $boton = $(this).find('.confirmar');
        var data = $(this).serialize();
        toggleBoton($boton);
        $.post('/receta/categoria/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/receta/categoria/listar');
            } else {
                erroresM.mostrarErrores('alta-categoria-receta-form', response);
                toggleBoton($boton);
            }
        });
        return false;
    });

    $('#alta-categoria-receta-form .cancelar').on('click', function (e) {
        window.location.replace('/receta/categoria/listar');
    });
})(jQuery);