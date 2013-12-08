package com.it2299.ffth.reincoast.dao;

import java.util.List;
import org.hibernate.criterion.Projections;
import com.it2299.ffth.reincoast.dto.InboundItem;

public class InboundItemDao extends AbstractDao<InboundItem> {

	@Override
	public InboundItem get(Integer id) {
		// TODO Auto-generated method stub
		return (InboundItem) session.get(InboundItem.class, id);
	}

	@Override
	public void saveOrUpdate(InboundItem t) {
		session.saveOrUpdate(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<InboundItem> getAll() {
		// TODO Auto-generated method stub
		return session.createQuery("FROM InboundItem").list();
	}

	@Override
	public Integer countAll() {
		// TODO Auto-generated method stub
		return ((Long) session.createCriteria(InboundItem.class)
				.setProjection(Projections.rowCount()).uniqueResult())
				.intValue();
	}

	@Override
	public void delete(InboundItem t) {
		// TODO Auto-generated method stub
		session.delete(t);
	}

}
