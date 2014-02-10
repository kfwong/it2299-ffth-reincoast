package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.CalendarEventPlanner;
import com.it2299.ffth.reincoast.dto.CalendarFoodDrive;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class CalendarEventPlannerDao implements Dao<CalendarEventPlanner> {

	@Override
	public CalendarEventPlanner get(Integer id) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		CalendarEventPlanner calendarFoodDrive = (CalendarEventPlanner) session.get(CalendarEventPlanner.class, id);
		session.close();
		
		return calendarFoodDrive;
	}

	@Override
	public void saveOrUpdate(CalendarEventPlanner t) {
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
	public List<CalendarEventPlanner> getAll() {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		List<CalendarEventPlanner> t = session.createQuery("FROM CalendarEventPlanner").list();
		
		session.close();
		return t;
	}

	@Override
	public Integer countAll() {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Integer count = ((Long) session.createCriteria(CalendarFoodDrive.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		
		session.close();
		return count;
	}

	@Override
	public void delete(CalendarEventPlanner t) {
		// TODO Auto-generated method stub
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		session.delete(t);

		session.getTransaction().commit();
		session.close();
	}

}
