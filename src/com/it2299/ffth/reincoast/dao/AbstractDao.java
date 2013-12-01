package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * @author kfwong
 *
 * This is a base class for all Data Access Object (DAO). 
 * It's recommended all DAO extends this class to ensure common interfaces. 
 */
abstract class AbstractDao<T> {
	protected static final SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	protected Session session;
	
	public void openSession(){
		session = sessionFactory.openSession();
	}
	
	public Session getSession(){
		return session;
	}
	
	public void closeSession(){
		session.close();
	}
	
	/**
	 * @param id
	 * @return
	 * 
	 * Return a single object.
	 */
	abstract T get(Integer id);

	/**
	 * @param t
	 * 
	 * Persist object parameter. Object will be updated if primary key (id) exist, if not a new record will be created.
	 */
	abstract void save(T t);

	/**
	 * @return
	 * 
	 * Return list of all the records.
	 */
	abstract List<T> getAll();

	/**
	 * @return
	 * 
	 * Return the existing number of records.
	 */
	abstract Integer countAll();

	/**
	 * @param t
	 * 
	 * Delete object from record.
	 */
	abstract void delete(T t);
}
