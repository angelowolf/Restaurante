/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia.ORM.DAOImplementacion;

import Modelo.Usuario;
import Persistencia.ORM.DAOInterface.IUsuario;
import Persistencia.ORM.Util.GenericDAO;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import org.hibernate.Session;

/**
 *
 * @author ang_2
 */
public class UsuarioDAO extends GenericDAO<Usuario, Integer> implements IUsuario {

    private static final Logger LOG = Logger.getLogger("UsuarioDAO");

    @Override
    public Usuario buscarNick(String nick) {
        Session session = getHibernateTemplate();
        List<Usuario> objetos = new ArrayList<>();
        try {
            String sql = "from Usuario where nick = :nick";
            objetos = session.createQuery(sql).setParameter("nick", nick).list();
        } catch (RuntimeException e) {
            LOG.log(java.util.logging.Level.SEVERE, "Error al obtener usuario.", e);
        }
        if (!objetos.isEmpty()) {
            return objetos.get(0);
        } else {
            return null;
        }
    }

    @Override
    public List<Usuario> listar() {
        Session session = getHibernateTemplate();
        List<Usuario> objetos = new ArrayList<>();
        try {
            String sql = "from Usuario";
            objetos = session.createQuery(sql).list();
        } catch (RuntimeException e) {
            LOG.log(java.util.logging.Level.SEVERE, "Error al obtener usuario.", e);
        }
        return objetos;
    }

}
