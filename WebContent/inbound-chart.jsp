<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2-bootstrap.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">

	<div class="row">
		<div class="col-lg-12">
			<h2>Inbound Delivery</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Home</li>
			</ol>
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> inbound
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" method="post" action="InBoundServlet">
						
						<div class="well well-lg"></div>
						<div class="col-lg-12">
						<div class="col-lg-8">
						<div class="col-lg-4">
								<input class="form-control datepicker" type="text" name="date1" readonly />
							</div>
							<div class="col-sm-1">
							to
							</div>
							<div class="col-lg-4">
							<input class="form-control datepicker" type="text" name="date2" readonly />
							</div>
							
							<button type="button" class="btn btn-xs btn-default" id="getChart">
								Generate Chart
							</button>
							</div>
							</div>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->

<!-- sample-content.jsp -->
<!-- Add row function -->
<script>
	$(document).ready(function(){
		$( ".datepicker" ).datepicker();
	});
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->