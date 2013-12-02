<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="alert alert-success alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				Transaction completed successfully. T.Code: 6000864578
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bar-chart"></i> Metadata
					</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="post"
						action="com.it2299.controllers/InboundControler.java">
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
							<label class="col-lg-2 control-label">Collection Center</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="donor" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Package Description</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="package_description" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Pre-Package</label>
							<div class="col-lg-4">
								<select class="form-control onchange='getPackage(this.value)'"
									id="Pack">
									<option value="default">Please select a Pack</option>
									<option value="pack1">Package 1</option>
									<option value="pack2">Package 2</option>
								</select>
							</div>
							<button type="button" class="btn btn-xs btn-default" id="addPack">
								<i class="icon-plus"></i> Add Package
							</button>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Item Search</label>
							<div class="col-lg-4">
								<input class="form-control" type="text" id="search" />
							</div>
							<button type="button" class="btn btn-xs btn-default" id="addRow">
								<i class="icon-plus"></i> Add row
							</button>
						</div>
						<div class="table-responsive">
							<table
								class="table table-hover table-striped tablesorter table-condensed"
								id="tableRec">
								<thead id="addHeader">
									<tr>
										<th><div class="alert alert-info text-center">
												<button type="button" class="close" data-dismiss="alert">&times;</button>
												Please Enter Record
											</div></th>
									</tr>
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
</div>
<!-- sample-content.jsp -->
<!-- Add row function -->
<script>
	var count = 1;
	$(document)
			.ready(
					function() {
						$("#addRow")
								.on(
										'click',
										function() {
											if ($('#search').val() == '') {
												alert("Please Enter Item Code");
											} else {
												if (count == 1) {
													$("#addHeader").empty();
													$("#tableRec")
															.append(
																	'<input type="submit" />');
													$("#addHeader")
															.append(
																	'<tr><th class="col-lg-1">#<i class="icon-sort"></i></th><th class="col-lg-2">Item Code <i class="icon-sort"></i></th><th>Item Description <i class="icon-sort"></i></th><th class="col-lg-1">Quantity<i class="icon-sort"></i></th><th class="col-lg-1">Unit of Measure<i class="icon-sort"></i></th><th class="col-lg-1">Unit Price<i class="icon-sort"></i></th></tr>');
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
					});
	$(document)
			.ready(
					function() {
						$("#addPack")
								.on(
										'click',
										function() {

											if (count == 1) {
												$("#addHeader").empty();
												$("#tableRec")
														.append(
																'<input type="submit" />');
												$("#addHeader")
														.append(
																'<tr><th class="col-lg-1">#<i class="icon-sort"></i></th><th class="col-lg-2">Item Code <i class="icon-sort"></i></th><th>Item Description <i class="icon-sort"></i></th><th class="col-lg-1">Quantity<i class="icon-sort"></i></th><th class="col-lg-1">Unit of Measure<i class="icon-sort"></i></th><th class="col-lg-1">Unit Price<i class="icon-sort"></i></th></tr>');
												getPackage($(
														'select#Pack option:selected')
														.val());
												$(document).scrollTop(
														$(document).height());
											} else {
												getPackage($(
														'select#Pack option:selected')
														.val());
												$(document).scrollTop(
														$(document).height());
											}

										});
					});

	function getItem() {

		var itemCode = $('#search').val();

		$
				.ajax({
					type : "POST",
					url : "InboundController",
					data : {
						ItemCode : itemCode
					}
				})
				.done(
						function(data) {
							var obj = $.parseJSON(data);
							$("#add-list")
									.append(
											'<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="id" value="'
													+ count
													+ '"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code" value="'
													+ obj.itemCode
													+ '"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-desc" value="'
													+ obj.itemDescription
													+ '"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-quantity" value="'
													+ obj.itemQuantity
													+ '"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-price" value="$ '
													+ obj.unitPrice
													+ '"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-measure" value ="'
													+ obj.unitOfMeasure
													+ 'g"/></td></tr>');
							count++;
						});

	}
	function getPackage(str) {
		var values = [];
		var itemPack = str;
		$.ajax({
			type : "POST",
			url : "InboundController",
			data : {
				ItemPack : itemPack
			}

		});
		$
				.each(
						[51 ,59],
						function(index, value) {
							$("#add-list")
									.append(
											'<tr><td><input class="form-control input-sm" type="text" style="width: 100%;" name="id" value="'
													+ index
													+ '"/></td><td><input class="form-control input-sm" type="text" style="width: 100%;" name="item-code" value="'
													+ value + '"/></td>');
						});

	}
</script>
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->