/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Implementacion;

import Controlador.Interface.IControladorInsumoBruto;
import Controlador.Interface.IControladorStock;
import Modelo.InsumoBruto;
import Modelo.Stock;
import java.util.List;

/**
 *
 * @author ang_2
 */
public class ControladorStock implements IControladorStock {

    @Override
    public void eliminar(Stock stock) {
        STOCKDAO.eliminar(stock);
    }

    @Override
    public void actualizar(Stock stock) {
        STOCKDAO.actualizar(stock);
    }

    @Override
    public Stock getStock(int id) {
        return STOCKDAO.buscar(id);
    }

    @Override
    public void guardar(Stock stock) {
        STOCKDAO.guardar(stock);
    }

    @Override
    public void registrarCompraInsumoBruto(List<Integer> ids, List<Integer> cantidad, List<Float> precio) {
        IControladorInsumoBruto controladorInsumoBruto = new ControladorInsumoBruto();
        for (int i = 0; i < ids.size(); i++) {
            InsumoBruto insumo = controladorInsumoBruto.getInsumo(ids.get(i));
            insumo.registrarReposicion(cantidad.get(i));
            insumo.setPrecioUnidad(precio.get(i));
            controladorInsumoBruto.actualizar(insumo);
        }

    }

}
