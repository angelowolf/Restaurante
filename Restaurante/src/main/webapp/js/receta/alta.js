(function ($) {
    var cdetallesingredientes = 0;
    var cdetallesrecetas = 0;

    $('#fechaAlta').val(erroresM.fechaActual());

    $('#alta-receta-form').submit(function (e) {
        var $boton = $(this).find('.confirmar');
        var data = $(this).serialize();
        toggleBoton($boton);
        $.post('/receta/registrar', data, function (response) {
            if (response.codigo === 200) {
                window.location.replace('/receta/listar');
            } else {
                erroresM.mostrarErrores('alta-receta-form', response);
                toggleBoton($boton);
            }
        });
        return false;
    });

    $('#busqueda-ingrediente').easyAutocomplete({
        url: function (phrase) {
            return '/insumo/postBuscarInsumoAutoComplete';
        },
        preparePostData: function(data) {
            data = { term : $("#busqueda-ingrediente").val() };
            return data;
        },
        getValue: 'value',
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
                var id = $("#busqueda-ingrediente").getSelectedItemData().id;

                $.post("/insumo/getModificar", { id : id }, function (response) {
                    if (response.codigo === 200) {
                        $('#busqueda-ingrediente').val('');
                        crearFilaDetalleIngrediente(response.model);
                    } else {
                        erroresM.mostrarAlertError(response.actionErrors);
                    }
                });
            }
        },
        ajaxSettings: {
            dataType: "json",
            method: "POST",
            data: {
                dataType: "json"
            }
        },
        theme: 'blue-light',
        adjustWidth : false,
        placeholder: "Buscar Insumo a añadir..."
    });

    $('#busqueda-receta').easyAutocomplete({
        url: function (phrase) {
            return '/receta/postBuscarRecetaAutoComplete';
        },
        preparePostData: function(data) {
            data = { term : $("#busqueda-receta").val() };
            return data;
        },
        getValue: 'value',
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
                var id = $("#busqueda-receta").getSelectedItemData().id;

                $.post("/receta/getModificar", { id : id }, function (response) {
                    if (response.codigo === 200) {
                        $('#busqueda-receta').val('');
                        crearFilaDetalleReceta(response.model);
                    } else {
                        erroresM.mostrarAlertError(response.actionErrors);
                    }
                });
            }
        },
        ajaxSettings: {
            dataType: "json",
            method: "POST",
            data: {
                dataType: "json"
            }
        },
        theme: 'blue-light',
        adjustWidth : false,
        placeholder: "Buscar Receta a incluir..."
    });

    function crearFilaDetalleReceta(model) {
        if (model.id) {
            var    $hidden = $('<input>').attr('id', 'idRecetasUtilizar')
                                        .prop('name', 'idsRecetas')
                                        .prop('type', 'hidden')
                                        .val(model.id);


            var $tdNombre = $('<td>').addClass('text-center-all')
                                     .html(model.nombre)
                                     .append($hidden);

            var $checkbox = $('<input>').attr('id', 'recetaOpcional')
                                        .prop('name', 'opcionalRecetasID')
                                        .prop('type', 'checkbox')
                                        .addClass('form-control')
                                        .val(model.id);

            var $tdOpcion = $('<td>').addClass('text-center-all')
                                     .append($checkbox);

            var     $icon = $('<i>').addClass('fa fa-minus')

            var   $button = $('<button>').attr('tabindex', '-1')
                                         .addClass('btn btn-xs btn-danger')
                                         .append($icon)
                                         .on('click', function () {
                                            $(this).tooltip('destroy');
                                            $(this).parents('tr').remove();
                                            cdetallesrecetas--;
                                            if(cdetallesrecetas < 1) {
                                                $('#detalle-recetas .empty').show();
                                            }
                                          })
                                         .tooltip({
                                            title : 'Quitar Receta',
                                            placement : 'right',
                                            container : 'body'
                                          });

            var $tdAccion = $('<td>').addClass('text-center-all')
                                     .append($button);

            var       $tr = $('<tr>').prop('id', model.id)
                                     .append($tdNombre)
                                     .append($tdOpcion)
                                     .append($tdAccion);

            cdetallesrecetas++;
            if(cdetallesrecetas > 0 ) {
                $('#detalle-recetas .empty').hide();
            }
            $('#detalle-recetas').append($tr);
        }
    }

    function crearFilaDetalleIngrediente(model) {
        if (model.id) {
            var    $hidden = $('<input>').attr('id', 'idIngredienteUtilizar')
                                        .prop('name', 'idsIngredientes')
                                        .prop('type', 'hidden')
                                        .val(model.id);


            var $tdNombre = $('<td>').addClass('text-center-all')
                                     .html(model.nombre)
                                     .append($hidden);

            var $tdUniMed = $('<td>').addClass('text-center-all')
                                     .html(model.unidadMedida);

            var    $input = $('<input>').attr('id', 'cantidadIngredienteUtilizar')
                                        .prop('name', 'cantidadesIngredientes')
                                        .prop('type', 'text')
                                        .prop('maxlength', '4')
                                        .prop('placeholder', 'Cantidad')
                                        .addClass('form-control fw-4')
                                        .val('1')
                                        .blur(function () {
                                            $(this).val($(this).val().replace(/[^\d\.,]/g, ''));
                                        });

            var $tdCanUsa = $('<td>').addClass('text-center-all')
                                     .append($input);

            var $checkbox = $('<input>').attr('id', 'ingredienteOpcional')
                                        .prop('name', 'opcionalIngredientesID')
                                        .prop('type', 'checkbox')
                                        .addClass('form-control')
                                        .val(model.id);

            var $tdOpcion = $('<td>').addClass('text-center-all')
                                     .append($checkbox);

            var     $icon = $('<i>').addClass('fa fa-minus')

            var   $button = $('<button>').attr('tabindex', '-1')
                                         .addClass('btn btn-xs btn-danger')
                                         .append($icon)
                                         .on('click', function () {
                                            $(this).tooltip('destroy');
                                            $(this).parents('tr').remove();
                                            cdetallesingredientes--;
                                            if(cdetallesingredientes < 1) {
                                                $('#detalle-ingredientes .empty').show();
                                            }
                                          })
                                         .tooltip({
                                            title : 'Quitar Insumo',
                                            placement : 'right',
                                            container : 'body'
                                          });

            var $tdAccion = $('<td>').addClass('text-center-all')
                                     .append($button);

            var       $tr = $('<tr>').prop('id', model.id)
                                     .append($tdNombre)
                                     .append($tdCanUsa)
                                     .append($tdUniMed)
                                     .append($tdOpcion)
                                     .append($tdAccion);

            cdetallesingredientes++;
            if(cdetallesingredientes > 0) {
                $('#detalle-ingredientes .empty').hide();
            }
            $('#detalle-ingredientes').append($tr);
        }
    }
})(jQuery);