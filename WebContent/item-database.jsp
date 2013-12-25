<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" name="css" />
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
			<div class="page-header">
				<h1>
					Item Database
				</h1>
			</div>
			<ol class="breadcrumb">
				<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
				<li class="active"><i class="icon-edit"></i> Item Database</li>
			</ol>
			<div class="row">
				<div class="col-lg-8">
					<c:forEach items="${products}" var="product">
						<div class="media">
						  <a class="pull-left" href="#">
						    <img class="media-object" src="http://placehold.it/100x100">
						  </a>
						  <div class="media-body">
						  	<div class="row">
						  		<div class="col-lg-10">
						  			<h5 class="media-heading"><strong>${product.name }</strong></h5>
								    <c:set var="categories" value="${fn:split(product.category, ',')}" />
								    <c:forEach items="${categories}" var="category">
								    	<span class="badge">${category }</span>
								    </c:forEach>
								    <p>
								    	<br/>
								    	<small><strong><i class="fa fa-money"></i>&nbsp;&nbsp;Price:</strong> ${product.price }</small>
								    	<br/>
								    	<small><strong><i class="fa fa-truck"></i>&nbsp;&nbsp;Weight:</strong> ${product.weight }</small>
								    </p>
						  		</div>
						  		<div class="col-lg-2">
						  			<h1><span class="label label-info">32</span></h1>
						  		</div>
						  	</div>
						  </div>
						</div>
					</c:forEach>
					<div class="row">
						<div class="col-lg-12">
							<ul class="pull-right pagination">
							  <li><a href="#">&laquo;</a></li>
							  <li><a href="#">1</a></li>
							  <li><a href="#">2</a></li>
							  <li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">5</a></li>
							  <li><a href="#">&raquo;</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="col-lg-12">
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
													</div>
												</div>
											</h4>
											<span>Click to expand criteria. Fill in the details you wish to include in your search.</span>
										</div>
									</div>
								</div>
								<div class="panel-footer" style="padding:0px;">
									<div class="panel-group" id="accordion">
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;">
									    <div class="panel-heading">
									      <h4 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
									          Keyword
									        </a>
									      </h4>
									    </div>
									    <div id="collapseOne" class="panel-collapse collapse">
									      <div class="panel-body" style="background-color:white;">
							      			<div class="input-group" style="width:100%;">
												<input class="form-control input-sm" />
												<h5><strong>Search in:</strong></h5>
												<div class="checkbox">
												  <label>
												    <input type="checkbox" value="">
												    Name
												  </label>
												</div>
												<div class="checkbox">
												  <label>
												    <input type="checkbox" value="">
												    Description
												  </label>
												</div>
												<div class="checkbox">
												  <label>
												    <input type="checkbox" value="">
												    Additional Data
												  </label>
												</div>
											</div>
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;overflow:visible;">
									    <div class="panel-heading">
									      <h4 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
									          Price
									        </a>
									      </h4>
									    </div>
									    <div id="collapseThree" class="panel-collapse collapse">
									      <div class="panel-body" style="background-color:white;overflow:visible;">
											<div class="input-group">
										      <div class="input-group-btn">
										        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Less than <span class="caret"></span></button>
										        <ul class="dropdown-menu">
										          <li><a href="#">Less than</a></li>
										          <li><a href="#">Less than or equal</a></li>
										          <li><a href="#">Equal</a></li>
										          <li><a href="#">Greater than or equal</a></li>
										          <li><a href="#">Greater than</a></li>
										        </ul>
										      </div><!-- /btn-group -->
										      <input type="text" class="form-control">
										    </div><!-- /input-group -->
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;overflow:visible;">
									    <div class="panel-heading">
									      <h4 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
									          Weight
									        </a>
									      </h4>
									    </div>
									    <div id="collapseFour" class="panel-collapse collapse">
									      <div class="panel-body" style="background-color:white;overflow:visible;">
											<div class="input-group">
										      <div class="input-group-btn">
										        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Less than <span class="caret"></span></button>
										        <ul class="dropdown-menu">
										          <li><a href="#">Less than</a></li>
										          <li><a href="#">Less than or equal</a></li>
										          <li><a href="#">Equal</a></li>
										          <li><a href="#">Greater than or equal</a></li>
										          <li><a href="#">Greater than</a></li>
										        </ul>
										      </div><!-- /btn-group -->
										      <input type="text" class="form-control">
										    </div><!-- /input-group -->
									      </div>
									    </div>
									  </div>
									  <div class="panel panel-default" style="border:none;border-radius:0px;border-bottom-width:1px; border-bottom-style:solid; border-bottom-color: rgb(221, 221, 221);margin-top:0px;overflow:visible;">
									    <div class="panel-heading">
									      <h4 class="panel-title">
									        <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
									          Stock
									        </a>
									      </h4>
									    </div>
									    <div id="collapseFive" class="panel-collapse collapse">
									      <div class="panel-body" style="background-color:white;overflow:visible;">
											<div class="input-group">
										      <div class="input-group-btn">
										        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Less than <span class="caret"></span></button>
										        <ul class="dropdown-menu">
										          <li><a href="#">Less than</a></li>
										          <li><a href="#">Less than or equal</a></li>
										          <li><a href="#">Equal</a></li>
										          <li><a href="#">Greater than or equal</a></li>
										          <li><a href="#">Greater than</a></li>
										        </ul>
										      </div><!-- /btn-group -->
										      <input type="text" class="form-control">
										    </div><!-- /input-group -->
									      </div>
									    </div>
									  </div>
									</div>
								</div>
							</div>					
						</div>
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<h4>
										<label>Bookmark</label>
									</h4>
								</div>
								<table class="table">
									<tbody>
										<c:forEach items="${p_categories}" var="p_category">
									    	<tr style="padding-bottom:5px;">
												<td>${p_category}</td>
											</tr>
									    </c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- /.row -->
</div>
<!-- sample-content.jsp -->

<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->