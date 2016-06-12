/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.Set;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class Stock {

    private int id;
    private int cantidadActual, cantidadMinima;
    private Set<DetalleStock> detalleStocks;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Set<DetalleStock> getDetalleStocks() {
        return detalleStocks;
    }

    public void setDetalleStocks(Set<DetalleStock> detalleStocks) {
        this.detalleStocks = detalleStocks;
    }

    public int getCantidadActual() {
        return cantidadActual;
    }

    public void setCantidadActual(int cantidadActual) {
        this.cantidadActual = cantidadActual;
    }

    public int getCantidadMinima() {
        return cantidadMinima;
    }

    public void setCantidadMinima(int cantidadMinima) {
        this.cantidadMinima = cantidadMinima;
    }

    @Override
    public String toString() {
        return "Stock{" + "id=" + id + ", cantidadActual=" + cantidadActual + ", cantidadMinima=" + cantidadMinima + '}';
    }

    /**
     * registra un descuento al stock del insumo y genera un detalle en el
     * historial.
     *
     * @param cantidadARestar cantidad positiva.
     */
    public void regitrarDescuento(int cantidadARestar) {
        DetalleStock venta = new DetalleStock(Math.negateExact(cantidadARestar), LocalDate.now(), TipoMovimiento.Venta);
        this.detalleStocks.add(venta);
        this.cantidadActual -= cantidadARestar;
    }

    /**
     * registra una reposicion al stock del insumo y genera un detalle en el
     * historial.
     *
     * @param cantidadASumar cantidad positiva.
     */
    public void registrarReposicion(int cantidadASumar) {
        DetalleStock aSumar = new DetalleStock(cantidadASumar, LocalDate.now(), TipoMovimiento.Reposicion);
        this.detalleStocks.add(aSumar);
        this.cantidadActual += cantidadASumar;
    }

    /**
     * registra un ajuste al stock del insumo y genera un detalle en el
     * historial.
     *
     * @param cantidadAjuste positivo o negativo segun sea el ajuste.
     */
    public void registrarAjusteStock(int cantidadAjuste) {
        DetalleStock ajuste = new DetalleStock(cantidadAjuste, LocalDate.now(), TipoMovimiento.Ajuste);
        this.detalleStocks.add(ajuste);
        this.cantidadActual = cantidadAjuste;
    }
}
