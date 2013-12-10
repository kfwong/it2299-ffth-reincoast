package com.it2299.ffth.reincoast.interceptor;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;

import com.it2299.ffth.reincoast.dao.AuditDao;
import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.Auditable;

public class AuditInterceptor extends EmptyInterceptor {
	private static final long serialVersionUID = 1L;

	@Override
	public void onDelete(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
		if(entity instanceof Auditable){
			Audit audit = new Audit();
			audit.setDateAudited(new Date());
			audit.setDescription(((Auditable) entity).auditDelete());
			audit.setMovementType("Delete");
			
			AuditDao auditDao = new AuditDao();
			auditDao.delete(audit);
			
		}
	}
	
	@Override
	public boolean onFlushDirty(Object entity, Serializable id, Object[] currentState, Object[] previousState, String[] propertyNames, Type[] types) {
		
		if(entity instanceof Auditable){
			Audit audit = new Audit();
			audit.setDateAudited(new Date());
			audit.setDescription(((Auditable) entity).auditUpdate());
			audit.setMovementType("Update");
			
			AuditDao auditDao = new AuditDao();
			auditDao.saveOrUpdate(audit);
			
			return true;
		}
		
		return false;
	}

	public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
		if(entity instanceof Auditable){
			Audit audit = new Audit();
			audit.setDateAudited(new Date());
			audit.setDescription(((Auditable) entity).auditSave());
			audit.setMovementType("Insert");
			
			AuditDao auditDao = new AuditDao();
			auditDao.saveOrUpdate(audit);
			
			return true;
		}
		
		return false;
	}

}
