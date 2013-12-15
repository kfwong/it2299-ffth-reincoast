package com.it2299.ffth.reincoast.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistryBuilder;

import com.it2299.ffth.reincoast.interceptor.AuditInterceptor;

/**
 * @author kfwong
 * 
 * A static singleton class to handle SessionFactory object.
 * This is to ensure there's only one SessionFactory object throughout the application lifecycle.
 * SessionFactory is an heavy-weighted object.
 * It's not required to have more than one SessionFactory unless dealing with multiple datasource.
 */
public class HibernateUtil {

	private static final SessionFactory sessionFactory = buildSessionFactory();

	private static SessionFactory buildSessionFactory() {
		try {
			// Create the SessionFactory from hibernate.cfg.xml
			Configuration configuration = new AnnotationConfiguration();
			configuration.setInterceptor(new AuditInterceptor());
			configuration.configure();
			ServiceRegistryBuilder serviceRegistryBuilder = new ServiceRegistryBuilder().applySettings(configuration.getProperties());
			return configuration.buildSessionFactory(serviceRegistryBuilder.buildServiceRegistry());
		} catch (Throwable ex) {
			// Make sure you log the exceptio nn, as it might be swallowed
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

}