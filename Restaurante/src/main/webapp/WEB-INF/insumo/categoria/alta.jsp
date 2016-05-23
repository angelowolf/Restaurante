<%@taglib uri="/struts-tags" prefix="s"%>
<h2 class="page-header">Nueva Categoria Insumo</h2>
<form class="well col-md-6 col-md-offset-3" id="formulario">
    <div class="form-group">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
    </div>
    <div class="form-group">
        <label for="descrpcion">Descripción</label>
        <textarea class="form-control" id="descripcion" name="descripcion"></textarea>
    </div>
    <div id="botones" class="pull-right">
        <button type="submit" id="cancelar" class="btn btn-danger">Cancelar</button>
        <button type="submit" id="registrar" class="btn btn-success">Registrar</button>
    </div>
</form>           