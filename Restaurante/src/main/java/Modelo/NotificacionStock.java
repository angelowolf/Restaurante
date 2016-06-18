/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Notificacion.TipoMensaje;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class NotificacionStock extends Notificacion {

    private Insumo insumo;

    public NotificacionStock() {
    }

    public NotificacionStock(Insumo insumo, String mensaje, LocalDate fecha, Usuario usuario, boolean visto, TipoMensaje tipoMensaje) {
        super(mensaje, fecha, usuario, visto, tipoMensaje);
        this.insumo = insumo;
    }

    public Insumo getInsumo() {
        return insumo;
    }

    public void setInsumo(Insumo insumo) {
        this.insumo = insumo;
    }
}
