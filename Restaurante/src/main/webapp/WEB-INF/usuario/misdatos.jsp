<%@taglib uri="/struts-tags" prefix="s"%>
<h2 class="page-header">Mis Datos</h2>
<form class="well" id="formulario">
    <input type="hidden" id="id" name="id" value="<s:property value="usuario.id"/>">
    <div class="form-group">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" readonly="true" value="<s:property value="usuario.nombre"/>">
    </div>
    <div class="form-group">
        <label for="apellido">Appelido</label>
        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" readonly="true" value="<s:property value="usuario.apellido"/>">
    </div>   
    <div class="form-group">
        <label for="documento">Documento</label>
        <input type="number" class="form-control" id="documento" name="documento" readonly="true" placeholder="documento" value="<s:property value="usuario.documento"/>">
    </div>
    <div class="form-group">
        <label for="telefono">Teléfono</label>
        <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Teléfono" value="<s:property value="usuario.telefono"/>">
    </div>
    <div class="form-group">
        <label for="direccion">Dirección</label>
        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="<s:property value="usuario.direccion"/>">
    </div>
    <div class="form-group">
        <label for="fechaNacimiento">Fecha de Nacimiento</label>
        <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento" value="<s:property value="usuario.fechaNacimiento"/>">
    </div>
    <div class="form-group">
        <label for="nick">Nick</label>
        <input type="text" class="form-control" id="nick" name="nick" placeholder="Nick" value="<s:property value="usuario.nick"/>">
    </div>
    <div class="form-group">
        <label for="clave">Nueva clave</label>
        <input type="password" class="form-control" id="clave" name="clave" placeholder="Nueva clave">
    </div>
    <div class="form-group">
        <label for="clave2">Repita la clave</label>
        <input type="password" class="form-control" id="clave2" name="clave2" placeholder="Repita la clave">
    </div>
    <div class="form-group">
        <label for="claveOriginal">Clave anterior</label>
        <input type="password" class="form-control" id="claveOriginal" name="claveOriginal" placeholder="Clave anterior">
    </div>
    <button type="submit" id="guardar" class="btn btn-success pull-right">Guardar</button>
</form>           