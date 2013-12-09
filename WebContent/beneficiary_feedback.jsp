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
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">Beneficiary Feedback</h2>
				</div>
				<div class="panel-body">
					<!-- FORM -->
					<form role="form">
						<!--  ROW FOR NAME  -->

						<div class="row">
							<div class="col-xs-12 col-sm-4 col-md-6">
								<label for="Display_Name">NAME *</label> <input type="text"
									class="form-control" name="Name" id="Display_Name"
									placeholder="Enter Name">
							</div>
						</div>
						<br>

						<!--  ROW FOR EMAIL  -->

						<div class="row">
							<div class="col-xs-12 col-sm-4 col-md-6">
								<label for="Display_Email">EMAIL*</label> <input type="text"
									class="form-control" name="Name" id="Display_Email"
									placeholder="Enter Email">
							</div>
						</div>
						<br>
						
						
						<!--  ROW FOR FEEDBACK  -->
						<div class="row">
							<div class="col-xs-12 col-sm-4 col-md-6">
							<label for="Feedback">FEEDBACK*</label>
						<textarea class="form-control" rows="3" id="Feedback"></textarea>
						</div>
						</div>
						<br><br>
						
						<!--  ROW FOR BUTTONS  -->

						<div class="row">
							<div class="col-xs-6 col-sm-4">
								<button type="button" class="btn btn-default">Submit</button>
								<button type="button" class="btn btn-default">Cancel</button>
							</div>
						</div>

					</form>
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