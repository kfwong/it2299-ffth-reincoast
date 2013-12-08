package com.it2299.ffth.reincoast.dto;

public interface Auditable {
	public String auditDelete();
	public String auditUpdate();
	public String auditSave();
}
