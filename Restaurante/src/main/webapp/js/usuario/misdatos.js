(function ($) {
    $('body').on('click', '#guardar', function (e) {
        e.preventDefault();
        var data = $('#formulario').serialize();
        $.post('/usuario/modificarmisdatos', data, function (response) {
            erroresM.limpiarErrores('#formulario');
            if (response.codigo === 200) {
                window.location.replace('/home');
            } else {
                erroresM.mostrarErrores('#formulario', response);
            }
        });
    });
    $('#preguntaSecreta').val($('#preguntaSecretaOriginal').val());
    $('#cancelar').click(function (e) {
        e.preventDefault();
        window.location.replace('/home');
    });
})(jQuery);