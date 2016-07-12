<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuracion Cuenta</title>
        <link href="/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="/css/vendor/bootstrap-select.min.css" rel="stylesheet" type="text/css">
        <link href="/css/login.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-sm-offset-2 col-sm-8 col-xs-12 vcentered">
                    <div class="panel">
                        <div class="panel-body">
                            <form id="primer-login-form">
                                <h4>Bienvenido a Ruhaj!</h4>
                                <p>Hola! como esta es la primera vez que ingresas al sistema te vamos a pedir que selecciones y des una respuesta a la "Pregunta Secreta" de tu cuenta, la misma te será solicitada en el caso de que olvides tu contraseña.</p>
                                <hr />
                                <s:include value="/WEB-INF/usuario/preguntasSecretas.jsp"/>
                                <div class="form-group">
                                    <label for="respuestaSecreta" class="control-label">Respuesta Secreta</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="respuestaSecreta" name="respuestaSecreta" placeholder="Tu Respuesta Secreta">
                                        <div class="input-group-btn">
                                            <button class="btn btn-ruhaj guardar" type="submit">
                                                Listo!
                                                <i class="fa fa-chevron-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="/js/vendor/jquery.min.js"></script>
    <script type="text/javascript" src="/js/vendor/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/vendor/bootstrap-select.min.js"></script>

    <script type="text/javascript" src="/js/admin.js"></script>
    <script type="text/javascript" src="/js/usuario/primerLogin.js"></script>
</html>
