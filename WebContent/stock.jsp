<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
<div id="page-wrapper">

	<div class="row">
		<div class="col-lg-12">
			<h2>Stock</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i>Stock</li>
			</ol>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> Stock
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" method="post"
						action="/it2299-ffth-reincoast/InBoundServlet">
						
						
						<div class="table-responsive" id="tableRec">
							<table
								class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
									<th class="col-lg-1">Product ID<i class="icon-sort"></i></th>
									<th class="col-lg-2">Product Name<i class="icon-sort"></i></th>
									<th class="col-lg-1">Product Quantity<i class="icon-sort"></i></th>
									<th class="col-lg-1">Product value<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">
								<c:forEach items="${stockList}" var="item">
									<tr>
										<td>${item.product.id}</td>
										<td>${item.product.name}</td>
										<td>${item.quantity}</td>
										<td>${item.product.price}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
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
	
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->