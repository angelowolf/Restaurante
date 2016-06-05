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
public class InsumoElaborado extends Insumo {

    private Set<DetalleInsumoElaborado> detalleInsumoElaborados;

    public InsumoElaborado() {
    }

    public InsumoElaborado(Set<DetalleInsumoElaborado> detalleInsumoElaborados, CategoriaInsumo categoriaInsumo, LocalDate fechaAlta, LocalDate fechaBaja, String nombre, Stock stock, UnidadMedida unidadMedida) {
        super(categoriaInsumo, fechaAlta, fechaBaja, nombre, stock, unidadMedida);
        this.detalleInsumoElaborados = detalleInsumoElaborados;
    }

    public Set<DetalleInsumoElaborado> getDetalleInsumoElaborados() {
        return detalleInsumoElaborados;
    }

    public void setDetalleInsumoElaborados(Set<DetalleInsumoElaborado> detalleInsumoElaborados) {
        this.detalleInsumoElaborados = detalleInsumoElaborados;
    }

    @Override
    public void actualizar(Insumo insumo) {
        if (insumo instanceof InsumoElaborado) {
            InsumoElaborado insumo2 = (InsumoElaborado) insumo;
            this.detalleInsumoElaborados = insumo2.getDetalleInsumoElaborados();
            super.actualizar(insumo);
        } else {
            throw new ClassCastException("Error al castear un objeto a insumoelaborado");
        }
    }

    @Override
    public String toString() {
        return super.toString() + " " + "detalleInsumoElaborados=" + detalleInsumoElaborados;
    }

}
