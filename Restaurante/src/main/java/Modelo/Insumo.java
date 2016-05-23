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
    private CategoriaInsumo categoriaInsumo;
    private LocalDate fechaAlta, fechaBaja;

    public LocalDate getFechaBaja() {
        return fechaBaja;
    }

    public void setFechaBaja(LocalDate fechaBaja) {
        this.fechaBaja = fechaBaja;
    }

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

    public CategoriaInsumo getCategoriaInsumo() {
        return categoriaInsumo;
    }

    public void setCategoriaInsumo(CategoriaInsumo categoriaInsumo) {
        this.categoriaInsumo = categoriaInsumo;
    }

    @Override
    public String toString() {
        return "Insumo{" + "id=" + id + ", nombre=" + nombre + ", precioUnidad=" + precioUnidad + ", unidadMedida=" + unidadMedida + ", stock=" + stock + ", categoriaInsumo=" + categoriaInsumo + ", fechaAlta=" + fechaAlta + '}';
    }

    public void actualizar(Insumo insumo) {
        this.nombre = insumo.getNombre();
        this.precioUnidad = insumo.getPrecioUnidad();
        this.unidadMedida = insumo.getUnidadMedida();
        this.categoriaInsumo = insumo.getCategoriaInsumo();
    }

}
