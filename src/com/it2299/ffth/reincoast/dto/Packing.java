package com.it2299.ffth.reincoast.dto;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PACKING_LIST")
public class Packing {

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Column(name="PACKAGE_NAME")
	private String packageName;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy="packings" ,cascade=CascadeType.ALL)
	private List<PackingLineItem> packItem;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public List<PackingLineItem> getPackItem() {
		return packItem;
	}

	public void setPackItem(List<PackingLineItem> packItem) {
		this.packItem = packItem;
	}
}
