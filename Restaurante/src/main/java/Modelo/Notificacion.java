/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class Notificacion {

    private int id;
    private String mensaje;
    private LocalDate fecha;
    private Usuario usuario;
    private boolean visto;

    public Notificacion() {
    }

    public Notificacion(String mensaje, LocalDate fecha, Usuario usuario, boolean visto) {
        this.mensaje = mensaje;
        this.fecha = fecha;
        this.usuario = usuario;
        this.visto = visto;
    }

    public boolean isVisto() {
        return visto;
    }

    public void setVisto(boolean visto) {
        this.visto = visto;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

}
