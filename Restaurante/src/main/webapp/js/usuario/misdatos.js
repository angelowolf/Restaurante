(function ($) {
    $('body').on('click', '#guardar', function (e) {
        e.preventDefault();
        var btn = $('#guardar').prop('disabled', true);
        var data = $('#formulario').serialize();
        $.post('/usuario/modificarmisdatos', data, function (response) {
            erroresM.limpiarErrores('#formulario');
            if (response.codigo === 200) {
                window.location.replace('/home');
            } else {
                erroresM.mostrarErrores('#formulario', response);
                btn.prop('disabled', false);
            }
        });
    });
    $('#preguntaSecreta').val($('#preguntaSecretaOriginal').val());
    $('#cancelar').click(function (e) {
        e.preventDefault();
        window.location.replace('/home');
    });
})(jQuery);