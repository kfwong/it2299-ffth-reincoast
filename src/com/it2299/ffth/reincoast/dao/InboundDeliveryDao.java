package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.Item;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.interceptor.AuditDeliveryInterceptor;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class InboundDeliveryDao implements Dao<InboundDelivery> {

	@Override
	public InboundDelivery get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		InboundDelivery inboundDelivery = (InboundDelivery) session.get(InboundDelivery.class, id);
		session.close();
		
		return inboundDelivery;
	}

	@Override
	public void saveOrUpdate(InboundDelivery inboundDelivery) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.saveOrUpdate(inboundDelivery);
		
		for(Item item : inboundDelivery.getItems()){
			item.setInboundDelivery(inboundDelivery);
			session.saveOrUpdate(item);
		}		
		
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InboundDelivery> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<InboundDelivery> inboundDeliveries = session.createQuery("FROM InboundDelivery").list();
		session.close();
		
		return inboundDeliveries;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(InboundDelivery.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(InboundDelivery inboundDelivery) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(inboundDelivery);
		session.close();
		
	}

}
