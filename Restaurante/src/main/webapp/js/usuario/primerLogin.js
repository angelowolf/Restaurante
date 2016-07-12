(function ($) {
    $('#primer-login-form').on('submit', function (e) {
        e.preventDefault();
        toggleButton("#primerLogin > .guardar");
        var data = $('#primer-login-form').serialize();
        $.post('/primerLogin', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/home');
            } else {
                erroresM.mostrarErrores('#primer-login-form', response);
                toggleButton("#primerLogin > .guardar");
            }
        });
    });
})(jQuery);