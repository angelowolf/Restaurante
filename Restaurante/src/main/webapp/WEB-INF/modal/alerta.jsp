<%@taglib uri="/struts-tags" prefix="s"%>
<s:if test="mensaje != null && !mensaje.isEmpty()">
    <div  id="alerta" class="alert alert-dismissible alert-<s:property value="tipoAlerta"/>" role="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <s:if test="tipoAlerta == 'info'" >
            <strong>
                <i class="fa fa-info-circle"></i>
                &nbsp;&nbsp;Información:&nbsp;
            </strong>
        </s:if>
        <s:if test="tipoAlerta == 'danger'" >
            <strong>
                <i class="fa fa-exclamation-circle"></i>
                &nbsp;&nbsp;Ocurrion un Problema:&nbsp;
            </strong>
        </s:if>
        <s:property value="mensaje"/>
    </div>
</s:if>