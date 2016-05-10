/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.Interface;

import Modelo.Stock;
import Persistencia.ORM.DAOImplementacion.StockDAO;
import Persistencia.ORM.DAOInterface.IStock;

/**
 *
 * @author ang_2
 */
public interface IControladorStock {
    final IStock STOCKDAO = new StockDAO();

    public void eliminar(Stock stock);

    public void actualizar(Stock stock);

    public Stock getStock(int id);

    public void guardar(Stock stock);
}
