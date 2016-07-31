<%@page import="Decorator.RolDecorator"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-modificar-perfil" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><s:text name="global.editarperfilusuario"/></h4>
            </div>
            <form id="modificar-perfil-usuario-form" method="POST">
                <input type="hidden" id="id" name="id">
                <div class="modal-body">
                    <div class="row">
                        <div id="datos-perfil">
                            <div class="col-xs-12 col-md-4 text-inline">
                                <strong><s:text name="global.nombre"/>: </strong><p id="nombre"></p>
                            </div>
                            <div class="col-xs-12 col-md-4 text-inline">
                                <strong><s:text name="global.apellido"/>: </strong><p id="apellido"></p>
                            </div>
                            <div class="col-xs-12 col-md-4 text-inline">
                                <strong><s:text name="global.documento"/>: </strong><p id="documento"></p>
                            </div>
                            <div class="col-xs-12 col-md-6 text-inline">
                                <strong><s:text name="global.roles"/>:&nbsp;&nbsp;</strong><p id="roles"></p>
                            </div>
                            <hr />
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="control-label" for="fechaNacimiento"><s:text name="global.fechanacimiento"/></label>
                                    <div class="input-group date">
                                        <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento" maxlength="11" autocomplete="off">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    </div>
                                    <span class="help-block"></span>
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="telefono"><s:text name="global.telefono"/></label>
                                    <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="<s:text name="global.telefono"/>" maxlength="100">
                                    <span class="help-block"></span>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="direccion"><s:text name="global.direccion"/></label>
                                    <input type="text" class="form-control" id="direccion" name="direccion" placeholder="<s:text name="global.direccion"/>" autocomplete="off" maxlength="255">
                                    <span class="help-block"></span>
                                </div>
                                <button id="ver-datos-ingreso" class="btn btn-sm btn-default btn-block" type="button">
                                    <s:text name="global.mostrardatosingreso"/>
                                </button>
                            </div>
                        </div>
                        <div id="datos-ingreso" class="col-xs-12" style="display: none;">
                            <br />
                            <div class="row">
                                <div class="col-xs-12">
                                    <p><strong><s:text name="global.nota"/></strong> <s:text name="global.notamensajeobligatorio"/></p>
                                </div>
                            </div>
                            <br />
                            <input type="hidden" id="preguntaSecretaOriginal" value="">
                            <div class="form-group">
                                <label class="control-label" for="nick"><s:text name="global.nombreusuario"/> *</label>
                                <input type="text" class="form-control" id="nick" name="nick" placeholder="<s:text name="global.nombreusuario"/>" autocomplete="off" maxlength="200" required="required">
                                <span class="help-block"></span>
                            </div>
                            <s:include value="/WEB-INF/usuario/preguntasSecretas.jsp"/>
                            <div class="form-group">
                                <label for="respuestaSecreta"><s:text name="global.respuestasecreta"/> *</label>
                                <input type="text" class="form-control" id="respuestaSecreta" name="respuestaSecreta" placeholder="<s:text name="global.respuestasecreta"/>" maxlength="50" autocomplete="off" maxlength="50" required="required">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="clave"><s:text name="global.nuevaclave"/></label>
                                <input type="password" class="form-control" id="clave" name="clave" placeholder="<s:text name="global.nuevaclave"/>" autocomplete="off" maxlength="100">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="clave2"><s:text name="global.repitenuevaclave"/></label>
                                <input type="password" class="form-control" id="clave2" name="clave2" placeholder="<s:text name="global.repitenuevaclave"/>" autocomplete="off" maxlength="100">
                                <span class="help-block"></span>
                            </div>
                            <p><strong><s:text name="global.pista"/>:</strong> <s:text name="global.rellenarclave"/></p>
                        </div>
                        <div id="contraseña-actual" class="col-xs-12" style="display: none;">
                            <div class="form-group">
                                <label for="claveOriginal"><s:text name="global.claveactual"/></label>
                                <input type="password" class="form-control" id="claveOriginal" name="claveOriginal" placeholder="<s:text name="global.claveactual"/>" autocomplete="off" maxlength="100">
                                <span class="help-block"></span>
                            </div>
                            <hr />
                            <p><strong><s:text name="global.nota"/></strong> <s:text name="global.sosvos"/>.</p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-xs-6 text-left">
                            <button type="button" class="btn btn-default pull-left cancelar" data-dismiss="modal"><s:text name="global.cancelar"/></button>
                        </div>
                        <div class="col-xs-6 text-right">
                            <button type="submit" class="btn btn-ruhaj confirmar"><s:text name="global.aceptar"/></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>