package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.Item;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class AuditDao implements Dao<Audit> {

	@Override
	public
	Audit get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Audit audit = (Audit) session.get(Audit.class, id);
		session.close();
		
		return audit;
	}

	@Override
	public
	void saveOrUpdate(Audit audit) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.saveOrUpdate(audit);
		
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public
	List<Audit> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Audit> audits = session.createQuery("FROM Audit").list();
		session.close();
		
		return audits;
	}

	@Override
	public
	Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Audit.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public
	void delete(Audit audit) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(audit);
		session.close();
	}

}
