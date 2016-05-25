<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <form class="form-inline">
                <div class="form-group">
                    <label for="categoria">Categoria</label>
                    <input type="text" class="form-control" id="categoria" name="categoria" placeholder="esto es un select">
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del insumo">
                </div>
                <button type="submit" class="btn btn-default btn-info">Buscar</button>
            </form>
        </div>
        <display:table name="lista" pagesize="0" requestURI="${listar}" uid="row">
            <display:setProperty name="basic.msg.empty_list" >No hay Insumos con stock debajo del mínimo.</display:setProperty>
            <display:column property="nombre" title="Nombre"/>            
            <display:column property="categoriaInsumo.nombre" title="Categoria"/>            
            <display:column property="unidadMedida" title="Unidad de Medida"/>
            <display:column property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" />
            <display:column property="stock.cantidadActual" title="Cantidad Actual"/>            
            <display:column property="stock.cantidadMinima" title="Cantidad Mínima"/>            
            <display:column title="Funciones">
                <div id="botones">
                    <s:hidden name="id" value="%{#attr.row.id}"/>
                    <input type="checkbox"> Agregar
                </div>
            </display:column>
        </display:table>
    </div>
    <hr>
    <div class="panel  panel-default">
        <div class="panel-heading">
            Insumos a Cargar
        </div>
        <table class="table table-striped table-bordered" id="row">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Categoria</th>
                    <th>Unidad de Medida</th>
                    <th>Precio por Unidad</th>
                    <th>Cantidad Actual</th>
                    <th>Cantidad Mínima</th>
                    <th>Cantidad a Comprar</th></tr>
            </thead>
        </table>
    </div>
      <div id="botones" class="pull-right">
        <button type="submit" id="registrar" class="btn btn-success">Registrar</button>
    </div>
</div>