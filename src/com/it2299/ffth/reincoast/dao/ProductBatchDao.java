package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.ProductBatch;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class ProductBatchDao {
	
	public ProductBatch get(ProductBatch pb){
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		ProductBatch productBatch = (ProductBatch) session.get(ProductBatch.class, pb);
		session.close();

		return productBatch;
	}
	public List<ProductBatch> getBatch(int id){
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		Query query = session.createQuery("FROM ProductBatch where productId = :productId AND quantity > 0");
		Product product = new Product();
		query.setParameter("productId", id);
		List list = query.list();
		session.close();
		
		return list;
	}
	
}
