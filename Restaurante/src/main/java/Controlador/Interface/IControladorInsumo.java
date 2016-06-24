/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Interface;

import Modelo.Insumo;
import Persistencia.ORM.DAOImplementacion.InsumoDAO;
import Persistencia.ORM.DAOInterface.IInsumo;
import java.util.List;

/**
 *
 * @author ang_2
 */
public interface IControladorInsumo {

    final IInsumo INSUMODAO = new InsumoDAO();

    /**
     * Busca todos los insumos.
     *
     * @param activo si es true busca los activos, si es falso todos.
     * @return
     */
    public List<Insumo> getTodos(boolean activo);

}
