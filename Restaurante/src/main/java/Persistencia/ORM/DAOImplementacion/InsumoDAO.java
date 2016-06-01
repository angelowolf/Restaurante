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
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

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

    @Override
    public List<Insumo> getTodosStockMinimo() {
        Session session = getHibernateTemplate();
        List<Insumo> objetos = new ArrayList<>();
        try {
            String sql = "select * from insumo insumo inner join stock stock on insumo.id_stock = stock.id where insumo.fechaBaja is null and stock.cantidadActual <= stock.cantidadMinima";
            objetos = session.createSQLQuery(sql).addEntity(Insumo.class).list();
        } catch (RuntimeException e) {
            LOG.error("Error al buscar los insumos.", e);
        }
        return objetos;
    }

    @Override
    public List<Insumo> getTodosByCategoriaByNombreSinEstos(int idCategoria, String nombreInsumo, List<Integer> ids) {
        Session session = getHibernateTemplate();
        List<Insumo> objetos = new ArrayList<>();
        try {
            Criteria criterio = session.createCriteria(Insumo.class);
            criterio.add(Restrictions.neOrIsNotNull("id", null));
            
            if(nombreInsumo != null){
                criterio.add(Restrictions.like("nombre", nombreInsumo + "%"));
            }
            if(idCategoria > 0){
                criterio.add(Restrictions.eq("categoriaInsumo.id", idCategoria));
            }
           if(ids != null){
               criterio.add(Restrictions.not(Restrictions.in("id", ids)));
           }           
            objetos = criterio.list();
        } catch (RuntimeException e) {
            LOG.error("Error al buscar los insumos.", e);
        }
        return objetos;
    }

   
}
