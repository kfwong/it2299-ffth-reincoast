package com.it2299.ffth.reincoast.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.envers.Audited;

@Entity
@Audited
@Table(name="OUTBOUND_LINE_ITEM")
public class OutboundLineItem {

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Column(name="QUANTITY")
	private int quantity;
	
	@OneToOne(fetch= FetchType.EAGER)
	@JoinColumn(name="PRODUCT_ID")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name="OUTBOUND_DELIVERY_ID")
	private OutboundDelivery outboundDelivery;
	
	@JoinColumn(name ="OUTBOUND_ITEM_EXPIRY_DATE")
	private Date expriyDate;
	
	public Date getExpriyDate() {
		return expriyDate;
	}

	public void setExpriyDate(Date expriyDate) {
		this.expriyDate = expriyDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public OutboundDelivery getOutboundDelivery() {
		return outboundDelivery;
	}

	public void setOutboundDelivery(OutboundDelivery outboundDelivery) {
		this.outboundDelivery = outboundDelivery;
	}
	
	
}
