(function ($) {
   
    $('body').on('click', '#visto', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        $.post('/notificacion/visto', {id: id}, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/notificacion/listar');
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
            }
        });
    });

   
    $('body').on('click', '#modaleliminar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('.modal.eliminar[data-modelo=notificacion]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('notificacion');
        $modal.modal('show');
    });

    $('body').on('click', '#eliminar', function (e) {
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.eliminar');
        var id = $dialog.find('#id').val();
        $.post('/notificacion/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                window.location.replace('/notificacion/listar');
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
            }
        });
    });

})(jQuery);