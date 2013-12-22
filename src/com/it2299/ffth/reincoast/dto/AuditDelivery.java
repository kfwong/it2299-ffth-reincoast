package com.it2299.ffth.reincoast.dto;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table (name="AuditDelivery")
public class AuditDelivery {

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="INBOUND_DELIVERY_ID")
	private InboundDelivery inboundDelivery;
	
	@Column(name="Description")
	private String description;
	
	@Column(name="MOVEMENT_TYPE")
	private String movementType;
	
	@Column(name="DATE_AUDITED")
	private Date dateAudited;

	public InboundDelivery getInboundDelivery() {
		return inboundDelivery;
	}

	public void setInboundDelivery(InboundDelivery inboundDelivery) {
		this.inboundDelivery = inboundDelivery;
	}

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
