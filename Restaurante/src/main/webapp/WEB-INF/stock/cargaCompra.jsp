<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="row">
    <div class="col-xs-12 text-left">
        <h2 class="pull-left">Reponer Insumos Comprados</h2>
    </div>
</div>
<hr />
<div class="panel">
    <div class="panel-body">
        <div class="row">
            <s:form id="filtro-insumos-form" autocomplete="off">
                <div class="form-group col-xs-12 col-sm-4">
                    <label for="nombre" class="control-label">Nombre de Insumo</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del insumo" maxlenght="100" autofocus="autofocus">
                </div>
                <div class="form-group col-xs-12 col-sm-4">
                    <label class="control-label" for="rolesSeleccionados">Categoría de Insumo</label>
                    <s:select headerKey="-1" headerValue="Todas" list="categorias" id="categoria" name="categoria" listKey="id" listValue="nombre" cssClass="form-control selectpicker show-tick show-menu-arrow"/>
                </div>
            </s:form>
        </div>
    </div>
</div>
<display:table name="lista" pagesize="0" requestURI="${listar}" uid="row" htmlId="insumos-brutos-filtrados">
    <display:setProperty name="basic.msg.empty_list" >
        <div class="col-xs-12 well text-center empty">
            <p>
                <i class="fa fa-thumbs-up fa-lg"></i>
                No se encontraron Insumos Brutos con su cantidad por debajo del mínimo.
            </p>
        </div>
    </display:setProperty>
    <display:column property="nombre" title="Nombre" class="text-center-vertical"/>
    <display:column property="categoriaInsumo.nombre" title="Categoría" class="text-center-vertical"/>
    <display:column property="stock.cantidadActual" title="Cantidad Actual" class="text-center-all"/>
    <display:column property="stock.cantidadMinima" title="Cantidad Mínima" class="text-center-all"/>
    <display:column property="unidadMedida" title="Unidad de Medida" class="text-center-all"/>
    <display:column property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" class="text-center-all"/>
    <display:column title="Acciones" class="text-center-all">
        <button id='<s:property value="%{#attr.row.id}"/>' class="btn btn-sm btn-success btn-seleccionar-insumo" title="Seleccionar" data-placement="left" data-toggle="tooltip">
            <i class="fa fa-plus"></i>
        </button> 
    </display:column>
</display:table>
<h3 class="text-center">Insumos Brutos Seleccionados</h3>
<br />
<form id="carga-compra-form" autocomplete="off">
    <table class="table table-striped table-ruhaj table-condensed">
        <thead>
            <tr>
                <th class="text-center-vertical">Nombre</th>
                <th class="text-center-vertical">Categoría</th>
                <th class="text-center-all">Cantidad Actual</th>
                <th class="text-center-all">Cantidad Mínima</th>
                <th class="text-center-all">Unidad de Medida</th>
                <th class="text-center-all">Precio por Unidad</th>
                <th class="text-center-all">Cantidad Comprada</th>
                <th class="text-center-all">Precio Compra</th>
                <th class="text-center-all">Acciones</th>
            </tr>
        </thead>
        <tbody id="insumos-brutos-seleccionados">
            <tr class="empty well">
                <td class="text-center-all" colspan="9">Aun no se han seleccionado insumos brutos.</td>
            </tr>
        </tbody>
    </table>
    <div class="panel">
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-6 text-left">
                    <a href="/home" class="btn btn-default cancelar">
                        Cancelar
                    </a>
                </div>
                <div class="col-xs-6 text-right">
                    <button class="btn btn-ruhaj confirmar" type="submit">
                        Aceptar
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>