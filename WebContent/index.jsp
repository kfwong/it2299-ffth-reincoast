<%@page import="com.it2299.ffth.reincoast.dao.*, com.it2299.ffth.reincoast.dto.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello Hibernate!</h1>
	<%
	// One to One
	/*
	ProductDao productDao = new ProductDao();
	productDao.openSession();
	Product product = productDao.get(6);
	productDao.closeSession();
	
	Item item = new Item();
	item.setQuantity(5);
	item.setProduct(product);
	
	ItemDao itemDao = new ItemDao();
	itemDao.openSession();
	itemDao.getSession().beginTransaction();
	itemDao.saveOrUpdate(item);
	itemDao.getSession().getTransaction().commit();
	itemDao.closeSession();
	*/
	
	// One to Many	
	InboundDelivery inboundDelivery = new InboundDelivery();
	inboundDelivery.setDateDelivered(new Date()); // Current time
	InboundDeliveryDao inboundDeliveryDao = new InboundDeliveryDao();
	inboundDeliveryDao.openSession();
	inboundDeliveryDao.getSession().beginTransaction();
	inboundDeliveryDao.saveOrUpdate(inboundDelivery);
	inboundDeliveryDao.getSession().getTransaction().commit();
	inboundDeliveryDao.closeSession();
	
	ProductDao productDao = new ProductDao();
	productDao.openSession();
	Product product1 = productDao.get(6);
	Product product2 = productDao.get(2);
	Product product3 = productDao.get(4);
	productDao.closeSession();
	
	ItemDao itemDao = new ItemDao();
	itemDao.openSession();
	itemDao.getSession().beginTransaction();
	Item item1 = new Item();
	item1.setQuantity(5);
	item1.setProduct(product1);
	item1.setInboundDelivery(inboundDelivery);
	itemDao.saveOrUpdate(item1);
	
	Item item2 = new Item();
	item2.setQuantity(7);
	item2.setProduct(product2);
	item2.setInboundDelivery(inboundDelivery);
	itemDao.saveOrUpdate(item2);
	
	Item item3 = new Item();
	item3.setQuantity(9);
	item3.setProduct(product3);
	item3.setInboundDelivery(inboundDelivery);
	itemDao.saveOrUpdate(item3);
	itemDao.getSession().getTransaction().commit();
	itemDao.closeSession();

	%>
</body>
</html>