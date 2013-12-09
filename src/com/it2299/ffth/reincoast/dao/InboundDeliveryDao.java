package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.InboundDelivery;

public class InboundDeliveryDao extends AbstractDao<InboundDelivery> {

	@Override
	public InboundDelivery get(Integer id) {
		return (InboundDelivery) session.get(InboundDelivery.class, id);
	}

	@Override
	public void saveOrUpdate(InboundDelivery inboundDelivery) {
		session.saveOrUpdate(inboundDelivery);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InboundDelivery> getAll() {
		return session.createQuery("FROM InboundDelivery").list();
	}

	@Override
	public Integer countAll() {
		return ((Long) session.createCriteria(InboundDelivery.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
	}

	@Override
	public void delete(InboundDelivery inboundDelivery) {
		session.delete(inboundDelivery);
	}

}
