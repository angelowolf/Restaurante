<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="/struts-bootstrap-tags" prefix="sb" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Iniciar Sesión</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="../imagenes/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../imagenes/favicon.ico" type="image/x-icon">
        <link href='/css/login.css' rel='stylesheet' type='text/css'>

    </head>
    <body>
        <div class="content">
            <s:actionerror theme="bootstrap" />
            <!--Echo out errors here. See example-->
            <!--<p class=error>Error, wrong username or password used. Please, try again.-->
            <s:form action="login" theme="simple" namespace="/" >
                <div class="mat-in">
                    <input type="text" name="nick" value="admin" required />
                    <span class="bar"></span>
                    <label>Nombre de Usuario</label>
                </div>
                <div class="mat-in">
                    <input type="password" name="clave" value="admin" required />
                    <span class="bar"></span>
                    <label>Contraseña</label>
                </div>
                <input type="submit" value="Iniciar Sesión">
                <a href="<s:url action="recuperar" namespace="/"/>" class="olvideClave">¿Olvidaste la contraseña?</a>
            </s:form>
        </div>

        <div class="bg-boxes">
            <svg width="300px" height="100%" id="col1">
            <rect width="150px" height="150px" x="75px" y="75px" class="bubble" id="bub1" />
            </svg>
            <svg width="200px" height="100%" id="col2">
            <rect width="100px" height="100px" x="50px" y="50px" class="bubble" id="bub2" />
            </svg>
            <svg width="260px" height="100%" id="col3">
            <rect width="130px" height="130px" x="65px" y="65px" class="bubble" id="bub3" />
            </svg>
            <svg width="160px" height="100%" id="col4">
            <rect width="80px" height="80px" x="40px" y="40px" class="bubble" id="bub4" />
            </svg>
            <svg width="240px" height="100%" id="col5">
            <rect width="120px" height="120px" x="60px" y="60px" class="bubble" id="bub5" />
            </svg>
            <!--Here is a triangle-->
            <svg width="200px" height="100%" id="col6">
            <polygon points="50,150 100,50 150,150" class="bubble" id="bub6" />
            </svg>
            <svg width="200px" height="100%" id="col7">
            <rect width="100px" height="100px" x="50px" y="50px" class="bubble" id="bub7" />
            </svg>
            <svg width="200px" height="100%" id="col8">
            <rect width="100px" height="100px" x="50px" y="50px" class="bubble" id="bub8" />
            </svg>
            <svg width="200px" height="100%" id="col9">
            <rect width="100px" height="100px" x="50px" y="50px" class="bubble" id="bub9" />
            </svg>
            <svg width="200px" height="100%" id="col10">
            <rect width="100px" height="100px" x="50px" y="50px" class="bubble" id="bub10" />
            </svg>
            <svg width="100px" height="100%" id="col11">
            <rect width="50px" height="50px" x="25px" y="25px" class="bubble" id="bub11" />
            </svg>
        </div>
        <script src="/js/vendor/jquery.min.js"></script>
        <script src="/js/vendor/bootstrap.min.js"></script>
    </body>
</html>