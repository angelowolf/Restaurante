(function ($) {
    $('body').on('click', '#registrar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var data = $('#formulario').serialize();
        $.post('/insumobruto/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/listar');
            } else {
                erroresM.mostrarErrores('#formulario', response);
                toggleBoton(e.target);
            }
        });
    });
    $('body').on('click', '#cancelar', function (e) {
        e.preventDefault();
        window.location.replace('/insumobruto/listar');
    });
})(jQuery);