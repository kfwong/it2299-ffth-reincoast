package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.InboundTrans;
import com.it2299.ffth.reincoast.dto.Product;

public class InboundTransDao extends AbstractDao<InboundTrans> {

	@Override
	InboundTrans get(Integer id) {
		return (InboundTrans) session.get(InboundTrans.class, id);
	}

	@Override
	public void saveOrUpdate(InboundTrans t) {
		session.saveOrUpdate(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InboundTrans> getAll() {
		return session.createQuery("FROM InboundTrans").list();
	}

	@Override
	public Integer countAll() {
		return ((Long) session.createCriteria(InboundTrans.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
	}

	@Override
	public void delete(InboundTrans t) {
		session.delete(t);
	}



}
