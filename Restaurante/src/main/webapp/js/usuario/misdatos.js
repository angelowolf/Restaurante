(function ($) {
    $('body').on('click', '#guardar', function (e) {
        e.preventDefault();
        var data = $('#formulario').serialize();
        $.ajax({
            url: '/usuario/modificarmisdatos',
            type: 'POST',
            dataType: 'JSON',
            data: data,
            success: function (response) {
                erroresM.limpiarErrores('#formulario');
                if (response.codigo === 200) {
                    erroresM.mostrarAlertError(response.actionMessages, 'success');
                } else {
                    erroresM.mostrarErrores('#formulario', response);
                }
            }
        });
    });
})(jQuery);