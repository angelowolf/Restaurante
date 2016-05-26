var ids = [];

(function ($) {

    $('#categoria').on('change', function () {
        var data = getIdsFormatoPOST();
        if (data !== "") {
            data += '&';
        }
        data += 'idCategoria=' + $(this).find('option:selected').val();
        data += '&nombreInsumo=' + $('#nombre').val();
        console.log(data);
        $.post('/stock/postBuscarInsumo', data, function (response) {
            $('#row').fadeOut().remove();
            $('#notificacion').remove();
            $('#contenedor').append(response);
        });
    });

    $('#nombre').on('keyup', function () {
        var data = getIdsFormatoPOST();
        if (data !== "") {
            data += '&';
        }
        data += 'nombreInsumo=' + $(this).val();
        data += '&idCategoria=' + $('#categoria').find('option:selected').val();
        console.log(data);
        $.post('/stock/postBuscarInsumo', data, function (response) {
            $('#row').fadeOut().remove();
            $('#notificacion').remove();
            $('#contenedor').append(response);
        });
    });

    $('body').on('change', '#row input[type=checkbox]', function () {
        ids.push($(this).attr('id'));
        $(this).parents('tr').fadeOut('normal', function () {
            var tr = $(this).detach();
            var td = tr.find('td:last').detach();
            tr.append('<td><input name="cantidad" type="text"/></td><td><input name="precio" type="text"/></td>');
            tr.append(td);
            $('#row2 tbody').append(tr);
            tr.fadeIn();
        });
        console.log(ids);
    });

    $('body').on('change', '#row2 input[type=checkbox]', function () {
        ids.remove($(this).attr('id'));
        $(this).parents('tr').fadeOut('normal', function () {
            $(this).remove();
        });
        console.log(ids);
    });


    $('body').on('click', '#regisrar', function (e) {
        e.preventDefault();
        var data = getIdsFormatoPOST();
        data += $('#formulario-compra').serialize();
        console.log(data);
    });

})(jQuery);


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