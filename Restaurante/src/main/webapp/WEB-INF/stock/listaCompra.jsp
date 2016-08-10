<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="row">
    <div class="col-xs-12">
        <h2>Listado de Compras</h2>
    </div>
</div>
<hr />
<div class="panel">
    <div class="panel-body">
        <div class="row">
            <div class="form-group col-xs-12 col-sm-6">
                <label for="nombre" class="control-label">Nombre de Insumo Bruto</label>
                <input type="text" class="form-control" id="busqueda-insumo" autofocus="autofocus" />
            </div>
        </div>
    </div>
</div>

<form id="listado-compra-form" autocomplete="off">
    <display:table name="lista" pagesize="0" requestURI="${listar}" uid="row" htmlId="insumos-brutos-faltantes">
        <display:setProperty name="basic.msg.empty_list" >
            <div class="col-xs-12 well text-center empty">
                <p>
                    <i class="fa fa-thumbs-up fa-lg"></i>
                    No se encontraron Insumos Brutos con su cantidad por debajo del mínimo.
                </p>
            </div>
        </display:setProperty>
        <display:column property="nombre" title="Nombre" class="text-center-vertical"/>
        <display:column property="categoriaInsumo.nombre" title="Categoria" class=" text-center-vertical"/>
        <display:column property="stock.cantidadActual" title="Cantidad Actual" class="text-center-all"/>
        <display:column property="stock.cantidadMinima" title="Cantidad Mínima" class="text-center-all"/>
        <display:column property="unidadMedida" title="Unidad de Medida" class="text-center-all"/>
        <display:column property="precioUnidad" title="Precio por Unidad" format="$ {0,number,.00}" class="text-center-all"/>
        <display:column title="Cantidad a Comprar *" class="text-center-all">
                <input type="text" class="form-control numeric fw-4" id="cantidad">
        </display:column>
        <display:column title="Acciones" class="text-center-all">
            <input name="ids" type="hidden" value="<s:property value='%{#attr.row.id}'/>"/>
            <button type="button" class="btn btn-sm btn-fw btn-danger btn-quitar-insumo" title="Quitar del Listado" data-toggle="tooltip" data-placement="left" tabindex="-1">
                <i class="fa fa-minus fa-lg"></i>
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
                        Imprimir
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>