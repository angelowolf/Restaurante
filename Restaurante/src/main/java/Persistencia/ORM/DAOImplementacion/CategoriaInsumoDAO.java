/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia.ORM.DAOImplementacion;

import Modelo.CategoriaInsumo;
import java.util.List;
import Persistencia.ORM.DAOInterface.ICategoriaInsumo;
import Persistencia.ORM.Util.GenericDAO;
import java.util.ArrayList;
import org.apache.log4j.Logger;
import org.hibernate.Session;

/**
 *
 * @author ang_2
 */
public class CategoriaInsumoDAO extends GenericDAO<CategoriaInsumo, Integer> implements ICategoriaInsumo {

    private static final Logger LOG = Logger.getLogger(CategoriaInsumoDAO.class);

    @Override
    public List<CategoriaInsumo> getTodos() {
        Session session = getHibernateTemplate();
        List<CategoriaInsumo> objetos = new ArrayList<>();
        try {
            String sql = "from CategoriaInsumo";
            objetos = session.createQuery(sql).list();
        } catch (RuntimeException e) {
            LOG.error("Error al buscar las categorias.", e);
        }
        return objetos;
    }

    @Override
    public CategoriaInsumo buscar(String nombre) {
        Session session = getHibernateTemplate();
        List<CategoriaInsumo> objetos = new ArrayList<>();
        try {
            String sql = "from CategoriaInsumo where nombre = :nombre";
            objetos = session.createQuery(sql).setParameter("nombre", nombre).list();
        } catch (RuntimeException e) {
            LOG.error("Error al buscar categoria insumo", e);
        }
        if (!objetos.isEmpty()) {
            return objetos.get(0);
        } else {
            return null;
        }
    }

    @Override
    public List<CategoriaInsumo> categoriaInsumosEnUso(CategoriaInsumo categoriaInsumo) {
        Session session = getHibernateTemplate();
        List<CategoriaInsumo> objetos = new ArrayList<>();
        try {
            String sql = "select * from CategoriaInsumo categoria inner join insumo insumo ON insumo.id_categoria = categoria.id WHERE insumo.id_categoria LIKE :id ";
            objetos = session.createSQLQuery(sql).addEntity(CategoriaInsumo.class).setParameter("id", categoriaInsumo.getId()).list();
        } catch (RuntimeException e) {
            LOG.error("Error al verificar si esta en uso la categoria", e);
        }
        return objetos;
    }

}
