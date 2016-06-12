<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<display:table name="lista" pagesize="0" requestURI="${listar}" uid="row">
    <display:setProperty name="basic.msg.empty_list" ><p id="notificacion">No hay Insumos que cumplan con la condicion de busqueda.</p></display:setProperty>
    <display:column property="nombre" title="Nombre"/>            
    <display:column property="categoriaInsumo.nombre" title="Categoria"/>            
    <display:column property="unidadMedida" title="Unidad de Medida"/>
    <display:column property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" />
    <display:column property="stock.cantidadActual" title="Cantidad Actual"/>            
    <display:column property="stock.cantidadMinima" title="Cantidad Mínima"/>            
    <display:column title="Agregar">
          <button id="<s:property value="%{#attr.row.id}"/>" class="btn btn-info"><i class="fa fa-arrow-down"></i></button> 
    </display:column>
</display:table>