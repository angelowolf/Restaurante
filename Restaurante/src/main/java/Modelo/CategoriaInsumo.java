/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author ang_2
 */
public class CategoriaInsumo {

    private int id;
    private String nombre, descripcion;

    public CategoriaInsumo() {
    }

    public CategoriaInsumo(String nombre, String descripcion) {
        this.nombre = nombre;
        this.descripcion = descripcion;
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
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "CategoriaInsumo{" + "id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + '}';
    }

    public void actualizar(CategoriaInsumo categoriaInsumo) {
        this.nombre = categoriaInsumo.getNombre();
        this.descripcion = categoriaInsumo.getDescripcion();
    }

}
