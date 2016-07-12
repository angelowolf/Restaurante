<%@taglib uri="/struts-tags" prefix="s"%>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-xs-12">
    <div class="panel panel-ruhaj">
        <div class="panel-heading">
            <h3 class="panel-title">Nuevo Usuario</h3>
        </div>
        <form id="alta-usuario-form">
            <div class="panel-body"> 
                <div class="row">
                    <div class="col-xs-12">
                        <p><strong>NOTA:</strong> Los campos marcados con (*) son obligatorios y por lo tanto deben ser completados.</p>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="nombre">Nombre *</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="apellido">Apellido *</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="documento">Documento *</label>
                            <input type="number" class="form-control" min="1000000" id="documento" name="documento" placeholder="documento">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="fechaNacimiento">Fecha de Nacimiento</label>
                            <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="telefono">Teléfono</label>
                            <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Teléfono">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="direccion">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="nick">Nombre de Usuario *</label>
                            <input type="text" class="form-control" id="nick" name="nick" placeholder="Nombre de Usuario">
                        </div>
                        <s:include value="/WEB-INF/rol/roles.jsp"/>
                    </div>
                </div>
            </div>
            <div class="panel-footer" id="botones">
                <div class="row">
                    <div class="col-xs-6 text-left">
                        <button class="btn btn-default cancelar">Cancelar</button>
                    </div>
                    <div class="col-xs-6 text-right">
                        <button class="btn btn-ruhaj text-right registrar">Registrar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>