(function ($) {
    /*
    $('#rolesSeleccionados').multiselect({
        nonSelectedText: 'Seleccionar',
        nSelectedText: 'seleccionado',
        allSelectedText: 'Todos seleccionados',
        selectAllText: ' Elegir todo',
        buttonClass: 'btn btn-primary',
        includeSelectAllOption: true
    });
    */

    $('body').on('click', '#mostrar-modal-recuperar-usuario', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('.modal.recuperar[data-modelo=usuario]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('usuario');
        $modal.modal('show');
    });

    $('body').on('click', '#recuperar-usuario', function (e) {
        e.preventDefault();
        toggleButton(e.target);
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.recuperar');
        var id = $dialog.find('#id').val();
        $.post('/usuario/recuperar', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
                toggleButton(e.target);
            }
        });
    });

    $('body').on('click', '#mostrar-modal-reiniciar-contraseña', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('.modal.blanquear[data-modelo=usuario]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('usuario');
        $modal.modal('show');
    });

    $('body').on('click', '#reiniciar-contraseña', function (e) {
        e.preventDefault();
        toggleButton(e.target);
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.blanquear');
        var id = $dialog.find('#id').val();
        $.post('/usuario/blanquear', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger', true);
                toggleButton(e.target);
            }
        });
    });

    $('body').on('click', '#mostrar-modal-baja-usuario', function (e) {
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
        toggleButton(e.target);
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
                toggleButton(e.target);
            }
        });
    });

    $('body').on('click', '#mostrar-modal-ver-usuario', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-ver-usuario');
        $modal.find('#id').val(id);
        $.post('/usuario/editar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').html(response.model.id);
                $modal.find('#nombre').html(response.model.nombre);
                $modal.find('#apellido').html(response.model.apellido);
                $modal.find('#documento').html(response.model.documento);
                $modal.find('#telefono').html(response.model.telefono);
                $modal.find('#direccion').html(response.model.direccion);
                if (response.model.fNacimiento !== null) {
                    $modal.find('#fechaNacimiento').html(response.model.fNacimiento);
                }
                if (response.model.fAlta !== null) {
                    $modal.find('#fechaAlta').html(response.model.fAlta);
                }
                if (response.model.fBaja !== null) {
                    $modal.find('#fechaBaja').html(response.model.fBaja);
                }
                $modal.find('#nick').html(response.model.nick);
                $('#roles-ver ul').empty();
                for (var i = 0; i < response.model.roles.length; i++) {
                    $('#roles-ver ul').append('<li>' + response.model.roles[i] + '</li>');
                }
                $modal.find('#rol').html(response.model.rol);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger');
            }
        });
        $modal.modal('show');
    });

    $('body').on('click', '#mostrar-modal-modificar-usuario', function (e) {
        e.preventDefault();
        $('#modificar-usuario-form').trigger("reset");
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-modificar-usuario');
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
        erroresM.limpiarErrores('#modificar-usuario-form');
        $modal.modal('show');
    });
    $('#modal-modificar-usuario').on('click', '.guardar', function (e) {
        e.preventDefault();
        toggleButton(e.target);
        var data = $('#modificar-usuario-form').serialize();
        $.post('/usuario/modificar', data, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/usuario/listar?' + data);
            } else {
                erroresM.mostrarErrores('#modificar-usuario-form', response);
                toggleButton(e.target);
            }
        });
    });
})(jQuery);