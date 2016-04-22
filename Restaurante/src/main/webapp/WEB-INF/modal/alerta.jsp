<%@taglib uri="/struts-tags" prefix="s"%>
<s:if test="mensaje != null && !mensaje.isEmpty()">
    <div  id="#alerta" class="alert alert-dismissible alert-<s:property value="tipo"/>" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <s:property value="mensaje"/>
    </div>
</s:if>