package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Item;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class ItemDao implements Dao<Item> {

	@Override
	public Item get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Item item = (Item) session.get(Item.class, id);
		session.close();
		
		return item;
	}

	@Override
	public void saveOrUpdate(Item item) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(item);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Item> items = session.createQuery("FROM Item").list();
		session.close();
		
		return items;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Item.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(Item item) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(item);
		session.close();
		
	}

}
