<%@page import="com.it2299.ffth.reincoast.dao.*, com.it2299.ffth.reincoast.dto.*, java.util.*, com.it2299.ffth.reincoast.util.*, org.hibernate.*"%>
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
	
	ProductDao productDao = new ProductDao();
	Product product = productDao.get(1);
	
	Item item1 = new Item();
	item1.setQuantity(5);
	item1.setProduct(product);
	
	Item item2 = new Item();
	item2.setQuantity(7);
	item2.setProduct(product);
	
	Item item3 = new Item();
	item3.setQuantity(9);
	item3.setProduct(product);
	
	List<Item> items = new ArrayList<Item>();
	items.add(item1);
	items.add(item2);
	items.add(item3);
	
	InboundDelivery inboundDelivery = new InboundDelivery();
	inboundDelivery.setDateDelivered(new Date()); // Current time
	inboundDelivery.setItems(items);
	
	InboundDeliveryDao inboundDeliveryDao = new InboundDeliveryDao();
	inboundDeliveryDao.saveOrUpdate(inboundDelivery);
	
	%>
</body>
</html>