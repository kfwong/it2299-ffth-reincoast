package com.it2299.ffth.reincoast.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CALENDAR_FOOD_DRIVE")

public class CalendarFoodDrive {

	@Id
	@GeneratedValue
	private int id;
	
	private String title;
	
	private Date start;
	
	private Date end;
	
	private boolean allDay;
	
	@ManyToOne
	private Contact contact;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateInString = dateStr;
		Date date = null;
		try {
			date = sdf.parse(dateInString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.start = date;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateInString = dateStr;
		Date date = null;
		try {
			date = sdf.parse(dateInString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.end = date;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(String allDayStr) {
		boolean allDay;
		if(allDayStr != null && allDayStr.equals("true")){
			allDay = true;
		}
		else{
			allDay = false;
		}
		this.allDay = allDay;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}
}
