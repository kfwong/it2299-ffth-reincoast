package com.it2299.ffth.reincoast.dao;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

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
		Query query = session.createQuery("UPDATE Stock set quantity =: quantity WHERE product = : product");
		query.setParameter("product", t.getProduct());
		query.setParameter("quantity", t.getQuantity());
		
		
		int result = query.executeUpdate();
		session.close();
		
		return result;
	}
	@SuppressWarnings("rawtypes")
	public boolean isExists(Product product){
		boolean valid = false;
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createQuery("from Stock where product = :productID");
		query.setParameter("productID", product.getId());
		List list = query.list();
		session.close();
		if(list != null){
			valid = true;
		}
		return valid;
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
	
	

}
