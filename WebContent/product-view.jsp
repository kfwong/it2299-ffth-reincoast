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
						<div class="form-group">
							<label class="control-label">Name</label> 
							<p><small>${product.name}</small></p>
						</div>

						<div class="form-group">
							<label>Description</label>
							<p><small>${product.description}</small></p>
						</div>
						
						<div class="form-group">
							<label class="control-label">Code</label> 
							<p><small>${product.code}</small></p>
						</div>

						<div class="form-group">
							<label>Unit of Measure</label> 
							<p><small>${product.unitOfMeasure}</small></p>
						</div>

						<div class="form-group">
							<label>Price</label> 
							<p><small>${product.price}</small></p>
						</div>
						<div class="form-group">
							<label>Weight</label> 
							<p><small>${product.weight}</small></p>
						</div>
						<div class="form-group">
							<label>Category</label>
							<p>
								<c:set var="categories" value="${fn:split(product.category, ',')}" />
							    <c:forEach items="${categories}" var="category">
							    	<span class="badge">${category }</span>
							    </c:forEach>
							</p>
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
					</div>
					<table id="jspdf-p-meta-fields" class="table" style="border:none;background-color:rgb(245, 245, 245);">
						<thead>
							<tr>
								<th>Key</th>
								<th>Value</th>
							</tr>
						</thead>
						<tbody id="p_meta_fields">
							<c:forEach items="${product.productMetas}" var="productMeta">
								<tr>
									<td class="col-sm-3" style="border:none;">${productMeta.metaKey}</td>
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
							<label>Image</label>
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
								      <img id="p_image" src="${product.imageUrl}">
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
						<h4><label>Stock Graph</label></h4>
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
							<c:forEach items="${p_audits}" var="p_audit">
								<tr style="padding-bottom:5px;">
									<td class="col-lg-1"><span class="badge">${p_audit.operation}</span></td>
									<td><i class="fa fa-calendar"></i>&nbsp;${p_audit.date}</td>
									<td><a class="audit" href="#" data-revision-id="${p_audit.revisionId }" data-poload="TestServlet">View Details</a></td>
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
			</div>
		</div>
	</form>	
