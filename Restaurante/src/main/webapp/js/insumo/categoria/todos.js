(function ($) {
    $('body').on('click', '#mostrar-modal-eliminar-categoria', function (e) {
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
        toggleButton(e.target);
        $.post('/insumo/categoria/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumo/categoria/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
                toggleButton(e.target);
            }
        });
    });

    $('body').on('click', '#mostrar-modal-ver-categoria', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-ver-categoria');
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
        erroresM.limpiarErrores('#modificar-categoria-form');
        $modal.modal('show');
    });
    $('body').on('click', '#mostrar-modal-modificar-categoria', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-modificar-categoria');
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
        erroresM.limpiarErrores('#modificar-categoria-form');
        $modal.modal('show');
    });

    $('body').on('click', '#editar', function (e) {
        e.preventDefault();
        var data = $('#modificar-categoria-form').serialize();
        toggleButton(e.target);
        $.post('/insumo/categoria/postModificar', data, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumo/categoria/listar?' + data);
            } else {
                erroresM.mostrarErrores('#modificar-categoria-form', response);
                toggleButton(e.target);
            }
        });
    });
})(jQuery);