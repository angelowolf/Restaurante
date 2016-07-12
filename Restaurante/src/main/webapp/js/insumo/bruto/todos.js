(function ($) {
   
    $('body').on('click', '#modalrecuperar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('.modal.recuperar[data-modelo=insumo]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('insumo');
        $modal.modal('show');
    });

    $('body').on('click', '#recuperar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.recuperar');
        var id = $dialog.find('#id').val();
        $.post('/insumobruto/recuperar', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumobruto/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
                toggleBoton(e.target);
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
        toggleBoton(e.target);
        $.post('/insumobruto/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumobruto/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
                toggleBoton(e.target);
            }
        });
    });

    $('body').on('click', '#modalver', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-ver');
        $modal.find('#id').val(id);
        $.post('/insumobruto/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#precioUnidad').val(response.model.precioUnidad);
                $modal.find('#cantidadMinima').val(response.model.stock.cantidadMinima);
                $modal.find('#cantidadActual').val(response.model.stock.cantidadActual);
                if (response.model.fAlta !== null) {
                    $modal.find('#fechaAlta').val(response.model.fAlta);
                }
                if (response.model.fBaja !== null) {
                    $modal.find('#fechaBaja').val(response.model.fBaja);
                }
                $modal.find('#unidadMedida').val(response.model.unidadMedida);
                $modal.find('#categoria').val(response.model.categoriaInsumo.nombre);
                $modal.find('#unidadMedida' + response.model.unidadMedida).prop('checked', true);
                $modal.find('#categoriaInsumo').val(response.model.categoriaInsumo.id).prop('selected', true);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger');
            }
        });
        erroresM.limpiarErrores('#form-editar');
        $modal.modal('show');
    });

    $('body').on('click', '#modaleditar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-editar');
        $modal.find('#id').val(id);
        $.post('/insumobruto/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#precioUnidad').val(response.model.precioUnidad);
                $modal.find('#unidadMedida' + response.model.unidadMedida).prop('checked', true);
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
        toggleBoton(e.target);
        var data = $('#form-editar').serialize();
        $.post('/insumobruto/postModificar', data, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumobruto/listar?' + data);
            } else {
                toggleBoton(e.target);
                erroresM.mostrarErrores('#form-editar', response);
            }
        })
    });
})(jQuery);