package Soporte;

/**
 * @author angelo
 * @version 1.0
 * @created 28-ene-2016 08:44:28 p.m.
 */
public class Mensaje {

    private static final String MODIFICADO = "El %s ha sido modificado con éxito.";
    private static final String MODIFICADA = "La %s ha sido modificada con éxito.";
    private static final String AGREGADO = "El %s ha sido agregado.";
    private static final String AGREGADA = "La %s ha sido agregada.";
    private static final String ELIMINADO = "El %s ha sido eliminado.";
    private static final String ELIMINADA = "La %s ha sido eliminada.";
    private static final String ELEXISTE = "El nombre de %s ya está en uso.";
    private static final String USADOPORUNA = "El %s está siendo utilizado por alguna %s, debe eliminarla o desvincularlos para poder eliminar este %s.";
    private static final String USADOPORUN = "El %s está siendo utilizado por algun %s, debe eliminarlo o desvincularlos para poder eliminar este %s.";
    private static final String USADAPORUNA = "La %s está siendo utilizada por alguna %s, debe eliminarla o desvincularlas para poder eliminar esta %s.";
    private static final String USADAPORUN = "La %s está siendo utilizada por algun %s, debe eliminarlo o desvincularlos para poder eliminar esta %s.";
    private static final String CODIGOYAENVIADO = "Ya se ha enviado un email con el código a la dirección ingresada. En %d minutos podra generar otro código.";
    private static final String CUENTAAVISO = "Le recordamos que su suscripción actual está próxima a vencer. Vencerá el %s";
    public static final String PREGUNTAELIMINAREL = "¿Está seguro de que quiere eliminar este %s?";
    public static final String PREGUNTAELIMINARLA = "¿Está seguro de que quiere eliminar esta %s?";
    //************************************************************************//
    //Nombre de clases...//
    public static final String USUARIO = "Usuario";
    public static final String SEXO = "Sexo";
    public static final String TIPOPAGO = "Tipo Pago";
    public static final String PERSONAS = "Personas";
    public static final String PERSONA = "Persona";
    public static final String TIPODOCUMENTO = "Tipo Documento";
    public static final String MODULO = "Módulo";
    public static final String PLAN = "Plan";
    public static final String HOTEL = "Hotel";
    public static final String HABITACION = "Habitación";
    public static final String TIPOHABITACION = "Tipo Habitación";
    public static final String RESERVA = "Reserva";
    public static final String TEMPORADA = "Temporada";
    public static final String TARIFA = "Tarifa";
    public static final String DETALLEMANTENIMIENTO = "Detalla Mantenimiento";
    public static final String BLOQUEO = "Bloqueo";
    public static final String INSUMO = "Insumo";
    public static final String CATEGORIAINSUMO = "Categoría de Insumo";
    public static final String PAGO = "Pago";
    //************************************************************************//
    public static final String TIPOSUCCESS = "success";
    public static final String TIPOINFO = "info";
    public static final String TIPOWARNING = "warning";
    public static final String TIPODANGER = "danger";
    //************************************************************************//
    //Mensajes de validacion//
    public static final String INGRESENOMBRE = "Ingrese un nombre.";
    public static final String INGRESESIMBOLO = "Ingrese un símbolo.";
    public static final String INGRESEDIRECCION = "Ingrese una dirección.";
    public static final String INGRESEUNCODIGO = "Ingrese un código.";
    public static final String INGRESETITULO = "Ingrese un título.";
    public static final String INGRESEAPELLIDO = "Ingrese un apellido.";
    public static final String INGRESENICK = "Ingrese un nick.";
    public static final String INGRESECLAVE = "Ingrese una clave.";
    public static final String INGRESEUSUARIO = "Ingrese el usuario.";
    public static final String INGRESECLAVEACTUAL = "Ingrese su clave actual.";
    public static final String INGRESEMAIL = "Ingrese un email.";
    public static final String INGRESECODIGO = "Ingrese el código.";
    public static final String INGRESETELEFONO = "Ingrese un teléfono.";
    public static final String INGRESECONSULTA = "Ingrese su consulta.";
    public static final String INGRESERECARGO = "Ingrese un recargo positivo.";
    public static final String INGRESECARACTERISTICA = "Ingrese una característica.";
    public static final String INGRESECAPACIDAD = "Ingrese la capacidad de la habitación.";
    public static final String INGRESENUEVACLAVE = "Ingrese la nueva clave.";
    public static final String INGRESENOMBREHABITACION = "Ingrese el nombre de la habitación.";
    public static final String INGRESENOMBRETIPOHABITACION = "Ingrese el nombre del tipo de habitación.";
    public static final String INGRESENOMBRETEMPORADA = "Ingrese el nombre de la temporada.";
    public static final String INGRESEFECHAFIN = "Ingrese la fecha de finalización.";
    public static final String INGRESEFECHAINICIO = "Ingrese la fecha de inicio.";
    public static final String INGRESEDESCRIPCION = "Ingrese una descripción.";
    public static final String INGRESEFECHA = "Ingrese la fecha en la que ocurrió el evento.";
    public static final String INGRESEPRECIOALGUNACAPACIDAD = "Ingrese algun precio.";
    public static final String INGRESEPRECIO = "Ingrese un precio.";
    public static final String INGRESELACANTIDADACTUAL = "Ingrese la cantidad actual";
    public static final String INGRESEVALORPOSITIVO = "Ingrese un número positivo.";
    public static final String INGRESERESPUESTA = "Ingrese una respuesta secreta.";
    public static final String INGRESEDOCUMENTO = "Ingrese un número de documento.";
    public static final String INGRESECANTIDADCOMPRADA = "Ingrese la cantidad comprada.";

