<div class="modal fade" id="modal-editar" tabindex="-1" role="dialog" aria-labelledby="Editar" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Editar usuario</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form id="form-editar" class="well">
                        <input type="hidden" id="id" name="id">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label for="apellido">Appelido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
                        </div>
                        <div class="form-group">
                            <label for="rol">Rol</label>
                            <select class="form-control" id="rol" name="rol">
                                <option>Mozo</option>
                                <option>Administrador</option>
                                <option>Barra</option>            
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="nick">Nick</label>
                            <input type="text" class="form-control" id="nick" name="nick" placeholder="Nick">
                        </div>
                        <div class="form-group">
                            <label for="clave">Clave</label>
                            <input type="password" class="form-control" id="clave" name="clave" placeholder="Clave" data-toggle="tooltip" data-placement="left" title="Si deja en blanco no cambiará la clave">
                        </div>
                        <div class="form-group">
                            <label for="clave">Repita la clave</label>
                            <input type="password" class="form-control" id="clave2" name="clave2" placeholder="Repita la clave">
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="editar">Guardar</button>
            </div>
        </div>
    </div>    
</div>    
