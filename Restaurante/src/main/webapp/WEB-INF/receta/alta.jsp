<%@taglib uri="/struts-tags" prefix="s"%>

<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-xs-12">
    <div class="panel panel-ruhaj">
        <form id="alta-receta-form" autocomplete="off">
            <div class="panel-heading">
                <h3 class="panel-title">Nueva Elaboración</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12">
                        <p><strong>NOTA:</strong> Los campos marcados con (*) son obligatorios y por lo tanto deben ser completados.</p>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label for="nombre">Nombre *</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre de Receta" maxlength="100" autofocus="autofocus">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label for="categoria" name="categoria">Categoria de Insumo *</label>
                            <s:select headerKey="-1" headerValue="Selecciona una Categoría" list="categorias" id="categoriaReceta" name="categoriaReceta.id" listKey="id" listValue="nombre" cssClass="form-control selectpicker show-tick show-menu-arrow"/>
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="fechaAlta">Fecha Alta</label>
                            <input type="text" class="form-control" id="fechaAlta" disabled tabindex="-1">
                        </div>
                    </div>
                </div>
                <s:include value="/WEB-INF/receta/detalleRecetas.jsp"/>
                <s:include value="/WEB-INF/receta/detalleIngredientes.jsp"/>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-xs-6 text-left">
                        <a href="/receta/listar" class="btn btn-default cancelar">
                            Cancelar
                        </a>
                    </div>
                    <div class="col-xs-6 text-right">
                        <button class="btn btn-ruhaj confirmar" type="submit">
                            Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>