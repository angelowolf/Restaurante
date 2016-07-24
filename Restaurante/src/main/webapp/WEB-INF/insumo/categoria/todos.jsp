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
            <div class="col-xs-12">
                <s:form class="form-inline" action="listar" namespace="/insumo/categoria" id="formulario-buscar">
                    <div class="form-group">
                        <label for="nombre" class="control-label">Nombre de Categoria</label>
                        <input type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre de Categoria" maxlength="100" autocomplete="off" autofocus="autofocus" />
                    </div>
                    <button type="submit" class="btn btn-ruhaj pull-right">
                        Buscar
                        <i class="fa fa-search fa-fw"></i>
                    </button>
                </s:form>
            </div>
        </div>
    </div>
</div>
<div class="table-responsive">
    <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row">
        <display:setProperty name="basic.msg.empty_list" >
            <p id="notificacion">No se encontraron Categorias.</p>
        </display:setProperty>

        <display:column sortable="true" property="nombre" title="Nombre" class="text-center-all" decorator="Decorator.LimitadorCaracteresDecorator" headerClass="table-header-ruhaj"/>
        <display:column property="descripcion" title="Descripción" class="text-center-all" decorator="Decorator.LimitadorCaracteresDecorator" headerClass="table-header-ruhaj"/>
        <display:column title="Acciones" class="text-center-all" headerClass="table-header-ruhaj">
            <div class="acciones">
                <s:hidden class="model-id" value="%{#attr.row.id}"/>
                <div class="btn-group">
                    <button class="btn btn-sm btn-default mostrar-modal-ver-categoria" title="Ver Categoria" data-toggle="tooltip">
                        <i class="fa fa-eye"></i>
                    </button>
                    <button class="btn btn-sm btn-warning mostrar-modal-modificar-categoria" title="Editar Categoria" data-toggle="tooltip">
                        <i class="fa fa-pencil"></i>
                    </button>
                    <button class="btn btn-sm btn-danger mostrar-modal-eliminar-categoria" title="Eliminar Categoria" data-toggle="tooltip">
                        <i class="fa fa-trash"></i>
                    </button>
                </div>
            </div>
        </display:column>
    </display:table>
</div>
<s:include value="/WEB-INF/insumo/categoria/modalModificacion.jsp"/>
<s:include value="/WEB-INF/insumo/categoria/modalVer.jsp"/>

<s:action name="modal" namespace="/modal" executeResult="true">
    <s:param name="modalId">modal-eliminar-categoria</s:param>
    <s:param name="titulo">Eliminar <%out.println(Soporte.Mensaje.CATEGORIAINSUMO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaEliminarLa(Soporte.Mensaje.CATEGORIAINSUMO));%></s:param>
    <s:param name="modelo">categoria</s:param>
</s:action>