<%@taglib uri="/struts-tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row">
    <div class="col-xs-6 text-left">
        <h2 class="pull-left">Listado de Insumos</h2>
    </div>
    <div class="col-xs-6 text-right">
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
            <div class="col-xs-12">
                <s:form class="form-inline" action="listar" namespace="/insumobruto" id="formulario-buscar">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input value="<s:property value="nombreFiltro"/>"   type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre" maxlenght="100" autocomplete="off" autofocus="autofocus" />
                    </div>
                    <div class="form-group">
                        <label for="categoria" name="categoria">Categoria de Insumo</label>
                        <div class="form-group">
                            <s:select headerKey="-1" headerValue="Todas" list="categorias" id="categoriaInsumoFiltro" name="categoriaInsumoFiltro" listKey="id" listValue="nombre" cssClass="selectpicker show-tick show-menu-arrow" value="categoriaInsumoFiltro"/>
                        </div>
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
    <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row"  sort="list">
        <display:setProperty name="basic.msg.empty_list" >
            <p id="notificacion">No se encontraron Insumos.</p>
        </display:setProperty>
        <display:column sortable="true" property="nombre" title="Nombre" class="text-center-all" headerClass="table-header-ruhaj" decorator="Decorator.LimitadorCaracteresDecorator"/>
        <display:column sortable="true" property="categoriaInsumo.nombre" title="Categoria" class="text-center-all" headerClass="table-header-ruhaj" />
        <display:column sortable="true" property="unidadMedida" title="Unidad de Medida" class="text-center-all" headerClass="table-header-ruhaj"/>
        <display:column sortable="true" property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" class="text-center-all" headerClass="table-header-ruhaj"/>
        <display:column sortable="true" property="stock.cantidadActual" title="Cantidad en Stock" class="text-center-all" headerClass="table-header-ruhaj"/>
        <display:column sortable="true" property="stock.cantidadMinima" title="Stock Mínimo" class="text-center-all" headerClass="table-header-ruhaj"/>
        <display:column sortable="true" property="fechaAlta" title="Fecha de Alta" decorator="Decorator.DateDecorator" class="text-center-all" headerClass="table-header-ruhaj"/>
        <display:column sortable="true" property="fechaBaja" title="Fecha de Baja" decorator="Decorator.DateDecorator" class="text-center-all" headerClass="table-header-ruhaj"/>
        <display:column title="Acciones" class="col-xs-2 text-center-all" headerClass="table-header-ruhaj">
            <div class="acciones">
                <s:hidden class="model-id" value="%{#attr.row.id}"/>
                <div class="btn-group">
                    <button class="btn btn-sm btn-default mostrar-modal-ver-insumo-bruto" data-toggle="tooltip" title="Ver Insumo">
                        <i class="fa fa-eye"></i>
                    </button>
                    <s:if test="(#attr.row.fechaBaja == null)">
                        <button class="btn btn-sm btn-warning mostrar-modal-modificar-insumo-bruto" data-toggle="tooltip" title="Modificar Insumo">
                            <i class="fa fa-pencil"></i>
                        </button>
                    </s:if>
                    <s:if test="(#attr.row.fechaBaja == null)">
                        <button id="modaleliminar" class="btn btn-sm btn-danger mostrar-modal-baja-insumo-bruto" data-toggle="tooltip" title="Dar de Baja Insumo">
                            <i class="fa fa-trash"></i>
                        </button>
                    </s:if>
                    <s:else>
                        <button class="btn btn-sm btn-success mostrar-modal-recuperar-insumo-bruto" data-toggle="tooltip" title="Recuperar Insumo">
                            <i class="fa fa-check-circle"></i>
                        </button>
                    </s:else>
                </div>
            </div>
        </display:column>
    </display:table>
</div>

<s:include value="/WEB-INF/insumo/bruto/modalModificacion.jsp"/>
<s:include value="/WEB-INF/insumo/bruto/modalVer.jsp"/>

<s:action name="modal" namespace="/modal" executeResult="true">
    <s:param name="modalId">modal-baja-insumo-bruto</s:param>
    <s:param name="titulo">Dar de Baja <%out.println(Soporte.Mensaje.INSUMO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaDarBajaEl(Soporte.Mensaje.INSUMO));%></s:param>
    <s:param name="modelo">insumo</s:param>
</s:action>
<s:action name="modal" namespace="/modal" executeResult="true">
    <s:param name="modalId">modal-recuperar-insumo-bruto</s:param>
    <s:param name="titulo">Recuperar <%out.println(Soporte.Mensaje.INSUMO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaRecuperarEl(Soporte.Mensaje.INSUMO));%></s:param>
    <s:param name="modelo">insumo</s:param>
</s:action>