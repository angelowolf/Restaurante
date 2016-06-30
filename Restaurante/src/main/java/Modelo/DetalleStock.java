/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import org.apache.struts2.json.annotations.JSON;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class DetalleStock {

    private int id;
    private float cantidad;
    private LocalDate fecha;
    private TipoMovimiento tipoMovimiento;
    private String f;

    public DetalleStock() {
    }

    public DetalleStock(float cantidad, LocalDate fecha, TipoMovimiento tipoMovimiento) {
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.tipoMovimiento = tipoMovimiento;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getCantidad() {
        return cantidad;
    }

    public void setCantidad(float cantidad) {
        this.cantidad = cantidad;
    }

    public String getF() {
        if (null == fecha) {
            return null;
        }
        return fecha.toString(Soporte.Mensaje.FECHAJSON);
    }

    @JSON(serialize = false)
    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public TipoMovimiento getTipoMovimiento() {
        return tipoMovimiento;
    }

    public void setTipoMovimiento(TipoMovimiento tipoMovimiento) {
        this.tipoMovimiento = tipoMovimiento;
    }

}
