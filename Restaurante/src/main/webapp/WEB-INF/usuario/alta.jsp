<%@taglib uri="/struts-tags" prefix="s"%>
<h2 class="page-header">Nuevo Usuario</h2>
<form class="well col-md-6 col-md-offset-3" id="formulario">
    <div class="form-group">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
    </div>
    <div class="form-group">
        <label for="apellido">Appelido</label>
        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
    </div>
    <s:include value="/WEB-INF/rol/roles.jsp"/>
    <div class="form-group">
        <label for="nick">Nick</label>
        <input type="text" class="form-control" id="nick" name="nick" placeholder="Nick">
    </div>
    <div class="form-group">
        <label for="clave">Clave</label>
        <input type="password" class="form-control" id="clave" name="clave" placeholder="Clave">
    </div>
    <div class="form-group">
        <label for="clave">Repita la clave</label>
        <input type="password" class="form-control" id="clave2" name="clave2" placeholder="Repita la clave">
    </div>
    <button type="submit" id="registrar" class="btn btn-success pull-right">Registrar</button>
</form>           