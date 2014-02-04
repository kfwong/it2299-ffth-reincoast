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
		<h1>Edit Profile</h1>
	</div>
	<ol class="breadcrumb">
					<li><a href="dashboard.jsp"><i class="icon-dashboard"></i>Home</a></li>
					<li><a href="MemberViewProfileServlet"><i class="icon-briefcase"></i>Profile</a></li>
					<li class="active">Edit Profile</li>
				</ol>
	<div class="panel panel-default">
		<div class="panel-body">
			<form id="MEdit" class="Volunteer_SignUp" method="post" action="MemberEditProfileServlet">

				<div class="table-responsive">
					<table class="table">
						<thead>
						</thead>


						<tr>
							<th>Name</th>
							
							<th><input type="text" class="form-control" value="${member_datas.name}" name="name" id="name" required autofocus></th>


						</tr>

						<tr>
							<th>NRIC</th>
							<th><small> ${member_datas.nric}</small></th>
						</tr>

						<tr>
							<th>Gender</th>
							<th><small> ${member_datas.gender}</small></th>
						</tr>
						<tr>
							<th>Contact No</th>
							<th><input type="text" class="form-control" value="${member_datas.tel}" name="tel" id="tel" required ></th>
						</tr>
						<tr>
							<th>Address</th>
							<th><input type="text" class="form-control" value="${member_datas.address}" name="address" id="address" required ></th>
						</tr>
						<tr>
							<th>Postal Code</th>
							<th><input type="text" class="form-control" value="${member_datas.postalCode}" name=postalCode id="postalCode" required ></th>
						</tr>

						<tr>
							<th>Email</th>
							<th><input type="text" class="form-control" value="${member_datas.email}" name="email" id="email" required></th>
						</tr>

						<tr>
							<th>UserName</th>
							<th><small>${member_datas.userName }</small></th>

						</tr>

						<!--------------------------------------Confirm Password  -------------------------------------------->




						<tr>
							<th><button class="btn btn-default" type="submit">Save Edit</button>
							<a class="btn btn-default" href="MemberDeactivateServlet">Delete My Account</a>
							<a class="btn btn-default" href="MemberViewProfileServlet">Cancel</a>
							<th>
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
