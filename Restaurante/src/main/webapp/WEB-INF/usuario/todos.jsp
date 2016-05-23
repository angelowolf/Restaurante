<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="form-group">   
    <s:action name="mensajeAlerta" namespace="/modal" executeResult="true">
        <s:param name="tipo"><%out.println(Soporte.Mensaje.TIPOINFO);%></s:param>
    </s:action>
    <h2 class="page-header">Usuarios</h2>
    <div class=" col-md-12">
        <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row">
            <display:setProperty name="basic.msg.empty_list" >Aún no hay usuarios registrados. Puede crear uno desde <a href="<s:url action='nuevo' namespace='/usuario'/>">aquí</a>.</display:setProperty>
            <display:column sortable="true" property="nombre" title="Nombre"/>
            <display:column sortable="true" property="apellido" title="Apellido"/>
            <display:column sortable="true" property="nick" title="Nombre de Usuario"/>
            <display:column sortable="true" property="telefono" title="Teléfono de Contacto"/>
            <display:column sortable="true" property="roles" title="Roles Asignados" decorator="Decorator.RolDecorator"/>            
            <display:column sortable="true" property="fechaAlta" title="Fecha de Alta" decorator="Decorator.DateDecorator"/>
            <display:column sortable="true" property="fechaBaja" title="Fecha de Baja" decorator="Decorator.DateDecorator"/>
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
    <s:param name="titulo"><%out.println(Soporte.Mensaje.USUARIO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaEliminarEl(Soporte.Mensaje.USUARIO));%></s:param>
    <s:param name="modelo">usuario</s:param>
</s:action>
<s:include value="/WEB-INF/usuario/modalModificacion.jsp"/>