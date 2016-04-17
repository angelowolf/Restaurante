package Controlador.Implementacion;

import Controlador.Interface.IControladorUsuario;
import Modelo.Rol;
import Modelo.Usuario;
import Soporte.Encriptar;
import java.util.List;
import org.apache.log4j.Logger;

/**
 * @author Angelo
 * @version 1.0
 * @created 28-ene-2016 08:44:23 p.m.
 */
public class ControladorUsuario implements IControladorUsuario {
    private static final Logger LOG = Logger.getLogger(ControladorUsuario.class);
    
    @Override
    public void eliminar(Usuario u) {
        USUARIODAO.eliminar(u);
    }

    @Override
    public void eliminar(int idUsuario) {
        Usuario u = new Usuario();
        u.setId(idUsuario);
        USUARIODAO.eliminar(u);
    }

    @Override
    public boolean isNickDisponible(String nick) {
        Usuario u = getUsuario(nick);
        return u == null;
    }

    @Override
    public Usuario getUsuario(String nick) {
        return USUARIODAO.buscarNick(nick);

    }
    @Override
    public Usuario getUsuario(int id) {
        return USUARIODAO.buscar(id);
    }

    @Override
    public boolean iniciarSesion(Usuario usuario, String password) {
        return usuario != null && usuario.iniciarSesion(password);
    }

    @Override
    public int guardar(String nombre, String apellido, String clave, String nick, Rol rol) {
        Usuario u = new Usuario(nombre, apellido, nick, Encriptar.encriptaEnMD5(clave), rol);
        return USUARIODAO.guardar(u);
    }

    @Override
    public int guardar(Usuario usuario) {
        usuario.setClave(Encriptar.encriptaEnMD5(usuario.getClave()));
        return USUARIODAO.guardar(usuario);
    }

    @Override
    public void actualizar(int idUsuario, String nombre, String apellido, String clave, String nick, Rol rol) {
        Usuario u = USUARIODAO.buscar(idUsuario);
        if (!u.getClave().equals(clave)) {
            u.setClave(Encriptar.encriptaEnMD5(clave));
        }
        u.setNick(nick);
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setRol(rol);
        USUARIODAO.actualizar(u);
    }

    @Override
    public void actualizar(Usuario usuario) {
        Usuario u = USUARIODAO.buscar(usuario.getId());
        if (!u.getClave().equals(usuario.getClave())) {
            u.setClave(Encriptar.encriptaEnMD5(usuario.getClave()));
        }
        u.setNick(usuario.getNick());
        u.setNombre(usuario.getNombre());
        u.setApellido(usuario.getApellido());
        u.setRol(usuario.getRol());
        
        LOG.info(usuario.toString());
        LOG.info(u.toString());
        USUARIODAO.actualizar(u);
    }

    @Override
    public List<Usuario> getTodos() {
        return USUARIODAO.listar();
    }

    @Override
    public boolean nickDisponible(Usuario u) {
        Usuario usuario = USUARIODAO.buscarNick(u.getNick());
        if (usuario == null) {
            return true;
        }
        return u.getId() == usuario.getId();
    }

}//end ControladorUsuario
