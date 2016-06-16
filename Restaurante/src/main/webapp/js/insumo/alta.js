(function ($) {
    $('body').on('click', '#registrar', function (e) {
        e.preventDefault();
        var btn = $('#registrar').prop('disabled', true);
        var data = $('#formulario').serialize();
        $.post('/insumo/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/listar');
            } else {
                erroresM.mostrarErrores('#formulario', response);
                btn.prop('disabled', false);
            }
        });
    });
    $('body').on('click', '#cancelar', function (e) {
        e.preventDefault();
        window.location.replace('/insumo/listar');
    });
})(jQuery);