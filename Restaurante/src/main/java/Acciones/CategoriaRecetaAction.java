/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorCategoriaReceta;
import Controlador.Interface.IControladorCategoriaReceta;
import Modelo.CategoriaReceta;
import Soporte.Mensaje;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author ang_2
 */
public class CategoriaRecetaAction extends Accion implements ModelDriven<CategoriaReceta>, CRUD {

    private List<CategoriaReceta> lista;
    private CategoriaReceta categoria;
    private IControladorCategoriaReceta ccr;

    private String nombreFiltro;

    public CategoriaRecetaAction() {
        lista = new ArrayList<>();
        categoria = new CategoriaReceta();
        ccr = new ControladorCategoriaReceta();
    }

    @Override
    public String getModificar() {
        categoria = ccr.getCategoria(categoria.getId());
        return SUCCESS;
    }

    public void validar() {
        if (StringUtils.isBlank(categoria.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.OBLIGATORIO);
        } else if (!ccr.nombreDisponible(categoria)) {
            addFieldError("nombre", Soporte.Mensaje.getExiste(Soporte.Mensaje.CATEGORIARECETA));
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public void valdiatePostModificar() {
        this.validar();
    }

    @Override
    public String postModificar() {
        ccr.actualizar(categoria);
        sesion.put("mensaje", Mensaje.getModificada(Mensaje.CATEGORIARECETA));
        return SUCCESS;
    }

    public void validateRegistrar() {
        this.validar();
    }

    @Override
    public String registrar() {
        ccr.guardar(categoria);
        sesion.put("mensaje", Mensaje.getAgregada(Mensaje.CATEGORIAINSUMO));
        return SUCCESS;
    }

    public void validateEliminar() {
        if (ccr.enUso(categoria)) {
            addActionError(Soporte.Mensaje.getUsadaPorUn(Soporte.Mensaje.CATEGORIARECETA, Soporte.Mensaje.RECETA));
        }
        if (hasErrors()) {
            codigo = 400;
        }
    }

    @Override
    public String eliminar() {
        ccr.eliminar(categoria);
        sesion.put("mensaje", Soporte.Mensaje.getEliminada(Mensaje.CATEGORIARECETA));
        return SUCCESS;
    }

    @Override
    public String listar() {
        lista = ccr.buscar(nombreFiltro);
        return SUCCESS;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

    @Override
    public CategoriaReceta getModel() {
        return categoria;
    }

    public List<CategoriaReceta> getLista() {
        return lista;
    }

    public CategoriaReceta getCategoria() {
        return categoria;
    }

    public void setCategoria(CategoriaReceta categoria) {
        this.categoria = categoria;
    }

    public String getNombreFiltro() {
        return nombreFiltro;
    }

    public void setNombreFiltro(String nombreFiltro) {
        this.nombreFiltro = nombreFiltro;
    }

}
