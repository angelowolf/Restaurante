(function ($) {
    var ids = [];

    $('#filtro-insumos-form').submit(function (e) { return false; })

    $('#filtro-insumos-form #categoria').on('change', actualizarListadoInsumos);

    $('#filtro-insumos-form #nombre').on('keyup', actualizarListadoInsumos);

    $('.btn-seleccionar-insumo').on('click', btnSeleccionarInsumoListener);

    $('#carga-compra-form').submit(function (e) {
        var $form = $(this);
        var $boton = $form.find('.confirmar');
        var data = $form.serialize();
        toggleBoton($boton);
        $.ajax({
            type: 'POST',
            url : '/stock/postCargarCompra',
            traditional : true,
            data: data,
            dataType : 'JSON',
            success : function (response) {
                if (response.codigo === 200) {
                    window.location.reload();
                } else {
                    toggleBoton($boton);
                    erroresM.mostrarErrores($form.attr('id'), response);
                }
            }
        });
        return false;
    });

    function actualizarListadoInsumos() {
        var data = {};
            data.idCategoria  = $('#categoria').val();
            data.nombreInsumo = $('#nombre').val();
            data.ids = ids;
        $.ajax({
            type: 'POST',
            url : '/insumobruto/postBuscarInsumoBruto',
            traditional : true,
            data: data,
            dataType : 'JSON',
            success : function (response) {
                $('#insumos-brutos-filtrados tbody tr').not('.selected').remove();
                if(response.length == 0) {
                    console.log("NORESPONSE");
                    var $tde = $('<td>').attr('colspan', '9')
                                        .addClass('text-center-all')
                                        .html('No se encontraron Insumos Brutos que coincidan con tu busqueda.');
                    var $row = $('<tr>').addClass('empty well');
                        $row.append($tde);
                    $('#insumos-brutos-filtrados tbody').prepend($row);
                }
                $.each(response, function(k, modelo) {
                    construirFilaTablaFiltrado(modelo);
                });
            }
        });
    }

    function construirFilaTablaFiltrado(modelo) {
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
                            .html(modelo.precioUnidad.toFixed(2));
        var $cant = $('<input>').prop('name', 'cantidad')
                                .prop('type', 'text')
                                .prop('maxlength', 5)
                                .prop('disabled', true)
                                .addClass('form-control fw-4 cantidad-comprada')
                                .blur(function () {
                                    $(this).val($(this).val().replace(/[^\d\.,]/g, ''));
                                });
        var $tdcc = $('<td>').addClass('text-center-all').append($cant);

        var $prec = $('<input>').prop('name', 'precio')
                               .prop('type', 'text')
                               .prop('maxlength', 5)
                               .prop('disabled', true)
                               .addClass('form-control fw-4 precio-compra')
                                .blur(function () {
                                    $(this).val($(this).val().replace(/[^\d\.,]/g, ''));
                                });
        var $tdpc = $('<td>').addClass('text-center-all').append($prec);

        var $icon = $('<i>').addClass('fa fa-circle-o fa-lg');
        var $botn = $('<button>').attr('id', modelo.id)
                                 .prop('type', 'button')
                                 .prop('tabindex', '-1')
                                 .addClass('btn btn-sm btn-fw btn-default btn-seleccionar-insumo')
                                 .append($icon)
                                 .on('click', btnSeleccionarInsumoListener)
                                .tooltip({
                                    title : 'Seleccionar',
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
                 .append($tdpc)
                 .append($tdbt);

        $('#insumos-brutos-filtrados tbody').prepend($nrow);
    }

    function btnSeleccionarInsumoListener() {
        var $arow = $(this).parents('tr');
        var id = $arow.find('.id').val();
        var idx = ids.indexOf(id);
        if(idx > -1) {
            ids.splice(idx, 1);
            $arow.removeClass('selected');
            $arow.find('.cantidad-comprada').prop('disabled', true).val('');
            $arow.find('.precio-compra').prop('disabled', true).val('');
            $arow.find('.id').prop('disabled', true);
            $(this).toggleClass('btn-default btn-success').children().toggleClass('fa-circle-o fa-check-circle');
        }
        else {
            ids.push(id);
            $arow.addClass('selected');
            $arow.find('.cantidad-comprada').prop('disabled', false);
            $arow.find('.precio-compra').prop('disabled', false);
            $arow.find('.id').prop('disabled', false);
            $(this).toggleClass('btn-default btn-success').children().toggleClass('fa-circle-o fa-check-circle');
        }
    }
})(jQuery);
