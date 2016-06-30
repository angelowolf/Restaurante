/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Interface;

import Modelo.InsumoElaborado;
import java.util.List;

/**
 *
 * @author ang_2
 */
public interface IControladorInsumoElaborado {

    public List<InsumoElaborado> buscar(String nombreFiltro);

    public void eliminar(InsumoElaborado insumoElaborado);

    public void guardar(InsumoElaborado insumoElaborado);

    public void actualizar(InsumoElaborado insumoElaborado);

    public InsumoElaborado getInsumo(int id);

    public void recuperar(InsumoElaborado insumoElaborado);
    
}
