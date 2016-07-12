<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="panel panel-ruhaj">
    <div class="panel-heading">
        <h3 class="panel-title">Listado de Usuarios</h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-12">
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
                        <label class="control-label" for="nombre">Roles</label>
                        <select class="selectpicker show-tick show-menu-arrow" id="rolesSeleccionados" name="rolesSeleccionados" multiple title="Selecciona uno o mas roles..." data-selected-text-format="count > 3" multiple data-actions-box="true">
                            <s:iterator var="cadaRol" value="rolesTodos">
                                <option <s:if test="%{#cadaRol in rolesSeleccionados}"> selected</s:if> value="<s:property value="%{#cadaRol}"/>">
                                    <s:property value="%{#cadaRol}" /> 
                                </option>
                            </s:iterator>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-ruhaj pull-right">Buscar</button>
                </s:form>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-xs-12 table-responsive">
                <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row">
                    <display:setProperty name="basic.msg.empty_list" >
                        <p id="notificacion">No se encontraron Usuarios.</p>
                    </display:setProperty>
                    <display:setProperty name="paging.banner.placement">bottom</display:setProperty>

                    <display:column sortable="true" property="nombre" title="Nombre" class="col-xs-1" headerClass="table-header-ruhaj"/>
                    <display:column sortable="true" property="apellido" title="Apellido" class="col-xs-1" headerClass="table-header-ruhaj"/>
                    <display:column sortable="true" property="nick" title="Nombre de Usuario" headerClass="table-header-ruhaj"/>
                    <display:column sortable="true" property="telefono" title="Teléfono de Contacto" headerClass="table-header-ruhaj"/>
                    <display:column sortable="true" property="roles" title="Roles Asignados" decorator="Decorator.RolDecorator" headerClass="table-header-ruhaj"/>
                    <display:column sortable="true" property="fechaAlta" title="Fecha de Alta" class="text-center" decorator="Decorator.DateDecorator" headerClass="table-header-ruhaj"/>
                    <display:column sortable="true" property="fechaBaja" title="Fecha de Baja" class="text-center" decorator="Decorator.DateDecorator" headerClass="table-header-ruhaj"/>
                    <display:column title="Acciones" class="col-xs-2 text-center" headerClass="table-header-ruhaj">
                        <div id="botones">
                            <s:hidden name="id" value="%{#attr.row.id}"/>
                            <button id="mostrar-modal-ver-usuario" class="btn btn-sm btn-default" title="Ver Usuario" data-toggle="tooltip">
                                <i class="fa fa-eye"></i>
                            </button>
                            <s:if test="(#attr.row.fechaBaja == null)">
                                <button id="mostrar-modal-modificar-usuario" class="btn btn-sm btn-warning" title="Modificar Usuario" data-toggle="tooltip">
                                    <i class="fa fa-pencil"></i>
                                </button>
                                <button id="mostrar-modal-reiniciar-contraseña" class="btn btn-sm btn-info" title="Reiniciar Contraseña" data-toggle="tooltip">
                                    <i class="fa fa-repeat"></i>
                                </button>
                            </s:if>
                            <s:if test="(#attr.row.fechaBaja == null)">
                                <button id="mostrar-modal-baja-usuario" class="btn btn-sm btn-danger" title="Dar de Baja Usuario" data-toggle="tooltip">
                                    <i class="fa fa-ban"></i>
                                </button>
                            </s:if>
                            <s:else>
                                <button id="mostrar-modal-recuperar-usuario" class="btn btn-sm btn-success" title="Reactivar Usuario" data-toggle="tooltip">
                                    <i class="fa fa-check-circle"></i>
                                </button>
                            </s:else>
                        </div>
                    </display:column>
                </display:table>
            </div>
        </div>
    </div>
</div>
<s:action name="modaleliminar" namespace="/modal" executeResult="true">
    <s:param name="titulo">Dar de Baja <%out.println(Soporte.Mensaje.USUARIO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaDarBajaEl(Soporte.Mensaje.USUARIO));%></s:param>
    <s:param name="modelo">usuario</s:param>
</s:action>
<s:action name="modalrecuperar" namespace="/modal" executeResult="true">
    <s:param name="titulo"><%out.println(Soporte.Mensaje.USUARIO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaRecuperarEl(Soporte.Mensaje.USUARIO));%></s:param>
    <s:param name="modelo">usuario</s:param>
</s:action>
<s:action name="modalblanquear" namespace="/modal" executeResult="true">
    <s:param name="titulo"><%out.println(Soporte.Mensaje.USUARIO);%></s:param>
    <s:param name="mensaje">¿Estás seguro de que quieres reiniciar la contraseña de este usuario?</s:param>
    <s:param name="modelo">usuario</s:param>
</s:action>
<s:include value="/WEB-INF/usuario/modalModificacion.jsp"/>
<s:include value="/WEB-INF/usuario/modalVer.jsp"/>