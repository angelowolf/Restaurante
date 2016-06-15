var wsocket;
var serviceLocation = "ws://localhost:8080/wsnotificacion";
var idUsuario = 1;
var $clave;
var $lista_usuario;
var $mensaje;
var $destino;
var $response;
var token;

function mensajeRecibido(evt) {
    var mensaje = JSON.parse(evt.data);
    var tipo = mensaje.tipo + "";
    switch (tipo) {
        case 'LOGIN':
            {
                alert(mensaje.mensaje);
            }
            break;
        case 'OK':
            {
                console.log("logeado con exito.");
            }
            break;
        case 'NOTIFICACION':
            {
                console.log(mensaje.mensaje);
                var panelNotificaciones = $('#panel-notificaciones');
                var not = "<li><a href='#'><div><i class='fa fa-bell fa-fw'></i>" + mensaje.mensaje + " <span class='pull-right text-muted small'>" + mensaje.fecha + "</span></div></a></li><li class='divider'></li>";
                panelNotificaciones.append(not);
            }
            break;
        case 'ERROR':
            alert(mensaje.mensaje);
            break;
    }
}

function conectarWebSocket() {
    wsocket = new WebSocket(serviceLocation);
    wsocket.onmessage = mensajeRecibido;
    wsocket.onopen = function (e) {
        var msg = '{"idUsuario":"' + idUsuario + '","tipo":"LOGIN"}';
        wsocket.send(msg);
    };
}

$(document).ready(function () {
    idUsuario = $('#idUsuarioHidden').val();
    conectarWebSocket();
});