<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-xs-12">
        <h2>Listado de Categorías de Insumo</h2>
    </div>
</div>
<hr />
<div class="panel">
    <div class="panel-body">
        <div class="row">
            <s:form action="listar" namespace="/insumo/categoria" id="formulario-buscar">
                <div class="form-group col-xs-12 col-sm-6 col-md-4">
                    <label for="nombre" class="control-label">Nombre de Categoria</label>
                    <input value='<s:property value="nombreFiltro"/>' type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre de Categoria" maxlength="100" autocomplete="off" autofocus="autofocus" />
                </div>
                <div class="col-xs-12 col-sm-2 col-sm-offset-4 col-md-offset-6">
                    <button type="submit" class="btn btn-inline btn-ruhaj pull-right">
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
                No se encontraron Categorias  que coincidan con tu busqueda.
            </p>
        </div>
    </display:setProperty>
    <display:column sortable="true" property="nombre" title="Nombre" class="text-center-vertical" maxLength="40"/>
    <display:column property="descripcion" title="Descripción" class="text-center-vertical hidden-xs" headerClass="hidden-xs" />
    <display:column title="Acciones" class="col-xs-4 col-sm-2 text-center-all" >
        <div class="acciones">
            <s:hidden class="model-id" value="%{#attr.row.id}"/>
            <div class="btn-group">
                <button class="btn btn-sm btn-default mostrar-modal-ver-categoria-insumo" title="Ver Categoría" data-toggle="tooltip">
                    <i class="fa fa-eye"></i>
                </button>
                <button class="btn btn-sm btn-warning mostrar-modal-modificar-categoria-insumo" title="Editar Categoría" data-toggle="tooltip">
                    <i class="fa fa-pencil"></i>
                </button>
                <button class="btn btn-sm btn-danger mostrar-modal-eliminar-categoria-insumo" title="Eliminar Categoría" data-toggle="tooltip">
                    <i class="fa fa-trash"></i>
                </button>
            </div>
        </div>
    </display:column>
</display:table>

<s:include value="/WEB-INF/insumo/categoria/modalModificacion.jsp"/>
<s:include value="/WEB-INF/insumo/categoria/modalVer.jsp"/>
<s:set var="objeto" value="#application.mensaje.CATEGORIAINSUMO"/>
<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-eliminar-categoria-insumo</s:param>
    <s:param name="titulo">Eliminar <s:property value="#objeto"/></s:param>
    <s:param name="mensaje"><s:property value="#application.mensaje.getPreguntaEliminarLa(#objeto)"/></s:param>
    <s:param name="modelo">categoria</s:param>
</s:include>