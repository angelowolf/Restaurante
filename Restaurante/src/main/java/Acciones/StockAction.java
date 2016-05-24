/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

/**
 *
 * @author ang_2
 */
public class StockAction extends Accion {

    public String getListaCompra() {
        return SUCCESS;
    }

    public String getCargarCompra() {
        return SUCCESS;
    }

    public String getAjusteStock() {
        return SUCCESS;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

}
