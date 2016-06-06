/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Acciones;

import Controlador.Implementacion.ControladorUsuario;
import Controlador.Interface.IControladorUsuario;
import Modelo.Insumo;
import Modelo.Rol;
import Modelo.Usuario;
import Persistencia.ORM.DAOImplementacion.InsumoDAO;
import Persistencia.ORM.DAOInterface.IInsumo;
import Soporte.Encriptar;
import Soporte.Mensaje;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author ang_2
 */
public class UsuarioAction extends Accion implements ModelDriven<Usuario> {

    private static final Logger LOGGER = Logger.getLogger(UsuarioAction.class);
    private Usuario usuario;
    private List<Usuario> lista;
    private final IControladorUsuario controladorUsuario;
//filtro
    private List<Rol> rolesSeleccionados;
    private final List<Rol> rolesTodos;
    private String nombreFiltro, apellidoFiltro;

    public UsuarioAction() {
        lista = new ArrayList<>();
        rolesTodos = Arrays.asList(Rol.values());
        rolesSeleccionados = new ArrayList<>();
        usuario = new Usuario();
        controladorUsuario = new ControladorUsuario();
    }

    public String blanquear() {
        controladorUsuario.blanquear(usuario);
        sesion.put("mensaje", Soporte.Mensaje.CLAVERESETEADA);
        return SUCCESS;
    }

