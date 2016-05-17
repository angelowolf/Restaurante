(function ($) {
    $('body').on('click', '#modaleliminar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('.modal.eliminar[data-modelo=categoria');
        $modal.find('#id').val(id);
        $modal.find('#model').val('categoria');
        $modal.modal('show');
    });

    $('body').on('click', '#eliminar', function (e) {
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.eliminar');
        var id = $dialog.find('#id').val();
        $.post('/insumo/categoria/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                window.location.replace('/insumo/categoria/listar');
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
            }
        });
    });

    $('body').on('click', '#modaleditar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-editar');
        $modal.find('#id').val(id);
        $.post('/insumo/categoria/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#descripcion').val(response.model.descripcion);
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
        $.post('/insumo/categoria/postModificar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/categoria/listar');
            } else {
                erroresM.mostrarErrores('#form-editar', response);
            }
        });
    });
})(jQuery);