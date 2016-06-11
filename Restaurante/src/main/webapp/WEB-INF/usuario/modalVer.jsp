<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-ver" tabindex="-1" role="dialog" aria-labelledby="Editar" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Usuario</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form id="form-ver" class="well">
                        <input type="hidden" id="id" name="id">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" readonly="true" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label for="apellido">Appelido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" readonly="true" placeholder="Apellido">
                        </div>
                        <div class="form-group">
                            <label for="documento">Documento</label>
                            <input type="number" class="form-control" id="documento" name="documento" readonly="true" placeholder="documento">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono</label>
                            <input type="tel" class="form-control" id="telefono" name="telefono" readonly="true" placeholder="Teléfono">
                        </div>
                        <div class="form-group">
                            <label for="direccion">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" readonly="true" placeholder="Dirección">
                        </div>
                        <div class="form-group">
                            <label for="fechaNacimiento">Fecha de Nacimiento</label>
                            <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento" readonly="true" placeholder="Fecha de Nacimiento">
                        </div>
                        <div class="form-group">
                            <label for="fechaAlta">Fecha de Alta</label>
                            <input type="text" class="form-control" id="fechaAlta" name="fechaAlta" placeholder="Fecha de Alta" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="fechaBaja">Fecha de Baja</label>
                            <input type="text" class="form-control" id="fechaBaja" name="fechaBaja" placeholder="Usuario Activo" readonly="true">
                        </div>
                        <div class="form-group" id="roles-ver">
                            <label for="rol" name="rol">Roles</label>
                            <ul>

                            </ul>
                        </div>                    
                        <div class="form-group">
                            <label for="nick">Nombre de Usuario</label>
                            <input type="text" class="form-control" id="nick" name="nick" readonly="true" placeholder="Nombre de Usuario">
                        </div>   
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-right" id="salir" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>    
</div>    
