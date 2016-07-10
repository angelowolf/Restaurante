<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-confeccionar" tabindex="-1" role="dialog" aria-labelledby="Confeccionar" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Confeccionar Insumo</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form id="form-confeccionar" class="well" autocomplete='off'>
                        <input type="hidden" id="id" name="id">
                        <p id="nombre-insumo">

                        </p>
                        <p id="unidad-medida-insumo">

                        </p>
                        <p id="cantidad-actual-insumo">

                        </p>
                        <div class="form-group">
                            <label for="cantidadConfeccionarInsumo">Cantidad Elaborada</label>
                            <input class="form-control" type="number" min="0" id="cantidad-confeccionar-insumo" name="cantidadConfeccionarInsumo"/>
                        </div>
                    </form>
                    <div id="resultado">
                        
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" id="cancelarConfeccionar" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" id="confeccionar">Guardar</button>
            </div>
        </div>
    </div>    
</div>    
