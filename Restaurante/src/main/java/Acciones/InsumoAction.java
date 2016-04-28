/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorInsumo;
import Controlador.Interface.IControladorInsumo;
import Modelo.Insumo;
import Soporte.Mensaje;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author ang_2
 */
public class InsumoAction extends Accion implements ModelDriven<Insumo> {

    private static final Logger LOGGER = Logger.getLogger(InsumoAction.class);

    private Insumo insumo;
    private final IControladorInsumo controladorInsumo;
    private List<Insumo> lista;

    public InsumoAction() {
        lista = new ArrayList<>();
        insumo = new Insumo();
        controladorInsumo = new ControladorInsumo();
    }

    public String getModificar() {
        insumo = controladorInsumo.getInsumo(insumo.getId());
        return SUCCESS;
    }

    public void validatePostModificar() {
        if (StringUtils.isBlank(insumo.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.INGRESENOMBRE);
        }
        if (insumo.getUnidadMedida() == null) {
            addFieldError("unidad", Soporte.Mensaje.SELECCIONEUNIDADMEDIDA);
        }
        if (insumo.getPrecioUnidad() <= 0) {
            addFieldError("precioUnidad", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        }
        if (insumo.getStock().getCantidadActual() < 0) {
            addFieldError("stock.cantidadActual", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        }
        if (insumo.getStock().getCantidadMinima() < 0) {
            addFieldError("stock.cantidadMinima", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        }
        this.clearMessages();
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String postModificar() {
        controladorInsumo.actualizar(insumo);
        sesion.put("mensaje", Mensaje.getModificado(Mensaje.INSUMO));
        return SUCCESS;
    }

    public void validateRegistrar() {
        if (StringUtils.isBlank(insumo.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.INGRESENOMBRE);
        }
        if (insumo.getUnidadMedida() == null) {
            addFieldError("unidad", Soporte.Mensaje.SELECCIONEUNIDADMEDIDA);
        }
        if (insumo.getPrecioUnidad() <= 0) {
            addFieldError("precioUnidad", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        }
        if (insumo.getStock().getCantidadActual() < 0) {
            addFieldError("stock.cantidadActual", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        }
        if (insumo.getStock().getCantidadMinima() < 0) {
            addFieldError("stock.cantidadMinima", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        }
        this.clearMessages();
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String registrar() {
        controladorInsumo.guardar(insumo);
        sesion.put("mensaje", Mensaje.getAgregado(Mensaje.INSUMO));
        return SUCCESS;
    }

    public void validateEliminar() {
        LOGGER.warn("VALIDAR AL ELIMINAR INSUMO");
    }

    public String eliminar() {
        sesion.put("mensaje", Soporte.Mensaje.getEliminado(Mensaje.INSUMO));
        return SUCCESS;
    }

    public String listar() {
        lista = controladorInsumo.getTodos();
        return SUCCESS;
    }

    public String nuevo() {
        return SUCCESS;
    }

    public List<Insumo> getLista() {
        return lista;
    }

    public void setLista(List<Insumo> lista) {
        this.lista = lista;
    }

    public Insumo getInsumo() {
        return insumo;
    }

    public void setInsumo(Insumo insumo) {
        this.insumo = insumo;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

    @Override
    public Insumo getModel() {
        return insumo;
    }

}
