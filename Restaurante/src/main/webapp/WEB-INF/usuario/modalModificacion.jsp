<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-modificar-usuario" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-center modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Editar Usuario</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12">
                        <p><strong>NOTA:</strong> Los campos marcados con (*) son obligatorios y por lo tanto deben ser completados.</p>
                    </div>
                </div>
                <br />
                <div class="row">
                    <form id="modificar-usuario-form">
                        <div class="col-xs-12 col-md-6">
                            <input type="hidden" id="id" name="id">
                            <div class="form-group">
                                <label class="control-label" for="nombre">Nombre *</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="apellido">Appelido *</label>
                                <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="documento">Documento *</label>
                                <input type="number" class="form-control" id="documento" min="5000000" max="9999999999" name="documento" placeholder="documento">
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
                                <label class="control-label" for="fechaAlta">Fecha Alta</label>
                                <input type="text" class="form-control" id="fechaAlta" name="fechaAlta" placeholder="Fecha Alta" disabled>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="nick">Nombre de Usuario *</label>
                                <input type="text" class="form-control" id="nick" name="nick" placeholder="Nombre de Usuario">
                            </div>
                            <s:include value="/WEB-INF/rol/roles.jsp"/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-xs-6 text-left">
                        <button type="button" class="btn btn-default pull-left cancelar" data-dismiss="modal">Cancelar</button>
                    </div>
                    <div class="col-xs-6 text-right">
                        <button type="button" class="btn btn-ruhaj guardar">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
