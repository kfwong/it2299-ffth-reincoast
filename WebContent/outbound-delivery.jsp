<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2-bootstrap.css" name="css" />
	<jsp:param value="http://jquery.bassistance.de/validate/demo/site-demos.css" name="css" />
</jsp:include>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">

	<div class="row">
		<div class="col-lg-12">
			<h2>Outbound Delivery</h2>
			<ol class="breadcrumb">
				<li class="active"><i class="icon-dashboard"></i> Outbound
					Delivery</li>
			</ol>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> Food Drive (Outbound)
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" id="outbound-form" role="form" method="post" action="OutboundServlet">
						<div class="form-group">
							<label class="col-lg-1 control-label">DeliveryDate</label>
							<div class="col-lg-4">
							<div class="input-group input-group-sm">
							<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input class="form-control datepicker" type="text" name="deliveryDate" readonly required/>
							</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-1 control-label">Collection Center</label>
								<div class="col-lg-4">
							<select class="form-control" id="collect" class="colCenter" name="collectLoc"required>
									<option value="">Please select an Location</option>
								</select>
								</div>
						</div>									
						<div class="form-group">
							<label class="col-lg-1 control-label">PackageType</label>
								<div class="col-lg-4">
								<select class="form-control" id="PackageType" name=Type>
								</select>
								</div>	
								<button type="button" class="btn btn-xs btn-default" id="addPackage">
									<i class="icon-plus"></i> AddItemList
								</button>
								
							</div>
						<div class="form-group">
							<label class="col-lg-1 control-label">ItemSearch</label>
							<div class="col-lg-4">
								<select class="form-control" id="productName" class="selectedProduct">
									
								</select>
							</div>				
								<button type="button" class="btn btn-xs btn-default" id="addItem">
									<i class="icon-plus"></i> AddItem
								</button>
						</div>	
						<div class="table-responsive" id="tableRec">
							<table
								class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
										<th class="col-lg-1">Item Code <i class="icon-sort"></i></th>
										<th class="col-lg-2">Item Name<i class="icon-sort"></i></th>
										<th class="col-lg-1">Recommend Product Expiry Date<i class="icon-sort"></i></th>
										<th class="col-lg-1">Quantity<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">
								</tbody>
							</table>
						</div>
					
					<div id="notice">
						<div class="alert alert-success alert-dismissable">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							Please add Product
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
	var count = 0;

	$(document).ready(function() {
		getDate();
		
		$("#PackageType").select2({

		});
		getPackageName();
		$("#productName").select2({

		});
		$("#collect").select2({

		});
		getProductName();
		getPackageName();
		getCollectionCenter();
		$("#addItem").on('click', function() {
			
				if (count == 0) {
					$("#notice").remove();
					$("#tableRec").append('<input type="submit" />');
					getItem();
					count++;
					$(document).scrollTop($(document).height());
				} else {
					getItem();
					count++;
					$(document).scrollTop($(document).height());
				}
				
		});
		$("#addPackage").on('click', function() {
			if (count == 0) {
				$("#notice").remove();
				$("#tableRec").append('<input type="submit" />');
				count++;
				getPackageItem();
				$(document).scrollTop($(document).height());
			} else {
				count++;
				getPackageItem();
				$(document).scrollTop($(document).height());
			}

		});
		jQuery.validator.setDefaults({
			  debug: false,
			  success: "valid"
			});
		
			$("#outbound-form").validate({
			  rules: {
				  ExpiryDate: {
			      required: true
			    }
			  }
			});
		
		
	});
	function getPackageItem() {
		var packID = $("#PackageType option:selected").val();
		$.ajax({
					type : "POST",
					url : "GetPackageListItem",
					data : {
						packID : packID
					}
				}).done(function(data) {
							$.each($.parseJSON(data),function() {
												$("#add-list").append('<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code" value="'
														+ this.id
														+ '" readonly/></td><td>'
														+ this.name
														+ '</td><td class="expiry-date"><select class="form-control"  id="ExpiryDate" name="ExpiryDate" required><option value="" selected></option></select></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-quantity" value="'
														+ '" required/></td></tr>');
												getExpiryList();
											});
						});

	}
	
	function getItem() {

		var itemCode = $('#productName :selected').val();

		$.ajax({
					type : "POST",
					url : "GetItemServlet",
					data : {
						itemCode : itemCode
					}
				}).done(
						function(data) {
							var obj = $.parseJSON(data);
							$("#add-list").append(
											'<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code" value="'
													+ obj.id
													+ '" readonly/></td><td>'
													+ obj.name
													+ '</td><td class="expiry-date"><select class="form-control"  id="ExpiryDate" name="ExpiryDate" required><option value="" selected></option></select></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-quantity" value="'
													+ '" required/></td></tr>');
							getExpiryList();
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
	
	function getExpiryList(){
		var itemCode = $('#productName :selected').val();
		
		$.ajax({
			type:"POST",
			url: "GetProductExpiryListServlet",
			data: {
				itemCode : itemCode
			}
		}).done(function(data){
			$.each($.parseJSON(data), function(index, value){
				$("#add-list tr:last-child").find('.expiry-date').first().children('select').append('<option  value="'+ this.ExpiryDate +'">'+ this.ExpiryDate +' Qty('+ this.Quantity +') </option>');
			});
		});
	}
	function getPackageName(){
		var packCode =1;
		$.ajax({
			type:"POST",
			url:"GetPackage",
			data:{
				packCode :packCode
			}
		}).done(function(data){
			$.each($.parseJSON(data), function(){
				$("#PackageType").append('<option value='+this.id + '>'+ this.name +' </option>');
			});
		});
	}
	function getDate() {
		$(".datepicker").datepicker();
	}
	function JSFunctionValidate()
	{
	if(document.getElementById('.ExpiryDate').selectedIndex == 0)
	{
	alert("Please select ddl");
	return false;
	}
	return true;
	}
	
	function getCollectionCenter(){
		var type = 1;
		$.ajax({
			type:"POST",
			url:"GetCollectionCenter",
			data:{
				type : type
			}
		}).done(function(data){
			$.each($.parseJSON(data), function(){
				$("#collect").append('<option value='+this.name + '>'+ this.name +' </option>');
			});
		});
	}
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
		<jsp:param value="http://jquery.bassistance.de/validate/jquery.validate.js" name="js"/>
		<jsp:param value="http://jquery.bassistance.de/validate/additional-methods.js" name="js"/>
</jsp:include>
<!-- footer.jsp -->