/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia.ORM.DAOImplementacion;

import Controlador.Implementacion.ControladorReceta;
import Modelo.CategoriaReceta;
import Modelo.Receta;
import Persistencia.ORM.DAOInterface.IReceta;
import Persistencia.ORM.Util.GenericDAO;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ang_2
 */
public class RecetaDAO extends GenericDAO<Receta, Integer> implements IReceta {

    private static final Logger LOGGER = Logger.getLogger(RecetaDAO.class);

    @Override
    public List<Receta> getTodosByCategoriaByNombre(int idCategoria, String nombreReceta, boolean activo) {
        Session session = getHibernateTemplate();
        List<Receta> objetos = new ArrayList<>();
        try {
            Criteria criterio = session.createCriteria(Receta.class);
            criterio.add(Restrictions.neOrIsNotNull("id", null));

            if (nombreReceta != null) {
                criterio.add(Restrictions.like("nombre", nombreReceta + "%"));
            }
            if (idCategoria > 0) {
                criterio.add(Restrictions.eq("categoriaReceta.id", idCategoria));
            }
            if (activo) {
                criterio.add(Restrictions.isNull("fechaBaja"));
            }
            criterio.addOrder(Order.asc("nombre"));
            objetos = criterio.list();
        } catch (RuntimeException e) {
            LOGGER.error("Error al buscar las recetas.", e);
        }
        return objetos;
    }

    @Override
    public Receta buscar(String nombre) {
        Session session = getHibernateTemplate();
        List<Receta> objetos = new ArrayList<>();
        try {
            String sql = "from Receta where nombre = :nombre";
            objetos = session.createQuery(sql).setParameter("nombre", nombre).list();
        } catch (RuntimeException e) {
            LOGGER.error("Error al buscar la receta.", e);
        }
        if (!objetos.isEmpty()) {
            return objetos.get(0);
        } else {
            return null;
        }
    }

}
