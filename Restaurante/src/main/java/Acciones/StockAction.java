/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorInsumo;
import Controlador.Implementacion.ControladorStock;
import Controlador.Interface.IControladorInsumo;
import Controlador.Interface.IControladorStock;
import Modelo.Insumo;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ang_2
 */
public class StockAction extends Accion {

    private List<Insumo> lista;
    private final IControladorStock controladorStock;
    private final IControladorInsumo controladorInsumo;

    public StockAction() {
        controladorInsumo = new ControladorInsumo();
        controladorStock = new ControladorStock();
        lista = new ArrayList<>();
    }

    public String getListaCompra() {
        return SUCCESS;
    }

    public String getCargarCompra() {
        lista = controladorInsumo.getTodosStockMinimo();
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

}
