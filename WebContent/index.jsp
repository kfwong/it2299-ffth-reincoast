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
	MemberDao memberDao = new MemberDao();
	//Member member = memberDao.get(1);
	Member member1 = memberDao.getByUsername("James");
	
	%>
	
	<%=member1.getNric() %>
	<% %>
	
</body>
</html>