<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="panel panel-default" id="contenedor">
    <div class="panel-heading">
        <form class="form-inline">
            <div class="form-group">
                <label for="categoria">Categoria</label>
                <s:select headerKey="-1" headerValue="Todas" list="categorias" id="categoria" name="categoria" listKey="id" listValue="nombre" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del insumo">
            </div>
            <button type="submit" class="btn btn-info">Agregar</button>
        </form>
    </div>  
    <div class="panel-body">

        <form>
            <display:table name="lista" pagesize="0" requestURI="${listar}" uid="row">
                <display:setProperty name="basic.msg.empty_list" ><p id="notificacion">No se encontraron insumos por debajo del stock mínimo.</p></display:setProperty>
                <display:column property="nombre" title="Nombre" class="text-center-all" headerClass="text-center-all"/>            
                <display:column property="categoriaInsumo.nombre" title="Categoria" class=" text-center-all" headerClass="text-center-all"/>            
                <display:column property="unidadMedida" title="Unidad de Medida" class="text-center-all" headerClass="text-center-all"/>
                <display:column property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" class="text-center-all" headerClass="text-center-all"/>
                <display:column property="stock.cantidadActual" title="Cantidad Actual" class="text-center-all" headerClass="text-center-all"/>            
                <display:column property="stock.cantidadMinima" title="Cantidad Mínima" class="text-center-all" headerClass="text-center-all"/>            
                <display:column title="Cantidad a Comprar" class="text-center-all" headerClass="text-center-all">
                    <div class="form-group">
                        <input type="number" class="form-control" id="cantidad" name="cantidad" placeholder="Cantidad a comprar">
                    </div>
                </display:column>
                <display:column title="Quitar" class="text-center-all" headerClass="text-center-all">
                    <button id="quitar" class="btn btn-danger"><i class="fa fa-close"></i></button>            
                    </display:column>
                </display:table>     
            <div id="botones" class="pull-right">
                <button type="submit" id="cancelar" class="btn btn-danger">Cancelar</button>
                <button type="submit" id="imprimir" class="btn btn-success">Imprimir</button>
            </div>
        </form>
    </div>
</div>