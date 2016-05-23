/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorCategoriaInsumo;
import Controlador.Implementacion.ControladorInsumo;
import Controlador.Interface.IControladorCategoriaInsumo;
import Controlador.Interface.IControladorInsumo;
import Modelo.CategoriaInsumo;
import Modelo.Insumo;
import Modelo.UnidadMedida;
import Soporte.Mensaje;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.Arrays;
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
    private List<CategoriaInsumo> categorias;
    private List<UnidadMedida> unidades;

    public InsumoAction() {
        unidades = new ArrayList<>();
        categorias = new ArrayList<>();
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
        if (insumo.getCategoriaInsumo().getId() == -1) {
            addFieldError("categoriaInsumo.id", Soporte.Mensaje.SELECCIONECATEGORIAINSUMO);
        }
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
        controladorInsumo.eliminar(insumo);
        sesion.put("mensaje", Soporte.Mensaje.getEliminado(Mensaje.INSUMO));
        return SUCCESS;
    }

    public String recuperar() {
        controladorInsumo.recuperar(insumo);
        sesion.put("mensaje", Soporte.Mensaje.ISUMORECUPERADO);
        return SUCCESS;
    }

    public String listar() {
        unidades = Arrays.asList(UnidadMedida.values());
        IControladorCategoriaInsumo controladorCategoriaInsumo = new ControladorCategoriaInsumo();
        categorias = controladorCategoriaInsumo.getTodos();
        lista = controladorInsumo.getTodos();
        return SUCCESS;
    }

    public String nuevo() {
        unidades = Arrays.asList(UnidadMedida.values());
        IControladorCategoriaInsumo controladorCategoriaInsumo = new ControladorCategoriaInsumo();
        categorias = controladorCategoriaInsumo.getTodos();
        return SUCCESS;
    }

    public List<CategoriaInsumo> getCategorias() {
        return categorias;
    }

    public List<Insumo> getLista() {
        return lista;
    }

    public Insumo getInsumo() {
        return insumo;
    }

    public void setInsumo(Insumo insumo) {
        this.insumo = insumo;
    }

    public List<UnidadMedida> getUnidades() {
        return unidades;
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
