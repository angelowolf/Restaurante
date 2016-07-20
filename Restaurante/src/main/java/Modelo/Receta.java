/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import java.util.List;
import java.util.Set;
import org.apache.struts2.json.annotations.JSON;
import org.joda.time.LocalDateTime;

/**
 *
 * @author ang_2
 */
public class Receta {

    private int id;
    private String nombre, fAlta, fBaja;
    private CategoriaReceta categoriaReceta;
    private Set<Ingrediente> ingredientes;
    private Set<DetalleReceta> recetas;
    private LocalDateTime fechaAlta, fechaBaja;

    public Receta() {
    }

    public Receta(String nombre, CategoriaReceta categoriaReceta, Set<Ingrediente> ingredientes, Set<DetalleReceta> recetas) {
        this.nombre = nombre;
        this.categoriaReceta = categoriaReceta;
        this.ingredientes = ingredientes;
        this.recetas = recetas;
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

    @StringLengthFieldValidator(maxLength = "100", message = "La cantidad máxima de carácter es de 100", fieldName = "nombre")
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public CategoriaReceta getCategoriaReceta() {
        return categoriaReceta;
    }

    public void setCategoriaReceta(CategoriaReceta categoriaReceta) {
        this.categoriaReceta = categoriaReceta;
    }

    public Set<Ingrediente> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(Set<Ingrediente> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public Set<DetalleReceta> getRecetas() {
        return recetas;
    }

    public void setRecetas(Set<DetalleReceta> recetas) {
        this.recetas = recetas;
    }

    public String getfAlta() {
        if (null == fechaAlta) {
            return null;
        }
        return fechaAlta.toString(Soporte.Mensaje.FECHAJSON);
    }

    public void setfAlta(String fAlta) {
        this.fAlta = fAlta;
    }

    public String getfBaja() {
        if (null == fechaBaja) {
            return null;
        }
        return fechaBaja.toString(Soporte.Mensaje.FECHAJSON);
    }

    public void setfBaja(String fBaja) {
        this.fBaja = fBaja;
    }

    @JSON(serialize = false)
    public LocalDateTime getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(LocalDateTime fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    @JSON(serialize = false)
    public LocalDateTime getFechaBaja() {
        return fechaBaja;
    }

    public void setFechaBaja(LocalDateTime fechaBaja) {
        this.fechaBaja = fechaBaja;
    }

    @Override
    public String toString() {
        return "Receta{" + "id=" + id + ", nombre=" + nombre + ", categoriaReceta=" + categoriaReceta + ", ingredientes=" + ingredientes + ", recetas=" + recetas + '}';
    }

    public void nueva(Set<Ingrediente> ingredientesSeleccionados, Set<DetalleReceta> recetasSeleccionados) {
        this.setIngredientes(ingredientesSeleccionados);
        this.setRecetas(recetasSeleccionados);
        this.setFechaAlta(new LocalDateTime());
    }

    public void darDeBaja() {
        this.setFechaBaja(new LocalDateTime());
    }

}
