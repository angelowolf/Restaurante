/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Set;

/**
 *
 * @author ang_2
 */
public class Receta {

    private int id;
    private String nombre;
    private CategoriaReceta categoriaReceta;
    private Set<Ingrediente> ingredientes;
    private Set<DetalleReceta> recetas;

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

    @Override
    public String toString() {
        return "Receta{" + "id=" + id + ", nombre=" + nombre + ", categoriaReceta=" + categoriaReceta + ", ingredientes=" + ingredientes + ", recetas=" + recetas + '}';
    }

}
