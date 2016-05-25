(function ($) {
    $('body').on('click', '#recuperar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        $.post('/insumo/recuperar', {id: id}, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/listar');
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
        var $modal = $('.modal.eliminar[data-modelo=insumo]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('insumo');
        $modal.modal('show');
    });

    $('body').on('click', '#eliminar', function (e) {
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.eliminar');
        var id = $dialog.find('#id').val();
        $.post('/insumo/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                window.location.replace('/insumo/listar');
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
        $.post('/insumo/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#precioUnidad').val(response.model.precioUnidad);
                $modal.find('#unidadMedida'+response.model.unidadMedida).prop('checked', true);
                $modal.find('#categoriaInsumo').val(response.model.categoriaInsumo.id).prop('selected', true);
                $modal.find('#cantidadMinima').val(response.model.stock.cantidadMinima);
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
        $.post('/insumo/postModificar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/insumo/listar');
            } else {
                erroresM.mostrarErrores('#form-editar', response);
            }
        })
    });
})(jQuery);