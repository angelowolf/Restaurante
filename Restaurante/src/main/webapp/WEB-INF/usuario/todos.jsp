<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<div class="form-group">   
    <div style="display:none;" id="mensaje"><s:actionmessage/></div>
    <h2 class="page-header">Usuarios</h2>
    <div class=" col-md-12">
        <display:table name="lista" pagesize="10" requestURI="${listar}" uid="row">
            <display:setProperty name="basic.msg.empty_list" >Aún no hay usuarios registrados. Puede crear uno desde <a href="<s:url action='nuevo' namespace='/usuario'/>">aquí</a>.</display:setProperty>
            <display:column property="id" title="Número Usuario"/>
            <display:column sortable="true" property="nombre" title="Nombre"/>
            <display:column sortable="true" property="apellido" title="Apellido"/>
            <display:column sortable="true" property="nick" title="Nick"/>
            <display:column sortable="true" property="rol" title="Rol"/>            
            <display:column title="Funciones">
                <div id="botones">
                    <s:hidden name="id" value="%{#attr.row.id}"/>
                    <button id="modaleditar" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></button>
                    <button id="modaleliminar" class="btn btn-sm btn-danger"><i class="fa fa-close"></i></button>
                </div>
            </display:column>
        </display:table>
    </div>
</div>
<s:action name="modaleliminar" namespace="/modal" executeResult="true">
    <s:param name="titulo"><%out.println(Soporte.Mensaje.USUARIO);%></s:param>
    <s:param name="mensaje"><%out.println(Soporte.Mensaje.getPreguntaEliminarEl(Soporte.Mensaje.USUARIO));%></s:param>
    <s:param name="modelo">usuario</s:param>
</s:action>

<div class="modal fade" id="modal-editar" tabindex="-1" role="dialog" aria-labelledby="Editar" aria-hidden="true">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Editar usuario</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <form id="form-editar" class="well">
                        <input type="hidden" id="id" name="id">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label for="apellido">Appelido</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
                        </div>
                        <div class="form-group">
                            <label for="rol">Rol</label>
                            <select class="form-control" id="rol" name="rol">
                                <option>Mozo</option>
                                <option>Administrador</option>
                                <option>Barra</option>            
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="nick">Nick</label>
                            <input type="text" class="form-control" id="nick" name="nick" placeholder="Nick">
                        </div>
                        <div class="form-group">
                            <label for="clave">Clave</label>
                            <input type="password" class="form-control" id="clave" name="clave" placeholder="Clave" data-toggle="tooltip" data-placement="left" title="Si deja en blanco no cambiará la clave">
                        </div>
                        <div class="form-group">
                            <label for="clave">Repita la clave</label>
                            <input type="password" class="form-control" id="clave2" name="clave2" placeholder="Repita la clave">
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="editar">Guardar</button>
            </div>
        </div>
    </div>    
</div>    