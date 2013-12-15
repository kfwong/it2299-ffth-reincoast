package com.it2299.ffth.reincoast.interceptor;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;



import com.it2299.ffth.reincoast.dao.AuditDeliveryDao;
import com.it2299.ffth.reincoast.dto.AuditDelivery;
import com.it2299.ffth.reincoast.dto.Auditable;

public class AuditDeliveryInterceptor extends EmptyInterceptor {
	private static final long serialVersionUID = 1L;

	@Override
	public void onDelete(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
		if(entity instanceof Auditable){
			AuditDelivery audit = new AuditDelivery();
			audit.setDateAudited(new Date());
			audit.setDescription(((Auditable) entity).auditDelete());
			audit.setMovementType("Delete");
			
			AuditDeliveryDao auditDao = new AuditDeliveryDao();
			auditDao.delete(audit);
			
		}
	
	}
	
	@Override
	public boolean onFlushDirty(Object entity, Serializable id, Object[] currentState, Object[] previousState, String[] propertyNames, Type[] types) {
		
		if(entity instanceof Auditable){
			AuditDelivery audit = new AuditDelivery();
			audit.setDateAudited(new Date());
			audit.setDescription(((Auditable) entity).auditUpdate());
			audit.setMovementType("Update");
			
			AuditDeliveryDao auditDao = new AuditDeliveryDao();
			auditDao.saveOrUpdate(audit);
			
			return true;
		}
		
		return false;
	}
	
	public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
		if(entity instanceof Auditable){
			AuditDelivery audit = new AuditDelivery();
			audit.setDateAudited(new Date());
			audit.setDescription(((Auditable) entity).auditSave());
			audit.setMovementType("Insert");
			
			AuditDeliveryDao auditDao = new AuditDeliveryDao();
			auditDao.saveOrUpdate(audit);
			
			return true;
		}
		
		return false;
	}

}
