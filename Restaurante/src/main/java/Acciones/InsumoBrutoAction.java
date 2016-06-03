/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorCategoriaInsumo;
import Controlador.Implementacion.ControladorInsumoBruto;
import Controlador.Interface.IControladorCategoriaInsumo;
import Modelo.CategoriaInsumo;
import Modelo.Insumo;
import Modelo.InsumoBruto;
import Modelo.UnidadMedida;
import Soporte.Mensaje;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import Controlador.Interface.IControladorInsumoBruto;

/**
 *
 * @author ang_2
 */
public class InsumoBrutoAction extends Accion implements ModelDriven<Insumo> {

    private static final Logger LOGGER = Logger.getLogger(InsumoBrutoAction.class);

    private InsumoBruto insumo;
    private final IControladorInsumoBruto controladorInsumo;
    private List<InsumoBruto> lista;
    private final List<CategoriaInsumo> categorias;
    private final List<UnidadMedida> unidades;
    private int categoriaInsumoFiltro;
    private String nombreFiltro;

    public InsumoBrutoAction() {
        unidades = Arrays.asList(UnidadMedida.values());
        IControladorCategoriaInsumo controladorCategoriaInsumo = new ControladorCategoriaInsumo();
        categorias = controladorCategoriaInsumo.getTodos();
        lista = new ArrayList<>();
        insumo = new InsumoBruto();
        controladorInsumo = new ControladorInsumoBruto();
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
        lista = controladorInsumo.buscar(nombreFiltro, categoriaInsumoFiltro);
        return SUCCESS;
    }

    public String nuevo() {
        return SUCCESS;
    }

    public List<CategoriaInsumo> getCategorias() {
        return categorias;
    }

    public List<InsumoBruto> getLista() {
        return lista;
    }

    public InsumoBruto getInsumo() {
        return insumo;
    }

    public void setInsumo(InsumoBruto insumo) {
        this.insumo = insumo;
    }

    public List<UnidadMedida> getUnidades() {
        return unidades;
    }

    public int getCategoriaInsumoFiltro() {
        return categoriaInsumoFiltro;
    }

    public void setCategoriaInsumoFiltro(int categoriaInsumoFiltro) {
        this.categoriaInsumoFiltro = categoriaInsumoFiltro;
    }

    public String getNombreFiltro() {
        return nombreFiltro;
    }

    public void setNombreFiltro(String nombreFiltro) {
        this.nombreFiltro = nombreFiltro;
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
