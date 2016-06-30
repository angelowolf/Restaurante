/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorInsumoElaborado;
import Controlador.Interface.IControladorInsumoElaborado;
import Modelo.InsumoElaborado;
import Soporte.Mensaje;
import static Soporte.Mensaje.RECUPERADOINSUMO;
import com.opensymphony.xwork2.ModelDriven;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ang_2
 */
public class InsumoElaboradoAction extends Accion implements ModelDriven<InsumoElaborado>, CRUD {

    private InsumoElaborado insumoElaborado;
    private List<InsumoElaborado> lista;
    private final IControladorInsumoElaborado controladorInsumoElaborado;

    private String nombreFiltro;

    public InsumoElaboradoAction() {
        insumoElaborado = new InsumoElaborado();
        lista = new ArrayList<>();
        controladorInsumoElaborado = new ControladorInsumoElaborado();
    }

    @Override
    public String getModificar() {
        insumoElaborado = controladorInsumoElaborado.getInsumo(insumoElaborado.getId());
        return SUCCESS;
    }

    @Override
    public String postModificar() {
        controladorInsumoElaborado.actualizar(insumoElaborado);
        sesion.put("mensaje", Mensaje.getModificado(Mensaje.INSUMO));
        return SUCCESS;
    }

    @Override
    public String registrar() {
        controladorInsumoElaborado.guardar(insumoElaborado);
        sesion.put("mensaje", Mensaje.getAgregado(Mensaje.INSUMO));
        return SUCCESS;
    }

    @Override
    public String eliminar() {
        controladorInsumoElaborado.eliminar(insumoElaborado);
        sesion.put("mensaje", Soporte.Mensaje.getBaja(Mensaje.INSUMO));
        return SUCCESS;
    }

    public String recuperar() {
        controladorInsumoElaborado.recuperar(insumoElaborado);
        sesion.put("mensaje", Soporte.Mensaje.getRecuperado(RECUPERADOINSUMO));
        return SUCCESS;
    }

    @Override
    public String listar() {
        lista = controladorInsumoElaborado.buscar(nombreFiltro);
        return SUCCESS;
    }

    public String getNombreFiltro() {
        return nombreFiltro;
    }

    public void setNombreFiltro(String nombreFiltro) {
        this.nombreFiltro = nombreFiltro;
    }

    public InsumoElaborado getInsumoElaborado() {
        return insumoElaborado;
    }

    public void setInsumoElaborado(InsumoElaborado insumoElaborado) {
        this.insumoElaborado = insumoElaborado;
    }

    public List<InsumoElaborado> getLista() {
        return lista;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

    @Override
    public InsumoElaborado getModel() {
        return insumoElaborado;
    }

}
