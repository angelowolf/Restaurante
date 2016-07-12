<%-- 
    Document   : recuperarClave
    Created on : 11/05/2016, 14:39:52
    Author     : ang_2
--%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar Contraseña</title>
        <link href="/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="/css/login.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 col-sm-offset-2 col-sm-8 col-xs-12 vcentered">
                    <div class="panel">
                        <div class="panel-body">
                            <form id="formulario">
                                <h4>Pregunta Secreta</h4>
                                <p>Para restablecer la contraseña deberás responder a la pregunta secreta que configuraste en el primer inicio de sesión.</p>
                                <hr />
                                <input type="hidden" id="id" name="id" value="<s:property value="usuario.id"/>">
                                <div class="form-group">
                                    <h4 id="preguntaSecreta"><s:property value="usuario.preguntaSecreta"/></h4>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="respuestaSecreta">Respuesta Secreta</label>
                                    <input required type="text" class="form-control" id="respuestaSecreta" name="respuestaSecreta" placeholder="Respuesta Secreta">
                                </div>
                                <hr />
                                <div class="form-group">
                                    <label class="control-label" for="clave">Nueva Contraseña</label>
                                    <input required  type="password" class="form-control" id="clave" name="clave" placeholder="Nueva Contraseña">
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="clave2">Repite la Nueva Contraseña</label>
                                    <input type="password" required  class="form-control" id="clave2" name="clave2" placeholder="Repite la Nueva Contraseña">
                                </div>
                                <button type="submit" id="guardar" class="btn btn-ruhaj pull-right">Cambiar Contraseña</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="/js/vendor/jquery.min.js"></script>
    <script type="text/javascript" src="/js/vendor/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/admin.js"></script>
    <script type="text/javascript" src="/js/usuario/recuperarClave.js"></script>
</html>
