(function ($) {
    $('#nombre, #apellido').blur(function () {
        $('#nick').val($('#nombre').val().split(" ").join("") + $('#apellido').val().split(" ").join(""));
    });

    $('#alta-usuario-form').on('click', '.cancelar', function (e) {
        e.preventDefault();
        window.location.replace('/usuario/listar');
    });

    $('#alta-usuario-form').on('click', '.registrar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var data = $('#alta-usuario-form').serialize();
        $.post('/usuario/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/usuario/listar');
            } else {
                erroresM.mostrarErrores('#alta-usuario-form', response);
                toggleBoton(e.target);
            }
        });
    });
})(jQuery);