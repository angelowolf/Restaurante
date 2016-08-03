(function ($) {
    var cdetallesingredientes = 0;
    var cdetallesrecetas = 0;

    $('.mostrar-modal-recuperar-receta').on('click', function (e) {
        var id = $(this).parents('.acciones').children('.model-id').val();
        var $modal = $('#modal-recuperar-receta');
            $modal.find('#model-id').val(id);
            $modal.modal('show');
    });

    $('#modal-recuperar-receta .confirmar').on('click', function (e) {
        var $dialog = $('#modal-recuperar-receta');
        var id =  $dialog.find('#model-id').val();
        toggleBoton(e.target);
        $.post('/receta/recuperar', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/receta/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors);
                toggleBoton(e.target);
            }
        });
    });

    $('.mostrar-modal-baja-receta').on('click', function (e) {
        var id = $(this).parents('.acciones').children('.model-id').val();
        var $modal = $('#modal-baja-receta');
            $modal.find('#model-id').val(id);
            $modal.modal('show');
    });

    $('#modal-baja-receta .confirmar').on('click', function (e) {
        var $dialog = $('#modal-baja-receta');
        var id =  $dialog.find('#model-id').val();
        toggleBoton(e.target);
        $.post('/receta/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/receta/listar?' + data);
            } else {
                erroresM.mostrarAlertError(response.actionErrors);
                toggleBoton(e.target);
            }
        });
    });

    $('.mostrar-modal-ver-receta').on('click', function (e) {
        var id = $(this).parents('.acciones').children('.model-id').val();
        var $modal = $('#modal-ver-receta');
            $modal.find('#id').val(id);
            $modal.find('#ver-detalle-recetas tr, #ver-detalle-ingredientes tr').not('.empty').remove();
            $modal.find('.empty').show();
        $.post('/receta/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#nombre').html(response.model.nombre);
                $modal.find('#categoria').html(response.model.categoriaReceta.nombre);
                $modal.find('#fechaAlta').html(response.model.fAlta ? response.model.fAlta : '-');
                $modal.find('#fechaBaja').html(response.model.fBaja ? response.model.fBaja : '-');
                var $detalleRecetas = $modal.find('#ver-detalle-recetas');
                if(response.model.recetas.length > 0) {
                    $detalleRecetas.find('.empty').hide();
                }
                $.each(response.model.recetas, function (k, receta) {
                    var $tdN = $('<td>').addClass('text-center-all').html(receta.receta.nombre);
                    var $tdO = $('<td>').addClass('text-center-all').html(receta.opcional ? 'SI' : 'NO');
                    var  $tr = $('<tr>').append($tdN).append($tdO);
                    $detalleRecetas.append($tr);
                });
                var $detalleIngredientes = $modal.find('#ver-detalle-ingredientes');
                if(response.model.ingredientes.length > 0) {
                    $detalleIngredientes.find('.empty').hide();
                }
                $.each(response.model.ingredientes, function (k, ingrediente) {
                    var $tdN = $('<td>').addClass('text-center-all').html(ingrediente.insumo.nombre);
                    var $tdU = $('<td>').addClass('text-center-all').html(ingrediente.insumo.unidadMedida);
                    var $tdC = $('<td>').addClass('text-center-all').html(ingrediente.cantidad);
                    var $tdO = $('<td>').addClass('text-center-all').html(ingrediente.opcional ? 'SI' : 'NO');
                    var  $tr = $('<tr>').append($tdN).append($tdC).append($tdU).append($tdO);
                    $detalleIngredientes.append($tr);
                });
            } else {
                erroresM.mostrarAlertError(response.actionErrors);
            }
        });
        $modal.modal('show');
    });

    $('.mostrar-modal-modificar-receta').on('click', function (e) {
        var id = $(this).parents('.acciones').children('.model-id').val();
        var $modal = $('#modal-modificar-receta');
            $modal.find('#id').val(id);
            $modal.find('#detalle-recetas tr, #detalle-ingredientes tr').not('.empty').remove();
            $modal.find('#modificar-receta-form').trigger("reset");
            $modal.find('.empty').show();
        $.post('/receta/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#categoriaReceta').selectpicker('val', response.model.categoriaReceta.id);
                $.each(response.model.recetas, function (k, receta) {
                    crearFilaDetalleReceta(receta.receta, receta.opcional);
                });
                $.each(response.model.ingredientes, function (k, ingrediente) {
                    crearFilaDetalleIngrediente(ingrediente.insumo, ingrediente.cantidad, ingrediente.opcional);
                });
            } else {
                erroresM.mostrarAlertError(response.actionErrors);
            }
        });
        erroresM.limpiarErrores('modificar-receta-form');
        setTimeout(function (modal) { modal.find('[autofocus]').focus() }, 500, $modal);
        $modal.modal('show');
    });

    $('#modal-modificar-receta #modificar-receta-form').submit(function (e) {
        var $form = $(this);
        var $boton = $form.find('.confirmar');
        var data = $form.serialize();
        toggleBoton($boton);
        $.post('/receta/postModificar', data, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/receta/listar?' + data);
            } else {
                toggleBoton($boton);
                erroresM.mostrarErrores($form.attr('id'), response);
            }
        })
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
                        crearFilaDetalleIngrediente(response.model, 1, false);
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
                        crearFilaDetalleReceta(response.model, false);
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

    function crearFilaDetalleReceta(model, opcional) {
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
                                        .prop('checked', opcional)
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
                                                $('#detalle-recetas').find('.empty')
                                                                              .show(); 
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

            if(cdetallesrecetas < 1) {
                $('#detalle-recetas').find('.empty').hide();
            }
            $('#detalle-recetas').append($tr);
            cdetallesrecetas++;
        }
    }

    function crearFilaDetalleIngrediente(model, cantidad, opcional) {
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
                                        .addClass('form-control fixed-width-4')
                                        .val(cantidad)
                                        .blur(function () {
                                            $(this).val($(this).val().replace(/[^\d\.,]/g, ''));
                                        });

            var $tdCanUsa = $('<td>').addClass('text-center-all')
                                     .append($input);

            var $checkbox = $('<input>').attr('id', 'ingredienteOpcional')
                                        .prop('name', 'opcionalIngredientesID')
                                        .prop('type', 'checkbox')
                                        .prop('checked', opcional)
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
                                                $('#detalle-ingredientes').find('.empty')
                                                                              .show(); 
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

            if(cdetallesingredientes < 1) {
                $('#detalle-ingredientes').find('.empty').hide();
            }
            $('#detalle-ingredientes').append($tr);
            cdetallesingredientes++;
        }
    }
})(jQuery);


