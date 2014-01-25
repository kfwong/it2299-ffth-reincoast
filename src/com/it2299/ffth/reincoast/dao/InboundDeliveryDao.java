package com.it2299.ffth.reincoast.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.Product;
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
		
		session.getTransaction().commit();
		session.close();
	}
	
	@SuppressWarnings("unchecked")
	public List<InboundDelivery> getAllByDonorName(String name){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM InboundDelivery where donorName = :donorName");
		query.setParameter("donorName", name);
		List<InboundDelivery> result = query.list();
		session.close();
		
		return result;
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
		session.beginTransaction();
		session.delete(inboundDelivery);
		session.getTransaction().commit();
		session.close();
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Audit> getAudits(){
		List<Audit> audits = new ArrayList<Audit>();

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
														// HibernateDaoSupport

		AuditReader reader = AuditReaderFactory.get(session);

		AuditQuery query = reader.createQuery().forRevisionsOfEntity(InboundDelivery.class, false, true);
		query.addOrder(AuditEntity.property("dateDelivered").desc());
		query.setMaxResults(30);

		List<Object[]> results = query.getResultList();

		for (int i = 0; i < results.size(); i++) {
			Audit audit = new Audit();
			audit.setEntity(results.get(i)[0]);
			audit.setDate(((DefaultRevisionEntity) results.get(i)[1]).getRevisionDate());
			String operation = null;
			switch (results.get(i)[2].toString()) {
			case "ADD":
				operation = "INSERT";
				break;
			case "MOD":
				operation = "UPDATE";
				break;
			case "DEL":
				operation = "DELETE";
				break;
			}
			audit.setOperation(operation);
			audit.setRevisionId(((DefaultRevisionEntity) results.get(i)[1]).getId());
			
			audits.add(audit);
		}
		
		return audits;
	}

}
