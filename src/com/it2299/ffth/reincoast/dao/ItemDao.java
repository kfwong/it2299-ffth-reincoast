package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Item;

public class ItemDao extends AbstractDao<Item> {

	@Override
	public Item get(Integer id) {
		return (Item) session.get(Item.class, id);
	}

	@Override
	public void saveOrUpdate(Item item) {
		session.saveOrUpdate(item);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getAll() {
		return session.createQuery("FROM Item").list();
	}

	@Override
	public Integer countAll() {
		return ((Long) session.createCriteria(Item.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
	}

	@Override
	public void delete(Item item) {
		session.delete(item);
		
	}

}
