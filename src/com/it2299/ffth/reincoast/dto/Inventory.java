package com.it2299.ffth.reincoast.dto;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the inventory database table.
 * 
 */
@Entity
@NamedQuery(name="Inventory.findAll", query="SELECT i FROM Inventory i")
public class Inventory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int itemid;

	private String quantity;

	public Inventory() {
	}

	public int getItemid() {
		return this.itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getQuantity() {
		return this.quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

}