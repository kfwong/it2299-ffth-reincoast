package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.AuditDelivery;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class AuditDeliveryDao implements Dao<AuditDelivery> {

	@Override
	public AuditDelivery get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		AuditDelivery auditdelivery = (AuditDelivery) session.get(AuditDelivery.class, id);
		session.close();
		
		return auditdelivery;
	}

	@Override
	public void saveOrUpdate(AuditDelivery t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.saveOrUpdate(t);
		
		session.getTransaction().commit();
		session.close();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AuditDelivery> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<AuditDelivery> auditsDelivery = session.createQuery("FROM AuditDelivery").list();
		session.close();
		
		return auditsDelivery;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(AuditDelivery.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(AuditDelivery t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(t);
		session.close();

	}

}
