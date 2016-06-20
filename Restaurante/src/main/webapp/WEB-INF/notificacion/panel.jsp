<%@taglib uri="/struts-tags" prefix="s" %>
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-bell fa-fw"></i><span class="badge" id="panel-notificaciones-cantidad"><s:if test="cantidad != 0"><s:property value="cantidad"/></s:if></span>  <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-alerts" id="panel-notificaciones">
        <s:if test="lista != null">
            <s:iterator value="lista" var="notificacion">
                <li <s:if test="%{!#notificacion.visto}">class='novisto'</s:if>>
                        <a href='#'>
                            <div>
                                <i class='fa fa-<s:property value="%{#notificacion.tipoMensaje.getIcono()}"/>  fa-fw'></i> <s:property value="%{#notificacion.mensaje}"/><span class='pull-right text-muted small'><s:property value="%{#notificacion.fecha2}"/></span>
                        </div>
                    </a>
                </li>
            </s:iterator>
        </s:if>
        <li >
            <a class="text-center" href="#">
                <strong>Ver todas</strong>
                <i class="fa fa-angle-right"></i>
            </a>
        </li>
    </ul>
    <!-- /.dropdown-alerts -->
</li>