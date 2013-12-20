<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2-bootstrap.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.3/morris.css" name="css" />
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
							<label>Category</label> 
							<input id="p_category" class="form-control input-sm" name="p_category" value="${product.category}">
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Additional Data</label>
						</h4>
						<span>Customize your data by adding more fields to the form.</span>
					</div>
					<table class="table">
						<tbody id="p_meta_fields">
							<c:forEach items="${product.productMetas}" var="productMeta">
								<tr>
									<td class="col-sm-3" style="padding-left: 14px;"><input type="hidden" name="p_meta_id" value="${productMeta.id}" /><input class="form-control input-sm" placeholder="key" name="p_meta_key" value="${productMeta.metaKey}"></td>
									<td><input class="form-control input-sm" placeholder="value" name="p_meta_value" value="${productMeta.metaValue}"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="panel-footer">
						<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
							<div class="btn-group">
								<button id="p_add_meta_field" type="button" class="btn btn-xs btn-default">
									<i class="icon-plus"></i> Add field
								</button>
							</div>
						</div>
						&nbsp;
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
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Stock Status</label>
						</h4>
						<span>Displaying stock status.</span>
					</div>
					<table class="table ">
						<tbody>
							<tr>
								<td class="col-lg-4">Currently Available</td>
								<td>1098</td>
							</tr>
							<tr>
								<td class="col-lg-4">Total Inbound</td>
								<td>2567</td>
							</tr>
							<tr>
								<td class="col-lg-4">Total Outbound</td>
								<td>1200</td>
							</tr>
						</tbody>
					</table>
					<div class="panel-footer">
						<h4><label>Stock Histogram</label></h4>
						<div id="line-example"></div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Modification Log</label>
						</h4>
						<span>Modification history of primary details of this product.</span>
					</div>
					<table class="table">
						<tbody>
							<c:forEach items="${p_audit_trails}" var="p_audit_trail">
								<tr style="padding-bottom:5px;">
									<td class="col-lg-1"><span class="badge">${p_audit_trail[0]}</span></td>
									<td><i class="fa fa-calendar"></i>&nbsp;${p_audit_trail[1]}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Movement Log</label>
						</h4>
						<span>Movement history of this product.</span>
					</div>
					<table class="table">
						<tbody>
							<tr style="padding-bottom:5px;">
								<td class="col-lg-1"><span class="badge">INBOUND</span></td>
								<td><i class="fa fa-calendar"></i>&nbsp;Fri Dec 20 03:14:34 SGT 2013</td>
							</tr>
							<tr style="padding-bottom:5px;">
								<td class="col-lg-1"><span class="badge">INBOUND</span></td>
								<td><i class="fa fa-calendar"></i>&nbsp;Fri Dec 20 03:14:34 SGT 2013</td>
							</tr>
							<tr style="padding-bottom:5px;">
								<td class="col-lg-1"><span class="badge">OUTBOUND</span></td>
								<td><i class="fa fa-calendar"></i>&nbsp;Fri Dec 20 03:14:34 SGT 2013</td>
							</tr>
						</tbody>
					</table>
					<div class="panel-footer">
						<h4><label>Movement Graph</label></h4>
						<div id="holder"></div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Email Alerts</label>
						</h4>
						<div class="checkbox">
						    <label>
						      <input type="checkbox"> Send me an email when this product information is being modified.
						    </label>
						</div>
						<div class="checkbox">
						    <label>
						      <input type="checkbox"> Send me an email when this product is low in stock.
						    </label>
						</div>
						<div class="checkbox">
						    <label>
						      <input id="p_stock_movement_alert" type="checkbox"> Send me an email when there are stock movement.
						    </label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- sample-content.jsp -->
	<script>
	$(document).ready(function(){
		$("#p_category").select2({
			tags: [${p_category}],
			multiple: true
		});

		$('#p_add_meta_field').on("click", function(e){
			$('#p_meta_fields').append(
					'<tr>'+
						'<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>'+
						'<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>'+
					'</tr>'
			);	
		});

		var r = Raphael("holder"),
	        xs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
	        ys = [7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
	        data = [294, 300, 204, 255, 348, 383, 334, 217, 114, 33, 44, 26, 41, 39, 52, 17, 13, 2, 0, 2, 5, 6, 64, 153, 294, 313, 195, 280, 365, 392, 340, 184, 87, 35, 43, 55, 53, 79, 49, 19, 6, 1, 0, 1, 1, 10, 50, 181, 246, 246, 220, 249, 355, 373, 332, 233, 85, 54, 28, 33, 45, 72, 54, 28, 5, 5, 0, 1, 2, 3, 58, 167, 206, 245, 194, 207, 334, 290, 261, 160, 61, 28, 11, 26, 33, 46, 36, 5, 6, 0, 0, 0, 0, 0, 0, 9, 9, 10, 7, 10, 14, 3, 3, 7, 0, 3, 4, 4, 6, 28, 24, 3, 5, 0, 0, 0, 0, 0, 0, 4, 3, 4, 4, 3, 4, 13, 10, 7, 2, 3, 6, 1, 9, 33, 32, 6, 2, 1, 3, 0, 0, 4, 40, 128, 212, 263, 202, 248, 307, 306, 284, 222, 79, 39, 26, 33, 40, 61, 54, 17, 3, 0, 0, 0, 3, 7, 70, 199],
	        axisy = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
	        axisx = ["12am", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12pm", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"];

	    r.dotchart(10, 10, 620, 260, xs, ys, data, {symbol: "o", max: 10, heat: true, axis: "0 0 1 1", axisxstep: 23, axisystep: 6, axisxlabels: axisx, axisxtype: " ", axisytype: " ", axisylabels: axisy}).hover(function () {
	        this.marker = this.marker || r.tag(this.x, this.y, this.value, 0, this.r + 2).insertBefore(this);
	        this.marker.show();
	    }, function () {
	        this.marker && this.marker.hide();
	    });

	    Morris.Line({
    	  element: 'line-example',
    	  data: [
    	    { y: '2006', a: 100, b: 90 },
    	    { y: '2007', a: 75,  b: 65 },
    	    { y: '2008', a: 50,  b: 40 },
    	    { y: '2009', a: 75,  b: 65 },
    	    { y: '2010', a: 50,  b: 40 },
    	    { y: '2011', a: 75,  b: 65 },
    	    { y: '2012', a: 100, b: 90 }
    	  ],
    	  xkey: 'y',
    	  ykeys: ['a', 'b'],
    	  labels: ['Series A', 'Series B']
    	});
	});
	</script>
	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/graphael/0.5.1/g.raphael-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/graphael/0.5.1/g.dot-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.3/morris.min.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->