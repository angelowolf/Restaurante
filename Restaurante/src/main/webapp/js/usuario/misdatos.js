(function ($) {
    $('body').on('click', '#guardar', function (e) {
        e.preventDefault();
        var data = $('#formulario').serialize();
        $.post('/usuario/modificarmisdatos', data, function (response) {
            erroresM.limpiarErrores('#formulario');
            if (response.codigo === 200) {
                window.location.replace('/usuario/misdatos');
            } else {
                erroresM.mostrarErrores('#formulario', response);
            }
        });
    });
    $('#preguntaSecreta').val($('#preguntaSecretaOriginal').val());
})(jQuery);