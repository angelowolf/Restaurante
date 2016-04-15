/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import clase.Cliente;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.log4j.Logger;

/**
 *
 * @author ang_2
 */
public class ClienteAction extends ActionSupport implements ModelDriven<Cliente> {

    private static final Logger log = Logger.getLogger(ClienteAction.class);

    private Cliente cliente = new Cliente();

    public void validateDame() {
//        try {
//            throw new Exception("NOSE Q MIERDA PASO BOLUDO");
//        } catch (Exception e) {
//        log.error("Error al validar.", e);
//        }

        log.info("HOLA DESDE VALIDAR :D");
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
