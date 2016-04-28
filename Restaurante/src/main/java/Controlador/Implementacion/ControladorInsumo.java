/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Implementacion;

import Controlador.Interface.IControladorInsumo;
import Modelo.Insumo;
import Modelo.Stock;
import java.util.List;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class ControladorInsumo implements IControladorInsumo {

    @Override
    public int guardar(Insumo insumo) {
        STOCKDAO.guardar(insumo.getStock());
        insumo.setFechaAlta(new LocalDate());
        return INSUMODAO.guardar(insumo);
    }

    @Override
    public List<Insumo> getTodos() {
        return INSUMODAO.getTodos();
    }

    @Override
    public Insumo getInsumo(int id) {
        return INSUMODAO.buscar(id);
    }

    @Override
    public void actualizar(Insumo insumo) {
        Insumo insumoEnBd = INSUMODAO.buscar(insumo.getId());
        Stock stock = STOCKDAO.buscar(insumoEnBd.getStock().getId());
        stock.setCantidadMinima(insumo.getStock().getCantidadMinima());
        insumoEnBd.actualizar(insumo);
        STOCKDAO.actualizar(stock);
        INSUMODAO.actualizar(insumoEnBd);
    }

}
