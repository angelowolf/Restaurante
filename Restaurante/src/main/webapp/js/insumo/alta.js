(function ($) {
    $('body').on('click', '#registrar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var data = $('#formulario').serialize();
        $.post('/insumo/registrar', data, function (response) {
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
        window.location.replace('/insumo/listar');
    });
})(jQuery);