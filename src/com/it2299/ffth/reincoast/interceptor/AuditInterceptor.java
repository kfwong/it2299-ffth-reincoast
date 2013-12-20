package com.it2299.ffth.reincoast.interceptor;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;

import com.it2299.ffth.reincoast.dao.AuditDao;
import com.it2299.ffth.reincoast.dao.AuditDeliveryDao;
import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.AuditDelivery;
import com.it2299.ffth.reincoast.dto.Auditable;
import com.it2299.ffth.reincoast.dto.InboundDelivery;

public class AuditInterceptor extends EmptyInterceptor {
	private static final long serialVersionUID = 1L;
	private List<Auditable> auditSaves = new ArrayList<Auditable>();

	@Override
	public void onDelete(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
		if(entity instanceof Auditable){
			Audit audit = new Audit();
			audit.setDateAudited(new Date());
			audit.setDescription(((Auditable) entity).auditDelete());
			audit.setMovementType("Delete");
			
			AuditDao auditDao = new AuditDao();
			auditDao.saveOrUpdate(audit);
			
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

	@Override
	public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
		if(entity instanceof Auditable){
			
			auditSaves.add((Auditable)entity);
			
			return true;
		}
		
		return false;
	}
	
	@Override
	public void postFlush(Iterator entities){
		for(Auditable auditSave : auditSaves){
			if(auditSave instanceof InboundDelivery){
				AuditDelivery audit = new AuditDelivery();
				audit.setDateAudited(new Date());
				audit.setDescription("Inbound Delivery " + auditSave.getId() + "is created");
				audit.setMovementType("Insert");
				audit.setInboundDelivery((InboundDelivery) auditSave);
				
				AuditDeliveryDao auditDao = new AuditDeliveryDao();
				auditDao.saveOrUpdate(audit);
				
				System.out.println(auditSave.getId());
				System.out.println(((InboundDelivery) auditSave).getDonorName());
			}
			
			
		}
		auditSaves.clear();
	}

}
