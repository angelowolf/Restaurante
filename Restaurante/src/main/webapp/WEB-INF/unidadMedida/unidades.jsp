<%@taglib uri="/struts-tags" prefix="s"%>
<div class="form-group">
    <label for="categoria" name="categoria">Categoria de Insumo</label>
    <div class="form-group">
        <s:iterator var="cadaUnidad" value="unidades">
            <label class="radio-inline"><input type="radio" name="unidadMedida" id="unidadMedidaUnidad" value="<s:property value="cadaUnidad"/>"><s:property value="cadaUnidad"/></label>
            </s:iterator>
    </div>
</div>
