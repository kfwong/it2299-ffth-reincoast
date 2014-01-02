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

import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.ProductMeta;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * @author kfwong
 * 
 *         Implementation of Item Data Access Object. Please make sure you
 *         extends AbstractDAO so that we have common interfaces for calling
 *         each other's function.
 */
public class ProductDao implements Dao<Product> {

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

	public Set<String> getCategories() {
		Set<String> categories = new HashSet<String>();

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("SELECT category FROM Product WHERE category != '' AND category IS NOT NULL");
		String[] results = StringUtils.join(query.list(), ",").split(",");

		for (String result : results) {
			categories.add(result);
		}

		return categories;
	}

	public List<Audit> getAudits(int id) {
		/*
		 * System.out.println(histories.get(i)[0]); //entity
		 * System.out.println
		 * (((DefaultRevisionEntity)histories.get(i)[1]).getRevisionDate());
		 * //DefaultRevisionEntity(id, revisionDate)
		 * System.out.println(histories.get(i)[2]); //operation type (ADD,
		 * MOD, DEL)
		 */
		
		List<Audit> audits = new ArrayList<Audit>();

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
														// HibernateDaoSupport

		AuditReader reader = AuditReaderFactory.get(session);

		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Product.class, false, true);
		query.add(AuditEntity.id().eq(id));

		List<Object[]> results = query.getResultList();

		for (int i = 0; i < results.size(); i++) {
			Audit audit = new Audit();
			audit.setEntity(results.get(i)[0]);
			audit.setDate(((DefaultRevisionEntity) results.get(i)[1]).getRevisionDate());
			String operation = null;
			switch (results.get(i)[2].toString()) {
			case "ADD":
				operation = "INSERT";
				break;
			case "MOD":
				operation = "UPDATE";
				break;
			case "DEL":
				operation = "DELETE";
				break;
			}
			audit.setOperation(operation);
			audit.setRevisionId(((DefaultRevisionEntity) results.get(i)[1]).getId());
			
			audits.add(audit);
		}
		
		return audits;
	}
}
