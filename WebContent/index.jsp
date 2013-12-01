<%@page import="com.it2299.ffth.reincoast.dao.*, com.it2299.ffth.reincoast.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello Hibernate!</h1>
	<%
	// 1. Instantiate & Initialize objects
	Item item1 = new Item();
	item1.setName("First Item");
	
	Item item2 = new Item();
	item2.setName("Second Item");
	
	Item item3 = new Item();
	item3.setName("Third Item");
	
	// 2. Create a itemDAO
	ItemDao itemDao = new ItemDao();
	
	// 3. Open a session
	itemDao.openSession();
	
	// 4. Begin transaction
	itemDao.getSession().beginTransaction();
	
	// 5. Do the required DB operations
	itemDao.save(item1); // Persist object. Inserting record in this case (without id).
	itemDao.save(item2);
	itemDao.save(item3);
	
	itemDao.delete(item2); // Remove object from DB.
	
	for(Item item : itemDao.getAll()){ // Retrieve list of Item and display details
		out.println(item.getId() + ": "+ item.getName());
	}
	
	// 6. Commit the transaction
	itemDao.getSession().getTransaction().commit();
	
	// 7. Close the session
	itemDao.closeSession();
	
	%>
</body>
</html>