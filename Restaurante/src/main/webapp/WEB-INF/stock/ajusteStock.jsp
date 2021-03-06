<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="row">
    <div class="col-xs-12 text-left">
        <h2 class="pull-left">Ajuste Manual de Stock</h2>
    </div>
</div>
<hr />
<div class="panel">
    <div class="panel-body">
        <div class="row">
            <s:form id="filtro-insumos-form" autocomplete="off">
                <div class="form-group col-xs-12 col-sm-4">
                    <label for="nombre" class="control-label">Nombre de Insumo</label>
                    <input type="text" class="form-control" id="nombre" placeholder="Nombre del insumo" maxlenght="100" autofocus="autofocus">
                </div>
                <div class="form-group col-xs-12 col-sm-4">
                    <label class="control-label" for="rolesSeleccionados">Categoría de Insumo</label>
                    <s:select headerKey="-1" headerValue="Todas" list="categorias" id="categoria" listKey="id" listValue="nombre" cssClass="form-control selectpicker show-tick show-menu-arrow"/>
                </div>
            </s:form>
        </div>
    </div>
</div>
<form id="ajuste-stock-form" autocomplete="off">
    <display:table name="listaTodos" pagesize="0" requestURI="${listar}" uid="row" htmlId="insumos-filtrados">
        <display:setProperty name="basic.msg.empty_list" >
            <div class="col-xs-12 well text-center empty">
                <p>
                    <i class="fa fa-thumbs-up fa-lg"></i>
                    No se encontraron Insumos con su cantidad por debajo del mínimo.
                </p>
            </div>
        </display:setProperty>
        <display:column property="nombre" title="Nombre" class="text-center-vertical" />
        <display:column property="categoriaInsumo.nombre" title="Categoria" class="text-center-vertical" />
        <display:column property="stock.cantidadActual" title="Cantidad Actual" class="text-center-all cantidad-actual" />
        <display:column property="unidadMedida" title="Unidad de Medida" class="text-center-all"/>
        <display:column title="Cantidad Real *" class="text-center-all">
            <input type="text" name="cantidad" class="form-control fw-4 numeric cantidad-real" disabled/>
        </display:column>
        <display:column title="Diferencia" class="text-center-all diferencia" />
        <display:column title="Acciones" class="text-center-all">
            <input class="id" name="ids" type="hidden" value="<s:property value='%{#attr.row.id}'/>" disabled/>
            <button type="button" class="btn btn-sm btn-fw btn-default btn-seleccionar-insumo" title="Seleccionar" data-placement="left" data-toggle="tooltip" tabindex="-1">
                <i class="fa fa-circle-o fa-lg"></i>
            </button>
        </display:column>
    </display:table>
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