(function ($) {

    $('body').on('click', '#modalrecuperar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('.modal.recuperar[data-modelo=insumo]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('insumo');
        $modal.modal('show');
    });

    $('body').on('click', '#recuperar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.recuperar');
        var id = $dialog.find('#id').val();
        $.post('/insumoelaborado/recuperar', {id: id}, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumoelaborado/listar?' + data);
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
        var $modal = $('.modal.eliminar[data-modelo=insumo]');
        $modal.find('#id').val(id);
        $modal.find('#model').val('insumo');
        $modal.modal('show');
    });

    $('body').on('click', '#eliminar', function (e) {
        var $boton = $(this);
        var $dialog = $boton.parents('.modal.eliminar');
        var id = $dialog.find('#id').val();
        toggleBoton(e.target);
        $.post('/insumoelaborado/eliminar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $dialog.modal('hide');
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumoelaborado/listar?' + data);
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
        $.post('/insumoelaborado/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#nombre-ver').html('Nombre: ' + response.model.nombre);
                $modal.find('#unidadmedida-ver').html('Unidad Medida: ' + response.model.unidadMedida);
                $modal.find('#cantidadactual-ver').html('Cantidad Actual: ' + response.model.stock.cantidadActual);
                $modal.find('#cantidadminima-ver').html('Cantidad Mínima: ' + response.model.stock.cantidadMinima);
                $modal.find('#receta-ver').html('Receta:');
                for (var i = 0; i < response.model.detalleInsumoElaborados.length; i++) {
                    var p = '<p>' + response.model.detalleInsumoElaborados[i].insumoBruto.nombre + ' cantidad: ' +
                            response.model.detalleInsumoElaborados[i].cantidad + ' unidad medida: ' +
                            response.model.detalleInsumoElaborados[i].insumoBruto.unidadMedida + '</p>';
                    $modal.find('#receta-ver').append(p);
                }
                if (response.model.fAlta !== null) {
                    $modal.find('#fechaalta-ver').html('Fecha Alta: ' + response.model.fAlta);
                }
                if (response.model.fBaja !== null) {
                    $modal.find('#fechabaja-ver').html('Fecha Baja: ' + response.model.stock.cantidadActual);
                }
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger');
            }
        });
        erroresM.limpiarErrores('#form-editar');
        $modal.modal('show');
    });

    $('body').on('click', '#modaleditar', function (e) {
        e.preventDefault();
        $('#table-body').empty();
        $('#form-editar').trigger("reset");
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-editar');
        $modal.find('#id').val(id);
        $.post('/insumoelaborado/getModificar', {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#id').val(response.model.id);
                $modal.find('#nombre').val(response.model.nombre);
                $modal.find('#unidadMedida' + response.model.unidadMedida).prop('checked', true);
                $modal.find('#cantidadMinima').val(response.model.stock.cantidadMinima);
                for (var i = 0; i < response.model.detalleInsumoElaborados.length; i++) {
                    $('#table-body').append('<tr id="' + response.model.detalleInsumoElaborados[i].insumoBruto.id + '"><td class="text-center-all">' + response.model.detalleInsumoElaborados[i].insumoBruto.nombre + '</td><td class="text-center-all">' +
                            response.model.detalleInsumoElaborados[i].insumoBruto.unidadMedida +
                            '</td><td class="text-center-all">' +
                            response.model.detalleInsumoElaborados[i].insumoBruto.stock.cantidadActual +
                            '</td><td class="text-center-all"><input min="0" type="number" class="form-control" id="cantidadUtilizar" name="cantidadUtilizar" placeholder="Cantidad a utilizar" value="' + response.model.detalleInsumoElaborados[i].cantidad + '"><input type="hidden" name="idUtilizar" value="' + response.model.detalleInsumoElaborados[i].insumoBruto.id + '"></td>' +
                            '<td class="text-center-all"><button class="btn btn-danger"><i class="fa fa-close"></i></button></td></tr>');
                }
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
        $.post('/insumoelaborado/postModificar', data, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumoelaborado/listar?' + data);
            } else {
                toggleBoton(e.target);
                erroresM.mostrarErrores('#form-editar', response);
            }
        })
    });


    $('body').on('click', '#tabla-detalleElaborados button', function (e) {
        e.preventDefault();
        $(this).parents('tr').fadeOut('normal', function () {
            var tr = $(this).detach();
            tr.remove();
        });
    });


    $('#nombre-ac').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/insumobruto/postBuscarInsumoBrutoAutoComplete",
                type: "POST",
                data: {
                    term: request.term
                },
                dataType: "json",
                success: function (data) {
                    response(data);
                }
            });
        },
        appendTo: '#modal-editar',
        select: function (event, ui) {
            var data = {id: ui.item.id};
            $.post("/insumobruto/getModificar", data, function (response) {
                if (response.codigo === 200) {
                    $('#nombre-ac').val('');
                    if ($('#' + response.model.id + '').length !== 1) {
                        $('#table-body').append('<tr id="' + response.model.id + '"><td class="text-center-all">' + response.model.nombre + '</td><td class="text-center-all">' +
                                response.model.unidadMedida +
                                '</td><td class="text-center-all">' +
                                response.model.stock.cantidadActual +
                                '</td><td class="text-center-all"><input min="0" type="number" class="form-control" id="cantidadUtilizar" name="cantidadUtilizar" placeholder="Cantidad a utilizar"><input type="hidden" name="idUtilizar" value="' + response.model.id + '"></td>' +
                                '<td class="text-center-all"><button class="btn btn-danger"><i class="fa fa-close"></i></button></td></tr>');
                    }
                } else {
                    erroresM.mostrarAlertError(response.actionErrors, 'danger');
                }
            });
        }
    });


    $('body').on('click', '#modalconfeccionar', function (e) {
        e.preventDefault();
        var $boton = $(this);
        var $contenedor = $boton.parents('#botones');
        var id = $contenedor.find('#id').val();
        var $modal = $('#modal-confeccionar');
        erroresM.limpiarErrores('#form-confeccionar')
        $modal.find('form').trigger('reset');
        $modal.find('#resultado').empty();
        $modal.find('#id').val(id);
        $.post("/insumoelaborado/getModificar", {id: id}, function (response) {
            if (response.codigo === 200) {
                $modal.find('#nombre-insumo').html('Nombre: ' + response.model.nombre);
                $modal.find('#unidad-medida-insumo').html('Unidad de Medida: ' + response.model.unidadMedida);
                $modal.find('#cantidad-actual-insumo').html('Cantidad en Stock Actual: ' + response.model.stock.cantidadActual);
            } else {
                erroresM.mostrarAlertError(response.actionErrors, 'danger');
            }
        });

        $modal.modal('show');
    });

    $('#cantidad-confeccionar-insumo').on('keyup', function (e) {
        e.preventDefault();
        var $modal = $('#modal-confeccionar');
        var id = $modal.find('#id').val();
        var cantidad = $modal.find('#cantidad-confeccionar-insumo').val();
        if (cantidad > 0) {
            $.post("/insumoelaborado/getResultadoMensaje", {id: id, cantidadConfeccionarInsumo: cantidad}, function (response) {
                $modal.find('#resultado').html(response);
            });
        }
    });

    $('body').on('click', '#confeccionar', function (e) {
        e.preventDefault();
        toggleBoton(e.target);
        var data = $('#modal-confeccionar form').serialize();
        $.post('/insumoelaborado/confeccionar', data, function (response) {
            if (response.codigo === 200) {
                var data = $('#formulario-buscar').serialize();
                window.location.replace('/insumoelaborado/listar?' + data);
            } else {
                toggleBoton(e.target);
                erroresM.mostrarErrores('#form-confeccionar', response);
            }
        })
    });

})(jQuery);