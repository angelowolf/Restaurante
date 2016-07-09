<%@taglib uri="/struts-tags" prefix="s" %>
<input type="hidden" value="<s:property value="id"/>" id="idInsumo"/>
<h2 class="page-header">
    Movimientos de: <s:property value="nombre"/>
</h2>
<div class="form-group">
    <s:select headerKey="-1" headerValue="Total" list="movimientos" id="movimiento" cssClass="form-control"/>
</div>
<div class="sombra">
    <div id="grafico"></div>					
</div>