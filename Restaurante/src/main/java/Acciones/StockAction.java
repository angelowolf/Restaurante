/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorCategoriaInsumo;
import Controlador.Implementacion.ControladorInsumoBruto;
import Controlador.Implementacion.ControladorStock;
import Controlador.Interface.IControladorCategoriaInsumo;
import Controlador.Interface.IControladorStock;
import Modelo.CategoriaInsumo;
import java.util.ArrayList;
import java.util.List;
import Controlador.Interface.IControladorInsumoBruto;
import Modelo.InsumoBruto;

/**
 *
 * @author ang_2
 */
public class StockAction extends Accion {

    private List<InsumoBruto> lista;
    private List<CategoriaInsumo> categorias;
    private final IControladorStock controladorStock;
    private final IControladorInsumoBruto controladorInsumo;
    private final IControladorCategoriaInsumo controladorCategoriaInsumo;

    private List<Integer> ids;
    private List<Integer> cantidad;
    private List<Float> precio;

    public StockAction() {
        controladorCategoriaInsumo = new ControladorCategoriaInsumo();
        controladorInsumo = new ControladorInsumoBruto();
        controladorStock = new ControladorStock();
        lista = new ArrayList<>();
        categorias = new ArrayList<>();
    }

    public String getListaCompra() {
        lista = controladorInsumo.getTodosStockMinimo();
        categorias = controladorCategoriaInsumo.getTodos();
        return SUCCESS;
    }

    public String getCargarCompra() {
        lista = controladorInsumo.getTodosStockMinimo();
        categorias = controladorCategoriaInsumo.getTodos();
        return SUCCESS;
    }

    public void validatePostCargarCompra() {
        if (ids == null || ids.isEmpty()) {
            addActionError(Soporte.Mensaje.SELECCIONEINSUMO);
        } else {
            if (cantidad == null || cantidad.isEmpty()) {
                addActionError(Soporte.Mensaje.INGRESECANTIDADCOMPRADA);
            } else {
                for (Integer integer : cantidad) {
                    if (integer == null) {
                        addActionError(Soporte.Mensaje.INGRESECANTIDADCOMPRADA);
                        break;
                    }
                }
            }
            if (precio == null || precio.isEmpty()) {
                addActionError(Soporte.Mensaje.INGRESEPRECIO);
            } else {
                for (Float float1 : precio) {
                    if (float1 == null) {
                        addActionError(Soporte.Mensaje.INGRESEPRECIO);
                        break;
                    }
                }
            }
        }
        if (hasErrors()) {
            codigo = 400;
        }
    }

    public String postCargarCompra() {
        controladorStock.registrarCompraInsumoBruto(ids, cantidad, precio);
        sesion.put("mensaje", Soporte.Mensaje.COMPRAREGISTRADA);
        return SUCCESS;
    }

    public void validatePostAjusteStock() {
        if (ids == null || ids.isEmpty()) {
            addActionError(Soporte.Mensaje.SELECCIONEINSUMO);
        } else if (cantidad == null || cantidad.isEmpty()) {
            addActionError(Soporte.Mensaje.INGRESECANTIDADCOMPRADA);
        } else {
            for (Integer integer : cantidad) {
                if (integer == null) {
                    addActionError(Soporte.Mensaje.INGRESECANTIDADCOMPRADA);
                    break;
                }
            }
        }
        if (hasErrors()) {
            codigo = 400;
        }
    }

    public String postAjusteStock() {
        controladorStock.registrarAjuste(ids, cantidad);
        return SUCCESS;
    }

    public String getAjusteStock() {
        return SUCCESS;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

    public List<InsumoBruto> getLista() {
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

}