    public static final String OBLIGATORIO = "Este campo es obligatorio";

    public static final String SELECCIONEROL = "Seleccione un Rol.";
    public static final String SELECCIONEUNIDADMEDIDA = "Seleccione una Unidad de Medida.";
    public static final String SELECCIONEPREGUNTA = "Seleccione una pregunta secreta.";
    public static final String SELECCIONECATEGORIAINSUMO = "Seleccione una categoría de insumo.";
    public static final String SELECCIONEINSUMO = "Seleccione algun insumo.";
    public static final String USERCLAVEINCORRECTO = "Usuario o contraseña incorrectos.";

    public static final String MINIMOCARACTERES = "Mínimo 5 caracteres.";
    public static final String IDINVALIDO = "Id inválido.";
    public static final String PRECIONOVALIDO = "Ingrese un precio válido.";
    public static final String FORMATONOCORRECTO = "El valor ingresado no esta en un formato correcto.";
    public static final String FORMATOFECHANOCORRECTO = "El formato de la fecha ingresada no es correcto.";

    public static final String ERRORVALIDAR = "El Nombre de Usuario y/o la Contraseña son Incorrectos.";
    public static final String REPITACLAVE = "Repita la clave.";
    public static final String CLAVEINGRESADAMAL = "La clave ingresada no coincide con la anterior.";
    public static final String CLAVENOCOINCIDE = "La clave no coincide.";
    public static final String CLAVECAMBIADA = "Clave cambiada con éxito.";
    public static final String CLAVERESETEADA = " La clave del usuario ha sido reseteada.";
    public static final String RESPUESTANOVALIDA = "La respuesta ingresada no es correcta.";
    public static final String NICKINCORRECTO = "El nombre de usuario no existe.";
    public static final String DATOSMODIFICADOS = "Tus datos han sido modificados con éxito.";
    public static final String USUARIODADODEBAJA = "Usuario dado de baja.";

    public static final String NODISPONIBLENICK = "Ya existe el usuario ingresado.";
    public static final String NODISPONIBLEDOCUMENTO = "El Número de Documento ya está en uso.";

    public static final String RECUPERADOINSUMO = "Insumo recuperado.";
    public static final String RECUPERADOUSUARIO = "Usuario recuperado.";

    public static final String COMPRAREGISTRADA = "La compra ha sido registrada.";
    public static final String AJUSTEREALIZADO = "El ajuste ha sido realizado con éxito.";

    /**
     * Crea un mensaje con el tiempo pasado por parametro. "Ya se ha enviado un
     * email con el código a la dirección ingresada. En %d minutos podra generar
     * otro código."
     *
     * @param arg El tiempo.
     * @return EL mensaje.
     */
    public static String getCodigoYaEnviado(long arg) {
        return String.format(CODIGOYAENVIADO, arg);
    }

