<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.css" name="css" />
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2-bootstrap.css" name="css" />
</jsp:include>
<style>
label.error{font-weight: normal;font-size:12px;color:red;font-style:italic;}
.highlight { color: #00adff; }
.bold{ font-weight: bold;}
</style>
<!-- header.jsp -->
<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp">
	<jsp:param value="Product Management" name="active" />
	<jsp:param value="Product Database" name="sub-active" />
</jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">
	<form id="s_form" method="get" action="ProductSearchServlet" role="form" autocomplete="on">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header">
					<h1>
						Product Database
					</h1>
				</div>
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-briefcase"></i> Product Management</li>
					<li class="active">Product Database</li>
				</ol>
				<div class="row">
					<div class="col-lg-8">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<h4>
											<label>Result</label>
										</h4>
										<span>Showing ${s_record_from} ~ ${s_record_to} out of ${s_matching_total} matching record(s).</span>
									</div>
								</div>
							</div>
							<table id="s_result" class="table table-condensed table-hover" style="background-color:white;">
								<c:forEach items="${products}" var="product">
									<tr>
										<td style="border: none;padding-left:15px;padding-right:15px;">
											<h5 style="padding-bottom:5px;border-bottom-width: 1px;border-bottom-style: dotted; border-bottom-color: LightGray;"><strong>${product.name}</strong></h5>
											<div class="media" style="padding-bottom: 15px;">
											  <a class="pull-left" href="#">
											    <img class="media-object" style="width:100px;height: 100px;" src="${product.imageUrl }">
											  </a>
											  <div class="media-body">
											  	<div class="row">
											  		<div class="col-lg-11">
													    <c:set var="categories" value="${fn:split(product.category, ',')}" />
													    <c:forEach items="${categories}" var="category">
													    	<span class="badge">${category }</span>
													    </c:forEach>
													    <p>
													    	<br/>
													    	<small><strong><i class="fa fa-money"></i>&nbsp;&nbsp;Price:</strong> ${product.price }</small>
													    	<br/>
													    	<small><strong><i class="fa fa-truck"></i>&nbsp;&nbsp;Weight:</strong> ${product.weight }</small>
													    	<br/>
													    	<small><strong><i class="fa fa-archive"></i>&nbsp;&nbsp;Stock Available:</strong> ${product.weight }</small>
													    </p>
											  		</div>
											  		<div class="col-lg-1">
														<a href="ProductViewServlet?id=${product.id}" class="btn btn-xs btn-default pull-right" style="margin-bottom: 5px;">
															<i class="fa fa-info-circle"></i> View
														</a>
														<a href="ProductEditServlet?id=${product.id}" class="btn btn-xs btn-default pull-right" style="margin-bottom: 5px;">
															<i class="fa fa-pencil"></i> Edit
														</a>
											  		</div>
											  	</div>
											  </div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="pull-right">
									<ul id="pagination" class="pagination">
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">
											<h4>
												<label>Search</label>
												<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
													<div class="btn-group">
														<button type="submit" class="btn btn-xs btn-default" value="Search">
															<i class="glyphicon glyphicon-search"></i> Search
														</button>
														<a href="http://zxing.appspot.com/scan?ret=http%3A%2F%2Freincoast-kfwong.rhcloud.com%2FProductViewServlet%3Fcode%3D%7BCODE%7D%26SCAN_FORMATS%3DUPC_A%2CEAN_13" class="btn btn-xs btn-default">
															<i class="fa fa-barcode"></i> Scan Code
														</a>
													</div>
												</div>
											</h4>
											<span>Fill in the criterias you wish to include in your search. Leave the criteria blank to match any result.</span>
										</div>
									</div>
								</div>
								<div class="panel-footer" style="padding:0px;">
									<div class="panel-group">
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;">
									    <div class="panel-heading">
									      <h4 class="panel-title">Keyword <i class="fa fa-check-circle hidden"></i></h4>
									    </div>
									    <div class="panel-collapse">
									      <div class="panel-body" style="background-color:white;">
							      			<div class="input-group" style="width:100%;">
							      				<p><small>Use (*) to match any number of characters, (?) to match any single character.</small></p>
												<input class="form-control input-sm s-flag" name="s_keyword" value="${s_keyword}"/>
												<h5><strong>Search in:</strong></h5>
												<div class="checkbox">
												  <label>
												    <input class="s_keyword_options" type="checkbox" value="name" name="s_keyword_options" checked="true">
												    Name
												  </label>
												</div>
												<div class="checkbox">
												  <label>
												    <input class="s_keyword_options" type="checkbox" value="description" name="s_keyword_options" checked="true">
												    Description
												  </label>
												</div>
											</div>
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;">
									    <div class="panel-heading">
									      <h4 class="panel-title">Category <i class="fa fa-check-circle hidden"></i></h4>
									    </div>
									    <div class="panel-collapse">
									      <div class="panel-body" style="background-color:white;">
							      			<div class="input-group" style="width:100%;">
												<input id="s_category" class="form-control input-sm s-flag" name="s_category" value="${s_category}" />
											</div>
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;overflow:visible;">
									    <div class="panel-heading">
									      <h4 class="panel-title">Price <i class="fa fa-check-circle hidden"></i></h4>
									    </div>
									    <div class="panel-collapse">
									      <div class="panel-body" style="background-color:white;overflow:visible;">
											<div class="input-group">
										      <div class="input-group-btn">
										        <button id="s_price_option" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Less than <span class="caret"></span></button>
										        <input type="hidden" name="s_price_option"  value="${s_price_option}"/>
										        <ul class="s_dropdown_options dropdown-menu">
										          <li><input type="hidden" value="LESS_THAN"/><a href="#">Less than</a></li>
										          <li><input type="hidden" value="LESS_THAN_OR_EQUAL"/><a href="#">Less than or equal</a></li>
										          <li><input type="hidden" value="EQUAL"/><a href="#">Equal</a></li>
										          <li><input type="hidden" value="MORE_THAN_OR_EQUAL"/><a href="#">More than or equal</a></li>
										          <li><input type="hidden" value="MORE_THAN"/><a href="#">More than</a></li>
										          <li><input type="hidden" value="BETWEEN"/><a href="#">Between</a></li>
										        </ul>
										      </div><!-- /btn-group -->
										      <input type="text" class="form-control s-flag" name="s_price" value="${s_price}">
										      <span class="input-group-addon hidden">~</span>
											  <input type="text" class="form-control hidden" name="s_price_to" value="${s_price_to}">
										    </div><!-- /input-group -->
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;overflow:visible;">
									    <div class="panel-heading">
									      <h4 class="panel-title">Weight <i class="fa fa-check-circle hidden"></i></h4>
									    </div>
									    <div class="panel-collapse">
									      <div class="panel-body" style="background-color:white;overflow:visible;">
											<div class="input-group">
										      <div class="input-group-btn">
										        <button id="s_weight_option" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Less than <span class="caret"></span></button>
										        <input type="hidden" name="s_weight_option" value="${s_weight_option}"/>
										        <ul class="s_dropdown_options dropdown-menu">
										          <li><input type="hidden" value="LESS_THAN"/><a href="#">Less than</a></li>
										          <li><input type="hidden" value="LESS_THAN_OR_EQUAL"/><a href="#">Less than or equal</a></li>
										          <li><input type="hidden" value="EQUAL"/><a href="#">Equal</a></li>
										          <li><input type="hidden" value="MORE_THAN_OR_EQUAL"/><a href="#">More than or equal</a></li>
										          <li><input type="hidden" value="MORE_THAN"/><a href="#">More than</a></li>
										          <li><input type="hidden" value="BETWEEN"/><a href="#">Between</a></li>
										        </ul>
										      </div><!-- /btn-group -->
										      <input type="text" class="form-control s-flag" name="s_weight" value="${s_weight}">
										      <span class="input-group-addon hidden">~</span>
											  <input type="text" class="form-control hidden" name="s_weight_to" value="${s_weight_to}">
										    </div><!-- /input-group -->
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;overflow:visible;">
									    <div class="panel-heading">
									      <h4 class="panel-title">Stock <i class="fa fa-check-circle hidden"></i></h4>
									    </div>
									    <div class="panel-collapse">
									      <div class="panel-body" style="background-color:white;overflow:visible;">
											<div class="input-group">
										      <div class="input-group-btn">
										        <button id="s_stock_option" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Less than <span class="caret"></span></button>
										        <input type="hidden" name="s_stock_option" value="LESS_THAN"/>
										        <ul class="s_dropdown_options dropdown-menu">
										          <li><input type="hidden" value="LESS_THAN"/><a href="#">Less than</a></li>
										          <li><input type="hidden" value="LESS_THAN_OR_EQUAL"/><a href="#">Less than or equal</a></li>
										          <li><input type="hidden" value="EQUAL"/><a href="#">Equal</a></li>
										          <li><input type="hidden" value="MORE_THAN_OR_EQUAL"/><a href="#">More than or equal</a></li>
										          <li><input type="hidden" value="MORE_THAN"/><a href="#">More than</a></li>
										          <li><input type="hidden" value="BETWEEN"/><a href="#">Between</a></li>
										        </ul>
										      </div><!-- /btn-group -->
										      <input type="text" class="form-control s-flag" name="s_stock" value="${s_stock}">
										      <span class="input-group-addon hidden">~</span>
											  <input type="text" class="form-control hidden" name="s_stock_to" value="${s_stock_to}">
										    </div><!-- /input-group -->
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;">
									    <div class="panel-heading">
									      <h4 class="panel-title">Additional Data <i class="fa fa-check-circle hidden"></i></h4>
									    </div>
									    <div class="panel-collapse">
									      <div class="panel-body" style="background-color:white;">
									      	<small>You can also include custom field in your search criteria.</small>
									      </div>
									    </div>
									    <table class="table">
											<tbody id="s_meta_fields">
											</tbody>
										</table>
										<div class="panel-footer" style="padding:10px 15px 0px;border:none;border-radius:0px;border-top-width:1px; border-top-style:solid; border-top-color: rgb(221, 221, 221);">
											<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;margin-bottom:10px;">
												<div class="btn-group">
													<button id="s_add_meta_field" type="button" class="btn btn-xs btn-default">
														<i class="icon-plus"></i> Add field
													</button>
												</div>
											</div>
											<div class="clearfix"></div>
										</div>
									  </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!-- /.row -->
		</div>
	</form>
</div>
	<!-- sample-content.jsp -->
	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/select2/3.4.4/select2.min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js" name="js" />
		<jsp:param value="js/bootstrap-paginator.min.js" name="js" />
		<jsp:param value="js/jquery.highlight.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->
	<script>
	$(document).ready(function(){
		var metaKeys = new Array();
		var metaValues = new Array();
		<c:forEach var="metaKey" items="${s_meta_key}">
		  metaKeys.push("${metaKey}");
		</c:forEach>
		<c:forEach var="metaValue" items="${s_meta_value}">
		  metaValues.push("${metaValue}");
		</c:forEach>

		if(metaKeys.length >0){
			for(var i=0; i< metaKeys.length;i++){
				$('#s_meta_fields').append(
						'<tr style="background-color:white;">'+
							'<td class="col-sm-4" style="padding-left: 14px;"><input class="form-control input-sm s-flag" placeholder="key" name="s_meta_key" value="'+metaKeys[i]+'"></td>'+
							'<td><input class="form-control input-sm" placeholder="value" name="s_meta_value" value="'+metaValues[i]+'"></td>'+
							'<td class="col-sm-1">'+
								'<div class="btn-group">'+
									'<button type="button" class="s_remove_meta_field btn btn-sm btn-default" value="">'+
										'<i class="fa fa-minus"></i>'+
									'</button>'+
								'</div>'+
							'</td>'+
						'</tr>'
				);
			}
		}else{
			$('#s_meta_fields').append(
					'<tr style="background-color:white;">'+
						'<td class="col-sm-4" style="padding-left: 14px;"><input class="form-control input-sm s-flag" placeholder="key" name="s_meta_key"></td>'+
						'<td><input class="form-control input-sm" placeholder="value" name="s_meta_value"></td>'+
						'<td class="col-sm-1">'+
							'<div class="btn-group">'+
								'<button type="button" class="s_remove_meta_field btn btn-sm btn-default" value="">'+
									'<i class="fa fa-minus"></i>'+
								'</button>'+
							'</div>'+
						'</td>'+
					'</tr>'
			);
		}

		$('.s-flag').each(function(index){
			if($(this).val() == ""){
				$(this).closest('.panel').find('.panel-title').removeClass("bold");
				$(this).closest('.panel').find('.panel-title').children('i').addClass("hidden");
			}else{
				$(this).closest('.panel').find('.panel-title').addClass("bold");
				$(this).closest('.panel').find('.panel-title').children('i').removeClass("hidden");
			}
		});

		$('.s-flag').on('change', function(e){
			if($(this).val() == ""){
				$(this).closest('.panel').find('.panel-title').removeClass("bold");
				$(this).closest('.panel').find('.panel-title').children('i').addClass("hidden");
			}else{
				$(this).closest('.panel').find('.panel-title').addClass("bold");
				$(this).closest('.panel').find('.panel-title').children('i').removeClass("hidden");
			}
		});
		
		$('#s_add_meta_field').on("click", function(e){
			$('#s_meta_fields').append(
					'<tr style="background-color:white;">'+
						'<td class="col-sm-4" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="s_meta_key"></td>'+
						'<td><input class="form-control input-sm" placeholder="value" name="s_meta_value"></td>'+
						'<td class="col-sm-1">'+
							'<div class="btn-group">'+
								'<button type="button" class="s_remove_meta_field btn btn-sm btn-default" value="">'+
									'<i class="fa fa-minus"></i>'+
								'</button>'+
							'</div>'+
						'</td>'+
					'</tr>'
			);	
		});
		
		$('body').on("click", '.s_remove_meta_field', function(e){
			$(this).parent().parent().parent().remove();
		});
		
        $('#s_result').highlight("${s_keyword}".replace(/[\*\?]/, "").split(" "));
		
		$(".s_dropdown_options").each(function(index){
			var option = $(this).prev().val();

			switch(option){
			case "LESS_THAN":
				$(this).prev().prev().html('Less than <span class="caret"></span>');
				break;
			case "LESS_THAN_OR_EQUAL":
				$(this).prev().prev().html('Less than or equal <span class="caret"></span>');
				break;
			case "EQUAL":
				$(this).prev().prev().html('Equal <span class="caret"></span>');
				break;
			case "MORE_THAN_OR_EQUAL":
				$(this).prev().prev().html('More than or equal <span class="caret"></span>');
				break;
			case "MORE_THAN":
				$(this).prev().prev().html('More than <span class="caret"></span>');
				break;
			case "BETWEEN":
				$(this).prev().prev().html('Between <span class="caret"></span>');
				$(this).closest(".input-group").children().last().prev("span").andSelf().removeClass('hidden');
				break;
			default:
				$(this).prev().prev().html('Less than <span class="caret"></span>');
				$(this).prev().val('LESS_THAN');
				break;
			}		
		});

		$(".s_keyword_options").each(function(index){
			var options = new Array();
			<c:forEach var="s_keyword_option" items="${s_keyword_options}">
			  options.push("${s_keyword_option}");
			</c:forEach>

			for(var i = 0; i<options.length; i++){
				if(options[i] == $(this).val()){
					$(this).prop("checked", true);
					break;
				}else{
					$(this).prop("checked", false);
				}
			}
		});
		
		$("#s_category").select2({
			tags: [${s_categories}],
			createSearchChoice: function() { return null; },
			multiple: true
		});
	
		$(".s_dropdown_options a").click(function(e){
			e.preventDefault();
			$(this).closest('div').children('button').html($(this).text()+' <span class="caret"></span>');
			$(this).closest("ul").prev().val($(this).prev().val());
	
			if($(this).prev().val() == "BETWEEN"){
				$(this).closest(".input-group").children().last().prev("span").andSelf().removeClass('hidden');
			}else{
				$(this).closest(".input-group").children().last().prev("span").andSelf().addClass('hidden');
			}
		});
	
		$.validator.addMethod("money", function(value, element) {
		    return this.optional(element) || /^(\d{1,9})(\.\d{1,2})?$/.test(value);
		}, "Must be in SGD currency format 0.99");
	
		$('#s_form').validate({
			rules:{
				s_weight:{
					number: true
				},
				s_price:{
					money: true
				}
			},
			errorPlacement: function (error, element){
				error.insertAfter($(element).closest(".input-group"));
			}
		});

        $('#pagination').bootstrapPaginator({
        	bootstrapMajorVersion: 3,
            currentPage: "${s_current_page}",
            totalPages: Math.ceil(${(s_matching_total)/10}),
            pageUrl: function(type, page, current){
                return "${s_url}&page="+page;
            },
            onPageClicked: function(e,originalEvent,type,page){
                e.stopImmediatePropagation();
            }
        });
	});
	</script>