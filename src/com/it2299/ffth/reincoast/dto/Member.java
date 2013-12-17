package com.it2299.ffth.reincoast.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MEMBER")
public class Member implements Auditable {
	@Id
	@GeneratedValue
	@Column(name = "ID")
	private int id;

	@Column(name = "NRIC")
	private String nric;

	@Column(name = "TYPE")
	private String type;

	@Column(name = "USERNAME")
	private String userName;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "NAME")
	private String name;

	@Column(name = "CONTACT_NO")
	private String contactNo;

	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNric() {
		return nric;
	}

	public void setNric(String nric) {
		this.nric = nric;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getUsername() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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



	public String getUserName() {
		return userName;
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