    /**
     * Crea un mensaje que notifica que la cuenta esta proxima a vencer. "Le
     * recordamos que su suscripción actual está próxima a vencer. Vencera el
     * %s"
     *
     * @param arg La fecha que vencera.
     * @return El mensaje.
     */
    public static String getAviso(String arg) {
        return String.format(CUENTAAVISO, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto fue modificado. "El %s ha sido
     * modificado con éxito.";
     *
     * @param arg El objeto.
     * @return El mensaje.
     */
    public static String getModificado(String arg) {
        return String.format(MODIFICADO, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto fue modificado. "La %s ha sido
     * modificada con éxito.";
     *
     * @param arg El objeto.
     * @return El mensaje.
     */
    public static String getModificada(String arg) {
        return String.format(MODIFICADA, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto fue agregado. "El %s ha sido
     * agregado.";
     *
     * @param arg El objeto.
     * @return El mensaje.
     */
    public static String getAgregado(String arg) {
        return String.format(AGREGADO, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto fue agregado. "La %s ha sido
     * agregada.";
     *
     * @param arg El objeto.
     * @return El mensaje.
     */
    public static String getAgregada(String arg) {
        return String.format(AGREGADA, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto fue eliminado. "El %s ha sido
     * eliminado.";
     *
     * @param arg El objeto.
     * @return El mensaje.
     */
    public static String getEliminado(String arg) {
        return String.format(ELIMINADO, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto fue eliminado. "La %s ha sido
     * eliminado.";
     *
     * @param arg El objeto.
     * @return El mensaje.
     */
    public static String getEliminada(String arg) {
        return String.format(ELIMINADA, arg);
    }

    /**
     * Crea un mensaje que notifica que el nombre ingresado ya esta ocupado. "El
     * nombre de %s ya esta en uso."
     *
     * @param arg El objeto usado.
     * @return El mensaje.
     */
    public static String getExiste(String arg) {
        return String.format(ELEXISTE, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto no se puede eliminar porque
     * está siendo usado. "El %s está siendo utilizado por alguna %s, debe
     * eliminarla o desvincularlos para poder eliminar este %s."
     *
     * @param arg El objeto usado.
     * @param arg2 Quien usa al objeto.
     * @return El mensaje.
     */
    public static String getUsadoPorUna(String arg, String arg2) {
        return String.format(USADOPORUNA, arg, arg2, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto no se puede eliminar porque
     * está siendo usado. "La %s está siendo utilizada por alguna %s, debe
     * eliminarla o desvincularlas para poder eliminar esta %s."
     *
     * @param arg El objeto usado.
     * @param arg2 Quien usa al objeto.
     * @return El mensaje.
     */
    public static String getUsadaPorUna(String arg, String arg2) {
        return String.format(USADAPORUNA, arg, arg2, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto no se puede eliminar porque
     * está siendo usado. "El %s está siendo utilizado por algun %s, debe
     * eliminarlo o desvincularlos para poder eliminar este %s."
     *
     * @param arg El objeto usado.
     * @param arg2 Quien usa al objeto.
     * @return El mensaje.
     */
    public static String getUsadoPorUn(String arg, String arg2) {
        return String.format(USADOPORUN, arg, arg2, arg);
    }

    /**
     * Crea un mensaje que notifica que el objeto no se puede eliminar porque
     * está siendo usado. "La %s está siendo utilizada por algun %s, debe
     * eliminarlo o desvincularlos para poder eliminar esta %s."
     *
     * @param arg El objeto usado.
     * @param arg2 Quien usa al objeto.
     * @return El mensaje.
     */
    public static String getUsadaPorUn(String arg, String arg2) {
        return String.format(USADAPORUN, arg, arg2, arg);
    }

    /**
     * Crea un mensaje que pregunta si el objeto quiere ser eliminado. "¿Está
     * seguro de que quiere eliminar este %s?"
     *
     * @param arg
     * @return
     */
    public static String getPreguntaEliminarEl(String arg) {
        return String.format(PREGUNTAELIMINAREL, arg);
    }

    /**
     * Crea un mensaje que pregunta si el objeto quiere ser eliminado. "¿Está
     * seguro de que quiere eliminar esta %s?"
     *
     * @param arg
     * @return
     */
    public static String getPreguntaEliminarLa(String arg) {
        return String.format(PREGUNTAELIMINARLA, arg);
    }

}//end Mensaje