</div>
	<!-- sample-content.jsp -->
	<script>
	$(document).ready(function(){
		$('.audit').on('click', function(event){
			event.preventDefault();
			var target = $(this);
			
			clearTimeout(window.timer);
			window.timer=setTimeout(function(){
				$.get(target.data('poload'), {
					entityId: ${product.id},
					revisionId: target.data("revision-id")
				}).done(function(data) {
					var audit = $.parseJSON(data);
			    	target.popover({
				    	html: true,
				    	placement: 'left',
				    	trigger: 'hover',
				    	container: 'body',
				    	content: "<label>"+audit.name+"</label>"+
				    		"<p><small>"+audit.description+"</small></p>"+
				    		"<p><small><strong>Price</strong>: "+audit.price+"</small></p>"+
				    		"<p><small><strong>weight</strong>: "+audit.weight+"</small></p>"+
				    		"<p><small><strong>Category</strong>: "+audit.category+"</small></p>"
				    }).popover('show');
			    });
			}, 500);
		});
		
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
			<c:forEach items="${p_audits_past_7_days}" var="p_audit" varStatus="status">
		    { xkey: 'Mon', inbound: ${p_audit.entity.quantity}, outbound: ${p_audit.entity.quantity} }<c:if test="${!status.last}">,</c:if>
		    </c:forEach>
		  ],
		  xkey: 'xkey',
		  ykeys: ['inbound', 'outbound'],
		  labels: ['Inbound', 'Outbound']
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
    	  labels: ['Series A', 'Series B'],
    	  smooth: false
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
		var imgData = 'data:image/jpeg;base64,'+ '/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wgARCAAyAJYDAREAAhEBAxEB/8QAGgABAAMBAQEAAAAAAAAAAAAAAAQFBgcCA//EABoBAQADAQEBAAAAAAAAAAAAAAAEBQYDAgH/2gAMAwEAAhADEAAAAeAgAAAAAAAAAAAAAAAAAAEjtH1N7mK+JP8Ap65xeEubKgwYk7Z1tzUF8VpLMSdRMAdDOJgEyRE2+oxVHV3V5aUlFVXnn57t7Co1GV3OSNuVZcFGbg5CaU5WAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf/EAB4QAAMBAQEAAgMAAAAAAAAAAAMEBQYCAQBQEBIU/9oACAEBAAEFAvp1x+FOVGcNziZz5YKOWIiKXDK82UN5PhLz2fMzaAodqbKEmPNy5UrQZsCM7IZpOwKtP7k038vEgegFIDVrQcxJS/KnvnLfVzrisp+q1w5mydTCcCUXY8FHbaAxJUOlpMpakTpSTn8OxkaF9JDNFryYmb3LSdgqDHanzWMItaDXuAZifd//xAArEQABAwMCBQEJAAAAAAAAAAABAgMEAAUREjEUIUFRYRMiMEJQYHGRobH/2gAIAQMBAT8B+TyHC0ytwdATTU65uRuLAb079c0u5KNt45CefY/fFNOXd1CXB6eDz+Kp0xyM8w2gDCzg/qrjdXYMlDYTlGMnvvilzVCY0wjGlYJ97LBVHcA7H+UmyJXbg4lGHt+vPntipeuTaSENkHA9nHntTDUJtKSqG5qGOh3/ADVybcdkRVIScBXPxtvT7BduaSpOUaCD2qJFkx7i20tJKEZwrwdvoX//xAAtEQACAQMCAwQLAAAAAAAAAAABAgMABBESFAUhMSJBUWEwMkJQYHKBkdHh8P/aAAgBAgEBPwH3PCgkkVD3mntbFJ9vl8/Slsl321Y8v1mpE4dGxQ6+Xy1a2yTxSu3sirKwS6gZycNnA8KW1G2klb1lOPS25AmQnxFNxQpelC2Y/wC76t9MHEBqfIz1zUsl05YC5TSfMdPtVi6Rw3Cseo/NQyiOxYBu1qBq4nhmsndT2mxkefwL/8QAMRAAAQMDAgMFBgcAAAAAAAAAAgEDBAAFERIhEzFRFCJBYZEGIzJQcYEVICRCodHw/9oACAEBAAY/Avk7YLyIkSuzZlcTOM7YrsZmqjn4h+maMF7XkVx+2pbhKSK0GpMU4amou6tIdOVSHi1I40SDigu14kvMx3T0MsxkTWfrTMu1zyeEy0lGkYR0PPbwqJMvcmSJyx1tR4iJq09VzUW6W6SUq3SF0e8TBgXRfRakSbi86xEbMGRJpURVMlx4pUmG58TJqOevnUZq5O3EnHQQlkRwHgjn+Vp4JT0qRb0zw3YooJl02KoMhw7sQzW+I2gq3ty5+v5GVVcIhpv96IFdQoi7d3G3nmh1PCYIS+91c9utOINzicMs4TUnL0q4CRiiq3hN+fOnEQ0F3jISJnennBMRedUVJvO+aiWx2czb5sIyUFkrhsxXzpoW7kM+4KXfSPu0I/XrVsxcY1vnw2uA43LLQJInii1EsUOSM0wd4zz7fwZ32T1q2W5yMF2I/wBU9wpShoPwyo+P9VAu0cw1yWsPsC4im2Sdf94VHW2e1Mb8MwmqPcjTWPUdOKluW4UGIqpp0phM43x969mwafbdNqNpcECRVBe7z6fPP//EACQQAQACAgEDBAMBAAAAAAAAAAERIQAxYUFRgVBxkfAgobHB/9oACAEBAAE/IfR0fRKm4XFbqYpyfE9cAUHaGKMRpsaVkyLkZZC3v4wXnRSTbA1nHK023OIXEpOSLNAp+N2YxAhiUTIo8v7cSCTXisNXqfZxqAQwnOv6HtgKkUDwSlEk++SiWV0DXkQ+c+cOLVBg4wuqhIKk6SJnEeRdUR1QjTU/gY5CpgCGM/wLRIKDnJe+EigVb3YSCwWeXTwyGX5ST7O+BTMKahYZHCkalhQyS4Uyq+1v9c0iabo9XOX0i1DIYEQjxdc8WwlhnCfry45qVroEPpJkDEOoYImCmJ8tUKXjsofq7jTgT/c3RpjwSHQZYtasBRQm1O+3rn//2gAMAwEAAgADAAAAEJJJJJJJJJJJJJJJJJJJJdeKwIAIJJBr+HIBJIJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ/8QAIREBAQEAAgEDBQAAAAAAAAAAAREhADFBMGGBUFFgcZH/2gAIAQMBAT8Q+jgjpF6oLvA+QYZgt8y5m8SiJuiXTqKdp144DMoLuJf7xWjWWh9kTd83hEECxgpJszPDyxy024KRsj+n1RLqmBqqsOM5IUOoWlmnWGzwvKEsNBEFCLMpnXFXSSk4lTPnevjjnVECx7HXzx5KIR7Li9VPHAACZMkoWSjnft1PwX//xAAhEQEBAAICAgEFAAAAAAAAAAABEQAhMVFBgWEwUGBxof/aAAgBAgEBPxD7PwGgPtmX3ZC7lZ8Xz1hg9qU0+DvfebLKTpRmOMjYkl3zp68TFwgthTKDq7/eNtgI8bY0lvv6rNwKPswYa61IUNg3p533l0Ip1IiMVsvfzhsqMPI8evz7wSIxNm3p36wSQCFLoNhzhxR3UsIKHMef73+C/wD/xAAgEAEBAAMAAwACAwAAAAAAAAABEQAhMUFRYRBQcYHR/9oACAEBAAE/EP07GDVABGXzvETpZzojqhpdZaoEha9BB4PfOMCHVJEZ8phuRCEDlDTTkyWGI0YhrezSf6tRXsDAAS0r5MaIbFmGIE9k64Et1UXQ2C5BKkcGlERNlTAR5rsKkDgqcYUNFegH8hTMUiCYQwTQgWwcvAnycy+RPgy6+LUog6hrsoiFZlNLAeoAFBHaE1gVks/QCJeJcO/f5NA3oBFV4GXSPUHSKsTdur6MOspecFE6Br3IXGjzIJttTv8AeWSK0ACFfY57MB3NyiCyoJ2eMCIiiB6mxAeffeImeq2QwhSbr6tOE1SKeBGD8nhaQcLqohFEpK0wLuMhwqjPkICHM2GtXqMHVjRq9QTNjajRJ0t5A6eawpBZsxpSbgKEkrFCLwU2ZMJpEc0gM0dsLMh2XOXsL4CHb1+8/9k=';
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