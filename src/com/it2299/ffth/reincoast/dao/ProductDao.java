package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * @author kfwong
 *
 * Implementation of Item Data Access Object.
 * Please make sure you extends AbstractDAO so that we have common interfaces for calling each other's function.
 */
public class ProductDao implements Dao<Product>{
	
	@Override
	public Product get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Product product = (Product) session.get(Product.class, id);
		session.close();
		
		return product;
	}

	@Override
	public void saveOrUpdate(Product product) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(product);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Product> products = session.createQuery("FROM Product").list();
		session.close();
		
		return products;
	}

	@Override
	public Integer countAll() {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Product.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(Product product) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(product);
		session.close();
	}
}
