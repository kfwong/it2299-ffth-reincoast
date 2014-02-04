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
	<div class="page-header">
		<h1>Profile</h1>
	</div>
	<ol class="breadcrumb">
					<li><a href="dashboard.jsp"><i class="icon-dashboard"></i>Home</a></li>
					<li class="active">Profile</li>
				</ol>
	<div class="alert alert-dismissable alert-success ${param.isHidden}">
				<button type="button" class="close" data-dismiss="alert"aria-hidden="true">&times;</button>
				
				${param.updatedmsg}
			</div>
	<div class="panel panel-default">

		<div class="panel-body">
			<form class="Modify_Profile" method="post" action="MemberViewProfileServlet">

				<div class="table-responsive">
					<table class="table">
						<thead>
						</thead>


						<tr>
							<th>Name</th>
							<th><small> ${member_data.name }</small></th>


						</tr>

						<tr>
							<th>NRIC</th>
							<th><small> ${member_data.nric }</small></th>
						</tr>

						<tr>
							<th>Gender</th>
							<th><small> ${member_data.gender }</small></th>
						</tr>

						<tr>
							<th>Address</th>
							<th><small> ${member_data.address} Singapore
									${member_data.postalCode} </small></th>

						</tr>

						<tr>
							<th>Email</th>
							<th><small> ${member_data.email }</small></th>
						</tr>

						<tr>
							<th>UserName</th>
							<th><small> ${member_data.userName }</small></th>
						</tr>

						<tr>
							<th>Password</th>
							<th><a href="member-edit-pwd.jsp?isHidden=hidden">Edit Password</a></th>
						</tr>

						<tr>

							<th>
								<button class="btn btn-default" type="submit">Modify Account</button> 
								<a class="btn btn-default" href="MemberDeactivateServlet">Delete My Account</a>
							</th>

						</tr>


					</table>

				</div>
			</form>


		</div>

	</div>
</div>


<!-- sample-content.jsp -->
<!-- footer.jsp -->
<jsp:include page="footer.jsp">
	<jsp:param value="/path/to/js1" name="js" />
</jsp:include>
<!-- footer.jsp -->