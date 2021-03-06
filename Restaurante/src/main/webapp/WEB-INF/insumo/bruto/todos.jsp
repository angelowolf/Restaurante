<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-xs-10 text-left">
        <h2 class="pull-left">Listado de Insumos Brutos</h2>
    </div>
    <div class="col-xs-2 text-right">
        <br />
        <a class="btn btn-default text-right" data-toggle="tooltip" title="Imprimir Listado" data-placement="left">
            <i class="fa fa-print"></i>
        </a>
    </div>
</div>
<hr />
<div class="panel">
    <div class="panel-body">
        <div class="row">
            <s:form action="listar" namespace="/insumobruto" id="formulario-buscar">
                <div class="form-group col-xs-12 col-sm-4">
                    <label for="nombre">Nombre</label>
                    <input value='<s:property value="nombreFiltro"/>' type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre" maxlenght="100" autocomplete="off" autofocus="autofocus" />
                </div>
                <div class="form-group col-xs-12 col-sm-5 col-md-4">
                    <label for="categoria" name="categoria">Categoria de Insumo</label>
                    <s:select headerKey="-1" headerValue="Selecciona Categoría" list="categorias" id="categoriaInsumoFiltro" name="categoriaInsumoFiltro" listKey="id" listValue="nombre" cssClass="form-control selectpicker show-tick show-menu-arrow" value="categoriaInsumoFiltro"/>
                </div>
                <div class="col-xs-12 col-sm-3 col-md-2 col-md-offset-2 text-right">
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
    <display:setProperty name="basic.msg.empty_list">
        <div class="col-xs-12 well text-center">
            <p>
                <i class="fa fa-filter fa-lg"></i>
                No se encontraron Insumos Brutos que coincidan con tu busqueda.
            </p>
        </div>
    </display:setProperty>
    <display:column sortable="true" property="nombre" title="Nombre" class="text-center-vertical" maxLength="40"/>
    <display:column sortable="true" property="categoriaInsumo.nombre" title="Categoria" class="text-center-vertical hidden-xs hidden-sm" headerClass="hidden-xs hidden-sm" maxLength="40"/>
    <display:column sortable="true" property="stock.cantidadActual" title="Cantidad en Stock" class="text-center-all"/>
    <display:column sortable="true" property="stock.cantidadMinima" title="Stock Mínimo" class="text-center-all hidden-xs hidden-sm" headerClass="hidden-xs hidden-sm"/>
    <display:column sortable="true" property="unidadMedida" title="Unidad de Medida" class="text-center-vertical hidden-xs hidden-sm" headerClass="hidden-xs hidden-sm"/>
    <display:column sortable="true" property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" class="hidden-xs text-center-all hidden-xs" headerClass="hidden-xs"/>
    <display:column sortable="true" property="fechaAlta" title="Fecha de Alta" decorator="Decorator.DateDecorator" class="text-center-all hidden-xs" headerClass="hidden-xs"/>
    <display:column sortable="true" property="fechaBaja" title="Fecha de Baja" decorator="Decorator.DateDecorator" class="text-center-all hidden-xs" headerClass="hidden-xs"/>
    <display:column title="Acciones" class="col-xs-4 col-sm-2 text-center-all">
        <div class="acciones">
            <s:hidden class="model-id" value="%{#attr.row.id}"/>
            <div class="btn-group">
                <button class="btn btn-sm btn-default mostrar-modal-ver-insumo-bruto" data-toggle="tooltip" title="Ver Insumo Bruto">
                    <i class="fa fa-eye"></i>
                </button>
                <s:if test="(#attr.row.fechaBaja == null)">
                    <button class="btn btn-sm btn-warning mostrar-modal-modificar-insumo-bruto" data-toggle="tooltip" title="Modificar Insumo Bruto">
                        <i class="fa fa-pencil"></i>
                    </button>
                </s:if>
                <s:if test="(#attr.row.fechaBaja == null)">
                    <button id="modaleliminar" class="btn btn-sm btn-danger mostrar-modal-baja-insumo-bruto" data-toggle="tooltip" title="Dar de Baja Insumo Bruto">
                        <i class="fa fa-ban"></i>
                    </button>
                </s:if>
                <s:else>
                    <button class="btn btn-sm btn-success mostrar-modal-recuperar-insumo-bruto" data-toggle="tooltip" title="Recuperar Insumo Bruto">
                        <i class="fa fa-check-circle"></i>
                    </button>
                </s:else>
            </div>
        </div>
    </display:column>
</display:table>

<s:include value="/WEB-INF/insumo/bruto/modalModificacion.jsp"/>
<s:include value="/WEB-INF/insumo/bruto/modalVer.jsp"/>
<s:set var="objeto" value="#application.mensaje.INSUMO"/>

<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-baja-insumo-bruto</s:param>
    <s:param name="titulo">Dar de Baja <s:property value="#objeto"/></s:param>
    <s:param name="mensaje"><s:property value="#application.mensaje.getPreguntaDarBajaEl(#objeto)"/></s:param>
    <s:param name="modelo">insumo</s:param>
</s:include>
<s:include value="/WEB-INF/modal/modal.jsp">
    <s:param name="modalId">modal-recuperar-insumo-bruto</s:param>
    <s:param name="titulo">Recuperar <s:property value="#objeto"/></s:param>
    <s:param  name="mensaje"><s:property value='#application.mensaje.getPreguntaRecuperarEl(#objeto)'/></s:param>
    <s:param name="modelo">insumo</s:param>
</s:include>