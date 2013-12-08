package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Audit;

public class AuditDao extends AbstractDao<Audit> {

	@Override
	public
	Audit get(Integer id) {
		return (Audit) session.get(Audit.class, id);
	}

	@Override
	public
	void saveOrUpdate(Audit audit) {
		session.saveOrUpdate(audit);
	}

	@SuppressWarnings("unchecked")
	@Override
	public
	List<Audit> getAll() {
		return session.createQuery("FROM Audit").list();
	}

	@Override
	public
	Integer countAll() {
		return ((Long) session.createCriteria(Audit.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
	}

	@Override
	public
	void delete(Audit audit) {
		session.delete(audit);
	}

}
