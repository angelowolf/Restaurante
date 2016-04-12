/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accion;

import clase.Cliente;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 *
 * @author ang_2
 */
public class ClienteAction extends ActionSupport implements ModelDriven<Cliente> {

    private Cliente cliente = new Cliente();

    public void validateDame() {
        System.out.println("validacion de dame...");
    }

    public String dame() {
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

}
