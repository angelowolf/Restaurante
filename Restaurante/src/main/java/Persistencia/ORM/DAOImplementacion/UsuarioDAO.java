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
import org.apache.log4j.Logger;
import org.hibernate.Session;

/**
 *
 * @author ang_2
 */
public class UsuarioDAO extends GenericDAO<Usuario, Integer> implements IUsuario {

    private static final Logger LOG = Logger.getLogger(UsuarioDAO.class);

    @Override
    public Usuario buscarNick(String nick) {
        Session session = getHibernateTemplate();
        List<Usuario> objetos = new ArrayList<>();
        try {
            String sql = "from Usuario where nick = :nick";
            objetos = session.createQuery(sql).setParameter("nick", nick).list();
        } catch (RuntimeException e) {
            LOG.error("Error al buscar usuario", e);
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
            LOG.error("Error al buscar los usuarios.", e);
        }
        return objetos;
    }

    @Override
    public Usuario buscarDocumento(long documento) {
       Session session = getHibernateTemplate();
        List<Usuario> objetos = new ArrayList<>();
        try {
            String sql = "from Usuario where documento = :documento";
            objetos = session.createQuery(sql).setParameter("documento", documento).list();
        } catch (RuntimeException e) {
            LOG.error("Error al buscar usuario", e);
        }
        if (!objetos.isEmpty()) {
            return objetos.get(0);
        } else {
            return null;
        } }
    
}
