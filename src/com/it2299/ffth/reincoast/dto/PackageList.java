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
public class PackageList {

	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Column(name="PACKAGE_NAME")
	private String packageName;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy="packingList", cascade=CascadeType.ALL)
	private List<PackageListItem> packItem;

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

	public List<PackageListItem> getPackItem() {
		return packItem;
	}

	public void setPackItem(List<PackageListItem> packItem) {
		this.packItem = packItem;
	}
}
