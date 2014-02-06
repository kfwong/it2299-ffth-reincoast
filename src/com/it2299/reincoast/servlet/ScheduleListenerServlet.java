package com.it2299.reincoast.servlet;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

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
    	Timer timer = new Timer();
    	TimerTask task = new TimerTask(){
			@Override
			public void run() {
				// TODO Auto-generated method stub
				Calendar now = Calendar.getInstance();
				final DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss aa");
				System.out.println("Scheduled task: " + dateFormat.format(now.getTime()));
			}
    		
    	};
    	//get current time 
    	Calendar cal = Calendar.getInstance(); // locale-specific
    	cal.set(Calendar.AM_PM, Calendar.PM);
    	cal.set(Calendar.HOUR, 0);
    	cal.set(Calendar.MINUTE, 0);
    	cal.set(Calendar.SECOND, 0);
    	cal.set(Calendar.MILLISECOND, 0);
    	
    	Date date = cal.getTime();
    	final DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss aa");
    	System.out.println("Start time: " + dateFormat.format(date));
    	
    	//every 10 seconds for demo purpose
    	//timer.scheduleAtFixedRate(task, date, 10000);
    	
    	//every 24 hours for actual implementation
    	timer.scheduleAtFixedRate(task, date, 86400000);
    	
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
