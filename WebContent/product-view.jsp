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
	<jsp:param value="Product Management" name="active" />
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
						Product <small>View</small>
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
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div id="jspdf-ignore" class="btn-group">
									<a href="ProductEditServlet?id=${product.id }" class="btn btn-xs btn-default">
										<i class="fa fa-pencil"></i> Edit
									</a>
									<a href="javascript:demoFromHTML()" class="btn btn-xs btn-default">
										<i class="fa fa-file"></i> Export PDF
									</a>
								</div>
							</div>
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
							<div id="jspdf-ignore" class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<a href="ProductEditServlet?id=${product.id }" class="btn btn-xs btn-default">
										<i class="fa fa-pencil"></i> Edit
									</a>
								</div>
							</div>
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
				<div class="panel panel-default">
					<div class="panel-body" style="padding-bottom:0px;">
						<h4>
							<label>Expiry Dates</label>
						</h4>
						<p>Expiry dates that are associated with this product.</p>
					</div>
					<table id="jspdf-p-batches" class="table" style="border:none;background-color:rgb(245, 245, 245);">
						<thead>
							<tr>
								<th>Expiry Date</th>
								<th>Quantity</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty product_batches}">
								<tr><td colspan="2">No records found.</td></tr>
							</c:if>
							<c:forEach items="${product_batches}" var="productBatch">
								<tr>
									<td class="col-sm-3" style="border:none;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${productBatch.expiryDate}" /></td>
									<td style="border:none;">${productBatch.quantity}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Email Alerts</label>
						</h4>
					    <p><i class="fa fa-check-square-o"></i> Send me an email when this product information is being modified.</p>
					    <p><i class="fa fa-square-o"></i> Send me an email when this product is low in stock.</p>
					    <p><i class="fa fa-check-square-o"></i> Send me an email when there are stock movement.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
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
								<td>${product.quantity } units</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
					<div class="panel-footer">
						<h4><label>Stock Changes Graph</label></h4>
						<div id="morris-stock-graph"></div>
					</div>
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
							<tr>
								<td class="col-lg-4">Last Inbound</td>
								<td>${p_latest_inbound_quantity} units</td>
								<td><c:if test="${not empty p_latest_inbound_date}"><i class="fa fa-calendar"></i>&nbsp;${p_latest_inbound_date}</c:if></td>
							</tr>
							<tr>
								<td class="col-lg-4">Last Outbound</td>
								<td>${p_latest_outbound_quantity} units</td>
								<td><c:if test="${not empty p_latest_outbound_date}"><i class="fa fa-calendar"></i>&nbsp;${p_latest_outbound_date}</c:if></td>
							</tr>
						</tbody>
					</table>
					<div class="panel-footer">
						<h4><label>Inbound/Outbound Distribution Graph</label></h4>
						<div id="holder"></div>
					</div>
				</div>
			</div>
		</div>
	</form>	
</div>
	<!-- sample-content.jsp -->
	<script>
	$(document).ready(function(){
		
		$('#p_add_meta_field').on("click", function(e){
			$('#p_meta_fields').append(
					'<tr>'+
						'<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>'+
						'<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>'+
					'</tr>'
			);	
		});

		Morris.Bar({
		  element: 'holder',
		  data: [
			${p_movement_graph_data}
		  ],
		  xkey: 'm',
		  ykeys: ['inbound', 'outbound'],
		  labels: ['Inbound', 'Outbound'],
		  xLabelMargin: 10,
		  xLabelAngle: 60
		});

	    Morris.Line({
    	  element: 'morris-stock-graph',
    	  data: [
			<jsp:useBean id="now" class="java.util.Date" />
			<c:if test="${empty p_audits_past_30_days}">
			{ date:${now.time}, quantity: null }
			</c:if>
			<c:forEach items="${p_audits_past_30_days}" var="p_audit" varStatus="status">
			{ date: '${p_audit.date.time}', quantity: ${p_audit.entity.quantity } }<c:if test="${!status.last}">,</c:if>
			</c:forEach>
    	  ],
    	  xkey: 'date',
    	  ykeys: ['quantity'],
    	  labels: ['Quantity'],
    	  smooth: false,
    	  parseTime: false,
    	  xLabelFormat: function (x) { return $.format.date(new Date(parseInt(x.label)), "dd-MMM-yy"); },
    	  xLabelMargin: 10,
		  xLabelAngle: 60
    	});
	});
	
	function demoFromHTML() {

		var pdf = new jsPDF('p','pt','a4', true);
		
		pdf.setFontStyle("bold");
		pdf.setFontSize(16);
		pdf.setTextColor(0,173,255);
		pdf.text(25,50,"REIN");
		pdf.setTextColor(0,0,0);
		pdf.setFontStyle("bold");
		pdf.setFontSize(16);
		pdf.text(65,50,"COAST");

		var source = $('#jspdf-p-primary-details')[0];  // This is your HTML Div to generate pdf
		
		var specialElementHandlers = {
		
		    '#jspdf-ignore': function(element, renderer){
		        return true
		    }
		};
		
		// Generate from HTML	
		pdf.fromHTML(
		    source, // HTML string or DOM elem ref.
			25, // x coord
		    75, // y coord
		    {
		    	'width':555, // max width of content on PDF
		        'elementHandlers': specialElementHandlers
		    }
		);

		//Create table
		
		pdf.setFontStyle("bold");
		pdf.setFontSize(14);
		pdf.text(25,435,"Additional Data");
		
		var table = tableToJson($('#jspdf-p-meta-fields').get(0))
		pdf.cellInitialize();
		pdf.setFontSize(8);
		$.each(table, function (i, row){
		  $.each(row, function (j, cell){
			pdf.cell(25, 450, 150, 15, cell, i); 
		  })
		});
		

		// Add image
		/*
		var imgData = 'data:image/jpeg;base64,'+ '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';
		pdf.addImage(imgData, 'JPEG', 15, 300, 150, 50);
		*/
		
		pdf.output('dataurl')

		
	}

	function tableToJson(table) {
	    var data = [];

	    // first row needs to be headers
	    var headers = [];
	    for (var i=0; i<table.rows[0].cells.length; i++) {
	        headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
	    }

	    // go through cells
	    for (var i=1; i<table.rows.length; i++) {

	        var tableRow = table.rows[i];
	        var rowData = {};

	        for (var j=0; j<tableRow.cells.length; j++) {

	            rowData[ headers[j] ] = tableRow.cells[j].innerHTML;

	        }

	        data.push(rowData);
	    }       

	    return data;
	}
	</script>
	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/graphael/0.5.1/g.raphael-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.3/morris.min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.min.js" name="js" />
		
		<jsp:param value="js/jspdf/adler32cs.js" name="js" />
		<jsp:param value="js/jspdf/deflate.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.addimage.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.autoprint.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.cell.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.from_html.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.ie_below_9_shim.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.javascript.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.sillysvgrenderer.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.split_text_to_size.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.standard_fonts_metrics.js" name="js" />
		<jsp:param value="js/jspdf/jspdf.plugin.total_pages.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->