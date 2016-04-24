(function ($) {
    $('body').on('click', '#registrar', function (e) {
        e.preventDefault();
        var data = $('#formulario').serialize();
        $.post('/usuario/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/usuario/listar');
            } else {
                erroresM.mostrarErrores('#formulario', response);
            }
        });
    });
})(jQuery);