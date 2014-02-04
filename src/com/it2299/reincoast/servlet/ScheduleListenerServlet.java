package com.it2299.reincoast.servlet;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.it2299.ffth.reincoast.util.Reminder;

/**
 * Application Lifecycle Listener implementation class ScheduleListenerServlet
 *
 */
@WebListener
public class ScheduleListenerServlet implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ScheduleListenerServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    	System.out.println("AmuletxHeart's scheduler");
    	Reminder reminder = new Reminder();
    	Timer timer = new Timer();
    	timer.scheduleAtFixedRate(reminder, 0, 1800000);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
