<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="form-group">   
    <s:action name="mensajeAlerta" namespace="/modal" executeResult="true">
        <s:param name="tipo"><%out.println(Soporte.Mensaje.TIPOINFO);%></s:param>
    </s:action>
    <h2 class="page-header">Insumos</h2>
    <div class=" col-md-12">
        <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row">
            <display:setProperty name="basic.msg.empty_list" >Aún no hay insumos registrados. Puede crear uno desde <a href="<s:url action='nuevo' namespace='/insumo'/>">aquí</a>.</display:setProperty>
            <display:column sortable="true" property="nombre" title="Nombre"/>            
            <display:column sortable="true" property="categoriaInsumo.nombre" title="Categoria"/>            
            <display:column sortable="true" property="unidadMedida" title="Unidad de Medida"/>
            <display:column property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" />
            <display:column sortable="true" property="stock.cantidadActual" title="Cantidad Actual"/>            
            <display:column sortable="true" property="stock.cantidadMinima" title="Cantidad Mínima"/>            
            <display:column sortable="true" property="fechaAlta" title="Fecha de alta" decorator="Decorator.DateDecorator"/>
            <display:column sortable="true" property="fechaBaja" title="Fecha de baja" decorator="Decorator.DateDecorator"/>
            <display:column title="Funciones">
                <div id="botones">
                    <s:hidden name="id" value="%{#attr.row.id}"/>
                    <button id="modaleditar" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></button>
                        <s:if test="(#attr.row.fechaBaja == null)">
                        <button id="modaleliminar" class="btn btn-sm btn-danger"><i class="fa fa-close"></i></button>                        
                        </s:if>
                        <s:else>
                        <button id="recuperar" class="btn btn-sm btn-success"><i class="fa fa-check-circle"></i></button>
                        </s:else>
                </div>
            </display:column>
        </display:table>
    </div>
</div>
<s:action name="modaleliminar" namespace="/modal" executeResult="true">
    <s:param name="titulo"><%out.println(Soporte.Mensaje.INSUMO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaEliminarEl(Soporte.Mensaje.INSUMO));%></s:param>
    <s:param name="modelo">insumo</s:param>
</s:action>
<s:include value="/WEB-INF/insumo/modalModificacion.jsp"/>