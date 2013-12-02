package com.it2299.ffth.reincoast.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
//Declare this class as entity so that Hibernate will know this is to be taken
//care of. Mapping configuration required in hibernate.cfg.xml.
@Table(name = "InboundItem")
//The table name that will be created upon persistence.
public class InboundItem {
	@Id
	// Declare this attribute as primary key
	@GeneratedValue
	// Auto-increment value. Generated by Hibernate.
	@Column(name = "ID")
	// The corresponding column name in the table.
	private int id;
	
	@Column(name = "ReceiptNO")
	private int receiptno;
	
	@Column(name = "CODE")
	private String code;
	
	@Column(name = "ExpiryDate")
	private Date expirydate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="INBOUND_TRANS_ID")
	private InboundTrans inboundTrans;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getReceiptno() {
		return receiptno;
	}

	public void setReceiptno(int receiptno) {
		this.receiptno = receiptno;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getExpirydate() {
		return expirydate;
	}

	public void setExpirydate(Date expirydate) {
		this.expirydate = expirydate;
	}
}
