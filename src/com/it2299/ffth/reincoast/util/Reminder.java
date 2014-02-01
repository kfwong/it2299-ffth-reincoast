package com.it2299.ffth.reincoast.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimerTask;

public class Reminder extends TimerTask {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		Calendar now = Calendar.getInstance();
		final DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		System.out.println("scheduled task");
		System.out.println(dateFormat.format(now.getTime()));
	}

}