    public void validateRegistrar() {
        if (StringUtils.isBlank(usuario.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.INGRESENOMBRE);
        }
        if (StringUtils.isBlank(usuario.getApellido())) {
            addFieldError("apellido", Soporte.Mensaje.INGRESEAPELLIDO);
        }
        if (usuario.getRoles() == null) {
            addFieldError("rol", Soporte.Mensaje.SELECCIONEROL);
        }
        if (StringUtils.isBlank(usuario.getNick())) {
            addFieldError("nick", Soporte.Mensaje.INGRESENICK);
        } else if (!controladorUsuario.nickDisponible(usuario)) {
            addFieldError("nick", Soporte.Mensaje.NICKNODISPONIBLE);
        }
        if (usuario.getDocumento() == 0) {
            addFieldError("documento", Soporte.Mensaje.INGRESEDOCUMENTO);
        }
        if (usuario.getDocumento() < 0) {
            addFieldError("documento", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        } else if (usuario.getDocumento() != 0 && !controladorUsuario.documentoDisponible(usuario)) {
            addFieldError("documento", Soporte.Mensaje.DOCUMENTONODISPONIBLE);
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String registrar() {
        controladorUsuario.guardar(usuario);
        sesion.put("mensaje", Soporte.Mensaje.getAgregado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public void validateModificar() {
        if (StringUtils.isBlank(usuario.getNombre())) {
            addFieldError("nombre", Soporte.Mensaje.INGRESENOMBRE);
        }
        if (StringUtils.isBlank(usuario.getApellido())) {
            addFieldError("apellido", Soporte.Mensaje.INGRESEAPELLIDO);
        }
        if (usuario.getRoles() == null) {
            addFieldError("rol", Soporte.Mensaje.SELECCIONEROL);
        }
        if (usuario.getDocumento() == 0) {
            addFieldError("documento", Soporte.Mensaje.INGRESEDOCUMENTO);
        }
        if (usuario.getDocumento() < 0) {
            addFieldError("documento", Soporte.Mensaje.INGRESEVALORPOSITIVO);
        } else if (usuario.getDocumento() != 0 && !controladorUsuario.documentoDisponible(usuario)) {
            addFieldError("documento", Soporte.Mensaje.DOCUMENTONODISPONIBLE);
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String modificar() {
        controladorUsuario.actualizar(usuario);
        sesion.put("mensaje", Soporte.Mensaje.getModificado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public String eliminar() {
        controladorUsuario.eliminar(usuario);
        sesion.put("mensaje", Soporte.Mensaje.getEliminado(Mensaje.USUARIO));
        return SUCCESS;
    }

    public String recuperar() {
        controladorUsuario.recuperar(usuario);
        sesion.put("mensaje", Soporte.Mensaje.USUARIORECUPERADO);
        return SUCCESS;
    }

    public String listar() {
        lista = controladorUsuario.buscar(nombreFiltro, apellidoFiltro, rolesSeleccionados);
        return SUCCESS;
    }

    public String nuevo() {
        return SUCCESS;
    }

    public String editar() {
        usuario = controladorUsuario.getUsuario(usuario.getId());
        return SUCCESS;
    }

    public String misdatos() {
        usuario = controladorUsuario.getUsuario((int) sesion.get("idUsuario"));
        return SUCCESS;
    }

    public void validateModificarmisdatos() {
        if (StringUtils.isBlank(usuario.getNick())) {
            addFieldError("nick", Soporte.Mensaje.INGRESENICK);
        } else if (!controladorUsuario.nickDisponible(usuario)) {
            addFieldError("nick", Soporte.Mensaje.NICKNODISPONIBLE);
        }
        if (StringUtils.isNotBlank(usuario.getClave()) || StringUtils.isNotBlank(usuario.getClave2())) {
            if (StringUtils.isBlank(usuario.getClave())) {
                addFieldError("clave", Soporte.Mensaje.INGRESECLAVE);
            }
            if (StringUtils.isBlank(usuario.getClave2())) {
                addFieldError("clave2", Soporte.Mensaje.REPITACLAVE);
            }
            if (StringUtils.isNotBlank(usuario.getClave()) && StringUtils.isNotBlank(usuario.getClave2())) {
                if (!usuario.getClave().equals(usuario.getClave2())) {
                    addFieldError("clave2", Soporte.Mensaje.CLAVENOCOINCIDE);
                }
            }
        }
        Usuario original = controladorUsuario.getUsuario((int) sesion.get("idUsuario"));
        if (StringUtils.isBlank(usuario.getClaveOriginal())) {
            addFieldError("claveOriginal", Soporte.Mensaje.INGRESECLAVEACTUAL);
        } else if (!Encriptar.encriptaEnMD5(usuario.getClaveOriginal()).equals(original.getClave())) {
            addFieldError("claveOriginal", Soporte.Mensaje.CLAVEINGRESADAMAL);
            usuario.setClaveOriginal("");
        }
        if (StringUtils.isBlank(usuario.getRespuestaSecreta())) {
            addFieldError("respuestaSecreta", Soporte.Mensaje.INGRESERESPUESTA);
        }
        if (StringUtils.isBlank(usuario.getPreguntaSecreta())) {
            addFieldError("preguntaSecreta", Soporte.Mensaje.SELECCIONEPREGUNTA);
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String modificarmisdatos() {
        if (StringUtils.isBlank(usuario.getClave())) {
            controladorUsuario.actualizarMisDatos(usuario, false);
        } else {
            controladorUsuario.actualizarMisDatos(usuario, true);
        }
        sesion.put("mensaje", Soporte.Mensaje.getModificado(Soporte.Mensaje.USUARIO));
        return SUCCESS;
    }

    public void validateLogin() {
        if (StringUtils.isBlank(usuario.getNick())) {
            addActionError(Soporte.Mensaje.INGRESENICK);
        }
        if (StringUtils.isBlank(usuario.getClave())) {
            addActionError(Soporte.Mensaje.INGRESECLAVE);
        }
        if (hasErrors()) {
            codigo = 400;
        } else if (!controladorUsuario.iniciarSesion(controladorUsuario.getUsuario(usuario.getNick()), usuario.getClave())) {
            addActionError(Soporte.Mensaje.ERRORVALIDAR);
            codigo = 400;
        }
    }

    public String login() {
        Usuario u = controladorUsuario.getUsuario(usuario.getNick());
        sesion.put("idUsuario", u.getId());
        sesion.put("rolUsuario", u.esResponsableUsuario());
        sesion.put("rolMozo", u.esMozo());
        sesion.put("rolCocina", u.esResponsableCocina());
        sesion.put("rolStock", u.esResponsableStock());
        sesion.put("rolCaja", u.esResponsableCaja());
        sesion.put("rolMesa", u.esResponsableMesa());
        if (StringUtils.isBlank(u.getPreguntaSecreta())) {
            return "primeravez";
        } else {
            return SUCCESS;
        }
    }

    public String logout() {
        sesion.put("idUsuario", null);
        sesion.put("rolUsuario", null);
        sesion.put("rolMozo", null);
        sesion.put("rolCocina", null);
        sesion.put("rolStock", null);
        sesion.put("rolMesa", null);
        sesion.put("rolCaja", null);
        return SUCCESS;
    }

    public String home() {
        return SUCCESS;
    }

    public void validatePrimerLogin() {
        if (StringUtils.isBlank(usuario.getPreguntaSecreta())) {
            addFieldError("preguntaSecreta", Soporte.Mensaje.SELECCIONEPREGUNTA);
        }
        if (StringUtils.isBlank(usuario.getRespuestaSecreta())) {
            addFieldError("respuestaSecreta", Soporte.Mensaje.INGRESERESPUESTA);
        }
        if (hasFieldErrors()) {
            codigo = 400;
        }
    }

    public String primerLogin() {
        controladorUsuario.actualizar((int) sesion.get("idUsuario"), usuario.getPreguntaSecreta(), usuario.getRespuestaSecreta());
        return SUCCESS;
    }

    public void validateRecuperarClave() {
        if (StringUtils.isBlank(usuario.getClave())) {
            addFieldError("clave", Soporte.Mensaje.INGRESECLAVE);
        }
        if (StringUtils.isBlank(usuario.getClave2())) {
            addFieldError("clave2", Soporte.Mensaje.REPITACLAVE);
        }
        if (StringUtils.isNotBlank(usuario.getClave()) && StringUtils.isNotBlank(usuario.getClave2())) {
            if (!usuario.getClave().equals(usuario.getClave2())) {
                addFieldError("clave2", Soporte.Mensaje.CLAVENOCOINCIDE);
            }
        }
        Usuario temp = controladorUsuario.getUsuario(usuario.getId());
        if (temp.getRespuestaSecreta() != null && !temp.getRespuestaSecreta().equals(usuario.getRespuestaSecreta())) {
            addFieldError("respuestaSecreta", Soporte.Mensaje.RESPUESTANOVALIDA);
        }
        if (temp.getRespuestaSecreta() == null) {
            addFieldError("respuestaSecreta", "Usted aun no respondio la pregunta secreta.");
        }
        if (hasErrors()) {
            codigo = 400;
        }
    }

    public String recuperarClave() {
        controladorUsuario.actualizarClave(usuario.getId(), usuario.getClave());
        return SUCCESS;
    }

    public void validateObtenerPregunta() {
        if (controladorUsuario.getUsuario(usuario.getNick()) == null) {
            String mensaje = Soporte.Mensaje.NICKINCORRECTO;
            addFieldError("nick", mensaje);
            sesion.put("mensaje", mensaje);
        }
    }

    public String obtenerPregunta() {
        usuario = controladorUsuario.getUsuario(usuario.getNick());
        return SUCCESS;
    }

    public List<Usuario> getLista() {
        return lista;
    }

    @VisitorFieldValidator(appendPrefix = false)
    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Rol> getRolesSeleccionados() {
        return rolesSeleccionados;
    }

    public void setRolesSeleccionados(List<Rol> rolesSeleccionados) {
        this.rolesSeleccionados = rolesSeleccionados;
    }

    public List<Rol> getRolesTodos() {
        return rolesTodos;
    }

    public String getNombreFiltro() {
        return nombreFiltro;
    }

    public void setNombreFiltro(String nombreFiltro) {
        this.nombreFiltro = nombreFiltro;
    }

    public String getApellidoFiltro() {
        return apellidoFiltro;
    }

    public void setApellidoFiltro(String apellidoFiltro) {
        this.apellidoFiltro = apellidoFiltro;
    }

    @Override
    public Usuario getModel() {
        return usuario;
    }

    @Override
    public int getCodigo() {
        return codigo;
    }

}
