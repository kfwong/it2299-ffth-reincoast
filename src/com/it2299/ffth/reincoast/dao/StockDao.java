package com.it2299.ffth.reincoast.dao;

import java.util.ArrayList;
import java.util.List;







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
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.Stock;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class StockDao implements Dao<Stock> {

	/* (non-Javadoc)
	 * @see com.it2299.ffth.reincoast.dao.Dao#get(java.lang.Integer)
	 */
	@Override
	public Stock get(Integer id) {
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Stock stock = (Stock)session.get(Stock.class, id);
		session.close();
		return stock;
	}
	
	public Stock getAvailableStock(Product product){
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createQuery("from Stock where product = :product");
		Stock stock = (Stock) query.uniqueResult();
		session.close();
		return stock;
	}
	
	public Stock find(Product product){
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createQuery("from Stock WHERE product = :product");
		query.setParameter("product", product);
		Stock stock= (Stock) query.uniqueResult();
		return stock;
	}
	@Override
	public void saveOrUpdate(Stock t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(t);
		session.getTransaction().commit();
		session.close();
		
	}
	
	public int updateStock(Stock t){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("UPDATE Stock set quantity = :quantity WHERE product = :product");
		query.setParameter("product", t.getProduct());
		query.setParameter("quantity", t.getQuantity());
		
		
		int result = query.executeUpdate();
		session.close();
		
		return result;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Stock getProductStock(Product product){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM Stock where product = :product");
		
		query.setParameter("product", product);
		
		List list = query.list();
		
		Stock stock = (Stock) list.get(0);
		session.close();
		
		return stock;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Stock> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Stock> stocks = session.createQuery("FROM Stock").list();
		session.close();
		
		return stocks;
	}
	
	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Stock.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(Stock t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(t);
		session.close();
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Audit> getAudits(){
		List<Audit> audits = new ArrayList<Audit>();

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
														// HibernateDaoSupport

		AuditReader reader = AuditReaderFactory.get(session);

		AuditQuery query = reader.createQuery().forRevisionsOfEntity(InboundDelivery.class, false, true);
		query.addOrder(AuditEntity.property("dateDelivered").desc());
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

}
