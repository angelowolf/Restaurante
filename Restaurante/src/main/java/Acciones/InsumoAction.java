/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorInsumo;
import Controlador.Interface.IControladorInsumo;
import Modelo.Insumo;
import Soporte.AutoComplete;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ang_2
 */
public class InsumoAction extends Accion {

    private IControladorInsumo controladorInsumo = new ControladorInsumo();
    private List<Insumo> lista;
    private List<AutoComplete> listaAC;
    private String term;
    private Insumo insumo;
    private int id;

    public InsumoAction() {
        lista = new ArrayList<>();
        listaAC = new ArrayList<>();
    }

    public String listar() {
        lista = controladorInsumo.getTodos(true);
        return SUCCESS;
    }

    public String postBuscarInsumo() {
        insumo = controladorInsumo.buscar(id);
        return SUCCESS;
    }

    public String postBuscarInsumoAutoComplete() {
        listaAC = new ArrayList<>();
        lista = controladorInsumo.getTodosByCategoriaByNombreSinEstos(-1, term, null, true);
        for (Insumo cadaInsumo : lista) {
            listaAC.add(AutoComplete.generarAC(cadaInsumo));
        }
        return SUCCESS;
    }

    public void setTerm(String term) {
        this.term = term;
    }

    public List<Insumo> getLista() {
        return lista;
    }

    public List<AutoComplete> getListaAC() {
        return listaAC;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Insumo getInsumo() {
        return insumo;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

}
