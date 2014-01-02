package com.it2299.ffth.reincoast.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

public class Audit {
	private Date date;
	private String operation;
	private Object entity;
	private int revisionId;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public Object getEntity() {
		return entity;
	}
	public void setEntity(Object entity) {
		this.entity = entity;
	}
	public int getRevisionId() {
		return revisionId;
	}
	public void setRevisionId(int revisionId) {
		this.revisionId = revisionId;
	}
}
