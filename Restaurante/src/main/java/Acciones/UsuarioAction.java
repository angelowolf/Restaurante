/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorUsuario;
import Controlador.Interface.IControladorUsuario;
import Modelo.Usuario;
import Soporte.Encriptar;
import Soporte.Mensaje;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author ang_2
 */
public class UsuarioAction extends Accion implements ModelDriven<Usuario> {

    private static final Logger LOGGER = Logger.getLogger(UsuarioAction.class);
    private Usuario usuario;
    private List<Usuario> lista;
    private final IControladorUsuario controladorUsuario;

    public UsuarioAction() {
        lista = new ArrayList<>();
        usuario = new Usuario();
        controladorUsuario = new ControladorUsuario();
        usuarioSesion = (Usuario) sesion.get("usuario");
    }

    public void validateRegistrar() {
        if (StringUtils.isBlank(usuario.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.INGRESENOMBRE);
        }
        if (StringUtils.isBlank(usuario.getApellido())) {
            addFieldError("apellido", Soporte.Mensaje.INGRESEAPELLIDO);
        }
        if (usuario.getRoles() == null) {
            addFieldError("rol", Soporte.Mensaje.SELECCIONEROL);
        }
        if (StringUtils.isBlank(usuario.getNick())) {
            addFieldError("nick", Soporte.Mensaje.INGRESENICK);
        } else if (!controladorUsuario.nickDisponible(usuario)) {
            addFieldError("nick", Soporte.Mensaje.NICKNODISPONIBLE);
        }
        if (usuario.getDocumento() < 0) {
            addFieldError("documento", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        } else if (usuario.getDocumento() != 0 && !controladorUsuario.documentoDisponible(usuario)) {
            addFieldError("documento", Soporte.Mensaje.DOCUMENTONODISPONIBLE);
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String registrar() {
        controladorUsuario.guardar(usuario);
        sesion.put("mensaje", Soporte.Mensaje.getAgregado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public void validateModificar() {
        if (StringUtils.isBlank(usuario.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.INGRESENOMBRE);
        }
        if (StringUtils.isBlank(usuario.getApellido())) {
            addFieldError("apellido", Soporte.Mensaje.INGRESEAPELLIDO);
        }
        if (usuario.getRoles() == null) {
            addFieldError("rol", Soporte.Mensaje.SELECCIONEROL);
        }
        if (usuario.getDocumento() < 0) {
            addFieldError("documento", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        } else if (usuario.getDocumento() != 0 && !controladorUsuario.documentoDisponible(usuario)) {
            addFieldError("documento", Soporte.Mensaje.DOCUMENTONODISPONIBLE);
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String modificar() {
        controladorUsuario.actualizar(usuario);
        sesion.put("mensaje", Soporte.Mensaje.getModificado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public String eliminar() {
        controladorUsuario.eliminar(usuario);
        sesion.put("mensaje", Soporte.Mensaje.getEliminado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public String recuperar() {
        controladorUsuario.recuperar(usuario);
        sesion.put("mensaje", Soporte.Mensaje.USUARIORECUPERADO);
        return SUCCESS;
    }

    public String listar() {
        lista = controladorUsuario.getTodos();
        return SUCCESS;
    }

    public String nuevo() {
        return SUCCESS;
    }

    public String editar() {
        usuario = controladorUsuario.getUsuario(usuario.getId());
        return SUCCESS;
    }

    public String misdatos() {
        usuario = controladorUsuario.getUsuario(usuarioSesion.getId());
        usuario.toString();
        return SUCCESS;
    }

    public void validateModificarmisdatos() {
        if (StringUtils.isBlank(usuario.getNick())) {
            addFieldError("nick", Soporte.Mensaje.INGRESENICK);
        } else if (!controladorUsuario.nickDisponible(usuario)) {
            addFieldError("nick", Soporte.Mensaje.NICKNODISPONIBLE);
        }
        if (StringUtils.isNotBlank(usuario.getClave()) || StringUtils.isNotBlank(usuario.getClave2())) {
            if (StringUtils.isBlank(usuario.getClave())) {
                addFieldError("clave", Soporte.Mensaje.INGRESECLAVE);
            }
            if (StringUtils.isBlank(usuario.getClave2())) {
                addFieldError("clave2", Soporte.Mensaje.REPITACLAVE);
            }
            if (StringUtils.isNotBlank(usuario.getClave()) && StringUtils.isNotBlank(usuario.getClave2())) {
                if (!usuario.getClave().equals(usuario.getClave2())) {
                    addFieldError("clave2", Soporte.Mensaje.CLAVENOCOINCIDE);
                }
            }
        }
        if (StringUtils.isBlank(usuario.getClaveOriginal())) {
            addFieldError("claveOriginal", Soporte.Mensaje.INGRESECLAVEACTUAL);
        } else if (!Encriptar.encriptaEnMD5(usuario.getClaveOriginal()).equals(usuarioSesion.getClave())) {
            addFieldError("claveOriginal", Soporte.Mensaje.CLAVEINGRESADAMAL);
            usuario.setClaveOriginal("");
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }

    }

    public String modificarmisdatos() {
        if (StringUtils.isBlank(usuario.getClave())) {
            controladorUsuario.actualizarMisDatos(usuario, false);
        } else {
            controladorUsuario.actualizarMisDatos(usuario, true);
        }
        sesion.put("usuario", controladorUsuario.getUsuario(usuario.getId()));
        addActionMessage(Soporte.Mensaje.getModificado(Soporte.Mensaje.USUARIO));
        return SUCCESS;
    }

    public void validateLogin() {
        if (!controladorUsuario.iniciarSesion(controladorUsuario.getUsuario(usuario.getNick()), usuario.getClave())) {
            addActionError(Soporte.Mensaje.ERRORVALIDAR);
            codigo = 400;
        }
    }

    public String login() {
        sesion.put("usuario", controladorUsuario.getUsuario(usuario.getNick()));
        return SUCCESS;
    }

    public String logout() {
        sesion.put("usuario", null);
        return SUCCESS;
    }

    public List<Usuario> getLista() {
        return lista;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public Usuario getModel() {
        return usuario;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

}
