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
                            <div class="col-lg-5 col-sm-6 col-xs-12 text-center">
                                <img src="/imagenes/favicon.ico" class="logo center-block">
                            </div>
                            <div class="col-lg-7 col-sm-6 col-xs-12">
                                <br />
                                <h4>Recuperar Contraseña</h4>
                                <p>A continuacion ingresa el nombre de usuario de la cuenta que deseas recuperar.</p>
                                <s:form namespace="/" action="obtenerPregunta" id="recuperar-contraseña-form" autocomplete="off">
                                    <div class="form-group">
                                        <label for="nick" class="control-label">Nombre de Usuario</label>
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="nick" value="" placeholder="Nombre de Usuario" required />
                                            <div class="input-group-btn">
                                                <button class="btn btn-ruhaj" type="submit">
                                                    Siguiente
                                                    <i class="fa fa-chevron-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </s:form>
                            </div>
                        </div>
                    </div>
                    <s:action name="mensajeAlerta" namespace="/modal" executeResult="true">
                        <s:param name="tipo"><%out.println(Soporte.Mensaje.TIPODANGER);%></s:param>
                    </s:action>
                </div>
            </div>
        </div>
    </body>
</html>
