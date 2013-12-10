package com.it2299.ffth.reincoast.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity

@Table(name ="MEMBER") 



public class Member implements Auditable {
	@Id
	@GeneratedValue
	
	@Column(name ="ID")
	private int id;
	
	@Column(name="TYPE")
	private String type;
	
	
	@Column(name="NAME")
	private String name ;
	
	@Column(name="CONTACT_NO")
	private String contactNo;
	
	@Column(name="ADDRESS")
	private String address;
	

	@Column(name="NRIC")
	private String nric;


	
	
	
	
	
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getContactNo() {
		return contactNo;
	}


	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getNric() {
		return nric;
	}


	public void setNric(String nric) {
		this.nric = nric;
	}


	@Override
	public String auditDelete() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String auditUpdate() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String auditSave() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
