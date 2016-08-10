<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>



<div class="row">
    <div class="col-xs-10 text-left">
        <h2 class="pull-left">Listado de Usuarios</h2>
    </div>
    <div class="col-xs-2 text-right">
        <br />
        <a class="btn btn-default text-right"><i class="fa fa-print"></i></a>
    </div>
</div>
<hr />
<div class="panel">
    <div class="panel-body">
        <div class="row">
            <s:form action="listar" namespace="/usuario" id="formulario-buscar">
                <div class="form-group col-xs-12 col-sm-3">
                    <label for="nombre" class="control-label">Nombre</label>
                    <input value='<s:property value="nombreFiltro"/>'  type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre" maxlenght="100" autocomplete="off" autofocus="autofocus" />
                </div>
                <div class="form-group col-xs-12 col-sm-3">
                    <label for="apellido" class="control-label">Apellido</label>
                    <input value='<s:property value="apellidoFiltro"/>' type="text" class="form-control" id="apellido" name="apellidoFiltro" placeholder="Apellido" maxlenght="100" autocomplete="off"/>
                </div>
                <div class="form-group col-xs-12 col-sm-4">
                    <label class="control-label" for="rolesSeleccionados">Roles</label>
                    <select class="form-control selectpicker show-tick show-menu-arrow" id="rolesSeleccionados" name="rolesSeleccionados" multiple title="Selecciona uno o mas roles..." data-selected-text-format="count > 3" data-actions-box="true" >
                        <s:iterator var="cadaRol" value="rolesTodos">
                            <option <s:if test="%{#cadaRol in rolesSeleccionados}"> selected</s:if> value='<s:property value="%{#cadaRol}"/>'>
                                <s:property value="%{#cadaRol}" /> 
                            </option>
                        </s:iterator>
                    </select>
                </div>
                <div class="col-xs-12 col-sm-2 text-right">
                    <button type="submit" class="btn btn-inline btn-ruhaj">
                        Buscar
                        <i class="fa fa-search fa-fw"></i>
                    </button>
                </div>
            </s:form>
        </div>
    </div>
</div>
<display:table name="lista" pagesize="10" requestURI="${listar}" uid="row"  sort="list" keepStatus="true">
    <display:setProperty name="basic.msg.empty_list" >
        <div class="col-xs-12 well text-center">
            <p>
                <i class="fa fa-filter fa-lg"></i>
                No se encontraron Usuarios  que coincidan con tu busqueda.
            </p>
        </div>
    </display:setProperty>
    <display:column sortable="true" property="nombre" title="Nombre" maxLength="40"/>
    <display:column sortable="true" property="apellido" title="Apellido" maxLength="40"/>
    <display:column sortable="true" property="roles" title="Roles Asignados" class="visible-lg" decorator="Decorator.RolDecorator" headerClass="col-lg-3 visible-lg"/>
    <display:column sortable="true" property="nick" title="Nombre de Usuario" class="visible-lg" headerClass="visible-lg" maxLength="40"/>
    <display:column sortable="true" property="telefono" title="Teléfono" class="hidden-xs hidden-sm" headerClass="hidden-xs hidden-sm" />
    <display:column sortable="true" property="fechaAlta" title="Fecha de Alta" class="text-center-all hidden-xs" decorator="Decorator.DateDecorator" headerClass="hidden-xs"/>
    <display:column sortable="true" property="fechaBaja" title="Fecha de Baja" class="text-center-all hidden-xs" decorator="Decorator.DateDecorator" headerClass="hidden-xs"/>
    <display:column title="Acciones" class="col-xs-6 col-sm-3 col-lg-2 text-center-all">
        <div class="acciones">
            <s:hidden class="model-id" value="%{#attr.row.id}"/>
            <div class="btn-group">
                <button class="btn btn-sm btn-default mostrar-modal-ver-usuario" title="Ver Usuario" data-toggle="tooltip">
                    <i class="fa fa-eye"></i>
                </button>
                <s:if test="(#attr.row.fechaBaja == null)">
                    <button class="btn btn-sm btn-warning mostrar-modal-modificar-usuario" title="Modificar Usuario" data-toggle="tooltip">
                        <i class="fa fa-pencil"></i>
                    </button>
                    <button class="btn btn-sm btn-info mostrar-modal-reiniciar-contraseña" title="Reiniciar Contraseña" data-toggle="tooltip">
                        <i class="fa fa-repeat"></i>
                    </button>
                </s:if>
                <s:if test="(#attr.row.fechaBaja == null)">
                    <button class="btn btn-sm btn-danger mostrar-modal-baja-usuario" title="Dar de Baja Usuario" data-toggle="tooltip">
                        <i class="fa fa-ban"></i>
                    </button>
                </s:if>
                <s:else>
                    <button class="btn btn-sm btn-success mostrar-modal-recuperar-usuario" title="Reactivar Usuario" data-toggle="tooltip">
                        <i class="fa fa-check-circle"></i>
                    </button>
                </s:else>
            </div>
        </div>
    </display:column>
</display:table>

<s:include value="/WEB-INF/usuario/modalVer.jsp"/>
<s:include value="/WEB-INF/usuario/modalModificacion.jsp"/>
<s:set var="objeto" value="#application.mensaje.USUARIO"/>
<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-baja-usuario</s:param>
    <s:param name="titulo">Dar de Baja <s:property value="#objeto"/></s:param>
    <s:param name="mensaje"><s:property value="#application.mensaje.getPreguntaDarBajaEl(#objeto)"/></s:param>
    <s:param name="modelo">usuario</s:param>
</s:include>
<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-recuperar-usuario</s:param>
    <s:param name="titulo">Recuperar <s:property value="#objeto"/></s:param>
    <s:param name="mensaje"><s:property value='#application.mensaje.getPreguntaRecuperarEl(#objeto)'/></s:param>
    <s:param name="modelo">usuario</s:param>
</s:include>
<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-reiniciar-contraseña</s:param>
    <s:param name="titulo">Reiniciar Contraseña del <s:property value="#objeto"/></s:param>
    <s:param name="mensaje">¿Estás seguro de que quieres reiniciar la contraseña de este usuario?</s:param>
    <s:param name="modelo">usuario</s:param>
</s:include>