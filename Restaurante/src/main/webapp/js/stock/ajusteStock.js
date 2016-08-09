(function ($) {
    var ids = [];

    $('#filtro-insumos-form').submit(function (e) { return false; });

    $('#filtro-insumos-form #categoria').on('change', actualizarListadoInsumos);

    $('#filtro-insumos-form #nombre').on('keyup', actualizarListadoInsumos);

    $('input .cantidad').on('change', inputCantidadRealListener);

    $('.btn-seleccionar-insumo').on('click', btnSeleccionarInsumoListener);

    $('#ajuste-stock-form').submit(function (e) {
        var $form = $(this);
        var $boton = $form.find('.confirmar');
        var data = $form.serialize();
        toggleBoton($boton);
        $.ajax({
            type: 'POST',
            url : '/stock/postAjusteStock',
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
            url : '/insumo/postBuscarInsumos',
            traditional : true,
            data: data,
            dataType : 'JSON',
            success : function (response) {
                $('input .cantidad').off('change', '**');
                $('#insumos-filtrados tbody tr').not('.selected').remove();
                if(response.length == 0) {
                    var $tde = $('<td>').attr('colspan', '7')
                                        .addClass('text-center-all')
                                        .html('No se encontraron Insumos que coincidan con tu busqueda.');
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
                            .html(modelo.nombre).prepend($hide);
        var $tdcn = $('<td>').addClass('text-center-vertical')
                            .html(modelo.categoriaInsumo.nombre);
        var $tdca = $('<td>').addClass('text-center-all cantidad-actual')
                             .html(modelo.stock.cantidadActual);
        var $care = $('<input>').prop('name', 'cantidad')
                                .prop('type', 'text')
                                .prop('disabled', true)
                                .prop('maxlength', 5)
                                .addClass('form-control numeric cantidad-real fw-4')
                                .on('change', inputCantidadRealListener);
        var $tdcr = $('<td>').addClass('text-center-all').append($care);


        var $tddi = $('<td>').addClass('text-center-all diferencia');
        var $tdum = $('<td>').addClass('text-center-all')
                            .html(modelo.unidadMedida);
        var $icon = $('<i>').addClass('fa fa-circle-o');
        var $botn = $('<button>').attr('id', modelo.id)
                                 .prop('type', 'button')
                                 .addClass('btn btn-sm btn-info btn-seleccionar-insumo')
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
                 .append($tdcr)
                 .append($tddi)
                 .append($tdum)
                 .append($tdbt);

        $('#insumos-filtrados tbody').prepend($nrow);
    }

    function btnSeleccionarInsumoListener() {
        var $arow = $(this).parents('tr');
        var id = $arow.find('input[name="ids"]').val();
        var idx = ids.indexOf(id);
        if(idx > -1) {
            ids.splice(idx, 1);
            $arow.removeClass('selected');
            $arow.find('.cantidad-real').prop('disabled', true);
            $(this).toggleClass('btn-info btn-success').children().toggleClass('fa-circle-o fa-check-circle');
        }
        else {
            ids.push(id);
            $arow.addClass('selected');
            $arow.find('.cantidad-real').prop('disabled', false);
            $(this).toggleClass('btn-info btn-success').children().toggleClass('fa-circle-o fa-check-circle');
        }
    }

    function inputCantidadRealListener() {
        var $arow = $(this).parents('tr');
        var $tdca = $arow.find('.cantidad-actual');
        var $tddi = $arow.find('.diferencia');
        var caac = parseFloat($tdca.html()) || 0;
        var care = parseFloat($(this).val()) || 0;
        var diff =  care - caac;
        $tddi.html(diff.toFixed(2));
    }
})(jQuery);
