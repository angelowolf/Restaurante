(function ($) {
    $('body').on('click', '#guardar', function (e) {
        e.preventDefault();
        var data = $('#formulario').serialize();
        $.post('/usuario/recuperarClave', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/logout');
            } else {
                erroresM.mostrarErrores('#formulario', response);
            }
        });
    });
})(jQuery);