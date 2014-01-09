<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.it2299.ffth.reincoast.dto.Packing,com.it2299.ffth.reincoast.dao.PackingDao,java.util.List"
	%>


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
			<h2>Outbound Delivery</h2>
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
					<form class="form-horizontal" role="form" method="post" action="/it2299-ffth-reincoast/OutboundServlet">
						<div class="form-group" style="padding: 0px 10px 0px 10px;">
							<div class="btn-group">
								<button type="button" class="btn btn-xs btn-default">
									<i class="icon-ok"></i> Save
								</button>
								<button type="button" class="btn btn-xs btn-default">
									<i class="icon-tags"></i> Other
								</button>
								<button type="button" class="btn btn-xs btn-default">
									<i class="icon-tags"></i> Other
								</button>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">DeliveryDate</label>
							<div class="col-lg-4">
								<input class="form-control datepicker" type="text" name="deliveryDate" readonly />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Package Type</label>
							<div class="col-lg-4">
								<select class="form-control" id="PackageType" name=Type>
								<%
									PackingDao packingdao = new PackingDao();
									List<Packing> ListOfPacking = packingdao.getAll();
									for(int i=0; i< ListOfPacking.size(); i++){
								%>
									<option value="<%=ListOfPacking.get(i).getId() %>"><%= ListOfPacking.get(i).getPackageName() %></option>
								<%
								}
								%>
								
								</select>
							</div>
							<div class="col-lg-1">
							<button type="button" class="btn btn-xs btn-default" id="addPackage">
								<i class="icon-plus"></i> Add Package
							</button>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Collection location</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="collect" name="collectLoc" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Item Search</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="search" />
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
									<th class="col-lg-1">#<i class="icon-sort"></i></th>
									<th class="col-lg-2">Item Code <i class="icon-sort"></i></th>
									<th class="col-lg-2">Item Name<i class="icon-sort"></i></th>
									<th class="col-lg-1">Quantity<i class="icon-sort"></i></th>
									<th class="col-lg-1">Unit Price<i class="icon-sort"></i></th>
									</tr>
								</thead>
								<tbody id="add-list">
								</tbody>
							</table>
						</div>
					</form>
					<div id="notice">
						<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
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
	var count =1;

	$(document).ready(function() {
						getDate();
						$("#addRow").on('click', function() {
											if ($('#search').val() == '') {
												alert("Please Enter Item Code");
											} else {
												if (count == 1) {
													$("#notice").remove();
													$("#tableRec").append('<input type="submit" />');
													count++;
													getItem();
													$(document).scrollTop(
															$(document)
																	.height());
												} else {
													
													getItem();
													$(document).scrollTop(
															$(document)
																	.height());
												}
											}
										});
						$("#addPackage").on('click', function(){
								if (count == 1) {
									$("#tableRec").append('<input type="submit" />');
									count++;
									getPackageItem();
									$(document).scrollTop(
											$(document)
													.height());
								} else {
									getPackageItem();
									$(document).scrollTop(
											$(document)
													.height());
								}
							
						});
					});
	function getPackageItem(){
		var packID = $("#PackageType option:selected").val();
		$.ajax({
			type:"POST",
			url:"GetPackageListItem",
			data:{ packID : packID }
		}).done(function(data){
			$.each($.parseJSON(data), function(){
				$("#add-list").append('<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="id" value="'
						+ this.id
						+ '" readonly/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code" value="'
						+ this.code
						+ '" readonly/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-name" value="'
						+ this.name
						+ '" readonly /></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-quantity" value="'
						+ "0"
						+ '"name="quantity"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-price" value=" '
						+ this.price
						+ '" readonly/></td></tr>');
				});
		});
		
	}
	function getItem() {

		var itemCode = $('#search').val();
		
		$.ajax({
					type : "POST",
					url : "GetItemServlet",
					data : {
						ItemCode : itemCode
					}
				}).done(
						function(data) {
							var obj = $.parseJSON(data);
							$("#add-list")
									.append(
											'<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="id" value="'
													+ obj.id
													+ '" readonly/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code" value="'
													+ obj.code
													+ '" readonly/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-name" value="'
													+ obj.name
													+ '" readonly /></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-quantity" value="'
													+ "0"
													+ '"name="quantity"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-price" value=" '
													+ obj.price
													+ '" readonly/></td></tr>');
							getDate().datepicker("refresh");
						});
	}
	function getDate(){
		$( ".datepicker" ).datepicker();
	}
	
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js" name="js" />
</jsp:include>
<!-- footer.jsp -->