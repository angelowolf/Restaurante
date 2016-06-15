/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Implementacion;

import Controlador.Interface.IControladorUsuario;
import Modelo.Insumo;
import Modelo.Rol;
import Modelo.Stock;
import Modelo.Usuario;
import Notificacion.WSControlador;
import Soporte.Mensaje;
import java.util.ArrayList;
import java.util.List;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class ControladorNotificacion {

    private static ControladorNotificacion instancia = null;
    private final IControladorUsuario controladorUsuario;

    /**
     * Crea una instancia de este controlador.
     *
     * @return La instancia
     */
    public synchronized static ControladorNotificacion getControlador() {
        if (instancia == null) {
            instancia = new ControladorNotificacion();
        }
        return instancia;
    }

    private ControladorNotificacion() {
        controladorUsuario = new ControladorUsuario();
    }

    /**
     * Notifica a todos los usuarios logeados con el rol Responsable Stock sobre
     * este insumo, crea y guarda para todos los usuarios la notificacion.
     *
     * @param insumo.
     */
    public void notificarInsumoDebajoDelMinimo(Insumo insumo) {
        List<Rol> rolStock = new ArrayList<>();
        rolStock.add(Rol.Stock);
        List<Usuario> usuariosStock = controladorUsuario.buscar(null, null, rolStock);
        Notificacion.Mensaje mensaje = new Notificacion.Mensaje(Soporte.Mensaje.getNotificacionInsumo(insumo.getNombre()), new LocalDate());
        for (Usuario cadaUsuario : usuariosStock) {
            WSControlador.getControlador().mandarNotificacion(cadaUsuario.getId(), mensaje);
            //crear objeto notificacion y guardarlo para cada uno de estos usuarios
        }
    }
}
