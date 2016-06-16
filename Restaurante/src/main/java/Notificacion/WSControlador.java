/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Notificacion;

import Controlador.Implementacion.ControladorUsuario;
import Controlador.Interface.IControladorUsuario;
import Modelo.Usuario;
import Persistencia.ORM.Util.HibernateUtil;
import java.util.HashMap;
import org.hibernate.SessionFactory;

/**
 *
 * @author ang_2
 */
public class WSControlador {

    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(WSControlador.class);
    private static WSControlador instancia = null;

    private final HashMap<Integer, Usuario> usuariosConectados;

    /**
     * Busca el usuario por su id en la base de datos y lo agrega a la lista de
     * usuarios conectados.
     *
     * @param idUsuario
     * @param sesion
     */
    public synchronized void agregarUsuario(int idUsuario, ISesion sesion) {
        SessionFactory sf = null;
        try {
            sf = HibernateUtil.getSESSIONFACTORY();
            sf.getCurrentSession().beginTransaction();
            IControladorUsuario controladorUsuario = new ControladorUsuario();
            Usuario usuarioBD = controladorUsuario.getUsuario(idUsuario);
            usuarioBD.setSesion(sesion);
            usuariosConectados.put(idUsuario, usuarioBD);
            usuarioBD.exitoAlLogear();
        } catch (Exception e) {
            sesion.notificarError("Se produjo un error al intentar logear el usuario con el websocket.");
            LOGGER.error("Error al iniciar sesion WebSocket", e);
        } finally {
            try {
                sf.getCurrentSession().getTransaction().commit();
            } catch (Exception e2) {
                LOGGER.error("Error al cerrar sesion sesion", e2);
            }
        }
    }

    /**
     * Quita al usuario de los usuarios conectados.
     *
     * @param idUsuario
     */
    public synchronized void quitarUsuario(int idUsuario) {
        if (usuariosConectados.containsKey(idUsuario)) {
            usuariosConectados.remove(idUsuario);
        }
    }

    /**
     * Verifica si el usuario al que se le enviara el mensaje esta logeado, si
     * lo esta le envia el mensaje.
     *
     * @param idUsuarioDestino
     * @param mensaje
     */
    public synchronized void mandarNotificacion(int idUsuarioDestino, Mensaje mensaje) {
        if (usuariosConectados.containsKey(idUsuarioDestino)) {
            LOGGER.info("Mandando notificacion");
            usuariosConectados.get(idUsuarioDestino).mandarMensaje(mensaje);
        }else{
            LOGGER.info("El usuario no esta logeado" + idUsuarioDestino);
        }
    }

    /**
     * Crea una instancia de este controlador.
     *
     * @return La instancia
     */
    public synchronized static WSControlador getControlador() {
        if (instancia == null) {
            instancia = new WSControlador();
        }
        return instancia;
    }

    private WSControlador() {
        this.usuariosConectados = new HashMap<>();
    }
}
