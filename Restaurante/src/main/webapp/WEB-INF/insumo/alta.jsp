<%@taglib uri="/struts-tags" prefix="s"%>
<h2 class="page-header">Nuevo Insumo</h2>
<form class="well col-md-6 col-md-offset-3" id="formulario">
    <div class="form-group">
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
    </div>
    <div class="form-group">
        <label for="precioUnidad">Precio</label>
        <input type="number" class="form-control" id="precioUnidad" name="precioUnidad" placeholder="Precio por unidad">
    </div>
    <div class="form-group">
        <label for="categoria" name="categoria">Categoria de Insumo</label>
        <div class="form-group">
            <s:select headerKey="-1" headerValue="Seleccione una categoria" list="categorias" id="categoriaInsumo" name="categoriaInsumo.id" listKey="id" listValue="nombre" cssClass="form-control"/>
        </div>
    </div>
    <s:include value="/WEB-INF/unidadMedida/unidades.jsp"/>
    <div class="form-group">
        <label for="cantidadActual">Cantidad Actual</label>
        <input type="number" class="form-control" id="cantidadActual" name="stock.cantidadActual" placeholder="Cantidad actual">
    </div>
    <div class="form-group">
        <label for="cantidadMinima">Cantidad Mínima</label>
        <input type="number" class="form-control" id="cantidadMinima" name="stock.cantidadMinima" placeholder="Cantidad mínima">
    </div>
    <div id="botones" class="pull-right">
        <button type="submit" id="cancelar" class="btn btn-danger">Cancelar</button>
        <button type="submit" id="registrar" class="btn btn-success">Registrar</button>
    </div>
</form>           