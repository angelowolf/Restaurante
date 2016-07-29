(function ($) {

    $('.mostrar-modal-eliminar-categoria-insumo').on('click', function (e) {
        var id = $(this).parents('.acciones').children('.model-id').val();
        var $modal = $('#modal-eliminar-categoria-insumo');
            $modal.find('#model-id').val(id);
            $modal.modal('show');
    });

    $('#modal-eliminar-categoria-insumo .confirmar').on('click', function (e) {
        toggleBoton(e.target);
        var $dialog = $('#modal-eliminar-categoria-insumo');
        var id =  $dialog.find('#model-id').val();
        $.post('/insumo/categoria/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumo/categoria/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors);
                toggleBoton(e.target);
            }
        });
    });

    $('.mostrar-modal-ver-categoria-insumo').on('click', function (e) {
        var id = $(this).parents('.acciones').children('.model-id').val();
        var $modal = $('#modal-ver-categoria-insumo');
            $modal.find('#id').val(id);
        $.post('/insumo/categoria/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').html(response.model.nombre);
                $modal.find('#descripcion').html(response.model.descripcion);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger');
            }
        });
        erroresM.limpiarErrores('modificar-categoria-insumo-form');
        $modal.modal('show');
    });

    $('.mostrar-modal-modificar-categoria-insumo').on('click', function (e) {
        var id = $(this).parents('.acciones').children('.model-id').val();
        var $modal = $('#modal-modificar-categoria-insumo');
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
        erroresM.limpiarErrores('modificar-categoria-insumo-form');
        setTimeout(function (modal) { modal.find('[autofocus]').focus() }, 500, $modal);
        $modal.modal('show');
    });

    $('#modal-modificar-categoria-insumo #modificar-categoria-insumo-form').submit(function (e) {
        var $form = $(this);
        var $boton = $form.find('.confirmar');
        var data = $form.serialize();
        toggleBoton($boton);
        $.post('/insumo/categoria/postModificar', data, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumo/categoria/listar?' + data);
            } else {
                erroresM.mostrarErrores($form.attr('id'), response);
                toggleBoton($boton);
            }
        });
        return false;
    });
})(jQuery);