package com.it2299.ffth.reincoast.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.it2299.ffth.reincoast.dto.Contact;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class ContactDao implements Dao<Contact> {

	@Override
	public Contact get(Integer id) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Contact contact = (Contact) session.get(Contact.class, id);
		session.close();
		return contact;
	}

	@Override
	public void saveOrUpdate(Contact t) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.saveOrUpdate(t);
		session.getTransaction().commit();
		
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contact> getAll() {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		List<Contact> t = session.createQuery("FROM Contact").list();
		
		session.close();
		return t;
	}
	
	public List<Contact> getAllById(ArrayList<Integer> ids){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(Contact.class);
		Disjunction disjunction = Restrictions.disjunction();
		for(int id : ids){
			disjunction.add(Restrictions.idEq(id));
		}
		criteria.add(disjunction);
		
		List<Contact> contacts = criteria.list();
		
		session.close();
		
		return contacts;
	}
	
	public List<Contact> getAllByType(String type){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(Contact.class);
		Disjunction disjunction = Restrictions.disjunction();
		
		disjunction.add(Restrictions.eq("type", type));
		
		criteria.add(disjunction);
		
		List<Contact> contacts = criteria.list();
		
		session.close();
		
		return contacts;
	}

	@Override
	public Integer countAll() {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Integer count = ((Long) session.createCriteria(Contact.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		
		session.close();
		return count;
	}

	@Override
	public void delete(Contact t) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete("Contact");
		session.close();
	}

}
