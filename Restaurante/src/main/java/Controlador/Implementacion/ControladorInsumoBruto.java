/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Implementacion;

import Modelo.Stock;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.WordUtils;
import org.apache.log4j.Logger;
import org.joda.time.LocalDate;
import Controlador.Interface.IControladorInsumoBruto;
import Modelo.InsumoBruto;

/**
 *
 * @author ang_2
 */
public class ControladorInsumoBruto implements IControladorInsumoBruto {

    private static final Logger LOGGER = Logger.getLogger(ControladorInsumoBruto.class);

    @Override
    public int guardar(InsumoBruto insumo) {
        CS.guardar(insumo.getStock());
        insumo.setFechaAlta(new LocalDate());
        return INSUMODAO.guardar(insumo);
    }

    @Override
    public List<InsumoBruto> getTodos() {
        return INSUMODAO.getTodos();
    }

    @Override
    public InsumoBruto getInsumo(int id) {
        return INSUMODAO.buscar(id);
    }

    @Override
    public void actualizar(InsumoBruto insumo) {
        InsumoBruto insumoEnBd = this.getInsumo(insumo.getId());
        insumoEnBd.actualizar(insumo);
        INSUMODAO.actualizar(insumoEnBd);
    }

    @Override
    public void eliminar(InsumoBruto insumo) {
        InsumoBruto insumoEnBD = this.getInsumo(insumo.getId());
        insumoEnBD.darDeBaja();
        INSUMODAO.actualizar(insumoEnBD);
    }

    @Override
    public void recuperar(InsumoBruto insumo) {
        InsumoBruto insumoEnBD = this.getInsumo(insumo.getId());
        insumoEnBD.recuperar();
        INSUMODAO.actualizar(insumoEnBD);
    }

    @Override
    public List<InsumoBruto> getTodosStockMinimo() {
        return INSUMODAO.getTodosStockMinimo();
    }

    @Override
    public List<InsumoBruto> getTodosByCategoriaByNombreSinEstos(int idCategoria, String nombreInsumo, List<Integer> ids) {
        if (StringUtils.isBlank(nombreInsumo) || nombreInsumo.equals("undefined")) {
            LOGGER.info("2");
            return INSUMODAO.getTodosByCategoriaByNombreSinEstos(idCategoria, null, ids);
        } else {
            LOGGER.info("4");
            return INSUMODAO.getTodosByCategoriaByNombreSinEstos(idCategoria, WordUtils.capitalize(nombreInsumo), ids);
        }
    }

    @Override
    public List<InsumoBruto> buscar(String nombreFiltro, int categoriaInsumoFiltro) {
        if (StringUtils.isBlank(nombreFiltro)) {
            nombreFiltro = null;
        }
        return INSUMODAO.getTodosByCategoriaByNombreSinEstos(categoriaInsumoFiltro, nombreFiltro, null);
    }
}
