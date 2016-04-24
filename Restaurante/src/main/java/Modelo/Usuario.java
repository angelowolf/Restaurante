/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Soporte.Encriptar;
import java.util.Set;
import org.apache.commons.lang.WordUtils;

/**
 *
 * @author ang_2
 */
public class Usuario {

    private int id;
    private String nombre, apellido, nick, clave, clave2, claveOriginal;
    private Set<Rol> roles;
    private boolean activo = true;

    public Usuario() {
    }

    public Usuario(int id, String nombre, String apellido, String nick, String clave, Set<Rol> rol) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nick = nick;
        this.clave = clave;
        this.roles = rol;
    }

    public Usuario(String nombre, String apellido, String nick, String clave, Set<Rol> rol) {
        this.nombre = WordUtils.capitalize(nombre);
        this.apellido = WordUtils.capitalize(apellido);
        this.nick = nick;
        this.clave = clave;
        this.roles = rol;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public String getClaveOriginal() {
        return claveOriginal;
    }

    public void setClaveOriginal(String claveOriginal) {
        this.claveOriginal = claveOriginal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = WordUtils.capitalize(nombre);
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = WordUtils.capitalize(apellido);
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public Set<Rol> getRoles() {
        return roles;
    }

    public void setRoles(Set<Rol> roles) {
        this.roles = roles;
    }

    public String getClave2() {
        return clave2;
    }

    public void setClave2(String clave2) {
        this.clave2 = clave2;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", nick=" + nick + ", clave=" + clave + ", clave2=" + clave2 + ", claveOriginal=" + claveOriginal + ", rol=" + roles + ", activo=" + activo + '}';
    }

    /**
     * Verifica que las contraseñas sean identicas y que el usuario este activo.
     *
     * @param password
     * @return True si lo son.
     */
    public boolean iniciarSesion(String password) {
        return this.clave.equals(Encriptar.encriptaEnMD5(password)) && this.isActivo();
    }

}
