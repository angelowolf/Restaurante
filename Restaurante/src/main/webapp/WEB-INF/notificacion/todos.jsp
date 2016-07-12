<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="form-group">   
    <h2 class="page-header">Notificaciones</h2>
    <div class=" col-md-12">
        <s:form id="seleccion" action="/informe/ver">
            <display:table name="lista" pagesize="20" requestURI="${listar}" uid="row">
                <display:setProperty name="basic.msg.empty_list" ><p id="notificacion">No se encontraron Notificaciones.</p></display:setProperty>
                <display:column title="<input id='check-todos' type='checkbox'/> <div class='btn-group'><button class='btn btn-xs btn-info' id='ver-seleccion'><i class='fa fa-check'></i></button><button class='btn btn-xs btn-danger' id='eliminar-seleccion'><i class='fa fa-trash'></i></button></div>" headerClass="text-center-all" class="text-center-all">
                    <input type="checkbox" name="ids" value='<s:property value="%{#attr.row.id}"/>'>
                </display:column>
                <display:column sortable="true" property="mensaje" title="Mensaje" class="text-center-all" headerClass="text-center-all"/>            
                <display:column sortable="true" property="visto" title="Vista" decorator="Decorator.NotificacionVistaDecorator" class="text-center-all" headerClass="text-center-all"/>
                <display:column sortable="true" property="fecha" title="Fecha" decorator="Decorator.DateTimeDecorator" class="text-center-all" headerClass="text-center-all"/>
                <display:column title="Acciones" class="text-center-all" headerClass="text-center-all">
                    <div id="botones">
                        <s:hidden id="id" value="%{#attr.row.id}"/>
                        <button id="ver" class="btn btn-primary"><i class="fa fa-search"></i></button>                        
                            <s:if test="(!#attr.row.visto)">
                            <button id="visto" class="btn btn-info  "><i class="fa fa-eye"></i></button>
                            </s:if>
                        <button id="modaleliminar" class="btn btn-danger"><i class="fa fa-close"></i></button>                        
                    </div>
                </display:column>
            </display:table>
        </s:form>
    </div>
</div>
<s:action name="modaleliminar" namespace="/modal" executeResult="true">
    <s:param name="titulo"><%out.println(Soporte.Mensaje.NOTIFICACION);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaEliminarLa(Soporte.Mensaje.NOTIFICACION));%></s:param>
    <s:param name="modelo">notificacion</s:param>
</s:action>