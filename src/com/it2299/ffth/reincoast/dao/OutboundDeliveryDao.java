package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundItem;
import com.it2299.ffth.reincoast.dto.Stock;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class OutboundDeliveryDao implements Dao<OutboundDelivery> {

	@Override
	public OutboundDelivery get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		OutboundDelivery outboundDelivery = (OutboundDelivery) session.get(OutboundDelivery.class, id);
		session.close();
		
		return outboundDelivery;
	}

	@Override
	public void saveOrUpdate(OutboundDelivery outboundDelivery) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.saveOrUpdate(outboundDelivery);
		
		for(InboundLineItem item : outboundDelivery.getItems()){
			Stock stock = new Stock();
			
			item.setOutboundDelivery(outboundDelivery);
			session.saveOrUpdate(item);
		}		
		
		session.getTransaction().commit();
		session.close();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OutboundDelivery> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<OutboundDelivery> outboundDeliveries = session.createQuery("FROM OutboundDelivery").list();
		session.close();
		
		return outboundDeliveries;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(OutboundDelivery.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(OutboundDelivery outboundDelivery) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(outboundDelivery);
		session.close();
	}

}
