(function ($) {
    $('#rolesSeleccionados').multiselect({
        nonSelectedText: 'Seleccionar',
        nSelectedText: 'seleccionado',
        allSelectedText: 'Todos seleccionados',
        selectAllText: ' Elegir todo',
        buttonClass: 'btn btn-primary',
        includeSelectAllOption: true
    });

    $('body').on('click', '#modalrecuperar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('.modal.recuperar[data-modelo=usuario]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('usuario');
        $modal.modal('show');
    });

    $('body').on('click', '#recuperar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        $.post('/usuario/recuperar', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
                toggleBoton(e.target);
            }
        });
    });

    $('body').on('click', '#modalblanquear', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('.modal.blanquear[data-modelo=usuario]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('usuario');
        $modal.modal('show');
    });

    $('body').on('click', '#blanquear', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.blanquear');
        var id = $dialog.find('#id').val();
        $.post('/usuario/blanquear', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
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
        var $modal = $('.modal.eliminar[data-modelo=usuario]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('usuario');
        $modal.modal('show');
    });

    $('body').on('click', '#eliminar', function (e) {
        toggleBoton(e.target);
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
        $.post('/usuario/editar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#apellido').val(response.model.apellido);
                $modal.find('#documento').val(response.model.documento);
                $modal.find('#telefono').val(response.model.telefono);
                $modal.find('#direccion').val(response.model.direccion);
                if (response.model.fNacimiento !== null) {
                    $modal.find('#fechaNacimiento').val(response.model.fNacimiento);
                }
                if (response.model.fAlta !== null) {
                    $modal.find('#fechaAlta').val(response.model.fAlta);
                }
                if (response.model.fBaja !== null) {
                    $modal.find('#fechaBaja').val(response.model.fBaja);
                }
                $modal.find('#nick').val(response.model.nick);
                $('#roles-ver ul').empty();
                for (var i = 0; i < response.model.roles.length; i++) {
                    $('#roles-ver ul').append('<li>' + response.model.roles[i] + '</li>');
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
        $('#form-editar').trigger("reset");
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
                if (response.model.fNacimiento !== null) {
                    $modal.find('#fechaNacimiento').val(response.model.fNacimiento);
                }
                $modal.find('#fechaAlta').val(response.model.fAlta);
                $modal.find('#nick').val(response.model.nick);
                for (var i = 0; i < response.model.roles.length; i++) {
                    $modal.find('#rol' + response.model.roles[i]).prop('checked', true);
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
        toggleBoton(e.target);
        var data = $('#form-editar').serialize();
        $.post('/usuario/modificar', data, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
            } else {
                erroresM.mostrarErrores('#form-editar', response);
                toggleBoton(e.target);
            }
        })
    });
})(jQuery);