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
			<h2>Item List</h2>
			<ol class="breadcrumb">
				<li><i class="icon-dashboard"></i>Home</li>
				<li>Delivery</li>
				<li>Food Drive</li>
				<li class="active">Item List</li>
			</ol>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> Metadata
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" >

						<div class="table-responsive" id="tableRec">
							<table class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
										
										<th class="col-lg-2">Product Name<i class="icon-sort"></i></th>
										<th class="col-lg-2">Unti of Measure<i class="icon-sort"></i></th>
										<th class="col-lg-1">Quantity<i class="icon-sort"></i></th>
										<th class="col-lg-2">Expiry Date<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">
									
									<c:forEach items="${itemList}" var="item">
										<tr>
											<td>
												${item.product.name}
											</td>
											<td>
												${item.product.unitOfMeasure}
											</td>
											<td>
												${item.quantity}
											</td>
											<td>
												${item.expiryDate}
											</td>
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