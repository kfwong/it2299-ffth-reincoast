package com.it2299.ffth.reincoast.dao;

import java.util.List;
import org.hibernate.criterion.Projections;
import com.it2299.ffth.reincoast.dto.InboundTran;

public class InboundTransDao extends AbstractDao<InboundTran> {

	@Override
	InboundTran get(Integer id) {
		return (InboundTran) session.get(InboundTran.class, id);
	}

	@Override
	public void saveOrUpdate(InboundTran t) {
		session.saveOrUpdate(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InboundTran> getAll() {
		return session.createQuery("FROM InboundTrans").list();
	}

	@Override
	public Integer countAll() {
		return ((Long) session.createCriteria(InboundTran.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
	}

	@Override
	public void delete(InboundTran t) {
		session.delete(t);
	}

	



}
