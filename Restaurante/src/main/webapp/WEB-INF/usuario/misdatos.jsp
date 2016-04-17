<%@taglib uri="/struts-tags" prefix="s"%>
<form class="well" id="formulario">
    <input type="hidden" id="id" name="id" value="<s:property value="usuario.id"/>">
    <div class="form-group">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<s:property value="usuario.nombre"/>">
    </div>
    <div class="form-group">
        <label for="apellido">Appelido</label>
        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" value="<s:property value="usuario.apellido"/>">
    </div>
    <div class="form-group">
        <label for="rol">Rol</label>
        <input type="text" class="form-control" id="rol" name="rol" placeholder="Rol" readonly="true" value="<s:property value="usuario.rol"/>">        
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
    <button type="submit" id="guardar" class="btn btn-success">Guardar</button>
</form>           