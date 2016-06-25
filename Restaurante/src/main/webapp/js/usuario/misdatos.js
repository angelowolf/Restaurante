(function ($) {
    $('body').on('click', '#guardar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var data = $('#formulario').serialize();
        $.post('/usuario/modificarmisdatos', data, function (response) {
            erroresM.limpiarErrores('#formulario');
            if (response.codigo === 200) {
                window.location.replace('/home');
            } else {
                erroresM.mostrarErrores('#formulario', response);
                toggleBoton(e.target);
            }
        });
    });
    $('#preguntaSecreta').val($('#preguntaSecretaOriginal').val());
    $('#cancelar').click(function (e) {
        e.preventDefault();
        window.location.replace('/home');
    });
})(jQuery);