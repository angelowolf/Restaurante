/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorCategoriaInsumo;
import Controlador.Interface.IControladorCategoriaInsumo;
import Modelo.CategoriaInsumo;
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
public class CategoriaInsumoAction extends Accion implements ModelDriven<CategoriaInsumo> {

    private static final Logger LOGGER = Logger.getLogger(CategoriaInsumoAction.class);

    private CategoriaInsumo categoriaInsumo;
    private final IControladorCategoriaInsumo controladorCategoriaInsumo;
    private List<CategoriaInsumo> lista;

    public CategoriaInsumoAction() {
        lista = new ArrayList<>();
        categoriaInsumo = new CategoriaInsumo();
        controladorCategoriaInsumo = new ControladorCategoriaInsumo();
    }

    public String getModificar() {
        categoriaInsumo = controladorCategoriaInsumo.getCategoria(categoriaInsumo.getId());
        return SUCCESS;
    }

    public void validar() {
        if (StringUtils.isBlank(categoriaInsumo.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.INGRESENOMBRE);
        } else if (!controladorCategoriaInsumo.nombreDisponible(categoriaInsumo)) {
            addFieldError("nombre", Soporte.Mensaje.getLaExiste(Soporte.Mensaje.CATEGORIAINSUMO));
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public void validatePostModificar() {
        this.validar();
    }

    public String postModificar() {
        controladorCategoriaInsumo.actualizar(categoriaInsumo);
        sesion.put("mensaje", Mensaje.getModificada(Mensaje.CATEGORIAINSUMO));
        return SUCCESS;
    }

    public void validateRegistrar() {
        this.validar();
    }

    public String registrar() {
        controladorCategoriaInsumo.guardar(categoriaInsumo);
        sesion.put("mensaje", Mensaje.getAgregada(Mensaje.CATEGORIAINSUMO));
        return SUCCESS;
    }

    public void validateEliminar() {
        if (controladorCategoriaInsumo.enUso(categoriaInsumo)) {
            addActionError(Soporte.Mensaje.getUsadaPorUn(Soporte.Mensaje.CATEGORIAINSUMO, Soporte.Mensaje.INSUMO));
        }
        if (hasErrors()) {
            codigo = 400;
        }
    }

    public String eliminar() {
        controladorCategoriaInsumo.eliminar(categoriaInsumo);
        sesion.put("mensaje", Soporte.Mensaje.getEliminada(Mensaje.CATEGORIAINSUMO));
        return SUCCESS;
    }

    public String listar() {
        lista = controladorCategoriaInsumo.getTodos();
        return SUCCESS;
    }

    public String nuevo() {
        return SUCCESS;
    }

    public List<CategoriaInsumo> getLista() {
        return lista;
    }

    public CategoriaInsumo getCategoriaInsumo() {
        return categoriaInsumo;
    }

    public void setCategoriaInsumo(CategoriaInsumo categoriaInsumo) {
        this.categoriaInsumo = categoriaInsumo;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

    @Override
    public CategoriaInsumo getModel() {
        return categoriaInsumo;
    }

}