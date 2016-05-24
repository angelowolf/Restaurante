<%@page import="Decorator.RolDecorator"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="form-group">
    <s:action name="mensajeAlerta" namespace="/modal" executeResult="true">
        <s:param name="tipo"><%out.println(Soporte.Mensaje.TIPOINFO);%></s:param>
    </s:action>
    <h2 class="page-header">Mis Datos</h2>
    <form class="well" id="formulario">
        <input type="hidden" id="id" name="id" value="<s:property value="usuario.id"/>">
        <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" readonly="true" value="<s:property value="usuario.nombre"/>">
        </div>
        <div class="form-group">
            <label for="apellido">Apellido</label>
            <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" readonly="true" value="<s:property value="usuario.apellido"/>">
        </div>   
        <div class="form-group">
            <label for="documento">Documento</label>
            <input type="number" class="form-control" id="documento" name="documento" readonly="true" placeholder="documento" value="<s:property value="usuario.documento"/>">
        </div>
        <div class="form-group">
            <label for="rol" name="rol">Roles</label>
            <ul>
                <s:iterator value="usuario.roles" var="rol">
                    <li>
                        <s:if test="%{#rol.toString() == 'Mozo'}">
                            <s:property value="rol"/>                
                        </s:if>
                        <s:else>
                            Responsable de <s:property value="rol"/>
                        </s:else>
                    </li>
                </s:iterator>
            </ul>
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono</label>
            <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Teléfono" value="<s:property value="usuario.telefono"/>">
        </div>
        <div class="form-group">
            <label for="direccion">Dirección</label>
            <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="<s:property value="usuario.direccion"/>">
        </div>
        <div class="form-group">
            <label for="fechaNacimiento">Fecha de Nacimiento</label>
            <input type="text" class="form-control" id="fechaNacimiento" name="fechaNacimiento" placeholder="Fecha de Nacimiento" value="<s:property value="usuario.fechaNacimiento"/>">
        </div>
        <div class="form-group">
            <label for="nick">Nick</label>
            <input type="text" class="form-control" id="nick" name="nick" placeholder="Nick" value="<s:property value="usuario.nick"/>">
        </div>
        <input type="hidden" id="preguntaSecretaOriginal" value="<s:property value="usuario.preguntaSecreta"/>">
        <s:include value="/WEB-INF/usuario/preguntasSecretas.jsp"/>
        <div class="form-group">
            <label for="respuestaSecreta">Respuesta Secreta</label>
            <input type="text" class="form-control" id="respuestaSecreta" name="respuestaSecreta" placeholder="Respuesta Secreta" value="<s:property value="usuario.respuestaSecreta"/>">
        </div>    
        <div class="form-group">
            <label for="clave">Nueva clave</label>
            <input type="password" class="form-control" id="clave" name="clave" placeholder="Nueva clave">
        </div>
        <div class="form-group">
            <label for="clave2">Repita la clave</label>
            <input type="password" class="form-control" id="clave2" name="clave2" placeholder="Repita la clave">
        </div>
        <div class="form-group">
            <label for="claveOriginal">Clave anterior</label>
            <input type="password" class="form-control" id="claveOriginal" name="claveOriginal" placeholder="Clave anterior">
        </div>
        <button type="submit" id="guardar" class="btn btn-success pull-right">Guardar</button>
    </form>       
</div>    