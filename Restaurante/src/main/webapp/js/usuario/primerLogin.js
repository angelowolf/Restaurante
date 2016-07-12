(function ($) {
    $('#primer-login-form').on('submit', function (e) {
        e.preventDefault();
        toggleBoton("#primerLogin > .guardar");
        var data = $('#primer-login-form').serialize();
        $.post('/primerLogin', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/home');
            } else {
                erroresM.mostrarErrores('#primer-login-form', response);
                toggleBoton("#primerLogin > .guardar");
            }
        });
    });
})(jQuery);