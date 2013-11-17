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
	<h1>Sponsors <small>Add new sponsor</small></h1>

	<form>
		<div class="form-group">
			<label>Name</label> <input type="text" class="form-control">
		</div>
		<div class="form-group">
			<label>Company</label> <input type="text" class="form-control">
		</div>
		<div class="form-group">
			<label>Contact Number</label> <input type="text" class="form-control">
		</div>
		<div class="form-group">
			<label>Email</label> <input type="email" class="form-control">
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
		<button type="reset" class="btn btn-default">Reset</button>
	</form>

</div>
<!-- /content -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->