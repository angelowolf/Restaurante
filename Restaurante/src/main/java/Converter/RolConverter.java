/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Converter;

import Modelo.Rol;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.util.StrutsTypeConverter;

/**
 *
 * @author ang_2
 */
public class RolConverter extends StrutsTypeConverter {

    private static final Logger log = Logger.getLogger(RolConverter.class);

    @Override
    public Rol convertFromString(Map context, String[] values, Class toClass) {
        Rol r = null;
        if (values.length > 0 && values[0] != null && values[0].trim().length() > 0) {
            r = Rol.valueOf(values[0]);
            log.info("Enum creado " + r.toString());
        }
        return r;
    }

    @Override
    public String convertToString(Map context, Object o) {
        if (o instanceof Rol) {
            Rol r = (Rol) o;
            return r.name();
        }
        return "";
    }

}
