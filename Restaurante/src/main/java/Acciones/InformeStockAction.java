/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorInsumo;
import Controlador.Implementacion.ControladorStock;
import Controlador.Interface.IControladorInsumo;
import Controlador.Interface.IControladorStock;
import Modelo.DetalleStock;
import Modelo.TipoMovimiento;
import Soporte.InformeDateBasedData;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author ang_2
 */
public class InformeStockAction extends Accion {

    private static final Logger LOGGER = Logger.getLogger(InformeStockAction.class);
    private int id;
    private String nombre;
    private final List listaDatos;
    private final List<TipoMovimiento> movimientos;
    private final IControladorInsumo ci;
    private final IControladorStock cs;

    public InformeStockAction() {
        cs = new ControladorStock();
        ci = new ControladorInsumo();
        movimientos = Arrays.asList(TipoMovimiento.values());
        listaDatos = new ArrayList();

    }

    public String ver() {
        this.nombre = ci.buscar(id).getNombre();
        return SUCCESS;
    }

    private List agregar(List<DetalleStock> l) {
        List temp = new ArrayList();
        for (DetalleStock detalleStock : l) {
            temp.add(new InformeDateBasedData(detalleStock.getF(), detalleStock.getTotal()));
        }
        return temp;
    }

    public String getMovimientoStock() {
        this.listaDatos.add(this.agregar(cs.getDetalles(id)));
        this.listaDatos.add(this.agregar(cs.getDetalles(id, TipoMovimiento.Venta)));
        this.listaDatos.add(this.agregar(cs.getDetalles(id, TipoMovimiento.Reposicion)));
        this.listaDatos.add(this.agregar(cs.getDetalles(id, TipoMovimiento.Ajuste)));
        this.listaDatos.add(this.agregar(cs.getDetalles(id, TipoMovimiento.Confeccion)));
        return SUCCESS;
    }

    public List getListaDatos() {
        return listaDatos;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public List<TipoMovimiento> getMovimientos() {
        return movimientos;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

}
