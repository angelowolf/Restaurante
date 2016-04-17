/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorUsuario;
import Controlador.Interface.IControladorUsuario;
import Modelo.Rol;
import Modelo.Usuario;
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

    private static final Logger log = Logger.getLogger(ClienteAction.class);
    private Usuario usuario;
    private List<Usuario> lista;
    private IControladorUsuario controladorUsuario;

    public UsuarioAction() {
        lista = new ArrayList<>();
        usuario = new Usuario();
        controladorUsuario = new ControladorUsuario();
    }

    public void validateRegistrar() {
        if (StringUtils.isBlank(usuario.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.INGRESENOMBRE);
        }
        if (StringUtils.isBlank(usuario.getApellido())) {
            addFieldError("apellido", Soporte.Mensaje.INGRESEAPELLIDO);
        }
        if (StringUtils.isBlank(usuario.getNick())) {
            addFieldError("nick", Soporte.Mensaje.INGRESENICK);
        }
        if (StringUtils.isBlank(usuario.getClave())) {
            addFieldError("clave", Soporte.Mensaje.INGRESECLAVE);
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String registrar() {
        controladorUsuario.guardar(usuario.getNombre(), usuario.getApellido(), usuario.getClave(), usuario.getNick(), usuario.getRol());
        sesion.put("mensaje", Soporte.Mensaje.getAgregado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public void validateModificar() {
        validateRegistrar();
    }

    public String modificar() {
        sesion.put("mensaje", Soporte.Mensaje.getModificado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public String eliminar() {
        sesion.put("mensaje", Soporte.Mensaje.getEliminado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public String listar() {
        addActionMessage((String) sesion.get("mensaje"));
        sesion.put("mensaje", null);
        return SUCCESS;
    }

    public String nuevo() {
        return SUCCESS;
    }

    public String editar() {
        usuario = new Usuario(11, "NEGRO", "NEGRO", "NEGRO", "NEGRO", Rol.Mozo);
        return SUCCESS;
    }

    public void validateLogin() {
//        addActionError("Las credenciales no son validas.");
    }

    public String login() {
        return SUCCESS;
    }

    public String logout() {
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
