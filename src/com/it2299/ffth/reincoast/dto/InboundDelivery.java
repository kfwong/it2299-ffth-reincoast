package com.it2299.ffth.reincoast.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.it2299.ffth.reincoast.dao.AuditDeliveryDao;

@Entity
@Table(name="INBOUND_DELIVERY")
public class InboundDelivery implements Auditable {
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="inboundDelivery")
	private List<Item> items;
	
	@Column(name="DATE_DELIVERED")
	private Date dateDelivered;
	
	@Column(name="DONOR_NAME")
	private String donorName;
	
	@Column(name="DONOR_TYPE")
	private String donorType;
	
	@Column(name="TOTAL_PRICE")
	private double totalPrice;
	
	public String getDonorName() {
		return donorName;
	}
	public void setDonorName(String donorName) {
		this.donorName = donorName;
	}
	public String getDonorType() {
		return donorType;
	}
	public void setDonorType(String donorType) {
		this.donorType = donorType;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public Date getDateDelivered() {
		return dateDelivered;
	}
	public void setDateDelivered(Date dateDelivered) {
		this.dateDelivered = dateDelivered;
	}
	@Override
	public String auditDelete() {
			AuditDelivery audit = new AuditDelivery();
			audit.setDateAudited(new Date());
			audit.setDescription("Inbound Delivery" + id + "is deleted");
			audit.setMovementType("Delete");
			
			AuditDeliveryDao auditDao = new AuditDeliveryDao();
			auditDao.saveOrUpdate(audit);
			
		
		return "Inbound Delivery " + id + " is deleted.";
	}
	@Override
	public String auditUpdate() {
		AuditDelivery audit = new AuditDelivery();
		audit.setDateAudited(new Date());
		audit.setDescription("Inbound Delivery " + id + "is updated");
		audit.setMovementType("Update");
		
		AuditDeliveryDao auditDao = new AuditDeliveryDao();
		auditDao.saveOrUpdate(audit);
		return "Inbound Delivery " + id + " is updated.";
	}
	@Override
	public String auditSave() {
		AuditDelivery audit = new AuditDelivery();
		audit.setDateAudited(new Date());
		audit.setDescription("Inbound Delivery " + id + "is created");
		audit.setMovementType("Insert");
		audit.setInboundDelivery(this);
		AuditDeliveryDao auditDao = new AuditDeliveryDao();
		auditDao.saveOrUpdate(audit);
		return "Inbound Delivery " + donorName + " is created.";
	}
	
	
	
}
