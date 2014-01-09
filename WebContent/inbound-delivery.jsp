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
				<li class="active"><i class="icon-dashboard"></i> Outbound
					Delivery</li>
			</ol>
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> Metadata
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" method="post"
						action="/it2299-ffth-reincoast/InBoundServlet">
						
						<div class="form-group">
							<label class="col-lg-2 control-label">DeliveryDate</label>
							<div class="col-lg-4">
								<input class="form-control datepicker" type="text" name="deliveryDate" readonly />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Donor Type</label>
							<div class="col-lg-4">
								<select class="form-control" id="Type" name=Type>
									<option value="organization">Organization</option>
									<option value="individual">Individual</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Donor Name</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="Donor" name="Donor" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Item Search</label>
							<div class="col-lg-4">
								<select class="form-control" id="productName">
									
								</select>
							</div>
							<div class="col-lg-1">
							<button type="button" class="btn btn-xs btn-default" id="addRow">
								 <i class="icon-plus glyphicon glyphicon-repeat"></i> Add row
							</button>
							</div>
						</div>
						<div class="table-responsive" id="tableRec">
							<table
								class="table table-hover table-striped tablesorter table-condensed">
								<thead id="addHeader">
									<tr>
									<th class="col-lg-1">#<i class="icon-sort"></i></th>
									<th class="col-lg-2">Item Code <i class="icon-sort"></i></th>
									<th class="col-lg-2">Item Name<i class="icon-sort"></i></th>
									<th class="col-lg-1">Quantity<i class="icon-sort"></i></th>
									<th class="col-lg-1">Unit Price<i class="icon-sort"></i></th>
									<th class="col-lg-1">Date<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">
									
								</tbody>
							</table>
						</div>
					</form>
					<div id="notice">
					<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				Please add Product
								</div>
								</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row -->

<!-- sample-content.jsp -->
<!-- Add row function -->
<script>
	var count = 1;

	$(document).ready(function() {
						getDate();
						$("#productName").select2({
						});
						getProductName();
						$("#addRow").on('click',function() {
											if ($('#search').val() == '') {
												alert("Please Enter Item Code");
											} else {
												if (count == 1) {
													$("#add-list").empty();
													$("#notice").remove();
													$("#btn_submit").remove();
													$("#tableRec").append('<input type="submit" id= "btn_submit" />');
													count++;
													getItem();
													$(document).scrollTop(
															$(document).height());
												} else {
													getItem();
													count++;
													$(document).scrollTop(
															$(document).height());
												}
											}
										});
					});
	
	function getItem() {

		var itemCode = $('#search').value;
		alert(itemCode);
		$.ajax({	type : "POST",
					url : "GetItemServlet",
					data : {
						ItemCode : itemCode
					}
				}).done(function(data) {
							var obj = $.parseJSON(data);
							$("#add-list")
									.append(
											'<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="id" value="'
													+ count
													+ '" readonly/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code" value="'
													+ obj.id
													+ '" readonly/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-name" value="'
													+ obj.name
													+ '" readonly /></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-quantity" value="'
													+ "0"
													+ '"name="quantity"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-price" value=" '
													+ obj.price
													+ '" readonly/></td><td><p><input class="form-control input-sm datepicker" type="text" style="width: 100%;" name="expiry-date" readonly/></P></td></tr>');
							getDate().datepicker("refresh");
						});
	}
	function getDate(){
		$( ".datepicker" ).datepicker();
	}
	
	
	function getProductName(){
		var itemCode = 1;
		$.ajax({	type : "POST",
			url : "getProductNameServlet",
			data : {
				ItemCode : itemCode
			}
	}).done(function(data){
			$.each($.parseJSON(data), function(){
				$("#productName").append('<option value='+this.id + '">"'+ this.name +' </option>');
			});
		});
	}
	

	/*
	$("#search").select2({
							placeholder: "Select a Product",
							ajax:{
								url:"GetItemServlet",
								data:function(term){
									return{
										ItemCode: term
									};
								},
								results: function(data){
									return {results: data};
								}
							},
							formatResult: function (data) {
							 	alert("result " + data);
							 	console.log("muhahaha");
							 	
						        var markup = "<table class='movie-result'><tr>";
						        if (results.imageUrl !== undefined && results.imageUrl !== undefined) {
						            markup += "<td class='movie-image'><img src='" + results.imageUrl + "'/></td>";
						        }
						        markup += "<td class='movie-info'><div class='movie-title'>" + results.name + "</div>";
						        if (results.description !== undefined) {
						            markup += "<div class='movie-synopsis'>" + results.description + "</div>";
						        }
						        else if (results.price !== undefined) {
						            markup += "<div class='movie-synopsis'>" + results.price + "</div>";
						        }
						        markup += "</td></tr></table>";
						        return markup;
						    },
							dropdownCssClass: "bigdrop",
						    escapeMarkup: function (m) { return m; }
						});
	
	*/
	 
	
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->