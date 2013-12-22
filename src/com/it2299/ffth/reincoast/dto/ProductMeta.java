package com.it2299.ffth.reincoast.dto;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.envers.Audited;

@Entity
@Audited
@Table(name="PRODUCT_META")
public class ProductMeta {
	
	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Column (name="META_KEY")
	private String metaKey;
	
	@Column (name="META_VALUE")
	private String metaValue;
	
	@ManyToOne
	@JoinColumn(name="PRODUCT_ID")
	private Product product;
	
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
	public String getMetaKey() {
		return metaKey;
	}
	public void setMetaKey(String metaKey) {
		this.metaKey = metaKey;
	}
	public String getMetaValue() {
		return metaValue;
	}
	public void setMetaValue(String metaValue) {
		this.metaValue = metaValue;
	}
	
}
