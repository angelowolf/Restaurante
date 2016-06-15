/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Notificacion;

import Modelo.Usuario;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.CloseReason;
import javax.websocket.Session;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author ang_2
 */
public class SesionWeb implements ISesion {

    Session sesion;

    public SesionWeb(Session session) {
        this.sesion = session;

    }

    @Override
    public void mandarMensaje(Mensaje mensaje) {
        try {
            if (sesion.isOpen()) {
                JSONObject json = new JSONObject();
                json.append("mensaje", mensaje.getMensaje());
                json.append("fecha", mensaje.getFecha().toString("dd-MM-yyyy"));
                json.append("tipo", TipoMensaje.NOTIFICACION);
                sesion.getBasicRemote().sendText(json.toString());
            }
        } catch (IOException ex) {
            Logger.getLogger(SesionWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void exitoAlLogear(Usuario usuario) {
        try {
            if (sesion.isOpen()) {
                sesion.getUserProperties().put("idUsuario", usuario.getId());
                JSONObject objetoJSON = new JSONObject();
                objetoJSON.append("tipo", "OK");
                System.out.println(usuario.toString());
                sesion.getBasicRemote().sendText(objetoJSON.toString());
            }
        } catch (IOException ex) {
            Logger.getLogger(SesionWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void notificarError(String mensaje) {
        try {
            JSONObject o = new JSONObject();
            o.append("tipo", "" + TipoMensaje.ERROR);
            o.append("mensaje", mensaje);
            sesion.getBasicRemote().sendText(o.toString());
            sesion.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Algo salio muy mal... o no tan mal(como login mal viste..)"));
        } catch (IOException ex) {
            Logger.getLogger(NotificacionEndPoint.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
