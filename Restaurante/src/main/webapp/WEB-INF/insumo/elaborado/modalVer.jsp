<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-ver-insumo-elaborado" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Insumo Elaborado</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12 text-inline">
                        <strong>Nombre:</strong> <p id="nombre"></p>
                    </div>
                    <div class="col-xs-12 text-inline">
                        <strong>Categoría:</strong> <p id="categoria"></p>
                    </div>
                    <div class="col-xs-12 text-inline">
                        <strong>Unidad de Medida:</strong> <p id="unidadMedida"></p>
                    </div>
                    <div class="col-xs-12 text-inline">
                        <strong>Cantidad Actual:</strong> <p id="cantidadActual"></p>
                    </div>
                    <div class="col-xs-12 text-inline">
                        <strong>Cantidad Minima:</strong> <p id="cantidadMinima"></p>
                    </div>
                    <div class="col-xs-12 text-inline">
                        <strong>Fecha de Alta:</strong> <p id="fechaAlta"></p>
                    </div>
                    <div class="col-xs-12 text-inline">
                        <strong>Fecha de Baja:</strong> <p id="fechaBaja"></p>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-xs-12">
                        <h4>Ingredientes</h4>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-ruhaj table-striped table-condensed">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Cantidad a Utilizar</th>
                                <th>Unidad de Medida</th>
                            </tr>
                        </thead>
                        <tbody id="ver-detalle-insumo-elaborado">
                            <tr class="empty well">
                                <td class="text-center-all" colspan="5">Aun no se han agregado insumos brutos a este insumo elaborado</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-ruhaj pull-right" data-dismiss="modal">
                    Aceptar
                </button>
            </div>
        </div>
    </div>
</div>
