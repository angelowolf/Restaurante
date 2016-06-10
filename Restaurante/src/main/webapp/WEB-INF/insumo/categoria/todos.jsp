<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="form-group">   
    <h2 class="page-header">Categoria Insumo</h2>
    <div class="panel panel-default">        
        <div class="panel-body">        
            <s:form class="form-inline" action="listar" namespace="/insumo/categoria" id="formulario-buscar">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <s:textfield type="text" class="form-control" id="nombre" name="nombreFiltro" placeholder="Nombre"/>
                </div>
                <button type="submit" class="btn btn-info">Buscar</button>
            </s:form>
        </div>
    </div>
    <div class=" col-md-12">
        <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row">
            <display:setProperty name="basic.msg.empty_list" >Aún no hay Categorias registradas. Puede crear uno desde <a href="<s:url action='nuevo' namespace='/insumo/categoria'/>">aquí</a>.</display:setProperty>
            <display:column sortable="true" property="nombre" title="Nombre" class="col-md-4 text-center-all" headerClass="text-center-all"/>
            <display:column property="descripcion" title="Descripción" decorator="Decorator.DescripcionDecorator" class="col-md-4 text-center-all" headerClass="text-center-all"/>
            <display:column title="Funciones" class="col-md-4 text-center-all" headerClass="text-center-all">
                <div id="botones">
                    <s:hidden name="id" value="%{#attr.row.id}"/>
                    <button id="modalver" class="btn btn-info"><i class="fa fa-eye"></i></button>
                    <button id="modaleditar" class="btn btn-warning"><i class="fa fa-edit"></i></button>
                    <button id="modaleliminar" class="btn btn-danger"><i class="fa fa-close"></i></button>
                </div>
            </display:column>
        </display:table>
    </div>
</div>
<s:action name="modaleliminar" namespace="/modal" executeResult="true">
    <s:param name="titulo"><%out.println(Soporte.Mensaje.CATEGORIAINSUMO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaEliminarLa(Soporte.Mensaje.CATEGORIAINSUMO));%></s:param>
    <s:param name="modelo">categoria</s:param>
</s:action>
<s:include value="/WEB-INF/insumo/categoria/modalModificacion.jsp"/>
<s:include value="/WEB-INF/insumo/categoria/modalVer.jsp"/>