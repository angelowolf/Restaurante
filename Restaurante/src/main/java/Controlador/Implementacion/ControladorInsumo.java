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
import org.apache.log4j.Logger;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class ControladorInsumo implements IControladorInsumo {

    private static final Logger LOGGER = Logger.getLogger(ControladorInsumo.class);

    @Override
    public int guardar(Insumo insumo) {
        CS.guardar(insumo.getStock());
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
        Stock stock = CS.getStock(insumoEnBd.getStock().getId());
        stock.setCantidadMinima(insumo.getStock().getCantidadMinima());
        insumoEnBd.actualizar(insumo);
        CS.actualizar(stock);
        INSUMODAO.actualizar(insumoEnBd);
    }

    @Override
    public void eliminar(Insumo insumo) {
        Insumo insumoEnBD = this.getInsumo(insumo.getId());
        LocalDate hoy = LocalDate.now();
        insumoEnBD.setFechaBaja(hoy);
        INSUMODAO.actualizar(insumoEnBD);
    }

    @Override
    public void recuperar(Insumo insumo) {
        Insumo insumoEnBD = this.getInsumo(insumo.getId());
        insumoEnBD.setFechaBaja(null);
        INSUMODAO.actualizar(insumoEnBD);
    }
}
