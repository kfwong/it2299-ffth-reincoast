package com.it2299.ffth.reincoast.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.ProductMeta;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * @author kfwong
 *
 * Implementation of Item Data Access Object.
 * Please make sure you extends AbstractDAO so that we have common interfaces for calling each other's function.
 */
public class ProductMetaDao implements Dao<ProductMeta>{
	
	@Override
	public ProductMeta get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		ProductMeta productMeta = (ProductMeta) session.get(ProductMeta.class, id);
		session.close();
		
		return productMeta;
	}

	@Override
	public void saveOrUpdate(ProductMeta productMeta) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.saveOrUpdate(productMeta);
		
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductMeta> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<ProductMeta> productMetas = session.createQuery("FROM ProductMeta").list();
		session.close();
		
		return productMetas;
	}

	@Override
	public Integer countAll() {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(ProductMeta.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(ProductMeta productMeta) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(productMeta);
		session.close();
	}
	
	public void deleteById(int id){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		Query query = session.createQuery("DELETE FROM ProductMeta WHERE id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
		
		session.getTransaction().commit();
		session.close();
	}
}
