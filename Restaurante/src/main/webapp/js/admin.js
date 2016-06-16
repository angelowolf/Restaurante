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

    $('[data-toggle="tooltip"]').tooltip();


    function escapeSelector(s) {
        return s.replace(/(:|\.|\[|\])/g, "\\$1");
    }

//    modulo.convertirFechaDeJODAAString = function (s) {
//        return s.dayOfMonth + '/' + s.monthOfYear + '/' + s.year;
//    };

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
                $(formId + ' [name=' + escapeSelector(input) + ']').after('<p class="error">' + error + '</p>').parents('.form-group').addClass('has-error');
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