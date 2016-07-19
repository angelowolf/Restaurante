/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia.ORM.DAOInterface;

import Modelo.CategoriaReceta;
import Modelo.Receta;
import Persistencia.ORM.Util.IGenericDAO;
import java.util.List;

/**
 *
 * @author ang_2
 */
public interface IReceta extends IGenericDAO<Receta, Integer> {

    public List<Receta> getTodos(boolean activo);

    public List<Receta> getTodos(boolean activo, String nombre, CategoriaReceta categoriaReceta);

}
