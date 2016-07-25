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
                $modal.find('#telefono').val(response.model.telefono);
                $modal.find('#direccion').val(response.model.direccion);
                $modal.find('#nick').val(response.model.nick);
                $modal.find('#preguntaSecreta').selectpicker('val', response.model.preguntaSecreta);
                $modal.find('#respuestaSecreta').val(response.model.respuestaSecreta);
                $modal.find('#fechaNacimiento').val(response.model.fNacimiento ? response.model.fNacimiento : '');
                var $roles = $modal.find('#roles');
                $roles.empty();
                $.each(response.model.roles, function (k, rol) {
                    var $label = $('<span>').addClass('label label-default').html(rol);
                    $roles.append($label).append('&nbsp;&nbsp;');
                });
                $('#datos-perfil').show();
                $('#contraseña-actual').hide();
                $('#datos-ingreso').hide();
                $('#ver-datos-ingreso').html('Mostrar Datos de Ingreso');
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger');
            }
        });
        erroresM.limpiarErrores('#modificar-perfil-usuario-form');
        setTimeout(function (modal) { modal.find('[autofocus]').focus() }, 500, $modal);
        $modal.modal('show');
    });

    $('#modal-modificar-perfil #ver-datos-ingreso').on('click', function(evt) {
        if($('#datos-ingreso').is(':hidden')) {
            $('#ver-datos-ingreso').html('Ocultar Datos de Ingreso');
            $('#datos-ingreso').slideDown('fast');
        }
        else {
            $('#ver-datos-ingreso').html('Mostrar Datos de Ingreso');
            $('#datos-ingreso').slideUp('fast');
        }
    });

    $('#modificar-perfil-usuario-form').submit(function (e) {
        if(!$('#claveOriginal').val().trim()) {
            $('#contraseña-actual').slideDown('fast');
            $('#datos-perfil, #datos-ingreso').slideUp('fast');
        }
        else {
            var $form = $(this);
            var $boton = $form.find('.confirmar');
            var data = $form.serialize();
            toggleBoton($boton);
            $.post('/usuario/modificar-perfil', data, function (response) {
                erroresM.limpiarErrores('#modificar-perfil-usuario-form');
                if (response.codigo !== 200) {
                    erroresM.mostrarErrores('#modificar-perfil-usuario-form', response);
                    var firstKey = '';
                    $.each(response.fieldErrors, function(k, v) {
                        firstKey = k;
                        return false;
                    })
                    if(firstKey != 'claveOriginal') {
                        $('#contraseña-actual').slideUp('fast');
                        $('#datos-perfil, #datos-ingreso').slideDown('fast');
                        $('#ver-datos-ingreso').html('Ocultar Datos de Ingreso');
                    }
                    $('#claveOriginal').val('');
                    toggleBoton($boton);
                }
            });
        }
        return false;
    });
});