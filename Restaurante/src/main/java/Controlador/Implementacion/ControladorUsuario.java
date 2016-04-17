package Controlador.Implementacion;

import Controlador.Interface.IControladorUsuario;
import Modelo.Rol;
import Modelo.Usuario;
import Soporte.Encriptar;
import java.text.SimpleDateFormat;

/**
 * @author Angelo
 * @version 1.0
 * @created 28-ene-2016 08:44:23 p.m.
 */
public class ControladorUsuario implements IControladorUsuario {

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
    public boolean iniciarSesion(Usuario usuario, String password) {
        return usuario != null && usuario.iniciarSesion(password);
    }

    @Override
    public int guardar(String nombre, String apellido, String clave, String nick, Rol rol) {
        Usuario u = new Usuario(nombre, apellido, nick, Encriptar.encriptaEnMD5(clave), rol);
        return USUARIODAO.guardar(u);

    }

    @Override
    public void actualizar(int idUsuario, String nombre, String apellido, String clave, String nick, Rol rol) {
        Usuario u = USUARIODAO.buscar(idUsuario);
        u.setClave(Encriptar.encriptaEnMD5(clave));
        u.setNick(nick);
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setRol(rol);
        USUARIODAO.actualizar(u);

    }

}//end ControladorUsuario
