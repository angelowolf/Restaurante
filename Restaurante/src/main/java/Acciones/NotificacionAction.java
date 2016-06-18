/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorNotificacion;
import Modelo.Notificacion;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ang_2
 */
public class NotificacionAction extends Accion implements ModelDriven<Notificacion> {

    private Notificacion notificacion;
    private final Controlador.Implementacion.ControladorNotificacion controladorNotificacion = ControladorNotificacion.getControlador();
    private List<Notificacion> lista;
    private int cantidad = 0;

    public NotificacionAction() {
        notificacion = new Notificacion();
        lista = new ArrayList<>();
    }

    public String listar() {
        lista = controladorNotificacion.buscar((int) sesion.get("idUsuario"));
        return SUCCESS;
    }

    public String panel() {
        lista = controladorNotificacion.buscarInsumo((int) sesion.get("idUsuario"));
        for (Notificacion n : lista) {
            if (!n.isVisto()) {
                cantidad ++;
            }
        }
        return SUCCESS;
    }

    public String eliminar() {
        controladorNotificacion.eliminar(notificacion);
        sesion.put("mensaje", Soporte.Mensaje.getEliminada(Soporte.Mensaje.NOTFICACION));
        return SUCCESS;
    }

    public String visto() {
        controladorNotificacion.marcarComoVisto(notificacion);
        sesion.put("mensaje", Soporte.Mensaje.NOTIFICACIONVISTA);
        return SUCCESS;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

    @Override
    public Notificacion getModel() {
        return notificacion;
    }

    public void setNotificacion(Notificacion notificacion) {
        this.notificacion = notificacion;
    }

    public List<Notificacion> getLista() {
        return lista;
    }

    public int getCantidad() {
        return cantidad;
    }

}
