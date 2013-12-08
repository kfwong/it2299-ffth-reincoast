package com.it2299.ffth.reincoast.dto;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the inbound_trans database table.
 * 
 */
@Entity
@Table(name="inbound_trans")
@NamedQuery(name="InboundTran.findAll", query="SELECT i FROM InboundTran i")
public class InboundTran implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	@Temporal(TemporalType.DATE)
	private Date date;

	private String donor;

	@Column(name="donor_type")
	private String donorType;

	private int receiptno;

	@Column(name="total_price")
	private double totalPrice;

	public InboundTran() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDonor() {
		return this.donor;
	}

	public void setDonor(String donor) {
		this.donor = donor;
	}

	public String getDonorType() {
		return this.donorType;
	}

	public void setDonorType(String donorType) {
		this.donorType = donorType;
	}

	public int getReceiptno() {
		return this.receiptno;
	}

	public void setReceiptno(int receiptno) {
		this.receiptno = receiptno;
	}

	public double getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}