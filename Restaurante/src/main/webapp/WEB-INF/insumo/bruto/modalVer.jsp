<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-ver" tabindex="-1" role="dialog" aria-labelledby="Editar" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Insumo</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form id="form-ver" class="well">
                        <input type="hidden" id="id" name="id">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="precioUnidad">Precio</label>
                            <input type="number" class="form-control" id="precioUnidad" name="precioUnidad" placeholder="Precio por unidad" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="categoria" name="categoria">Categoria de Insumo</label>
                            <input type="text" class="form-control" id="categoria" name="categoria" placeholder="Categoria" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="unidad" name="unidad">Unidad de Medida</label>
                            <input type="text" class="form-control" id="unidadMedida" name="unidadMedida" placeholder="Unidad de Medida" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="cantidadActual">Cantidad Actual</label>
                            <input type="number" class="form-control" id="cantidadActual" name="cantidadActual" placeholder="Cantidad actual" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="cantidadMinima">Cantidad Mínima</label>
                            <input type="number" class="form-control" id="cantidadMinima" name="cantidadMinima" placeholder="Cantidad mínima" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="fechaAlta">Fecha de Alta</label>
                            <input type="text" class="form-control" id="fechaAlta" name="fechaAlta" placeholder="Fecha de Alta" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="fechaBaja">Fecha de Baja</label>
                            <input type="text" class="form-control" id="fechaBaja" name="fechaBaja" placeholder="Insumo Activo" readonly="true">
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
