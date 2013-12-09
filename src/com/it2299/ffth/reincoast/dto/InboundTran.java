package com.it2299.ffth.reincoast.dto;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the inbound_trans database table.
 * 
 */
@Entity
@Table(name="inbound_trans")
@NamedQuery(name="InboundTran.findAll", query="SELECT i FROM InboundTran i")
public class InboundTran implements Serializable , Auditable {
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

	//bi-directional many-to-one association to InboundItem
	@OneToMany(mappedBy="inboundTran")
	private List<InboundItem> inboundItems;

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

	public List<InboundItem> getInboundItems() {
		return this.inboundItems;
	}

	public void setInboundItems(List<InboundItem> inboundItems) {
		this.inboundItems = inboundItems;
	}

	public InboundItem addInboundItem(InboundItem inboundItem) {
		getInboundItems().add(inboundItem);
		inboundItem.setInboundTran(this);

		return inboundItem;
	}

	public InboundItem removeInboundItem(InboundItem inboundItem) {
		getInboundItems().remove(inboundItem);
		inboundItem.setInboundTran(null);

		return inboundItem;
	}

	@Override
	public String auditDelete() {
		// TODO Auto-generated method stub
		return "Inbound Transaction " + receiptno + "has been deleted.";
	}

	@Override
	public String auditUpdate() {
		// TODO Auto-generated method stub
		return "Inbound Transaction " + receiptno + "has been updated.";
	}

	@Override
	public String auditSave() {
		// TODO Auto-generated method stub
		return "Inbound Transaction " + receiptno + " has been created.";
	}

}