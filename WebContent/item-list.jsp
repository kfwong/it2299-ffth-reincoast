<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
			<h2>Item List</h2>
			<ol class="breadcrumb">
				<li><i class="icon-dashboard"></i>Home</li>
				<li>Delivery</li>
				<li>Food Drive</li>
				<li class="active">Item List</li>
			</ol>
			<div class="col-lg-12">
			<div class="row"> 
				<div class="panel panel-default">
					<div class="panel-heading">
					<div id="printOut">
						<h3 class="panel-title">
							<label>Inbound ID: ${inboundID}</label>
						</h3>
						<h3 class="panel-title">
							<label>Donor: ${inbound.donorName}</label>
						</h3>
						<h3 class="panel-title">
							<label>Total Value: ${inbound.totalPrice}</label>
						</h3>
						<h3 class="panel-title">
							<label>Received: ${inbound.dateDelivered}</label>
						</h3>
					</div>
					
					<div class="panel-body">
						<form class="form-horizontal" role="form">
						<a href="javascript:demoFromHTML()" class="button">Print to PDF</a>
							<div class="table-responsive" id="tableRec">
								<table class="table table-hover table-striped tablesorter table-condensed" id="item-table">
									<thead id="addHeader">
										<tr>

											<th class="col-lg-2">Product Name</th>
											<th class="col-lg-2">Unti of Measure</th>
											<th class="col-lg-1">Quantity</th>
											<th class="col-lg-2">Expiry Date</th>
											<th class="col-lg-2">Available Quantity</th>
										</tr>
									</thead>
									<tbody id="add-list">

										<c:forEach items="${itemList}" var="item">
											<tr>
												<td>${item.product.name}</td>
												<td>${item.product.unitOfMeasure}</td>
												<td>${item.quantity}</td>
												<td>${item.expiryDate}</td>
												<td>${item.avaliable}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</form>
						</div>
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
function demoFromHTML() {

	var pdf = new jsPDF('p','pt','a4', true);

	var source = $('#printOut')[0];  // This is your HTML Div to generate pdf
	
	var specialElementHandlers = {
	
	    '#bypassme': function(element, renderer){
	        return true;
	    }
	};
	
	// Generate from HTML	
	pdf.fromHTML(
	    source, // HTML string or DOM elem ref.
		15, // x coord
	    15, // y coord
	    {
	    	'width':565, // max width of content on PDF
	        'elementHandlers': specialElementHandlers
	    }
	);

	//Create table
	var table = tableToJson($('#item-table').get(0))
	pdf.cellInitialize();
	pdf.setFontSize(8);
	pdf.cell(15, 150, 240, 20, "PRODUCT NAME", -1);
	pdf.cell(15, 150, 150, 20, "UNIT OF MEASURE(IN GRAM)", -1);
	pdf.cell(15, 150, 50, 20, "PRICE", -1);
	pdf.cell(15, 150, 90, 20, "EXPIRY DATE", -1);
	$.each(table, function (i, row){
	  $.each(row, function (j, cell){
		 
		if(j == "quantity"){
			 pdf.cell(15, 150, 50, 20, cell, i);
		 }else if(j == "expirydate"){
			 pdf.cell(15, 150, 90, 20, cell, i);
		 }else if(j == "untiofmeasure"){
			 pdf.cell(15, 150, 150, 20, cell, i);
		 }else{
			 pdf.cell(15, 150, 240, 20, cell, i);
		 }
	  })
	});

	
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