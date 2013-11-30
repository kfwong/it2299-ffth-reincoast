<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- content -->
<div id="page-wrapper">
	<h1>Contacts <small>Donors - Individual</small></h1>

	<form method="post" action="contacts-donors-individual-edit.jsp" style="padding-bottom:10px">
		<div class="form-group">
			<button type="submit" class="pull-right btn btn-default">Add / Edit</button>
		</div>
		<div class="clearfix"></div>
	</form>

	<table class="table table-hover table-striped table-bordered">
	<tr>
		<th>Name</th>
		<th>Address</th>
		<th>Contact Number</th>
		<th>Email</th>
	</tr>
	<tr>
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr>
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr>
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr>
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr>
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	<tr>
		<td>John Smith</td>
		<td>BLK 123 Choa Chu Kang Avenue 3 Singapore 670123</td>
		<td>91234567</td>
		<td>johnsmith@gmail.com</td>
	</tr>
	
	</table>

</div>
<!-- /content -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->