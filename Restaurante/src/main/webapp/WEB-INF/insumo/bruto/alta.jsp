<%@taglib uri="/struts-tags" prefix="s"%>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-xs-12">
    <div class="panel panel-ruhaj">
        <form id="alta-insumo-bruto-form" autocomplete="off">
            <div class="panel-heading">
                <h3 class="panel-title">Nuevo Insumo Bruto</h3>
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
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" maxlength="100" autofocus="autofocus">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label for="categoria" name="categoria">Categoría de Insumo *</label>
                            <div class="form-group">
                                <s:select headerKey="-1" headerValue="Selecciona una Categoría" list="categorias" id="categoriaInsumo" name="categoriaInsumo.id" listKey="id" listValue="nombre" cssClass="form-control selectpicker show-tick show-menu-arrow"/>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <s:include value="/WEB-INF/unidadMedida/unidades.jsp"/>
                        <div class="form-group">
                            <label for="precioUnidad">Precio por Unidad *</label>
                            <input type="text" class="form-control numeric" id="precioUnidad" name="precioUnidad" placeholder="Precio por unidad" maxlength="5">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label for="cantidadActual">Cantidad Actual *</label>
                            <input type="text" class="form-control numeric-nodot" id="cantidadActual" name="stock.cantidadActual" placeholder="Cantidad actual" maxlength="5">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label for="cantidadMinima">Cantidad Mínima *</label>
                            <input type="text" class="form-control numeric-nodot" id="cantidadMinima" name="stock.cantidadMinima" placeholder="Cantidad mínima" maxlength="5">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="fechaAlta">Fecha Alta</label>
                            <input type="text" class="form-control" id="fechaAlta" disabled tabindex="-1">
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-xs-6 text-left">
                        <a href="/insumobruto/listar" class="btn btn-default cancelar">
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