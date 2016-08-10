<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-xs-10 text-left">
        <h2 class="pull-left">Listado de Insumos Elaborados</h2>
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
            <s:form action="listar" namespace="/insumoelaborado" id="formulario-buscar">
                <div class="form-group col-xs-12 col-sm-6 col-md-3">
                    <label for="nombre" class="control-label">Nombre de Insumo Elaborado</label>
                    <input value='<s:property value="nombreFiltro"/>' type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre de Insumo Elaborado" autocomplete='off' autofocus="autofocus" />
                </div>
                <div class="col-xs-12 col-sm-3 col-sm-offset-3 col-md-2 col-md-offset-7 text-right">
                    <button type="submit" class="btn btn-inline btn-ruhaj">
                        Buscar
                        <i class="fa fa-search fa-fw"></i>
                    </button>
                </div>
            </s:form>
        </div>
    </div>
</div>
<display:table name="lista" pagesize="10" requestURI="${listar}" uid="row" sort="list"  keepStatus="true">
    <display:setProperty name="basic.msg.empty_list" >
        <div class="col-xs-12 well text-center">
            <p>
                <i class="fa fa-filter fa-lg"></i>
                No se encontraron Insumos Elaborados que coincidan con tu busqueda.
            </p>
        </div>
    </display:setProperty>
    <display:column sortable="true" property="nombre" title="Nombre" class="text-center-vertical" maxLength="40"/>
    <display:column sortable="true" property="categoriaInsumo.nombre" title="Categoria" class="text-center-all hidden-xs" headerClass="hidden-xs" maxLength="40"/>
    <display:column sortable="true" property="stock.cantidadActual" title="Cantidad en Stock" class="text-center-all hidden-xs" headerClass="hidden-xs"/>
    <display:column sortable="true" property="stock.cantidadMinima" title="Stock Mínimo" class="text-center-all hidden-xs hidden-sm" headerClass="hidden-xs hidden-sm"/>
    <display:column sortable="true" property="unidadMedida" title="Unidad de Medida" class="text-center-all hidden-xs hidden-sm" headerClass="hidden-xs hidden-sm"/>
    <display:column sortable="true" property="fechaAlta" title="Fecha de Alta" decorator="Decorator.DateDecorator" class="text-center-all hidden-xs" headerClass="hidden-xs"/>
    <display:column sortable="true" property="fechaBaja" title="Fecha de Baja" decorator="Decorator.DateDecorator" class="text-center-all hidden-xs" headerClass="hidden-xs"/>
    <display:column title="Acciones" class="col-xs-6 col-sm-2 text-center-all">
        <div class="acciones">
            <s:hidden class="model-id" value="%{#attr.row.id}"/>
            <div class="btn-group">
                <button id="modalver" class="btn btn-sm btn-default mostrar-modal-ver-insumo-elaborado" data-toggle="tooltip" title="Ver Insumo Elaborado">
                    <i class="fa fa-eye"></i>
                </button>
                <s:if test="(#attr.row.fechaBaja == null)">
                    <button  class="btn btn-sm btn-info mostrar-modal-confeccionar-insumo-elaborado" data-toggle="tooltip" title="Confeccionar Insumo Elaborado">
                        <i class="fa fa-adjust fa-rotate-90"></i>
                    </button>
                    <button class="btn btn-sm btn-warning mostrar-modal-modificar-insumo-elaborado" data-toggle="tooltip" title="Modificar Insumo Elaborado">
                        <i class="fa fa-pencil"></i>
                    </button>
                </s:if>
                <s:if test="(#attr.row.fechaBaja == null)">
                    <button class="btn btn-sm btn-danger mostrar-modal-baja-insumo-elaborado" data-toggle="tooltip" title="Dar de Baja Insumo Elaborado">
                        <i class="fa fa-ban"></i>
                    </button>
                </s:if>
                <s:else>
                    <button class="btn btn-sm btn-success mostrar-modal-recuperar-insumo-elaborado" data-toggle="tooltip" title="Recuperar Insumo Elaborado">
                        <i class="fa fa-check-circle"></i>
                    </button>
                </s:else>
            </div>
        </div>
    </display:column>
</display:table>

<s:include value="/WEB-INF/insumo/elaborado/modalConfeccionar.jsp"/>
<s:include value="/WEB-INF/insumo/elaborado/modalModificacion.jsp"/>
<s:include value="/WEB-INF/insumo/elaborado/modalVer.jsp"/>

<s:set var="objeto" value="#application.mensaje.INSUMOELABORADO"/>

<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-baja-insumo-elaborado</s:param>
    <s:param name="titulo">Dar de Baja <s:property value="#objeto"/></s:param>
    <s:param name="mensaje"><s:property value="#application.mensaje.getPreguntaDarBajaEl(#objeto)"/></s:param>
    <s:param name="modelo">insumo</s:param>
</s:include>
<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-recuperar-insumo-elaborado</s:param>
    <s:param name="titulo">Recuperar <s:property value="#objeto"/></s:param>
    <s:param name="mensaje"><s:property value='#application.mensaje.getPreguntaRecuperarEl(#objeto)'/>));%></s:param>
    <s:param name="modelo">insumo</s:param>
</s:include>