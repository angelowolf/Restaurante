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
    Usuario, Mozo,Cocina,Caja,Mesa,Stock;

    @Override
    public String toString() {
        switch (this) {
            case Usuario:
                return "Usuario";
            case Mozo:
                return "Mozo";
            case Cocina:
                return "Cocina";
            case Caja:
                return "Caja";
            case Mesa:
                return "Mesa";
            case Stock:
                return "Stock";
            default:
                throw new IllegalArgumentException();
        }
    }
}
