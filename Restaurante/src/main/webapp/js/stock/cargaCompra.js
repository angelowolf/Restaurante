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
                $('#insumos-brutos-filtrados tbody tr').remove();
                if(response.length == 0) {
                    var $tde = $('<td>').attr('colspan', '7')
                                        .addClass('text-center-all')
                                        .html('No se encontraron Insumos Brutos que coincidan con tu busqueda.');
                    var $row = $('<tr>').addClass('empty well');
                        $row.append($tde);
                    $('#insumos-brutos-filtrados tbody').append($row);
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
        var $icon = $('<i>').addClass('fa fa-plus');
        var $botn = $('<button>').attr('id', modelo.id)
                                 .prop('type', 'button')
                                 .addClass('btn btn-sm btn-success btn-seleccionar-insumo')
                                 .append($icon)
                                 .on('click', btnSeleccionarInsumoListener)
                                .tooltip({
                                    title : 'Seleccionar',
                                    placement : 'left',
                                    container : 'body'
                                 });
        var $tdbt = $('<td>').addClass('text-center-all')
                             .append($botn);

        var $nrow = $('<tr>');
            $nrow.append($tdno)
                 .append($tdcn)
                 .append($tdca)
                 .append($tdcm)
                 .append($tdum)
                 .append($tdpu)
                 .append($tdbt);

        $('#insumos-brutos-filtrados tbody').append($nrow);
    }

    function btnSeleccionarInsumoListener() {
        var id = $(this).attr('id');
        $(this).tooltip('destroy');

        var $orow  = $(this).parents('tr');
            $orow.slideDown('fast').remove();

        var $nrow = $orow.clone();
            $nrow.find('.btn-seleccionar-insumo')
                 .parents('td')
                 .remove();

        var $icon = $('<i>').addClass('fa fa-minus');
        var $botn = $('<button>').attr('id', id)
                                 .attr('tabindex', '-1')
                                 .prop('type', 'button')
                                 .addClass('btn btn-sm btn-danger')
                                 .append($icon)
                                 .on('click', function () {
                                    var id  = $(this).attr('id');
                                    var idx = ids.indexOf(id);
                                    if(idx > -1) {
                                        ids.splice(idx, 1);
                                        $(this).tooltip('destroy');
                                        $(this).parents('tr').remove();
                                        if(ids.length < 1) {
                                            $('#insumos-brutos-seleccionados .empty').show();
                                         }
                                     }
                                 })
                                 .tooltip({
                                    title : 'Quitar',
                                    placement : 'left',
                                    container : 'body'
                                 });

        var $tdac = $('<td>').addClass('text-center-all').append($botn);

        var $cant = $('<input>').prop('name', 'cantidad')
                                .prop('type', 'text')
                                .prop('maxlength', 5)
                                .addClass('form-control numeric fw-4');
        var $tdca = $('<td>').addClass('text-center-all').append($cant);

        var $prec = $('<input>').prop('name', 'precio')
                               .prop('type', 'text')
                               .prop('maxlength', 5)
                               .addClass('form-control numeric fw-4');
        var $tdpr = $('<td>').addClass('text-center-all').append($prec);

        var $hide = $('<input>').prop('name', 'ids')
                                .prop('type', 'hidden')
                                .val(id);

        $nrow.prepend($hide).append($tdca).append($tdpr).append($tdac);

        ids.push(id);

        if(ids.length > 0 ) {
            $('#insumos-brutos-seleccionados .empty').hide();
        }
        $('#insumos-brutos-seleccionados').append($nrow);
    }

})(jQuery);
