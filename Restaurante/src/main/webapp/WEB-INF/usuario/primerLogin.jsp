<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuracion Cuenta</title>
        <link href="/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="/js/usuario/primerLogin.js"></script>
    </head>
    <body>
        <form class="well col-md-6 col-md-offset-3" id="formulario">
            <s:include value="/WEB-INF/usuario/preguntasSecretas.jsp"/>
            <div class="form-group">
                <label for="respuestaSecreta">Respuesta Secreta</label>
                <input type="text" class="form-control" id="respuestaSecreta" name="respuestaSecreta" placeholder="Respuesta Secreta">
            </div>
            <button type="submit" id="guardar" class="btn btn-success pull-right">Guardar</button>
        </form>           
    </body>
</html>
