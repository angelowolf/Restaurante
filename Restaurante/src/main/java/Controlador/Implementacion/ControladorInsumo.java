/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Implementacion;

import Controlador.Interface.IControladorInsumo;
import Modelo.Insumo;
import java.util.List;

/**
 *
 * @author ang_2
 */
public class ControladorInsumo implements IControladorInsumo {

    @Override
    public List<Insumo> getTodos(boolean activo) {
        return INSUMODAO.getTodos(activo);
    }

    @Override
    public List<Insumo> getTodosByCategoriaByNombreSinEstos(int i, String term, Object object, boolean b) {
        return null;
    }

    @Override
    public Insumo buscar(int id) {
        return INSUMODAO.buscar(id);
    }

}
