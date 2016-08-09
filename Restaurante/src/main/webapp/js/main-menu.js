$(document).ready(function () {
    $("#side-menu").metisMenu();

    //Buscamos el item del menu que corresponde a la URL actual
    // y lo marcamos como activo, tambien desplegamos a sus padres
    var url = window.location.pathname.toString();
    $('ul.nav a[href="' + url + '"]').addClass('active')
                                     .parents('ul').addClass('in');

    //Buscamos el estado del menu en el almacenamiento del navegador
    // y si lo encontramos lo colocamos en ese estado
    if (typeof(Storage) !== "undefined") {
        var status = localStorage.getItem("isRuhajMenuOpen") || 0;
        setTimeout(function (keepOpen) { toggleRuhajMenu(keepOpen); }, 500, status);
    }

    //Si se presiona el boton del menu cambiamos el estado del mismo
    $("#sidebar-toggle").on('click', function (e) {
        toggleRuhajMenu($("#sidebar-ruhaj").hasClass('closed') ? 1 : 0);
        return false;
    });

    /**
     * Funcion para cambiar el estado del menu y almacenarlo
     * en el almacenamiento local del navegador
     */
    function toggleRuhajMenu(keepOpen) {
        var canStore = (typeof(Storage) !== "undefined");
        if(keepOpen ==  1) {
            $("#sidebar-ruhaj").removeClass('closed');
            if(canStore) {
                localStorage.setItem('isRuhajMenuOpen', 1);
            }
        }
        else {
            $("#sidebar-ruhaj").addClass('closed');
            if(canStore) {
                localStorage.setItem('isRuhajMenuOpen', 0);
            }
        }
    }
});