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
	<form class="form-signin" role="form">
		<h2> SIGN UP</h2>
		<input type="text" class="form-control" placeholder="User Name" required autofocus>
		<input type="password" class="form-control" placeholder="Password" required autofocus>
		<button class="btn-lg btn-primary btn-block" type="submit"> SIGN IN </button>
	
	</form>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->