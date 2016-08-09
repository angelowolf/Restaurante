<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-modificar-receta" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <form id="modificar-receta-form">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Modificar Receta</h4>
            </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <p><strong>NOTA:</strong> Los campos marcados con (*) son obligatorios y por lo tanto deben ser completados.</p>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-xs-12">
                            <input type="hidden" id="id" name="id">
                            <div class="form-group">
                                <label for="nombre">Nombre *</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="categoria" name="categoria">Categoria de Receta *</label>
                                <s:select headerKey="-1" headerValue="Selecciona una Categoría" list="categorias" id="categoriaReceta" name="categoriaReceta.id" listKey="id" listValue="nombre" cssClass="form-control selectpicker show-tick show-menu-arrow"/>
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>
                    <s:include value="/WEB-INF/receta/detalleRecetas.jsp"/>
                    <s:include value="/WEB-INF/receta/detalleIngredientes.jsp"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">
                        Cancelar
                    </button>
                    <button type="submit" class="btn btn-ruhaj">
                        Aceptar
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
