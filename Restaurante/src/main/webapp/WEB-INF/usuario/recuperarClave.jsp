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
        <link href="/css/admin.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <form class="well col-md-6 col-md-offset-3" id="formulario">
            <input type="hidden" id="id" name="id" value="<s:property value="usuario.id"/>">
            <div class="form-group">
                <p id="preguntaSecreta"><s:property value="usuario.preguntaSecreta"/></p>
            </div>
            <div class="form-group">
                <label for="respuestaSecreta">Respuesta Secreta</label>
                <input required type="text" class="form-control" id="respuestaSecreta" name="respuestaSecreta" placeholder="Respuesta Secreta">
            </div>
            <div class="form-group">
                <label for="clave">Nueva clave</label>
                <input required  type="password" class="form-control" id="clave" name="clave" placeholder="Nueva clave">
            </div>
            <div class="form-group">
                <label for="clave2">Repita la clave</label>
                <input type="password" required  class="form-control" id="clave2" name="clave2" placeholder="Repita la clave">
            </div>
            <button type="submit" id="guardar" class="btn btn-success pull-right">Guardar</button>
        </form>           
    </body>
    <script type="text/javascript" src="/js/vendor/jquery.min.js"></script>
    <script type="text/javascript" src="/js/vendor/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/vendor/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="/js/admin.js"></script>
    <script type="text/javascript" src="/js/usuario/recuperarClave.js"></script>
</html>
