/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author ang_2
 */
public class CategoriaReceta {

    private int id;
    private String nombre, descripcion;

    public CategoriaReceta() {
    }

    public CategoriaReceta(String nombre, String descripcion) {
        this.nombre = StringUtils.capitalize(nombre);
        this.descripcion = StringUtils.capitalize(descripcion);
    }

    @Override
    public String toString() {
        return "CategoriaReceta{" + "id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + '}';
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
        this.nombre = StringUtils.capitalize(nombre);
    }

    public String getDescripcion() {
        return descripcion;
    }

    @StringLengthFieldValidator(maxLength = "255", message = "La cantidad máxima de carácter es de 255", fieldName = "descripcion")
    public void setDescripcion(String descripcion) {
        this.descripcion = StringUtils.capitalize(descripcion);
    }

    public void actualizar(CategoriaReceta categoria) {
        this.nombre = categoria.getNombre();
        this.descripcion = categoria.getDescripcion();
    }

}
