package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Member;
import com.it2299.ffth.reincoast.dto.Volunteer;
import com.it2299.ffth.reincoast.util.HibernateUtil;

public class VolunteerDao implements Dao<Volunteer>{
	
	public Volunteer get(Integer id){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Volunteer volunteer = (Volunteer) session.get(Volunteer.class, id);
		session.close();
		
		return volunteer;
	}
	
	

	@Override
	public void saveOrUpdate(Volunteer volunteer) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(volunteer);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Volunteer> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Volunteer>volunteer = session.createQuery("From Volunteer").list();
		session.close();
		
		return volunteer;
		
	}

	@Override
	public Integer countAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Integer count = ((Long) session.createCriteria(Member.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
		session.close();
		
		return count;
	}

	@Override
	public void delete(Volunteer volunteer) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(volunteer);
		session.close();
		
	}
	

	public Volunteer getByUsernameVolunteer(String userName){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM Volunteer where username= :Uname");
		//Query query = session.createQuery("FROM Volunteer where username='" +userName+"' ");
		query.setParameter("Uname", userName);
		Volunteer volunteer = (Volunteer)query.uniqueResult();
		session.close();
		
		return  volunteer;
	}
	public boolean authenticateVolunteer(String userName, String password){
		Volunteer volunteer = getByUsernameVolunteer(userName);
		if(volunteer!=null && volunteer.getUserName().equals(userName) && volunteer.getPassword().equals(password)){
			return true;
		}else
		{
			return false; 
		}
		
		
	}
	

}
