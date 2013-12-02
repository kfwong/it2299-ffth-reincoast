<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="css/contacts.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- content -->
<div id="page-wrapper">
	<h1>Contacts <small>Donors - Individual</small></h1>

	<form method="post" action="contacts-donors-individual.jsp" class="edit-button">
		<div class="form-group">
			<button type="submit" class="pull-right btn btn-default">Save</button>
		</div>
		<div class="clearfix"></div>
	</form>

	<table class="table table-hover table-striped table-bordered">
	<tr>
		<th class="table-column-name">Name</th>
		<th class="table-column-address">Address</th>
		<th class="table-column-number">Contact Number</th>
		<th class="table-column-email">Email</th>
	</tr>
	<tr>
		<td class="table-column-name"><input type="text" class="form-control" value="John Smith"></td>
		<td class="table-column-address"><input type="text" class="form-control" value="BLK 123 Choa Chu Kang Avenue 3 Singapore 670123"></td>
		<td class="table-column-number"><input type="text" class="form-control" value="91234567"></td>
		<td class="table-column-email"><input type="text" class="form-control" value="johnsmith@gmail.com"></td>
	</tr>
	
	<tr>
		<td class="table-column-name"><input type="text" class="form-control" value="John Smith"></td>
		<td class="table-column-address"><input type="text" class="form-control" value="BLK 123 Choa Chu Kang Avenue 3 Singapore 670123"></td>
		<td class="table-column-number"><input type="text" class="form-control" value="91234567"></td>
		<td class="table-column-email"><input type="text" class="form-control" value="johnsmith@gmail.com"></td>
	</tr>
	
	<tr>
		<td class="table-column-name"><input type="text" class="form-control" value="John Smith"></td>
		<td class="table-column-address"><input type="text" class="form-control" value="BLK 123 Choa Chu Kang Avenue 3 Singapore 670123"></td>
		<td class="table-column-number"><input type="text" class="form-control" value="91234567"></td>
		<td class="table-column-email"><input type="text" class="form-control" value="johnsmith@gmail.com"></td>
	</tr>
	
	<tr>
		<td class="table-column-name"><input type="text" class="form-control" value="John Smith"></td>
		<td class="table-column-address"><input type="text" class="form-control" value="BLK 123 Choa Chu Kang Avenue 3 Singapore 670123"></td>
		<td class="table-column-number"><input type="text" class="form-control" value="91234567"></td>
		<td class="table-column-email"><input type="text" class="form-control" value="johnsmith@gmail.com"></td>
	</tr>
	
	<tr>
		<td class="table-column-name"><input type="text" class="form-control" value="John Smith"></td>
		<td class="table-column-address"><input type="text" class="form-control" value="BLK 123 Choa Chu Kang Avenue 3 Singapore 670123"></td>
		<td class="table-column-number"><input type="text" class="form-control" value="91234567"></td>
		<td class="table-column-email"><input type="text" class="form-control" value="johnsmith@gmail.com"></td>
	</tr>
	
	<tr>
		<td class="table-column-name"><input type="text" class="form-control" value="John Smith"></td>
		<td class="table-column-address"><input type="text" class="form-control" value="BLK 123 Choa Chu Kang Avenue 3 Singapore 670123"></td>
		<td class="table-column-number"><input type="text" class="form-control" value="91234567"></td>
		<td class="table-column-email"><input type="text" class="form-control" value="johnsmith@gmail.com"></td>
	</tr>
	
	</table>

</div>
<!-- /content -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->