package com.it2299.ffth.reincoast.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table (name="AUDIT")
public class Audit {
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Column(name="DESCRIPTION")
	private String description;
	
	@Column(name="MOVEMENT_TYPE")
	private String movementType;
	
	@Column(name="DATE_AUDITED")
	private Date dateAudited;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMovementType() {
		return movementType;
	}
	public void setMovementType(String movementType) {
		this.movementType = movementType;
	}
	public Date getDateAudited() {
		return dateAudited;
	}
	public void setDateAudited(Date dateAudited) {
		this.dateAudited = dateAudited;
	}
	
	

}
