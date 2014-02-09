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
			<h2>Creating Package</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Creating Package</li>
			</ol>
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				Transaction completed successfully. T.Code: 6000864578
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> Create Package
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" id="createPackage" role="form" method="post" action="CreatePackageListServlet">
						
						<div class="form-group">
							<label class="col-lg-2 control-label">Package Name</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="pName" name="packageName" required/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Collection Center</label>
								<div class="col-lg-4">
							<input class="form-control" type="text" id="colCenter" name="colCenter" required/>
								</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Item Search</label>
							<div class="col-lg-4">
								<select class="form-control" id="productName" class="selectedProduct">
									
								</select>
							</div>
							<div class="col-lg-1">
								<button type="button" class="btn btn-xs btn-default" id="addRow">
									<i class="icon-plus"></i> Add row
								</button>
							</div>
						</div>
						<div class="table-responsive" id="tableRec">
							<table
								class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
									<th class="col-lg-1">Item Code <i class="icon-sort"></i></th>
									<th class="col-lg-2">Item Name<i class="icon-sort"></i></th>
									<th class="col-lg-1">Unti Of Measure<i class="icon-sort"></i></th>
									<th class="col-lg-1">Price<i class="icon-sort"></i></th>
								</thead>
								<tbody id="add-list">
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

	var count =0;
	$(document).ready(function() {
		$("#productName").select2({

		});
		getProductName();
						$("#addRow").on('click',
										function() {
											
												if (count ==0) {
													$("#tableRec").append('<input type="submit" />');
													count++;
													getItem();
													$(document).scrollTop($(document).height());
												} else {
													getItem();
													$(document).scrollTop($(document).height());
												}
											
										});
						$("#createPackage").validate();
					});
	
	function getItem() {

		var itemCode = $("#productName option:selected").val();
		
		$.ajax({
					type : "POST",
					url : "GetItemServlet",
					data : {
						itemCode : itemCode
					}
				}).done(
						function(data) {
							var obj = $.parseJSON(data);
							$("#add-list")
									.append(
											'<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code" value="'
													+ obj.id
													+ '" readonly/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-name" value="'
													+ obj.name
													+ '" readonly /></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-unit" value=" '
													+ obj.unit
													+ '" readonly/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-price" value=" '
													+ obj.price
													+ '" readonly/></td></tr>');
						});
	}
	function getProductName(){
		var itemCode = 1;
		$.ajax({	type : "POST",
			url : "GetProductNameServlet",
			data : {
				ItemCode : itemCode
			}
	}).done(function(data){
			$.each($.parseJSON(data), function(){
				$("#productName").append('<option value='+this.id + '>'+ this.name +' </option>');
			});
		});
	}
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->