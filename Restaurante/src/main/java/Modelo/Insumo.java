/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import org.apache.commons.lang.WordUtils;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class Insumo {

    private int id;
    private String nombre;
    private float precioUnidad;
    private UnidadMedida unidadMedida;
    private Stock stock;
    private LocalDate fechaAlta;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = WordUtils.capitalize(nombre);
    }

    public float getPrecioUnidad() {
        return precioUnidad;
    }

    public void setPrecioUnidad(float precioUnidad) {
        this.precioUnidad = precioUnidad;
    }

    public UnidadMedida getUnidadMedida() {
        return unidadMedida;
    }

    public void setUnidadMedida(UnidadMedida unidadMedida) {
        this.unidadMedida = unidadMedida;
    }

    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
    }

    public LocalDate getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(LocalDate fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    @Override
    public String toString() {
        return "Insumo{" + "id=" + id + ", nombre=" + nombre + ", precioUnidad=" + precioUnidad + ", unidadMedida=" + unidadMedida + ", stock=" + stock + ", fechaAlta=" + fechaAlta + '}';
    }

    public void actualizar(Insumo insumo) {
        this.nombre = insumo.getNombre();
        this.precioUnidad = insumo.getPrecioUnidad();
        this.unidadMedida = insumo.getUnidadMedida();
    }

}