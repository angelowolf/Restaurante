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

    modulo.getConfig = defaultConfig;

    modulo.setConfig = function (config) {
        defaultConfig.ApplicationName = config.ApplicationName;
    };

    modulo.mostrarErrores = function (formId, data, nolimpiar) {
        if (!nolimpiar) {
            modulo.limpiarErrores(formId);
        }
        
        if (data.actionErrors) {
            modulo.mostrarAlertError(data.actionErrors, alert.DANGER);
        }
        if (data.fieldErrors) {
            var errores = data.fieldErrors;
            for (var input in errores) {
                var error = errores[input];
                $(formId + ' [name=' + input + ']').after('<p class="error">' + error + '</p>').parents('.form-group').addClass('has-error');
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

    modulo.limpiarErrores = function (formId) {
        $(formId + ' .error').remove();
        $(formId + ' .has-error').removeClass('has-error');
        $.notifyClose();
    };

    modulo.mostrarAlertError = function (mensaje, tipo) {
        for (var input in mensaje) {
            $.notify({
                message: mensaje[input]
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