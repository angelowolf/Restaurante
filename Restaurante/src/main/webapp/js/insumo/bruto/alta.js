(function ($) {
    $('body').on('click', '#registrar', function (e) {
        e.preventDefault();
        toggleButton(e.target);
        var data = $('#formulario').serialize();
        $.post('/insumobruto/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumobruto/listar');
            } else {
                erroresM.mostrarErrores('#formulario', response);
                toggleButton(e.target);
            }
        });
    });
    $('body').on('click', '#cancelar', function (e) {
        e.preventDefault();
        window.location.replace('/insumobruto/listar');
    });
})(jQuery);