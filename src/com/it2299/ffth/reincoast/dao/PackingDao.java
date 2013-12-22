package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Packing;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class PackingDao implements Dao<Packing> {

	@Override
	public Packing get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Packing pList = (Packing) session.get(Packing.class, id);
		session.close();
		
		return pList;
	}
	
	public Packing getName(String pName) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("FROM Packing where packageName = :packName");
		query.setParameter("packName", pName);
		
		Packing packageList = (Packing) query.uniqueResult();
		
		session.close();
		
		return packageList;
	}

	@Override
	public void saveOrUpdate(Packing t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.saveOrUpdate(t);
		
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Packing> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Packing> pList = session.createQuery("FROM Packing").list();
		session.close();
		
		return pList;
	}
	
	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Packing.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(Packing t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(t);
		session.close();
	}
	
}
