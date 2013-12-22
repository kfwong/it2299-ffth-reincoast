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
	
	
	/*
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
	*/
	
	/*Member member1 = new Member();
	member1.setName("admin");
	member1.setNric("SXXXXXXXXA");
	member1.setType("admin");
	member1.setUserName("admin");
	member1.setPassword("1");
	member1.setContactNo(62597176);
	
	Member member2 = new Member();	
	member2.setName("volunteer");
	member2.setNric("SXXXXXXXXA");
	member2.setType("volunteer");
	member2.setUserName("volunteer");
	member2.setPassword("2");
	member2.setContactNo(62597176);
	*/
	
	
	
	MemberDao memberDao = new MemberDao();
	//memberDao.saveOrUpdate(member1);
	//memberDao.saveOrUpdate(member2);

	Member member = memberDao.get(1);
	
	
	%>
	
	<%=member.getName() %>
</body>
</html>