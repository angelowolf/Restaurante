<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="form-group">   
    <h2 class="page-header">Usuarios</h2>
    <div class="panel panel-default">        
        <div class="panel-body">        
            <s:form class="form-inline" action="listar" namespace="/usuario" id="formulario-buscar">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <s:textfield type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre"/>
                </div>
                <div class="form-group">
                    <label for="nombre">Apellido</label>
                    <s:textfield type="text" class="form-control" id="apellido" name="apellidoFiltro" placeholder="Nombre"/>
                </div>
                <div class="form-group">
                    <label for="nombre">Roles</label>
                    <select id="rolesSeleccionados" name="rolesSeleccionados" multiple="multiple">    
                        <s:iterator var="cadaRol" value="rolesTodos">
                            <option <s:if test="%{#cadaRol in rolesSeleccionados}"> selected</s:if> value="<s:property value="%{#cadaRol}"/>">
                                <s:property value="%{#cadaRol}" /> 
                            </option>
                        </s:iterator>                     
                    </select>                    
                </div>
                <button type="submit" class="btn btn-info">Buscar</button>
            </s:form>
        </div>
    </div>
    <div class=" col-md-12">
        <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row">
            <display:setProperty name="basic.msg.empty_list" ><p id="notificacion">No se encontraron Usuarios.</p></display:setProperty>
            <display:column sortable="true" property="nombre" title="Nombre" class="col-md-1 text-center-all" headerClass="text-center-all"/>
            <display:column sortable="true" property="apellido" title="Apellido" class="col-md-1 text-center-all" headerClass="text-center-all"/>
            <display:column sortable="true" property="nick" title="Nombre de Usuario" class="col-md-1 text-center-all" headerClass="text-center-all"/>
            <display:column sortable="true" property="telefono" title="Teléfono de Contacto"  class="col-md-1 text-center-all"  headerClass="text-center-all"/>
            <display:column sortable="true" property="roles" title="Roles Asignados" decorator="Decorator.RolDecorator"  class="col-md-3 text-center-all" headerClass="text-center-all"/>            
            <display:column sortable="true" property="fechaAlta" title="Fecha de Alta" decorator="Decorator.DateDecorator"  class="col-md-1 text-center-all" headerClass="text-center-all"/>
            <display:column sortable="true" property="fechaBaja" title="Fecha de Baja" decorator="Decorator.DateDecorator"  class="col-md-1 text-center-all" headerClass="text-center-all"/>
            <display:column title="Acciones" class="col-md-2 text-center-all" headerClass="text-center-all">
                <div id="botones">
                    <s:hidden name="id" value="%{#attr.row.id}"/>
                    <button id="modalver" class="btn btn-info"><i class="fa fa-eye"></i></button>
                        <s:if test="(#attr.row.fechaBaja == null)">
                        <button id="modaleditar" class="btn btn-warning"><i class="fa fa-edit"></i></button>
                        <button id="modalblanquear" class="btn btn-default"><i class="fa fa-key"></i></button>
                        </s:if>
                        <s:if test="(#attr.row.fechaBaja == null)">
                        <button id="modaleliminar" class="btn btn-danger"><i class="fa fa-close"></i></button>                        
                        </s:if>
                        <s:else>
                        <button id="modalrecuperar" class="btn btn-success"><i class="fa fa-check-circle"></i></button>
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
<s:action name="modalrecuperar" namespace="/modal" executeResult="true">
    <s:param name="titulo"><%out.println(Soporte.Mensaje.USUARIO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaRecuperarEl(Soporte.Mensaje.USUARIO));%></s:param>
    <s:param name="modelo">usuario</s:param>
</s:action>
<s:action name="modalblanquear" namespace="/modal" executeResult="true">
    <s:param name="titulo"><%out.println(Soporte.Mensaje.USUARIO);%></s:param>
    <s:param name="mensaje">¿Está seguro de que quiere blanquear este usuario?</s:param>
    <s:param name="modelo">usuario</s:param>
</s:action>
<s:include value="/WEB-INF/usuario/modalModificacion.jsp"/>
<s:include value="/WEB-INF/usuario/modalVer.jsp"/>