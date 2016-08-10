(function ($) {
    var ids = [];

    $('#listado-compra-form').submit(function () {
        /*
        var $form = $(this);
        var $boton = $form.find('.confirmar');
        var data = $form.serialize();
        toggleBoton($boton);
        */
        erroresM.mostrarAlert('Las Impresiones no se encuentran Implementadas aun...', 'warning');
        return false;
    });

    $('#insumos-brutos-faltantes tr').each(function() {
        var id = $(this).find('input[name="ids"]').val();
        if(id) {
            ids.push(id);
        }
    });

    $('.btn-quitar-insumo').on('click', btnQuitarInsumoListener);

    $('#busqueda-insumo').easyAutocomplete({
        url: function (phrase) {
            return '/insumobruto/postBuscarInsumoBruto';
        },
        preparePostData: function(data) {
            data = { nombreInsumo : $("#busqueda-insumo").val(), ids : ids };
            return data;
        },
        getValue: function (element) {
            return element.nombre;
        },
        list: {
            showAnimation: {
                type: "slide", //normal|slide|fade
                time: 200,
            },

            hideAnimation: {
                type: "slide", //normal|slide|fade
                time: 200,
            },
            onChooseEvent: function() {
                var id = $("#busqueda-insumo").getSelectedItemData().id;

                $.post("/insumobruto/getModificar", { id : id }, function (response) {
                    if (response.codigo === 200) {
                        $('#busqueda-insumo').val('');
                        crearFilaListadoCompras(response.model);
                    } else {
                        erroresM.mostrarAlertError(response.actionErrors);
                    }
                });
            }
        },
        ajaxSettings: {
            dataType: "json",
            method: "POST",
            traditional : true
        },
        theme: 'blue-light',
        adjustWidth : false,
        placeholder: "Buscar Insumo a añadir..."
    });

    function crearFilaListadoCompras(modelo) {
        console.log(modelo);
        var $tdno = $('<td>').addClass('text-center-vertical')
                            .html(modelo.nombre);
        var $tdcn = $('<td>').addClass('text-center-vertical')
                            .html(modelo.categoriaInsumo.nombre);
        var $tdca = $('<td>').addClass('text-center-all')
                            .html(modelo.stock.cantidadActual);
        var $tdcm = $('<td>').addClass('text-center-all')
                            .html(modelo.stock.cantidadMinima);
        var $tdum = $('<td>').addClass('text-center-all')
                            .html(modelo.unidadMedida);
        var $tdpu = $('<td>').addClass('text-center-all')
                            .html('$ ' + modelo.precioUnidad.toFixed(2));
        var $cant = $('<input>').prop('name', 'cantidad')
                                .prop('type', 'text')
                                .prop('maxlength', 5)
                                .addClass('form-control fw-4 cantidad')
                                .blur(function () {
                                    $(this).val($(this).val().replace(/[^\d\.,]/g, ''));
                                });
        var $tdcc = $('<td>').addClass('text-center-all').append($cant);

        var $icon = $('<i>').addClass('fa fa-minus fa-lg');
        var $botn = $('<button>').attr('id', modelo.id)
                                 .prop('type', 'button')
                                 .prop('tabindex', '-1')
                                 .addClass('btn btn-sm btn-fw btn-danger btn-quitar-insumo')
                                 .append($icon)
                                 .on('click', btnQuitarInsumoListener)
                                .tooltip({
                                    title : 'Quitar del Listado',
                                    placement : 'left',
                                    container : 'body'
                                 });
        var $hide = $('<input>').prop('name', 'ids')
                                .prop('type', 'hidden')
                                .val(modelo.id);
        var $tdbt = $('<td>').addClass('text-center-all')
                             .append($hide)
                             .append($botn);

        var $nrow = $('<tr>');
            $nrow.append($tdno)
                 .append($tdcn)
                 .append($tdca)
                 .append($tdcm)
                 .append($tdum)
                 .append($tdpu)
                 .append($tdcc)
                 .append($tdbt);

        $('#insumos-brutos-faltantes tbody').prepend($nrow);
    }

    function btnQuitarInsumoListener() {
        $(this).tooltip('destroy');
        var $arow = $(this).parents('tr');
        var id = $arow.find('input[name="ids"]').val();
        var idx = ids.indexOf(id);
        if(idx > -1) {
            ids.splice(idx, 1);
            $arow.remove();
        }
    }
})(jQuery);