<%@taglib uri="/struts-tags" prefix="s"%>
<s:if test="mensaje != null && !mensaje.isEmpty()">
    <div  id="alerta" class="alert alert-dismissible alert-<s:property value="tipoAlerta"/>" role="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <s:property value="mensaje"/>
    </div>
</s:if>