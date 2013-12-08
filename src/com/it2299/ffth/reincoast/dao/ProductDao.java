package com.it2299.ffth.reincoast.dao;

import java.util.List;

import org.hibernate.criterion.Projections;

import com.it2299.ffth.reincoast.dto.Product;

/**
 * @author kfwong
 *
 * Implementation of Item Data Access Object.
 * Please make sure you extends AbstractDAO so that we have common interfaces for calling each other's function.
 */
public class ProductDao extends AbstractDao<Product>{
	
	@Override
	public Product get(Integer id) {
		return (Product) session.get(Product.class, id);
	}

	@Override
	public void saveOrUpdate(Product product) {
		session.saveOrUpdate(product);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAll() {
		return session.createQuery("FROM Product").list();
	}

	@Override
	public Integer countAll() {
		return ((Long) session.createCriteria(Product.class).setProjection(Projections.rowCount()).uniqueResult()).intValue();
	}

	@Override
	public void delete(Product product) {
		session.delete(product);
	}
}
