package com.it2299.ffth.reincoast.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.RevisionType;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;
import org.hibernate.envers.query.criteria.AuditProperty;

import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.ProductBatch;
import com.it2299.ffth.reincoast.dto.ProductMeta;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * @author kfwong
 * 
 *         Implementation of Item Data Access Object. Please make sure you
 *         extends AbstractDAO so that we have common interfaces for calling
 *         each other's function.
 */
/**
 * @author kfwong
 *
 */
/**
 * @author kfwong
 * 
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

	public Product getByBarcode(String code) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		Query query = session.createQuery("FROM Product WHERE code= :code");
		query.setParameter("code", code);

		Product product = (Product) query.uniqueResult();

		session.close();

		return product;
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

	public List<Audit> getAuditsById(int id) {
		/*
		 * System.out.println(histories.get(i)[0]); //entity System.out.println
		 * (((DefaultRevisionEntity)histories.get(i)[1]).getRevisionDate());
		 * //DefaultRevisionEntity(id, revisionDate)
		 * System.out.println(histories.get(i)[2]); //operation type (ADD, MOD,
		 * DEL)
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

	public List<Audit> getAuditsById(int id, Date date) {

		List<Audit> audits = new ArrayList<Audit>();

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
		// HibernateDaoSupport

		AuditReader reader = AuditReaderFactory.get(session);

		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Product.class, false, true);
		query.add(AuditEntity.id().eq(id));
		query.add(AuditEntity.revisionProperty("timestamp").ge(date.getTime()));

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

	/**
	 * @param date
	 * @return the sum of inbound delivery audits total over a span of duration
	 *         (long) since today.
	 */
	public int getInboundDeliveryAuditsTotal(Date date) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		Query query = session.createSQLQuery("SELECT SUM(QUANTITY) FROM `INBOUND_LINE_ITEM_AUD` WHERE PRODUCT_ID = 1 GROUP BY PRODUCT_ID");

		Object result = query.uniqueResult();

		session.close();

		if (result == null) {
			return 0;
		} else {
			return ((BigDecimal) result).intValue();
		}
	}
	
	public String getMovementGraphData(){
		String data = "";
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		Query query = session.createSQLQuery("SELECT `MONTHS`.MONTH AS MONTH, COALESCE(`INBOUNDS`.TOTAL, 0) AS INBOUND_TOTAL, COALESCE(`OUTBOUNDS`.TOTAL, 0) AS OUTBOUND_TOTAL FROM "
				+ "("
				+ "SELECT DATE_FORMAT(now() - INTERVAL 11 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 10 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 9 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 8 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 7 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 6 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 5 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 4 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 3 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 2 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now() - INTERVAL 1 MONTH, '%b %y') AS `MONTH` "
				+ "UNION "
				+ "SELECT DATE_FORMAT(now(), '%b %y') AS `MONTH`) AS `MONTHS` "
				+ "LEFT JOIN "
				+ "( "
				+ "SELECT DATE_FORMAT(DATE(FROM_UNIXTIME(REVINFO.REVTSTMP/1000)), '%b %y') AS `MONTH`, COUNT(*) AS `TOTAL` FROM INBOUND_LINE_ITEM_AUD "
				+ "INNER JOIN REVINFO ON INBOUND_LINE_ITEM_AUD.REV = REVINFO.REV "
				+ "WHERE PRODUCT_ID = 46 AND DATE(FROM_UNIXTIME(REVINFO.REVTSTMP/1000)) > NOW() - INTERVAL 12 MONTH "
				+ "GROUP BY `MONTH` "
				+ ") AS `INBOUNDS` "
				+ "ON `MONTHS`.MONTH = `INBOUNDS`.MONTH "
				+ "LEFT JOIN "
				+ "( "
				+ "SELECT DATE_FORMAT(DATE(FROM_UNIXTIME(REVINFO.REVTSTMP/1000)), '%b %y') AS `MONTH`, COUNT(*) AS `TOTAL` FROM OUTBOUND_LINE_ITEM_AUD "
				+ "INNER JOIN REVINFO ON OUTBOUND_LINE_ITEM_AUD.REV = REVINFO.REV "
				+ "WHERE PRODUCT_ID = 46 AND DATE(FROM_UNIXTIME(REVINFO.REVTSTMP/1000)) > NOW() - INTERVAL 12 MONTH "
				+ "GROUP BY `MONTH` "
				+ ") AS `OUTBOUNDS` "
				+ "ON `MONTHS`.MONTH = `OUTBOUNDS`.MONTH");
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);

		List list = query.list();
		
		for(Object object : list){
			Map map = (Map) object;
			data += "{ m: '" + map.get("MONTH") + "', inbound: "+ map.get("INBOUND_TOTAL") +", outbound: "+ map.get("OUTBOUND_TOTAL") +" },";
		}
		
		// remove last comma from string
		if (data.length() > 0 && data.charAt(data.length()-1)==',') {
		    data = data.substring(0, data.length()-1);
		}

		session.close();
		
		return data;
	}

	public List<Audit> getAudits() {
		List<Audit> audits = new ArrayList<Audit>();

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
														// HibernateDaoSupport

		AuditReader reader = AuditReaderFactory.get(session);

		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Product.class, false, true);
		query.addOrder(AuditEntity.property("dateRegistered").desc());
		query.setMaxResults(30);

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

	public int getAuditsCount() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
														// HibernateDaoSupport

		AuditReader reader = AuditReaderFactory.get(session);

		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Product.class, false, true);
		query.addProjection(AuditEntity.property("id").count());

		return ((Long) query.getSingleResult()).intValue();
	}

	public int getAuditsCount(RevisionType revisionType) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
														// HibernateDaoSupport

		AuditReader reader = AuditReaderFactory.get(session);

		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Product.class, false, true);
		query.addProjection(AuditEntity.property("id").count());
		query.add(AuditEntity.revisionType().eq(revisionType));

		return ((Long) query.getSingleResult()).intValue();
	}

	public void increaseQuantity(int id, int increment) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		session.beginTransaction();

		Product product = (Product) session.get(Product.class, id);
		product.setQuantity(product.getQuantity() + increment);

		session.update(product);

		session.getTransaction().commit();
		session.close();
	}
	
	public void increaseQuantity(int id, int increment, Date expiryDate) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		session.beginTransaction();

		Product product = (Product) session.get(Product.class, id);
		product.setQuantity(product.getQuantity() + increment);
		
		ProductBatch productBatch = new ProductBatch();
		productBatch.setProductId(id);
		productBatch.setExpiryDate(expiryDate);
		productBatch = (ProductBatch) session.get(ProductBatch.class, productBatch);
		
		if(productBatch == null){
			productBatch = new ProductBatch();
			productBatch.setProductId(id);
			productBatch.setExpiryDate(expiryDate);
			productBatch.setQuantity(increment);
		}else{
			productBatch.setQuantity(productBatch.getQuantity() + increment);
		}
		
		session.update(product);
		session.saveOrUpdate(productBatch);

		session.getTransaction().commit();
		session.close();
	}

	public void decreaseQuantity(int id, int decrement) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();

		session.beginTransaction();

		Product product = (Product) session.get(Product.class, id);
		product.setQuantity(product.getQuantity() - decrement);

		session.update(product);

		session.getTransaction().commit();
		session.close();
	}
}
