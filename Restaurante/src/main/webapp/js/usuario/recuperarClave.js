(function ($) {
    $('body').on('click', '#guardar', function (e) {
        e.preventDefault();
        toggleButton(e.target);
        var data = $('#formulario').serialize();
        $.post('/recuperarClave', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/logout');
            } else {
                erroresM.mostrarErrores('#formulario', response);
                toggleButton(e.target);
            }
        });
    });
})(jQuery);