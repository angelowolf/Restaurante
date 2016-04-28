(function ($) {
    $('body').on('click', '#registrar', function (e) {
        e.preventDefault();
        var data = $('#formulario').serialize();
        $.post('/insumo/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/listar');
            } else {
                erroresM.mostrarErrores('#formulario', response);
            }
        });
    });
})(jQuery);