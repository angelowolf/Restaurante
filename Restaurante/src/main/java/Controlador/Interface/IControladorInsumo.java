/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Interface;

import Controlador.Implementacion.ControladorStock;
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
    final IControladorStock CS = new ControladorStock();

    public int guardar(Insumo insumo);

    public List<Insumo> getTodos();

    public Insumo getInsumo(int id);

    public void actualizar(Insumo insumo);

    public void eliminar(Insumo insumo);

    public void recuperar(Insumo insumo);

    public List<Insumo> getTodosStockMinimo();

    public List<Insumo> getTodosByCategoriaByNombreSinEstos(int idCategoria, String nombreInsumo, List<Integer> ids);

    public List<Insumo> buscar(String nombreFiltro, int categoriaInsumoFiltro);
}
