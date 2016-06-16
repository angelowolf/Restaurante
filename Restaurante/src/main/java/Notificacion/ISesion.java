/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Notificacion;

import Modelo.Usuario;
import java.util.HashMap;

/**
 *
 * @author ang_2
 */
public interface ISesion {

    /**
     * Le manda un mensaje al usuario que representa una notificacion.
     *
     * @param mensaje
     */
    public void mandarMensaje(Mensaje mensaje);

    /**
     * Manda un mensaje al usuario indicandole que pudo logear con exito.
     *
     * @param usuario
     */
    public void exitoAlLogear(Usuario usuario);

    /**
     * Manda un mensaje al usuario indicando que algo salio mal, o hizo algo
     * mal, o esta intentando hacer algo malo y cierra la sesion.
     *
     * @param mensaje Mensaje del error.
     */
    public void notificarError(String mensaje);

}
