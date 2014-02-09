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
	<jsp:param value="css/bootstrap-fileupload.css" name="css" />
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
						Product <small>Edit</small>
					</h1>
				</div>
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-briefcase"></i> Product Management</li>
					<li class="active">Edit Product</li>
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
									<div class="btn-group">
										<a href="ProductViewServlet?id=${product.id }" class="btn btn-xs btn-default">
											<i class="fa fa-times"></i> Cancel
										</a>
									</div>
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
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<button id="p_action" type="submit" class="btn btn-xs btn-default" name="p_action" value="Update">
										<i class="glyphicon glyphicon-ok"></i> Update
									</button>
									<div class="btn-group">
										<a href="ProductViewServlet?id=${product.id }" class="btn btn-xs btn-default">
											<i class="fa fa-times"></i> Cancel
										</a>
									</div>
								</div>
							</div>
						</h4>
						<span>Customize your data by adding more fields to the form.</span>
					</div>
					<input id="p_meta_id_removals" type="hidden" name="p_meta_id_removals" value="" autocomplete="off"/>
					<table class="table">
						<tbody id="p_meta_fields">
							<c:forEach items="${product.productMetas}" var="productMeta">
								<tr>
									<td class="col-sm-3" style="padding-left: 14px;">
										<input type="hidden" name="p_meta_id" value="${productMeta.id}" />
										<input class="form-control input-sm" placeholder="key" name="p_meta_key" value="${productMeta.metaKey}">
									</td>
									<td>
										<input class="form-control input-sm" placeholder="value" name="p_meta_value" value="${productMeta.metaValue}">
									</td>
									<td class="col-sm-1">
										<div class="btn-group">
											<button type="button" class="p_remove_meta_field btn btn-sm btn-default" value="${productMeta.id}">
												<i class="fa fa-minus"></i>
											</button>
										</div>
									</td>
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
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="fileinput fileinput-new" data-provides="fileinput" style="width: 100%;">
							<h4>
								<label>Image</label>
								<div class="form-group pull-right">
								  	<div class="btn-group">
									    <span class="btn btn-xs btn-default btn-file"><span class="fileinput-new"><i class="glyphicon glyphicon-hdd"></i> Browse</span><span class="fileinput-exists"><i class="glyphicon glyphicon-hdd"></i> Change</span><input type="file" name="..."></span>
									    <a href="#" class="btn btn-xs btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
									</div>
								</div>
								<div class="clearfix"></div>
							</h4>
							<div class="row">
								<div class="col-lg-7">
									<p>Upload an image of this product.</p>
									<small>
										<ul>
											<li>Recommended dimension is 160x160px.</li>
											<li>Bigger image will be scaled down.</li>
											<li>You can also make use of import feature to import image from NTUC website, if available.</li>
										</ul>
									</small>
								</div>
								<div class="col-lg-5">
								  	<div class="fileinput-new thumbnail pull-right" style="width: 160px; height: 160px;">
								  		<input id="p_image_url" type="hidden" name="p_image_url" value="${product.imageUrl }"/>
									    <img id="p_image" src="${product.imageUrl }">
									</div>
									<div class="clearfix"></div>
									<div class="fileinput-preview fileinput-exists thumbnail pull-right" style="max-width: 200px; max-height: 150px;"></div>
								</div>
							</div>
						</div>
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
									<td><i class="fa fa-calendar" title="${p_audit.date}" style="cursor:pointer;"></i>&nbsp;<span class="format-date"><fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm:ss" value="${p_audit.date}" /></span>&nbsp;<span style="color:#aaa;">authored by</span>&nbsp;${p_audit.entity.registeredBy }</td>
									<td><a class="audit" href="#" data-revision-id="${p_audit.revisionId }" data-poload="TestServlet">View Details</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
</div>
	<!-- sample-content.jsp -->
	<script>
	$(document).ready(function(){
		$("#p_category").select2({
			tags: [${p_category}],
			multiple: true
		});

		$('.format-date').each(function (id, element) {
			$(element).text($.format.prettyDate($(element).text()));
		});
		
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
						'<td class="col-sm-1">'+
							'<div class="btn-group">'+
								'<button type="button" class="p_remove_meta_field btn btn-sm btn-default" value="">'+
									'<i class="fa fa-minus"></i>'+
								'</button>'+
							'</div>'+
						'</td>'+
					'</tr>'
			);	
		});

		// Binding event to dynamically added elements
		// See http://stackoverflow.com/questions/1359018/in-jquery-how-to-attach-events-to-dynamic-html-elements
		$('body').on("click", '.p_remove_meta_field', function(e){
			var id = $(this).val();
			if(id != ""){
				$('#p_meta_id_removals').val(function(i, val){
					return val + (val? ',' + id : id);
				});
			}
			$(this).parent().parent().parent().remove();
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
		<jsp:param value="js/bootstrap-fileupload.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.min.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->