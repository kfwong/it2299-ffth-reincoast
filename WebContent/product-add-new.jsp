<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2-bootstrap.css" name="css" />
	<jsp:param value="css/bootstrap-fileupload.css" name="css" />
</jsp:include>
<style>
label.error{font-weight: normal;font-size:12px;color:red;font-style:italic;}
</style>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp">
	<jsp:param value="Product Management" name="active" />
	<jsp:param value="New Product" name="sub-active" />
</jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">
	<form id="p_form" method="post" action="/it2299-ffth-reincoast/ProductRegistrationServlet" role="form">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header">
					<h1>
						Product <small>Add New</small>
					</h1>
				</div>
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-briefcase"></i> Product Management</li>
					<li class="active">New Product</li>
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
									<button id="p_import" type="button" class="btn btn-xs btn-default" data-content="<small><i class='glyphicon glyphicon-repeat'></i>&nbsp;Hacking NTUC database...<small>" data-toggle="modal" data-placement="left" data-html="true" data-container="body" data-trigger="manual" data-target="#myModal">
										<i class="glyphicon glyphicon-import"></i> Import
									</button>
									<button id="p_action" type="submit" class="btn btn-xs btn-default" name="p_action" value="Submit">
										<i class="glyphicon glyphicon-ok"></i> Submit
									</button>
								</div>
							</div>
						</h4>
						<div class="form-group">
							<label class="control-label">Name</label>
							<small class="help-block">The display name of the item.</small>
							<input id="p_name" class="form-control input-sm" name="p_name">
						</div>

						<div class="form-group">
							<label>Description</label>
							<small class="help-block">The short description of the item.</small>
							<textarea class="form-control input-sm" rows="3" name="p_description"></textarea>
						</div>
						<div class="form-group">
							<label class="control-label">Code</label>
							<small class="help-block">i.e. Barcode</small> 
							<input class="form-control input-sm" name="p_code">
						</div>

						<div class="form-group">
							<label>Unit of Measure</label> 
							<input class="form-control input-sm" name="p_unit_of_measure">
						</div>

						<div class="form-group">
							<label>Price</label>
							<small class="help-block">In Singapore Dollar (SGD).</small>
							<input id="p_price" class="form-control input-sm" name="p_price">
						</div>
						<div class="form-group">
							<label>Weight</label>
							<small class="help-block">In grams (G)</small>
							<input id="p_weight" class="form-control input-sm" name="p_weight">
						</div>
						<div class="form-group">
							<label>Category</label>
							<small class="help-block">Categorize your product. </small>
							<input id="p_category" class="form-control input-sm" name="p_category" type="text" />
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
							<tr>
								<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>
								<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>
							</tr>
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
								  		<input id="p_image_url" type="hidden" name="p_image_url" value="http://placehold.it/160x160"/>
									    <img id="p_image" src="http://placehold.it/160x160">
									</div>
									<div class="clearfix"></div>
									<div class="fileinput-preview fileinput-exists thumbnail pull-right" style="max-width: 200px; max-height: 150px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				
			</div>
		</div>
	</form>
	<!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">Import</h4>
	      </div>
	      <div class="modal-body">
	        <p>Copy the product URL from NTUC website:</p>
	        <input id="p_import_url" class="form-control input-sm" type="text"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button id="p_import_submit" type="button" class="btn btn-primary" data-dismiss="modal">Import</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</div>
	<!-- sample-content.jsp -->

	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js" name="js" />
		<jsp:param value="js/bootstrap-fileupload.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->
	<script type="text/javascript">
	$(document).ready(function(){		
		$("#p_import_submit").on("click", function(e){
			$('#p_import').popover('show');
			$.ajax({
				type: "POST",
				url: "ProductImportServlet",
				data: {
					p_import_url: $('#p_import_url').val()
				}
			}).done(function(response){
				$('#p_import').popover('hide');
				var data = $.parseJSON(response);

				$('#p_name').val(data.name);
				$('#p_weight').val(data.weight);
				$('#p_price').val(data.price);
				$('#p_image').attr('src', data.image);
				$('#p_image_url').val(data.image);
			});
		});

		$('#p_add_meta_field').on("click", function(e){
			$('#p_meta_fields').append(
					'<tr>'+
						'<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>'+
						'<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>'+
					'</tr>'
			);	
		});

		$('#p_category').select2({
			tags: [${p_category}],
			multiple: true
		});

		$.validator.addMethod("money", function(value, element) {
		    return this.optional(element) || /^(\d{1,9})(\.\d{1,2})?$/.test(value);
		}, "Must be in SGD currency format 0.99");

		$('#p_form').validate({
			rules:{
				p_weight:{
					number: true
				},
				p_price:{
					money: true
				}
			}
		});
	});
	</script>