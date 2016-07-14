<div class="panel panel-default">        
    <div class="panel-body">        
        <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" id="nombre-ac"  placeholder="Nombre del insumo">
        </div>
    </div>
    <form id="detalleElaborado" autocomplete='off'>
        <table class="table table-striped table-bordered" id="tabla-detalleElaborados">
            <thead>
                <tr>
                    <th class="text-center-all">Nombre</th>
                    <th class="text-center-all">Unidad de Medida</th>
                    <th class="text-center-all">Cantidad Actual</th>
                    <th class="text-center-all">Cantidad a Utilizar</th>
                    <th class="text-center-all">Quitar</th>
                </tr>
            </thead>
            <tbody id="table-body">
            </tbody>
        </table>
    </form>
</div>