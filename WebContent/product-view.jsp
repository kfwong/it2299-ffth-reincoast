<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Primary Details</label>
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<a href="ProductEditServlet?id=${product.id }" class="btn btn-xs btn-default">
										<i class="fa fa-pencil"></i> Edit
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
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<a href="ProductEditServlet?id=${product.id }" class="btn btn-xs btn-default">
										<i class="fa fa-pencil"></i> Edit
									</a>
								</div>
							</div>
						</h4>
					</div>
					<table class="table" style="border:none;background-color:rgb(245, 245, 245);">
						<tbody id="p_meta_fields">
							<c:forEach items="${product.productMetas}" var="productMeta">
								<tr>
									<td class="col-sm-3" style="border:none;"><label class="control-label">${productMeta.metaKey}</label></td>
									<td style="border:none;"><p>${productMeta.metaValue}</p></td>
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
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/graphael/0.5.1/g.raphael-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/graphael/0.5.1/g.dot-min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.4.3/morris.min.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->