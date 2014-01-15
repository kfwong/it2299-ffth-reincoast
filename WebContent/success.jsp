<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- header.jsp -->
<meta http-equiv="refresh" content="5;URL=GetInboundDeliveryListServlet">
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
	<jsp:param
		value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.css"
		name="css" />
	<jsp:param
		value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2-bootstrap.css"
		name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">

	<div class="row">

		<div class="col-lg-12">
			<h2>success</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Home</li>
			</ol>
			<div class="col-lg-2">
			</div>
			<div class="col-lg-8">
			<div class="jumbotron">
				<h1>congratulations!</h1>
				<p>Your request has been successfully completed.</p>
				<p>You will redirect shortly.</p>
			</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->

<!-- sample-content.jsp -->
<!-- Add row function -->
<script>
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param
		value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js"
		name="js" />
	<jsp:param
		value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js"
		name="js" />
</jsp:include>
<!-- footer.jsp -->