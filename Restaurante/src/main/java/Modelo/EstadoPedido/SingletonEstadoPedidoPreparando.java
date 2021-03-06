/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.EstadoPedido;

import Persistencia.ORM.DAOImplementacion.EstadoPedidoDAO;

/**
 *
 * @author ang_2
 */
public class SingletonEstadoPedidoPreparando {

    private static SingletonEstadoPedidoPreparando singleton;
    private static EstadoPedido estado;

    private SingletonEstadoPedidoPreparando() {
        EstadoPedidoDAO estadoPedidoDAO = new EstadoPedidoDAO();
        estado = estadoPedidoDAO.buscar("preparando");
    }

    public EstadoPedido getEstadoPedidoPreparando() {
        return estado;
    }

    public static SingletonEstadoPedidoPreparando getInstancia() {
        if (singleton == null) {
            singleton = new SingletonEstadoPedidoPreparando();
        }
        return singleton;
    }
}
