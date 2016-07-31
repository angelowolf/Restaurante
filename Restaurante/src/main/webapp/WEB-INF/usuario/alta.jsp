<%@taglib uri="/struts-tags" prefix="s"%>
<div class="col-lg-offset-1 col-lg-10 col-sm-offset-2 col-sm-8 col-xs-12">
    <div class="panel panel-ruhaj">
        <form id="alta-usuario-form">
            <div class="panel-heading">
                <h3 class="panel-title"><s:text name="global.nuevousuario"/></h3>
            </div>
            <div class="panel-body"> 
                <div class="row">
                    <div class="col-xs-12">
                        <p><strong><s:text name="global.nota"/></strong> <s:text name="global.notamensajeobligatorio"/></p>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="nombre"><s:text name="global.nombre"/> *</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="<s:text name="global.nombre"/>" maxlength="100" autocomplete="off" autofocus="autofocus">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="apellido"><s:text name="global.apellido"/> *</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" placeholder="<s:text name="global.apellido"/>" maxlength="100" autocomplete="off">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="documento"><s:text name="global.documento"/> *</label>
                            <input type="text" class="form-control numeric-nodot" id="documento" name="documento" placeholder="<s:text name="global.documento"/>" maxlength="10" autocomplete="off">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="fechaNacimiento"><s:text name="global.fechanacimiento"/></label>
                            <div class="input-group date">
                                <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="<s:text name="global.fechanacimiento"/>" maxlength="11" autocomplete="off">
                                <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                            </div>
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="telefono"><s:text name="global.telefono"/></label>
                            <input type="tel" class="form-control numeric-nodot" id="telefono" name="telefono" placeholder="<s:text name="global.telefono"/>" maxlength="100">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="direccion"><s:text name="global.direccion"/></label>
                            <input type="text" class="form-control" id="direccion" name="direccion" placeholder="<s:text name="global.direccion"/>" maxlength="255" autocomplete="off">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6">
                        <div class="form-group">
                            <label class="control-label" for="fechaAlta"><s:text name="global.falta"/></label>
                            <input type="text" class="form-control" id="fechaAlta" disabled autocomplete="off" tabindex="-1">
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="nick"><s:text name="global.nombreusuario"/> *</label>
                            <input type="text" class="form-control" id="nick" name="nick" placeholder="<s:text name="global.nombreusuario"/>" maxlength="200" autocomplete="off">
                            <span class="help-block"></span>
                        </div>
                        <s:include value="/WEB-INF/rol/roles.jsp"/>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-xs-6 text-left">
                        <button class="btn btn-default cancelar" type="button"><s:text name="global.cancelar"/></button>
                    </div>
                    <div class="col-xs-6 text-right">
                        <button class="btn btn-ruhaj confirmar" type="submit"><s:text name="global.aceptar"/></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>