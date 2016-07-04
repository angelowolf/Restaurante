/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Controlador.Implementacion.ControladorNotificacion;
import java.util.Set;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class Stock {

    private int id;
    private float cantidadActual, cantidadMinima;
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

    public float getCantidadActual() {
        return cantidadActual;
    }

    public void setCantidadActual(float cantidadActual) {
        this.cantidadActual = cantidadActual;
    }

    public float getCantidadMinima() {
        return cantidadMinima;
    }

    public void setCantidadMinima(float cantidadMinima) {
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
     * @param insumo
     * @param cantidadARestar cantidad positiva.
     */
    public void regitrarDescuento(Insumo insumo, float cantidadARestar) {
        DetalleStock venta = new DetalleStock(-cantidadARestar, LocalDate.now(), TipoMovimiento.Venta);
        this.detalleStocks.add(venta);
        this.cantidadActual -= cantidadARestar;
        this.verificarStockBajo(insumo);
    }

    /**
     * registra una reposicion al stock del insumo y genera un detalle en el
     * historial.
     *
     * @param cantidadASumar cantidad positiva.
     */
    public void registrarReposicion(float cantidadASumar) {
        DetalleStock aSumar = new DetalleStock(cantidadASumar, LocalDate.now(), TipoMovimiento.Reposicion);
        this.detalleStocks.add(aSumar);
        this.cantidadActual += cantidadASumar;
    }

    /**
     * registra un ajuste al stock del insumo y genera un detalle en el
     * historial.
     *
     * @param insumo
     * @param cantidadAjuste positivo o negativo segun sea el ajuste.
     */
    public void registrarAjusteStock(Insumo insumo, float cantidadAjuste) {
        DetalleStock ajuste = new DetalleStock(cantidadAjuste, LocalDate.now(), TipoMovimiento.Ajuste);
        this.detalleStocks.add(ajuste);
        this.cantidadActual = cantidadAjuste;
        this.verificarStockBajo(insumo);
    }

    /**
     * verifica si el stock actual esta debajo del minimo, si es el caso enviara
     * una notificacion a los responsables de stock.
     */
    private void verificarStockBajo(Insumo insumo) {
        LOGGER.info("Verificando Cantidad en Stock");
        if (this.cantidadActual - this.cantidadMinima <= 0) {
            LOGGER.info("Cantidad Verificada, Debajo del Minimo");
            ControladorNotificacion.getControlador().notificarInsumoDebajoDelMinimo(insumo);
        }
    }
    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(Stock.class);

    public void registrarConfeccion(InsumoBruto aThis, float f) {
        DetalleStock ajuste = new DetalleStock(-f, LocalDate.now(), TipoMovimiento.Confeccion);
        this.detalleStocks.add(ajuste);
        this.cantidadActual -= f;
        this.verificarStockBajo(aThis);
    }
}
