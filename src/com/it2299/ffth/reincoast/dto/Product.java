package com.it2299.ffth.reincoast.dto;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.hibernate.envers.Audited;
import org.hibernate.envers.NotAudited;

/**
 * @author kfwong
 * 
 *         There's no need for you to create any tables in your database, except
 *         an empty database itself. Once the entity class is properly
 *         annotated, Hibernate will execute appropriate query to persist the
 *         object and DB. Same as classes, you have to import the respective
 *         packages after you write the annotations. Import from
 *         javax.persistence package whenever you can. Certain extra features
 *         implemented by Hibernate will require you to import from
 *         org.hibernate package.
 */
@Entity
@Audited
// Declare this class as entity so that Hibernate will know this is to be taken
// care of. Mapping configuration required in hibernate.cfg.xml.
@Table(name = "PRODUCT")
// The table name that will be created upon persistence.
public class Product implements Auditable {

	@Id
	// Declare this attribute as primary key
	@GeneratedValue
	// Auto-increment value. Generated by Hibernate.
	@Column(name = "ID")
	// The corresponding column name in the table.
	private int id;

	@Column(name = "CODE")
	private String code;

	@Column(name = "NAME")
	private String name;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "UNIT_OF_MEASURE")
	private String unitOfMeasure;

	@Column(name = "PRICE")
	private double price;

	@Column(name = "WEIGHT")
	private double weight;

	@Column(name = "CATEGORY")
	private String category;

	@Column(name = "STATUS")
	private String status;

	@Column(name = "DATE_REGISTERED")
	private Date dateRegistered;

	@Column(name = "REGISTERED_BY")
	private String registeredBy;

	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, mappedBy="product")
	private List<ProductMeta> productMetas;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUnitOfMeasure() {
		return unitOfMeasure;
	}

	public void setUnitOfMeasure(String unitOfMeasure) {
		this.unitOfMeasure = unitOfMeasure;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDateRegistered() {
		return dateRegistered;
	}

	public void setDateRegistered(Date dateRegistered) {
		this.dateRegistered = dateRegistered;
	}

	public String getRegisteredBy() {
		return registeredBy;
	}

	public void setRegisteredBy(String registeredBy) {
		this.registeredBy = registeredBy;
	}

	public List<ProductMeta> getProductMetas() {
		return productMetas;
	}

	public void setProductMetas(List<ProductMeta> productMetas) {
		this.productMetas = productMetas;
	}

	@Override
	public String auditDelete() {
		return "Product " + name + " is deleted.";
	}

	@Override
	public String auditUpdate() {
		return "Product " + name + " is updated.";
	}

	@Override
	public String auditSave() {
		return "Product " + id + " is created.";
	}

}
