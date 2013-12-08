<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" name="css" />
	<jsp:param value="http://cdn.oesmith.co.uk/morris-0.4.3.min.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">
	<form method="post" action="/it2299-ffth-reincoast/ProductRegistrationServlet" role="form">
		<input type="hidden" name="p_id" value="${product.id}"/>
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header">
					<h1>
						Product <small>Add New</small>
					</h1>
				</div>
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-edit"></i> Register New Product</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-7">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Primary Details</label>
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<button id="p_action" type="submit" class="btn btn-xs btn-default" name="p_action" value="Update">
										<i class="glyphicon glyphicon-ok"></i> Update
									</button>
								</div>
							</div>
						</h4>
						<div class="form-group">
							<label class="control-label">Name</label> <input class="form-control input-sm" name="p_name" value="${product.name}">
							<p class="help-block">The display name of the item.</p>
						</div>

						<div class="form-group">
							<label>Description</label>
							<textarea class="form-control input-sm" rows="3" name="p_description">${product.description}</textarea>
							<p class="help-block">The short description of the item.</p>
						</div>
						<div class="form-group">
							<label class="control-label">Code</label> <input class="form-control input-sm" name="p_code" value="${product.code}">
							<p class="help-block">i.e. Barcode</p>
						</div>

						<div class="form-group">
							<label class="control-label">SKU</label> <input class="form-control input-sm" name="p_sku" value="${product.sku}">
							<p class="help-block">The stock keeping unit number.</p>
						</div>
						<div class="form-group">
							<label>Unit of Measure</label> <input class="form-control input-sm" name="p_unit_of_measure" value="${product.unitOfMeasure}">
						</div>

						<div class="form-group">
							<label>Price</label> <input class="form-control input-sm" name="p_price" value="${product.price}">
							<p class="help-block">In Singapore Dollar (SGD).</p>
						</div>
						<div class="form-group">
							<label>Weight</label> <input class="form-control input-sm" name="p_weight" value="${product.weight}">
							<p class="help-block">In grams (G)</p>
						</div>
						<div class="form-group">
							<label>Category</label> <input class="form-control input-sm" name="p_category" value="${product.category}">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Image</label>
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<button type="button" class="btn btn-xs btn-default">
										<i class="glyphicon glyphicon-hdd"></i> Browse
									</button>
								</div>
							</div>
						</h4>
						<div class="row">
							<div class="col-lg-7">
								<p>Upload an image of this product.</p>
								<small>
									<ul>
										<li>Recommend dimension is 160x160px.</li>
										<li>Bigger image will be cropped.</li>
									</ul>
								</small>
							</div>
							<div class="col-lg-5">
								<div style="width:160px;height:160px;">
									<a href="#" class="thumbnail">
								      <img id="p_image" src="http://placehold.it/160x160">
								    </a>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Additional Data</label>
						</h4>
						<span>Customize your data by adding more fields to the form.</span>
					</div>
					<table class="table">
						<tbody>
							<c:forEach items="${product.productMetas}" var="productMeta">
								<tr>
									<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key" value="${productMeta.metaKey}"></td>
									<td><input class="form-control input-sm" placeholder="value" name="p_meta_value" value="${productMeta.metaValue}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="panel-footer">
						<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
							<div class="btn-group">
								<button type="button" class="btn btn-xs btn-default">
									<i class="icon-plus"></i> Add field
								</button>
							</div>
						</div>
						&nbsp;
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- sample-content.jsp -->

	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="/path/to/js1" name="js" />
	</jsp:include>
	<!-- footer.jsp -->