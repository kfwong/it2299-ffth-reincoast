<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div class="page-header">
				<h1>
					Item Database
				</h1>
			</div>
			<ol class="breadcrumb">
				<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
				<li class="active"><i class="icon-edit"></i> Item Database</li>
			</ol>
			<div class="table-responsive">
				<table class="table table-hover table-striped tablesorter">
					<thead>
						<tr>
							<th>Code <i class="icon-sort"></i></th>
							<th>Name <i class="icon-sort"></i></th>
							<th>Weight <i class="icon-sort"></i></th>
							<th>UoM <i class="icon-sort"></i></th>
							<th>Category <i class="icon-sort"></i></th>
							<th>Status <i class="icon-sort"></i></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="product">
								<tr>
									<td class="col-lg-1"><small>${product.code}</small></td>
									<td class="col-lg-6"><small>${product.name}</small></td>
									<td class="col-lg-1"><small>${product.weight}</small></td>
									<td class="col-lg-1"><small>${product.unitOfMeasure}</small></td>
									<td class="col-lg-2"><small>${product.category}</small></td>
									<td class="col-lg-1"><small>${product.status}</small></td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	<!-- /.row -->
</div>
<!-- sample-content.jsp -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->