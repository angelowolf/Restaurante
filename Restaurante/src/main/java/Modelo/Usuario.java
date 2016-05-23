/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Soporte.Encriptar;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import java.util.Set;
import org.apache.commons.lang.WordUtils;
import org.joda.time.LocalDate;

/**
 *
 * @author ang_2
 */
public class Usuario {

    private int id;
    private String nombre, apellido, nick, clave, clave2, claveOriginal, telefono, direccion;
    private long documento;
    private LocalDate fechaAlta, fechaBaja, fechaNacimiento;
    private Set<Rol> roles;
    private String preguntaSecreta, respuestaSecreta;

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

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getPreguntaSecreta() {
        return preguntaSecreta;
    }

    public void setPreguntaSecreta(String preguntaSecreta) {
        this.preguntaSecreta = preguntaSecreta;
    }

    public String getRespuestaSecreta() {
        return respuestaSecreta;
    }

    @StringLengthFieldValidator(maxLength = "50", message = "La cantidad máxima de carácter es de 50", fieldName = "respuestaSecreta")
    public void setRespuestaSecreta(String respuestaSecreta) {
        this.respuestaSecreta = respuestaSecreta;
    }

    public String getTelefono() {
        return telefono;
    }

    @StringLengthFieldValidator(maxLength = "100", message = "La cantidad máxima de carácter es de 100", fieldName = "telefono")
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    @StringLengthFieldValidator(maxLength = "255", message = "La cantidad máxima de carácter es de 255", fieldName = "direccion")
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public long getDocumento() {
        return documento;
    }

    public void setDocumento(long documento) {
        this.documento = documento;
    }

    public LocalDate getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(LocalDate fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public LocalDate getFechaBaja() {
        return fechaBaja;
    }

    public void setFechaBaja(LocalDate fechaBaja) {
        this.fechaBaja = fechaBaja;
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

    @StringLengthFieldValidator(maxLength = "100", message = "La cantidad máxima de carácteres es de 100", fieldName = "nombre")
    public void setNombre(String nombre) {
        this.nombre = WordUtils.capitalize(nombre);
    }

    public String getApellido() {
        return apellido;
    }

    @StringLengthFieldValidator(maxLength = "100", message = "La cantidad máxima de carácteres es de 100", fieldName = "apellido")
    public void setApellido(String apellido) {
        this.apellido = WordUtils.capitalize(apellido);
    }

    public String getNick() {
        return nick;
    }

    @StringLengthFieldValidator(maxLength = "200", message = "La cantidad máxima de carácteres es de 200", fieldName = "nick")
    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getClave() {
        return clave;
    }

    @StringLengthFieldValidator(maxLength = "50", message = "La cantidad máxima de carácteres es de 50", fieldName = "clave")
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
        return "Usuario{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", nick=" + nick + ", clave=" + clave + ", clave2=" + clave2 + ", claveOriginal=" + claveOriginal + ", telefono=" + telefono + ", direccion=" + direccion + ", documento=" + documento + ", fechaAlta=" + fechaAlta + ", fechaBaja=" + fechaBaja + ", fechaNacimiento=" + fechaNacimiento + ", roles=" + roles + ", preguntaSecreta=" + preguntaSecreta + ", respuestaSecreta=" + respuestaSecreta + '}';
    }

    /**
     * Verifica que las contraseñas sean identicas y que el usuario este activo.
     *
     * @param password
     * @return True si lo son.
     */
    public boolean iniciarSesion(String password) {
        return this.clave.equals(Encriptar.encriptaEnMD5(password)) && fechaBaja != null;
    }

    public boolean esResponsableUsuario() {
        for (Rol role : roles) {
            if (role == Rol.Usuario) {
                return true;
            }
        }
        return false;
    }

    public boolean esResponsableStock() {
        for (Rol role : roles) {
            if (role == Rol.Stock) {
                return true;
            }
        }
        return false;
    }

    public boolean esResponsableCocina() {
        for (Rol role : roles) {
            if (role == Rol.Cocina) {
                return true;
            }
        }
        return false;
    }

    public boolean esResponsableCaja() {
        for (Rol role : roles) {
            if (role == Rol.Caja) {
                return true;
            }
        }
        return false;
    }

    public boolean esResponsableMesa() {
        for (Rol role : roles) {
            if (role == Rol.Mesa) {
                return true;
            }
        }
        return false;
    }

    public boolean esMozo() {
        for (Rol role : roles) {
            if (role == Rol.Mozo) {
                return true;
            }
        }
        return false;
    }
}
