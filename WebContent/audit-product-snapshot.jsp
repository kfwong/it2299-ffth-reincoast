<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2-bootstrap.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.3/morris.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp">
	<jsp:param value="Audit" name="active" />
</jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">
	<form method="post" action="ProductRegistrationServlet" role="form">
		<input type="hidden" name="p_id" value="${product.id}"/>
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header">
					<h1>
						Product Snapshot <small>${audit_date}</small>
					</h1>
				</div>
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-briefcase"></i> Product Management</li>
					<li class="active">View Product</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-7">
				<div id="jspdf-p-primary-details" class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Primary Details</label>
						</h4>
						<p>General information about this product.</p>
						<div class="row">
							<div class="col-lg-9">
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Name</label>	
										</div>
										<div class="col-lg-9">
											<small>${product.name}</small>
										</div>
									</div>
								</div>
		
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Description</label>
										</div>
										<div class="col-lg-9">
											<small>${product.description}</small>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Code</label>
										</div>
										<div class="col-lg-9">
											<small>${product.code}</small>
										</div>
									</div>
								</div>
		
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Unit of Measure</label>
										</div>
										<div class="col-lg-9">							 
											<small>${product.unitOfMeasure}</small>
										</div>
									</div>
								</div>
		
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Price</label>
										</div>
										<div class="col-lg-9">
											<small>${product.price}</small>	
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Weight</label>
										</div>
										<div class="col-lg-9">
											<small>${product.weight}</small>	
										</div> 
									</div>
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-lg-3">
											<label>Category</label>
										</div>
										<div class="col-lg-9">
											<c:set var="categories" value="${fn:split(product.category, ',')}" />
										    <c:forEach items="${categories}" var="category">
										    	<span class="badge">${category }</span>
										    </c:forEach>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div style="width:160px;height:160px;">
												<a href="#" class="thumbnail">
											      <img id="p_image" src="${product.imageUrl}">
											    </a>
											</div>	
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body" style="padding-bottom:0px;">
						<h4>
							<label>Additional Data</label>
						</h4>
						<p>User defined data, key & value pairs that belongs to this product.</p>
					</div>
					<table id="jspdf-p-meta-fields" class="table" style="border:none;background-color:rgb(245, 245, 245);">
						<thead>
							<tr>
								<th>Key</th>
								<th>Value</th>
							</tr>
						</thead>
						<tbody id="p_meta_fields">
							<c:if test="${empty product.productMetas}">
								<tr><td colspan="2">No records found.</td></tr>
							</c:if>
							<c:forEach items="${product.productMetas}" var="productMeta">
								<tr>
									<td class="col-sm-3" style="border:none;"><strong>${productMeta.metaKey}</strong></td>
									<td style="border:none;">${productMeta.metaValue}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Stock Status</label>
						</h4>
						<span>Stock status as per current snapshot.</span>
					</div>
					<table class="table ">
						<tbody>
							<tr>
								<td class="col-lg-4">Available</td>
								<td>${product.quantity }</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</form>	
</div>
	<!-- sample-content.jsp -->
	<script>

	</script>
	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.min.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->