package com.it2299.ffth.reincoast.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;






import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundLineItem;
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
		
		session.getTransaction().commit();
		session.close();
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<OutboundDelivery> getByDate(){
		Date date = new Date();
		long time = date.getTime() - 86400000;
		Date date1 =new Date(time);
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Criteria cri = session.createCriteria(OutboundDelivery.class);
		cri.add(Restrictions.ge("dateDelivered", date1));
		List result = cri.list();
		session.close();
		
		return result;
	}
	
	public List<OutboundDelivery> getByMonth(){
		Date current_date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(current_date);
		cal.add(Calendar.MONTH, -30);
		Date newDate = cal.getTime();
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Criteria cri = session.createCriteria(OutboundDelivery.class);
		cri.add(Restrictions.ge("dateDelivered", newDate));
		List result = cri.list();
		session.close();
		
		return result;
	}
	
	public List<OutboundDelivery> getByYear(){
		Date current_date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(current_date);
		cal.add(Calendar.YEAR, -1);
		
		Date newDate = cal.getTime();
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Criteria cri = session.createCriteria(OutboundDelivery.class);
		cri.add(Restrictions.ge("dateDelivered", newDate));
		List result = cri.list();
		session.close();
		
		return result;
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
		session.beginTransaction();
		session.delete(outboundDelivery);
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

		AuditQuery query = reader.createQuery().forRevisionsOfEntity(OutboundDelivery.class, false, true);
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
