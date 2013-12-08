package com.it2299.ffth.reincoast.dto;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the inbound_item database table.
 * 
 */
@Entity
@Table(name="inbound_item")
@NamedQuery(name="InboundItem.findAll", query="SELECT i FROM InboundItem i")
public class InboundItem implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Temporal(TemporalType.DATE)
	private Date expirydate;

	private int itemid;

	private int quantity;

	//bi-directional many-to-one association to InboundTran
	@ManyToOne
	@JoinColumn(name="receiptno")
	private InboundTran inboundTran;

	public InboundItem() {
	}
	
	

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getExpirydate() {
		return this.expirydate;
	}

	public void setExpirydate(Date expirydate) {
		this.expirydate = expirydate;
	}

	public int getItemid() {
		return this.itemid;
	}

	public void setItemid(int code) {
		this.itemid = code;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public InboundTran getInboundTran() {
		return this.inboundTran;
	}

	public void setInboundTran(InboundTran inboundTran) {
		this.inboundTran = inboundTran;
	}

}