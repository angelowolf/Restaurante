<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-editar" tabindex="-1" role="dialog" aria-labelledby="Editar" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Editar usuario</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form id="form-editar" class="well">
                        <input type="hidden" id="id" name="id">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label for="apellido">Appelido</label>
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
                            <label for="fechaAlta">Fecha Alta</label>
                            <input type="text" class="form-control" id="fechaAlta" name="fechaAlta" placeholder="Fecha Alta">
                        </div>
                        <div class="form-group">
                            <label for="nick">Nick</label>
                            <input type="text" class="form-control" id="nick" name="nick" placeholder="Nick">
                        </div>   
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="editar">Guardar</button>
            </div>
        </div>
    </div>    
</div>    
