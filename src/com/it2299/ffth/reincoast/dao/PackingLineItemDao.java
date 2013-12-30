package com.it2299.ffth.reincoast.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Packing;
import com.it2299.ffth.reincoast.dto.PackingLineItem;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class PackingLineItemDao implements Dao<PackingLineItem>{

	@Override
	public PackingLineItem get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		PackingLineItem item = (PackingLineItem) session.get(PackingLineItem.class, id);
		session.close();
		
		return item;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<PackingLineItem> getAll(Integer id){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM PackingLineItem WHERE packings = :packing");
		
		Packing packing = new Packing();
		packing.setId(id);
		
		query.setParameter("packing", packing);
		List list = query.list();
		session.close();
		
		return list;
	}
	@Override
	public void saveOrUpdate(PackingLineItem t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(t);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PackingLineItem> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<PackingLineItem> items = session.createQuery("FROM packingListItem").list();
		session.close();
		
		return items;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(PackingLineItem.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(PackingLineItem t) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(t);
		session.close();
	}

}
