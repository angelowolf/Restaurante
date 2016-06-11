<%@taglib uri="/struts-tags" prefix="s"%>
<h2 class="page-header">Nuevo Usuario</h2>
<form class="well col-md-6 col-md-offset-3" id="formulario">
    <div class="form-group">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
    </div>
    <div class="form-group">
        <label for="apellido">Apellido</label>
        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
    </div>
    <div class="form-group">
        <label for="documento">Documento</label>
        <input type="number" class="form-control" id="documento" name="documento" placeholder="documento">
    </div>
    <div class="form-group">
        <label for="telefono">Teléfono</label>
        <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Teléfono">
    </div>
    <div class="form-group">
        <label for="direccion">Dirección</label>
        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
    </div>
    <div class="form-group">
        <label for="fechaNacimiento">Fecha de Nacimiento</label>
        <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento">
    </div>
    <s:include value="/WEB-INF/rol/roles.jsp"/>
    <div class="form-group">
        <label for="nick">Nombre de Usuario</label>
        <input type="text" class="form-control" id="nick" name="nick" placeholder="Nombre de Usuario">
    </div>   
    <div id="botones">
        <button id="cancelar" class="btn btn-default pull-left">Cancelar</button>
        <button id="registrar" class="btn btn-success pull-right">Registrar</button>
    </div>
</form>           