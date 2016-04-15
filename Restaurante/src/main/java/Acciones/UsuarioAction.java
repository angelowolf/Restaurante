/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author ang_2
 */
public class UsuarioAction extends ActionSupport {

    private String clave, email;

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void validateLogin() {
        addActionError("Las credenciales no son validas.");
    }

    public String login() {
        return SUCCESS;
    }

    public String logout() {
        return SUCCESS;
    }
}
