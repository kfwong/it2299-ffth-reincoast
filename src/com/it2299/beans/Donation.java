package com.it2299.beans;

public class Donation {
	private String receiptNo;
	private String Type;
	private String Donor;
	private int itemCode;
	private String itemDescription;
	private int itemQuantity;
	private int unitOfMeasure;
	private int unitPrice;
	public String getReceiptNo() {
		return receiptNo;
	}
	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getDonor() {
		return Donor;
	}
	public void setDonor(String donor) {
		Donor = donor;
	}
	public int getItemCode() {
		return itemCode;
	}
	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	public int getItemQuantity() {
		return itemQuantity;
	}
	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	public int getUnitOfMeasure() {
		return unitOfMeasure;
	}
	public void setUnitOfMeasure(int unitOfMeasure) {
		this.unitOfMeasure = unitOfMeasure;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	

}
