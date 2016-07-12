(function ($) {
    $('body').on('click', '#guardar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var data = $('#formulario').serialize();
        $.post('/recuperarClave', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/logout');
            } else {
                erroresM.mostrarErrores('#formulario', response);
                toggleBoton(e.target);
            }
        });
    });
})(jQuery);