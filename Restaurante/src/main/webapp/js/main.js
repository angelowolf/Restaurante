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
        $(formId + ' .error').remove();
        $(formId + ' .has-error').removeClass('has-error');
         //$.notifyClose();
    };

    modulo.mostrarErrores = function (formId, data, noLimpiar) {
        if (!noLimpiar) {
            modulo.limpiarErrores(formId);
        }

        if (data.actionErrors) {
            modulo.mostrarAlertError(data.actionErrors, alert.DANGER);
        }
        if (data.fieldErrors) {
            var errores = data.fieldErrors;
            for (var input in errores) {
                var error = errores[input];
                $(formId + ' [name=' + escapeSelector(input) + ']').parents('.form-group').append('<span class="error help-block">' + error + '</span>').addClass('has-error');
            }
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
            console.log(mensaje[i]);
            //console.log('input ' + index);
            //console.log('mensaje '+mensaje);
            //console.log('mensaje2 '+ mensaje[index]);
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

function toggleButton(button) {
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
    $('[data-toggle="tooltip"]').tooltip();

    $('.selectpicker').selectpicker({
        countSelectedText : '{0} Roles Seleccionados...',
        selectAllText: 'Todos',
        deselectAllText: 'Ninguno',
        container : 'body'
    });

    $("#navbar-toggle-menu").on('click', function (evt) {
        if($("#page-wrapper").hasClass('closed')) {
            $(".sidebar").removeClass('closed');
            $("#navbar-toggle-menu").removeClass('closed');
            $("#page-wrapper").removeClass('closed');
        }
        else {
            $(".sidebar").addClass('closed');
            $("#navbar-toggle-menu").addClass('closed');
            $("#page-wrapper").addClass('closed');
        }
    });

    $('#mostrar-modal-modificar-perfil').on('click', function (evt) {
        var $modal = $('#modal-modificar-perfil');
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
        toggleButton(e.target);
        var data = $('#modificar-perfil-usuario-form').serialize();
        $.post('/usuario/modificarmisdatos', data, function (response) {
            erroresM.limpiarErrores('#modificar-perfil-usuario-form');
            if (response.codigo !== 200) {
                erroresM.mostrarErrores('#modificar-perfil-usuario-form', response);
                toggleButton(e.target);
            }
        });
    });
});