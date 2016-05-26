<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="panel panel-default" id="contenedor">
    <div class="panel-heading">
        <form class="form-inline">
            <div class="form-group">
                <label for="categoria">Categoria</label>
                <s:select headerKey="-1" headerValue="Seleccione una categoria" list="categorias" id="categoria" name="categoria" listKey="id" listValue="nombre" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del insumo">
            </div>
        </form>
    </div>        
    <display:table name="lista" pagesize="0" requestURI="${listar}" uid="row">
        <display:setProperty name="basic.msg.empty_list" ><p id="notificacion">No se encontraron insumos por debajo del stock mínimo.</p></display:setProperty>
        <display:column property="nombre" title="Nombre"/>            
        <display:column property="categoriaInsumo.nombre" title="Categoria"/>            
        <display:column property="unidadMedida" title="Unidad de Medida"/>
        <display:column property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" />
        <display:column property="stock.cantidadActual" title="Cantidad Actual"/>            
        <display:column property="stock.cantidadMinima" title="Cantidad Mínima"/>            
        <display:column title="Agregar">
            <input type="checkbox" id="<s:property value="%{#attr.row.id}"/>" /> Agregar
        </display:column>
    </display:table>     
</div>
<hr>
<div class="panel  panel-default">
    <div class="panel-heading">
        Insumos a Cargar
    </div>
    <form id="formulario-compra">
        <table class="table table-striped table-bordered" id="row2">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Categoria</th>
                    <th>Unidad de Medida</th>
                    <th>Precio por Unidad</th>
                    <th>Cantidad Actual</th>
                    <th>Cantidad Mínima</th>
                    <th>Cantidad Comprada</th>
                    <th>Precio Compra</th>
                    <th>Agregar</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </form>
</div>
<div id="botones" class="pull-right">
    <button type="submit" id="registrar" class="btn btn-success">Registrar</button>
</div>