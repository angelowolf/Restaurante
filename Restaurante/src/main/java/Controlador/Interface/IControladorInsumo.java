/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Interface;

import Modelo.Insumo;
import Persistencia.ORM.DAOImplementacion.InsumoDAO;
import Persistencia.ORM.DAOImplementacion.StockDAO;
import Persistencia.ORM.DAOInterface.IInsumo;
import Persistencia.ORM.DAOInterface.IStock;
import java.util.List;

/**
 *
 * @author ang_2
 */
public interface IControladorInsumo {

    final IInsumo INSUMODAO = new InsumoDAO();
    final IStock STOCKDAO = new StockDAO();

    public int guardar(Insumo insumo);

    public List<Insumo> getTodos();

    public Insumo getInsumo(int id);

    public void actualizar(Insumo insumo);
}
