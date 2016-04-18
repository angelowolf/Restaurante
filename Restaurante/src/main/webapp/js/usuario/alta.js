(function ($) {
    $('body').on('click', '#registrar', function (e) {
        e.preventDefault();
        var data = $('#formulario').serialize();
        $.ajax({
            url: '/usuario/registrar',
            type: 'POST',
            dataType: 'JSON',
            data: data,
            success: function (response) {
                if (response.codigo === 200) {
                    window.location.replace('/usuario/listar');
                } else {
                    erroresM.mostrarErrores('#formulario', response);
                }
            }
        });
    });
})(jQuery);