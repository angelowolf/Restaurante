<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-xs-10 text-left">
        <h2 class="pull-left">Listado de Recetas</h2>
    </div>
    <div class="col-xs-2 text-right">
        <br />
        <a class="btn btn-default" data-toggle="tooltip" title="Imprimir Listado" data-placement="left">
            <i class="fa fa-print"></i>
        </a>
    </div>
</div>
<hr />
<div class="panel">
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-12">
                <s:form class="row" action="listar" namespace="/receta" id="formulario-buscar">
                    <div class="form-group col-xs-12 col-sm-4">
                        <label for="nombre" class="control-label">Nombre de Receta</label>
                        <input value='<s:property value="nombreFiltro"/>' type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre de Receta" autocomplete='off' autofocus="autofocus" />
                    </div>
                    <div class="form-group col-xs-12 col-sm-4">
                        <label for="categoria" name="categoria">Categoria de Receta</label>
                            <s:select headerKey="-1" headerValue="Selecciona una Categoría" list="categorias" id="categoriaRecetaFiltro" name="categoriaRecetaFiltro" listKey="id" listValue="nombre" cssClass="form-control selectpicker show-tick show-menu-arrow" value="categoriaRecetaFiltro"/>
                    </div>
                    <div class="col-xs-12 col-sm-4 text-right">
                        <button type="submit" class="btn btn-inline btn-ruhaj">
                            Buscar
                            <i class="fa fa-search fa-fw"></i>
                        </button>
                    </div>
                </s:form>
            </div>
        </div>
    </div>
</div>
<div class="table-responsive">
    <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row" sort="list"  keepStatus="true">
        <display:setProperty name="basic.msg.empty_list" >
            <div class="col-xs-12 well text-center">
                <p>
                    <i class="fa fa-filter fa-lg"></i>
                    No se encontraron Recetas que coincidan con tu busqueda.
                </p>
            </div>
        </display:setProperty>
        <display:column sortable="true" property="nombre" title="Nombre" class="text-center-vertical"/>
        <display:column sortable="true" property="categoriaReceta.nombre" title="Categoria" class="text-center-vertical hidden-xs" headerClass="table-header-ruhaj hidden-xs"/>
        <display:column sortable="true" property="fechaAlta" title="Fecha de Alta" decorator="Decorator.DateTimeDecorator" class="text-center-all hidden-xs" headerClass="table-header-ruhaj hidden-xs"/>
        <display:column sortable="true" property="fechaBaja" title="Fecha de Baja" decorator="Decorator.DateTimeDecorator" class="text-center-all hidden-xs" headerClass="table-header-ruhaj hidden-xs"/>
        <display:column title="Acciones" class="col-xs-4 col-sm-2 text-center-all">
            <div class="acciones">
                <s:hidden class="model-id" value="%{#attr.row.id}"/>
                <div class="btn-group">
                    <button id="modalver" class="btn btn-sm btn-default mostrar-modal-ver-receta" data-toggle="tooltip" title="Ver Receta">
                        <i class="fa fa-eye"></i>
                    </button>
                    <s:if test="(#attr.row.fechaBaja == null)">
                        <button class="btn btn-sm btn-warning mostrar-modal-modificar-receta" data-toggle="tooltip" title="Modificar Receta">
                            <i class="fa fa-pencil"></i>
                        </button>
                    </s:if>
                    <s:if test="(#attr.row.fechaBaja == null)">
                        <button class="btn btn-sm btn-danger mostrar-modal-baja-receta" data-toggle="tooltip" title="Dar de Baja Receta">
                            <i class="fa fa-ban"></i>
                        </button>
                    </s:if>
                    <s:else>
                        <button class="btn btn-sm btn-success mostrar-modal-recuperar-receta" data-toggle="tooltip" title="Recuperar Receta">
                            <i class="fa fa-check-circle"></i>
                        </button>
                    </s:else>
                </div>
            </div>
        </display:column>
    </display:table>
</div>

<s:include value="/WEB-INF/receta/modalModificacion.jsp"/>
<s:include value="/WEB-INF/receta/modalVer.jsp"/>

<s:set var="objeto" value="#application.mensaje.RECETA"/>

<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-baja-receta</s:param>
    <s:param name="titulo">Dar de Baja <s:property value="#objeto"/></s:param>
    <s:param name="mensaje"><s:property value="#application.mensaje.getPreguntaDarBajaLa(#objeto)"/></s:param>
    <s:param name="modelo">receta</s:param>
</s:include>
<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-recuperar-receta</s:param>
    <s:param name="titulo">Recuperar <s:property value="#objeto"/></s:param>
    <s:param name="mensaje"><s:property value='#application.mensaje.getPreguntaRecuperarLa(#objeto)'/></s:param>
    <s:param name="modelo">receta</s:param>
</s:include>