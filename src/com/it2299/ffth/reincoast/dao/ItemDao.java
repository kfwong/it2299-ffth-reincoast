package com.it2299.ffth.reincoast.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class ItemDao implements Dao<InboundLineItem> {

	@Override
	public InboundLineItem get(Integer id) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		InboundLineItem item = (InboundLineItem) session.get(InboundLineItem.class, id);
		session.close();
		
		return item;
	}
	
	
	@Override
	public void saveOrUpdate(InboundLineItem item) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(item);
		session.getTransaction().commit();
		session.close();
	}
	
	public void saveOrUpdateOutbound(OutboundLineItem item) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(item);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InboundLineItem> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<InboundLineItem> items = session.createQuery("FROM InboundLineItem").list();
		session.close();
		
		return items;
	}
	
@SuppressWarnings({ "unchecked", "rawtypes" })
public List<InboundLineItem> getList(InboundDelivery inboundDelivery){
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	Session session = sessionFactory.openSession();
	Query query = session.createQuery("FROM InboundLineItem Where inboundDelivery = :inboundDelivery");
	query.setParameter("inboundDelivery", inboundDelivery);
	List list = query.list();
	session.close();
	
	return list;
	}

@SuppressWarnings({ "unchecked", "rawtypes" })
public List<OutboundLineItem> getOutboundList(OutboundDelivery outboundDelivery){
	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	Session session = sessionFactory.openSession();
	Query query = session.createQuery("FROM OutboundLineItem Where outboundDelivery = :outboundDelivery");
	query.setParameter("outboundDelivery", outboundDelivery);
	List list = query.list();
	session.close();
	
	return list;
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(InboundLineItem.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(InboundLineItem item) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(item);
		session.getTransaction().commit();
		session.close();
	}


	public void deleteOutbound(OutboundLineItem outboundLineItem) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(outboundLineItem);
		session.getTransaction().commit();
		session.close();
		
	}
	
	public List<InboundLineItem> getRecommend(Product product){
		Date date = new Date();
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM InboundLineItem Where product = :product AND expiryDate < :date AND avaliable > 0");
		query.setParameter("product", product);
		query.setParameter("date", date);
		List list = query.list();
		session.close();
		
		return list;
	}
	
	
}
