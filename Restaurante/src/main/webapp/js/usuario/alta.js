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
    $('#nombre').blur(function () {
        $('#nick').val($('#nombre').val() + $('#apellido').val());
    });
    $('#apellido').blur(function () {
        $('#nick').val($('#nombre').val() + $('#apellido').val());
    });
    $('body').on('click', '#cancelar', function (e) {
        e.preventDefault();
        window.location.replace('/usuario/listar');
    });
})(jQuery);