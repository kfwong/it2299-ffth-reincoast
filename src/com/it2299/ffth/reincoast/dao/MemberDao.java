package com.it2299.ffth.reincoast.dao;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Member;
import com.it2299.ffth.reincoast.dto.Volunteer;
import com.it2299.ffth.reincoast.util.HibernateUtil;
public class MemberDao implements Dao<Member>{
	

	@Override
	public Member get(Integer id){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Member member = (Member) session.get(Member.class, id);
		session.close();
		
		return member;
	}
	
	

	@Override
	public void saveOrUpdate(Member member) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(member);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Member> getAll() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		List<Member>member = session.createQuery("From Member").list();
		session.close();
		
		return member;
		
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
	public void delete(Member member) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.delete(member);
		session.close();
		
	}
	

	public Member getByUsernameMember(String userName){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM Member where username= :Uname");
		//Query query = session.createQuery("FROM Member where username='" +userName+"' ");
		query.setParameter("Uname", userName);
		Member member = (Member)query.uniqueResult();
		session.close();
		
		return member;
	}
	
	public boolean authenticateMember(String userName, String password){
		Member member = getByUsernameMember(userName);
		if(member!=null && member.getUserName().equals(userName) && member.getPassword().equals(password)){
			return true;
		}else
		{
			return false; 
		}
		
		
	}

	

	
}
