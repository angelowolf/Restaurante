(function ($) {
    $('#alta-categoria-form').submit( function (e) {
        e.preventDefault();
        toggleButton("#alta-categoria-form > .registrar");
        var data = $('#alta-categoria-form').serialize();
        $.post('/insumo/categoria/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/categoria/listar');
            } else {
                erroresM.mostrarErrores('#alta-categoria-form', response);
                toggleButton("#alta-categoria-form > .registrar");
            }
        });
    });
    $('#alta-categoria-form').on('click', '.cancelar', function (e) {
        e.preventDefault();
        window.location.replace('/insumo/categoria/listar');
    });
})(jQuery);