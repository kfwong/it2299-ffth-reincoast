<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper"></div>
<!-- sample-content.jsp -->
	<div id="col-lg-12 row"> 
	
	
	
	</div>

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->