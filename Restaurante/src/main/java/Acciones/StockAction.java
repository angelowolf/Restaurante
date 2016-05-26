/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorCategoriaInsumo;
import Controlador.Implementacion.ControladorInsumo;
import Controlador.Implementacion.ControladorStock;
import Controlador.Interface.IControladorCategoriaInsumo;
import Controlador.Interface.IControladorInsumo;
import Controlador.Interface.IControladorStock;
import Modelo.CategoriaInsumo;
import Modelo.Insumo;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ang_2
 */
public class StockAction extends Accion {

    private List<Insumo> lista;
    private List<CategoriaInsumo> categorias;
    private final IControladorStock controladorStock;
    private final IControladorInsumo controladorInsumo;
    private final IControladorCategoriaInsumo controladorCategoriaInsumo;
    
    private List<Integer> ids;
    private List<Integer> cantidad;
    private List<Float> precio;
    private String nombreInsumo;
    private int idCategoria;

    public StockAction() {
        controladorCategoriaInsumo = new ControladorCategoriaInsumo();
        controladorInsumo = new ControladorInsumo();
        controladorStock = new ControladorStock();
        lista = new ArrayList<>();
        categorias = new ArrayList<>();
    }

    public String getListaCompra() {
        return SUCCESS;
    }

    public String postBuscarInsumo(){
        lista = controladorInsumo.getTodosByCategoriaByNombreSinEstos(idCategoria,nombreInsumo,ids);
        return SUCCESS;
    }
    
    public String getCargarCompra() {
        lista = controladorInsumo.getTodosStockMinimo();
        categorias = controladorCategoriaInsumo.getTodos();
        System.out.println(lista);
        return SUCCESS;
    }

    public String getAjusteStock() {
        return SUCCESS;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

    public List<Insumo> getLista() {
        return lista;
    }

    public List<CategoriaInsumo> getCategorias() {
        return categorias;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }

    public void setCantidad(List<Integer> cantidad) {
        this.cantidad = cantidad;
    }

    public void setPrecio(List<Float> precio) {
        this.precio = precio;
    }

    public void setNombreInsumo(String nombreInsumo) {
        this.nombreInsumo = nombreInsumo;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

}
