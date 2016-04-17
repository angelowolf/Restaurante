/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Modelo.Cliente;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.log4j.Logger;

/**
 *
 * @author ang_2
 */
public class ClienteAction extends ActionSupport implements ModelDriven<Cliente> {

    private static final Logger LOG = Logger.getLogger(ClienteAction.class);

    private Cliente cliente = new Cliente();
    private int codigo = 400;

    public int getCodigo() {
        return codigo;
    }

    public String dame() {
        addActionMessage("hi");
        return SUCCESS;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public Cliente getModel() {
        return cliente;
    }

    public void validateDame() {
        if (!cliente.getNombre().equals("angelo")) {
            addFieldError("nombre", "nombre no valido");
        }
    }

    public String registrar() {
        return SUCCESS;
    }
}
