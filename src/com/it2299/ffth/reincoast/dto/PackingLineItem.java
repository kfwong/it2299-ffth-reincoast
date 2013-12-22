package com.it2299.ffth.reincoast.dto;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="PACKING_LIST_ITEM")
public class PackingLineItem {

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@OneToOne(fetch= FetchType.EAGER)
	@JoinColumn(name="PRODUCT_ID")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name="PACKING_LIST_ID")
	private Packing packings;
	
	@Column(name="QUANTITY")
	private int quantity;
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Packing getPacking() {
		return packings;
	}

	public void setPacking(Packing packing) {
		this.packings= packing;
	}
}
