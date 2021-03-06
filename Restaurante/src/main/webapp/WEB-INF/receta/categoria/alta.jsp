<%@taglib uri="/struts-tags" prefix="s"%>
<div class="col-lg-offset-3 col-lg-6 col-sm-offset-2 col-sm-8 col-xs-12">
    <div class="panel panel-ruhaj">
        <div class="panel-heading">
            <h3 class="panel-title">Nueva Categoria de Receta</h3>
        </div>
        <form id="alta-categoria-receta-form" autocomplete="off">
            <div class="panel-body">
                <div class="form-group">
                    <label for="nombre" class="control-label">Nombre de Categoria *</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre de Categoria" maxlength="100"  autofocus="autofocus">
                    <span class="help-block"></span>
                </div>
                <div class="form-group">
                    <label for="descrpcion">Descripción de Categoria</label>
                    <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Descripcion de Categoria" maxlength="255"></textarea>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-xs-6 text-left">
                        <a href="/receta/categoria/listar" class="btn btn-default cancelar">
                            Cancelar
                        </a>
                    </div>
                    <div class="col-xs-6 text-right">
                        <button type="submit" class="btn btn-ruhaj confirmar">
                            Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
