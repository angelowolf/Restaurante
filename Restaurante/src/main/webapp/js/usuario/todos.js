(function ($) {
    $('[data-toggle="tooltip"]').tooltip();

    $('body').on('click', '#eliminar', function (e) {
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.eliminar');
        var id = $dialog.find('#id').val();
        $.post('/usuario/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                window.location.replace('/usuario/listar');
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
        var $modal = $('.modal.eliminar[data-modelo=usuario]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('usuario');
        $modal.modal('show');
    });

    $('body').on('click', '#modaleditar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-editar');
        $modal.find('#id').val(id);
        $.post('/usuario/editar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#apellido').val(response.model.apellido);
                $modal.find('#nick').val(response.model.nick);
                $modal.find('#rol').val(response.model.rol);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger');
            }
        });
        erroresM.limpiarErrores('#form-editar');
        $modal.modal('show');
    });
    $('body').on('click', '#editar', function (e) {
        e.preventDefault();
        var data = $('#form-editar').serialize();
        $.post('/usuario/modificar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/usuario/listar');
            } else {
                erroresM.mostrarErrores('#form-editar', response);
            }
        })
    });
})(jQuery);