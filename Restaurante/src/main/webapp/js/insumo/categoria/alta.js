(function ($) {
    $('body').on('click', '#registrar', function (e) {
        e.preventDefault();
        var data = $('#formulario').serialize();
        $.post('/insumo/categoria/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/categoria/listar');
            } else {
                erroresM.mostrarErrores('#formulario', response);
            }
        });
    });
    $('body').on('click', '#cancelar', function (e) {
        e.preventDefault();
        window.location.replace('/insumo/categoria/listar');
    });
})(jQuery);