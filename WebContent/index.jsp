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
		
		InboundLineItem item1 = new InboundLineItem();
		item1.setQuantity(5);
		item1.setProduct(product);
		
		InboundLineItem item2 = new InboundLineItem();
		item2.setQuantity(7);
		item2.setProduct(product);
		
		InboundLineItem item3 = new InboundLineItem();
		item3.setQuantity(9);
		item3.setProduct(product);
		
		List<InboundLineItem> items = new ArrayList<InboundLineItem>();
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