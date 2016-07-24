<%@page import="Decorator.RolDecorator"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="modal fade" id="modal-modificar-perfil" tabindex="-1" role="dialog" data-backdrop="static">
    <div class="modal-dialog modal-dialog-center">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Editar Perfil de Usuario</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12 col-md-4 text-inline">
                        <strong>Nombre: </strong><p id="nombre"></p>
                    </div>
                    <div class="col-xs-12 col-md-4 text-inline">
                        <strong>Apellido: </strong><p id="apellido"></p>
                    </div>
                    <div class="col-xs-12 col-md-4 text-inline">
                        <strong>Documento: </strong><p id="documento"></p>
                    </div>
                    <form id="modificar-perfil-usuario-form">
                        <div id="datos-perfil" class="col-xs-12">
                            <input type="hidden" id="id" name="id">
                            <div class="form-group">
                                <label class="control-label" for="fechaNacimiento">Fecha de Nacimiento</label>
                                <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento" autocomplete="off" autofocus="autofocus">
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="telefono">Teléfono</label>
                                <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Teléfono">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="direccion">Dirección</label>
                                <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" autocomplete="off">
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <button id="ver-datos-ingreso" class="btn btn-sm btn-default btn-block" type="button">
                                Mostrar Datos de Ingreso
                            </button>
                        </div>
                        <div id="datos-ingreso" class="col-xs-12" style="display: none;">
                            <br />
                            <div class="row">
                                <div class="col-xs-12">
                                    <p><strong>NOTA:</strong> Los campos marcados con (*) son obligatorios y por lo tanto deben ser completados.</p>
                                </div>
                            </div>
                            <br />
                            <input type="hidden" id="preguntaSecretaOriginal" value="">
                            <div class="form-group">
                                <label class="control-label" for="nick">Nombre de Usuario *</label>
                                <input type="text" class="form-control" id="nick" name="nick" placeholder="Nombre de Usuario" autocomplete="off">
                            </div>
                            <s:include value="/WEB-INF/usuario/preguntasSecretas.jsp"/>
                            <div class="form-group">
                                <label for="respuestaSecreta">Respuesta Secreta *</label>
                                <input type="text" class="form-control" id="respuestaSecreta" name="respuestaSecreta" placeholder="Respuesta Secreta" value="" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="clave">Nueva Contraseña</label>
                                <input type="password" class="form-control" id="clave" name="clave" placeholder="Nueva Contraseña" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="clave2">Repite la Nueva Contraseña</label>
                                <input type="password" class="form-control" id="clave2" name="clave2" placeholder="Repite la Nueva Contraseña" autocomplete="off">
                            </div>
                        </div>
                        <div id="contraseña-actual" class="col-xs-12" style="display: none;">
                            <p>Debemos asegurarnos de que eres TÚ, para ello te solicitamos que ingreses tu contraseña actual</p>
                            <div class="form-group">
                                <label for="claveOriginal">Contraseña Actual</label>
                                <input type="password" class="form-control" id="claveOriginal" name="claveOriginal" placeholder="Contraseña Actual" autocomplete="off">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-xs-6 text-left">
                        <button type="button" class="btn btn-default pull-left cancelar" data-dismiss="modal">Cancelar</button>
                    </div>
                    <div class="col-xs-6 text-right">
                        <button type="button" class="btn btn-ruhaj guardar">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>