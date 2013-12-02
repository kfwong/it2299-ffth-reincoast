package com.it2299.ffth.reincoast.dto;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Embeddable
public class ProductMeta {
		
	@Column (name="META_KEY")
	private String metaKey;
	
	@Column (name="META_VALUE")
	private String metaValue;
	
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
