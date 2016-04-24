/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author ang_2
 */
public enum Rol {
    Mozo, Barra, Administrador;

    @Override
    public String toString() {
        switch (this) {
            case Mozo:
                return "Mozo";
            case Barra:
                return "Barra";
            case Administrador:
                return "Administrador";
            default:
                throw new IllegalArgumentException();
        }
    }
}
