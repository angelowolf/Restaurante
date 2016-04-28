/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia.ORM.DAOImplementacion;

import java.util.List;
import Modelo.Insumo;
import Persistencia.ORM.DAOInterface.IInsumo;
import Persistencia.ORM.Util.GenericDAO;
import java.util.ArrayList;
import org.apache.log4j.Logger;
import org.hibernate.Session;

/**
 *
 * @author ang_2
 */


public class InsumoDAO extends GenericDAO<Insumo, Integer> implements IInsumo {

    private static final Logger LOG = Logger.getLogger(InsumoDAO.class);

    @Override
    public List<Insumo> getTodos() {
        Session session = getHibernateTemplate();
        List<Insumo> objetos = new ArrayList<>();
        try {
            String sql = "from Insumo";
            objetos = session.createQuery(sql).list();
        } catch (RuntimeException e) {
            LOG.error("Error al buscar los insumos.", e);
        }
        return objetos;
    }

}
