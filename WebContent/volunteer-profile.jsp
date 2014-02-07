<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<style>
@media ( max-width :768px) {
	body {
		margin-top: 20px;
	}
	#page-wrapper {
		width: 100%;
		padding: 60px 15px 150px 75px;
		left: 10%;
	}
	.container{
			padding-top:30px;
			left:20%;
			top:30%;

		}
}
</style>
</head>
<body>

	<!-- sidebar.jsp -->
	<jsp:include page="v-sidebar.jsp"></jsp:include>
	<!-- sidebar.jsp -->

	<!-- sample-content.jsp -->
	<div id="page-wrapper">
		<div class="container">
			<br>
			<br>
			<br>
			<br>
			<div class="page-header">
				<h1>Profile</h1>
			</div>
			<ol class="breadcrumb">
				<li><a href="v-dashboard.jsp"><i class="icon-dashboard"></i>Home</a></li>
				<li class="active">Profile</li>
			</ol>
			<div class="alert alert-dismissable alert-success ${param.isHidden}">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>

				${param.updatedmsg}
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="VVP" method="post"
						action="VolunteerViewProfileServlet">

						<div class="table-responsive">
							<table class="table">
								<thead>
								</thead>


								<tr>
									<th>Name</th>
									<th><small> ${volunteer_data.name }</small></th>


								</tr>

								<tr>
									<th>NRIC</th>
									<th><small> ${volunteer_data.nric }</small></th>
								</tr>

								<tr>
									<th>Gender</th>
									<th><small> ${volunteer_data.gender }</small></th>
								</tr>

								<tr>
									<th>Address</th>
									<th><small> ${volunteer_data.address} Singapore
											${volunteer_data.postalCode} </small></th>

								</tr>

								<tr>
									<th>Email</th>
									<th><small> ${volunteer_data.email }</small></th>
								</tr>

								<tr>
									<th>UserName</th>
									<th><small> ${volunteer_data.userName }</small></th>
								</tr>

								<tr>
									<th>Password</th>
									<th><a href="volunteer-edit-pwd.jsp?isHidden=hidden">Edit
											Password</a></th>
								</tr>

								<tr>

									<th>
										<button class="btn btn-default" type="submit">Modify
											Account</button> <a class="btn btn-default"
										href="VolunteerDeactivateServlet">Delete My Account</a>
									</th>

								</tr>


							</table>

						</div>
					</form>


				</div>

			</div>
		</div>

	</div>

	<script src="js/bootstrap.js"></script>
	<script src="js/tablesorter/jquery.tablesorter.js"></script>
	<script src="js/tablesorter/tables.js"></script>

</body>
</html>

