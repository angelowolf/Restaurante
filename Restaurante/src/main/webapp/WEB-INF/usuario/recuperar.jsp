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
        <s:action name="mensajeAlerta" namespace="/modal" executeResult="true">
            <s:param name="tipo"><%out.println(Soporte.Mensaje.TIPODANGER);%></s:param>
        </s:action>
        <s:form namespace="/usuario" action="obtenerPregunta" class="well col-md-6 col-md-offset-3" id="formulario">
            <div class="form-group">
                <label for="nick">Nombre de Usuario</label>
                <input required type="text" class="form-control" id="nick" name="nick" placeholder="Nombre de Usuario">
            </div>
            <s:submit class="btn btn-success pull-right" value="Siguiente"/>
        </s:form>           
    </body>
</html>
