/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Implementacion;

import Controlador.Interface.IControladorInsumoElaborado;
import Modelo.InsumoElaborado;
import java.util.List;

/**
 *
 * @author ang_2
 */
public class ControladorInsumoElaborado implements IControladorInsumoElaborado {

    @Override
    public List<InsumoElaborado> buscar(String nombreFiltro) {
        return null;
    }

    @Override
    public void eliminar(InsumoElaborado insumoElaborado) {
    }

    @Override
    public void guardar(InsumoElaborado insumoElaborado) {
    }

    @Override
    public void actualizar(InsumoElaborado insumoElaborado) {
    }

    @Override
    public InsumoElaborado getInsumo(int id) {
        return null;
    }

    @Override
    public void recuperar(InsumoElaborado insumoElaborado) {
    }

}
