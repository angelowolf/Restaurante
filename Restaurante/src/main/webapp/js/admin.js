var erroresM = (function () {
    var modulo = this;

    var defaultConfig = {
        ApplicationName: 'Restaurante'
    };

    var alert = {
        SUCCESS: 'success',
        DANGER: 'danger',
        WARNING: 'warning',
        INFO: 'info'
    };

    function escapeSelector(s) {
        return s.replace(/(:|\.|\[|\])/g, "\\$1");
    }

    modulo.getConfig = defaultConfig;

    modulo.setConfig = function (config) {
        defaultConfig.ApplicationName = config.ApplicationName;
    };

    modulo.limpiarErrores = function (formId) {
        $(formId + ' .help-block').html('');
        $(formId + ' .has-error').removeClass('has-error');
    };

    modulo.mostrarErrores = function (formId, data, noLimpiar) {
        if (!noLimpiar) {
            modulo.limpiarErrores(formId);
        }

        if (data.actionErrors) {
            modulo.mostrarAlertError(data.actionErrors, alert.DANGER);
        }
        if (data.fieldErrors) {
            $.each(data.fieldErrors, function (input, errors) {
                var $frmgrp = $(formId + ' [name="' + input + '"]').parents('.form-group');
                var strerror= '';
                $.each(errors, function (idx, error) {
                    strerror += error + '<br />';
                });
                $frmgrp.addClass('has-error');
                $frmgrp.children('.help-block').html(strerror);
            });
        }
        if (data.actionMessages) {
            var mensajes = data.actionMessages;
            for (var dato in mensajes) {
                var mensaje = mensajes[dato];
                $(formId).append('<p class="info">' + mensaje + '</p>');
            }
        }
    };

    modulo.mostrarAlertError = function (mensaje, tipo) {
        for (var i = 0; i < mensaje.length; i++) {
            $.notify({
                message: mensaje[i]
            }, {
                animate: {
                    enter: 'animated fadeInDown',
                    exit: 'animated fadeOutLeft'
                },
                delay: 10000,
                offset: {
                    y: 0
                },
                placement: {
                    align: "center",
                    from: "bottom"
                },
                type: tipo
            });
        }
    };

    modulo.mostrarAlert = function (mensaje, tipo) {
        $.notify({
            message: mensaje
        }, {
            animate: {
                enter: 'animated fadeInDown',
                exit: 'animated fadeOutLeft'
            },
            delay: 10000,
            offset: {
                y: 0
            },
            placement: {
                align: "center",
                from: "bottom"
            },
            type: tipo
        });
    };

    return modulo;
})();


function getIdsFormatoPOST() {
    var allVals = '';
    $.each(ids, function (index, id) {
        allVals += "ids=" + id + "&";  //prepare the string
    });
    if (allVals.length > 0) {
        allVals = allVals.substring(0, allVals.length - 1); //remove last '&'
    }
    return allVals; //submit this string as parameter
}

Array.prototype.remove = function () {
    var what, a = arguments, L = a.length, ax;
    while (L && this.length) {
        what = a[--L];
        while ((ax = this.indexOf(what)) !== -1) {
            this.splice(ax, 1);
        }
    }
    return this;
};

function toggleBoton(button) {
    var btn = $(button);
    if (btn.is(':disabled')) {
        btn.prop('disabled', false);
        btn.removeClass('btn-loading');
    } 
    else {
        btn.prop('disabled', true);
        btn.addClass('btn-loading');
    }
}

$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip({
        container : 'body'
    });

    $('.input-group.date').datepicker({
        format: 'dd/mm/yyyy',
        language: 'es',
        autoclose: true,
        todayHighlight: true,
        orientation: 'bottom auto',
        container: 'body'
    });

    $('.selectpicker').selectpicker({
        countSelectedText : '{0} Roles Seleccionados...',
        selectAllText: 'Todos',
        deselectAllText: 'Ninguno',
        container : 'body'
    });

    $('input.numeric-nodot[type=text]').blur(function (evt) {
        var $input = $(this);
        var patrn  = /[^\d]/g;
        if($input.val().trim() && patrn.test($input.val())) {
            var hlbl = $input.parents('.form-group').children('.help-block');
            $input.val($input.val().replace(patrn, ''));
            hlbl.html('Este campo solo acepta numeros sin puntos y/o comas');
        }
    });

    $('input.numeric[type=text]').blur(function (evt) {
        var $input = $(this);
        var patrn  = /[^\d\.,]/g;
        if($input.val().trim() && patrn.test($input.val())) {
            var hlbl = $input.parents('.form-group').children('.help-block');
            $input.val($input.val().replace(patrn, ''));
            hlbl.html('Este campo solo acepta numeros');
        }
    });

    $('input.numeric-signed[type=text]').blur(function (evt) {
        var $input = $(this);
        var patrn  = /[^\d\.,\+\-]/g;
        if($input.val().trim() && patrn.test($input.val())) {
            var hlbl = $input.parents('.form-group').children('.help-block');
            $input.val($input.val().replace(patrn, ''));
            hlbl.html('Este campo solo acepta numeros');
        }
    });





    $('#mostrar-modal-modificar-perfil').on('click', function (evt) {
        var $modal = $('#modal-modificar-perfil');
        $.get('/usuario/ver-perfil', function (response) {
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

    $('#modal-modificar-perfil').on('click', '#ver-datos-ingreso', function(evt) {
        if($('#datos-ingreso').is(':hidden')) {
            $('#ver-datos-ingreso').html('Ocultar Datos de Ingreso');
            $('#datos-ingreso').slideDown('fast');
        }
        else {
            $('#ver-datos-ingreso').html('Mostrar Datos de Ingreso');
            $('#datos-ingreso').slideUp('fast');
        }
    });

    $()

    $('#modal-modificar-perfil').on('click', '.guardar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var data = $('#modificar-perfil-usuario-form').serialize();
        $.post('/usuario/modificar-perfil', data, function (response) {
            erroresM.limpiarErrores('#modificar-perfil-usuario-form');
            if (response.codigo !== 200) {
                erroresM.mostrarErrores('#modificar-perfil-usuario-form', response);
                toggleBoton(e.target);
            }
        });
    });
});