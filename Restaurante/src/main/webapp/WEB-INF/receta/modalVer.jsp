<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-ver-receta" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Receta</h4>
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
                        <strong>Fecha de Alta:</strong> <p id="fechaAlta"></p>
                    </div>
                    <div class="col-xs-12 text-inline">
                        <strong>Fecha de Baja:</strong> <p id="fechaBaja"></p>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-xs-12">
                        <h4>Recetas Incluídas</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="table-responsive">
                        <table class="table table-striped table-condensed">
                            <thead>
                                <tr>
                                    <th class="table-header-ruhaj">Nombre</th>
                                    <th class="table-header-ruhaj">Es Opcional?</th>
                                </tr>
                            </thead>
                            <tbody id="ver-detalle-recetas">
                                <tr class="empty well">
                                    <td class="text-center-all" colspan="5">Aun no se han incluído recetas en esta receta</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-xs-12">
                        <h4>Insumos</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="table-responsive">
                        <table class="table table-striped table-condensed">
                            <thead>
                                <tr>
                                    <th class="table-header-ruhaj">Nombre</th>
                                    <th class="table-header-ruhaj">Cantidad a Utilizar</th>
                                    <th class="table-header-ruhaj">Unidad de Medida</th>
                                    <th class="table-header-ruhaj">Es Opcional?</th>
                                </tr>
                            </thead>
                            <tbody id="ver-detalle-ingredientes">
                                <tr class="empty well">
                                    <td class="text-center-all" colspan="5">Aun no se han agregado insumos a esta receta</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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