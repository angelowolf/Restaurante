(function ($) {
    $('#rolesSeleccionados').multiselect({
        nonSelectedText: 'Seleccionar',
        nSelectedText: 'seleccionado',
        allSelectedText: 'Todos seleccionados',
        selectAllText: ' Elegir todo',
        buttonClass: 'btn btn-primary',
        includeSelectAllOption: true
    });

    $('body').on('click', '#recuperar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        $.post('/usuario/recuperar', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
            }
        });
    });

    $('body').on('click', '#blanquear', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        $.post('/usuario/blanquear', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
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

    $('body').on('click', '#eliminar', function (e) {
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.eliminar');
        var id = $dialog.find('#id').val();
        $.post('/usuario/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
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
        $.post('/usuario/editar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#apellido').val(response.model.apellido);
                $modal.find('#documento').val(response.model.documento);
                $modal.find('#telefono').val(response.model.telefono);
                $modal.find('#direccion').val(response.model.direccion);
                if (response.model.fechaNacimiento !== null) {
                    $modal.find('#fechaNacimiento').val(convertirFechaDeJODAAString(response.model.fechaNacimiento));
                }
                if (response.model.fechaAlta !== null) {
                    $modal.find('#fechaAlta').val(convertirFechaDeJODAAString(response.model.fechaAlta));
                }
                if (response.model.fechaBaja !== null) {
                    $modal.find('#fechaBaja').val(convertirFechaDeJODAAString(response.model.fechaBaja));
                }
                $modal.find('#nick').val(response.model.nick);
                $('#roles-ver ul').empty();
                for (var rol in response.model.roles) {
                    $('#roles-ver ul').append('<li>' + response.model.roles[rol] + '</li>');
                }
                $modal.find('#rol').val(response.model.rol);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger');
            }
        });
        erroresM.limpiarErrores('#form-ver');
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
                $modal.find('#documento').val(response.model.documento);
                $modal.find('#telefono').val(response.model.telefono);
                $modal.find('#direccion').val(response.model.direccion);
                if (response.model.fechaNacimiento != null) {
                    $modal.find('#fechaNacimiento').val(convertirFechaDeJODAAString(response.model.fechaNacimiento));
                }
                $modal.find('#fechaAlta').val(convertirFechaDeJODAAString(response.model.fechaAlta));
                $modal.find('#nick').val(response.model.nick);
                for (var rol in response.model.roles) {
                    $modal.find('#rol' + response.model.roles[rol]).prop('checked', true);
                }
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
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
            } else {
                erroresM.mostrarErrores('#form-editar', response);
            }
        })
    });
})(jQuery);