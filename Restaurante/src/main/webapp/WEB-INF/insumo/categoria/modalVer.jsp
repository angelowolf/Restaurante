<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-ver" tabindex="-1" role="dialog" aria-labelledby="Editar" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Categoría Insumo</h4>
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
                            <label for="descrpcion">Descripción</label>
                            <textarea class="form-control" id="descripcion" name="descripcion" readonly="true"></textarea>
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
