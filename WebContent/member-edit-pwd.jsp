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
		<h1>Change Password</h1>
	</div>
	<ol class="breadcrumb">
					<li><a href="dashboard.jsp"><i class="icon-dashboard"></i>Home</a></li>
					<li><a href="MemberViewProfileServlet"><i class="icon-briefcase"></i>Profile</a></li>
					<li class="active">Change Password</li>
				</ol>
					<div class="alert alert-dismissable alert-danger ${param.isHidden}">
				<button type="button" class="close" data-dismiss="alert"aria-hidden="true">&times;</button>
				
				${param.failmsg}
			</div>
	<div class="panel panel-default">
		<div class="panel-body">
			<form id="MePwd" class="Volunteer_SignUp" method="post" action="MemberEditPwdServlet">

				<div class="table-responsive">
					<table class="table">
						<thead>
						</thead>


						<!--------------------------------------Confirm Password  -------------------------------------------->
						<tr> 
							<th>Current Password</th>
							<th><input type="password" class="form-control" placeholder="Current Password" name="Current_password" id="Current_password" required autofocus></th>
						</tr>
						<tr>
							<th>Password</th>
							<th><input type="password" class="form-control"placeholder="Password" name="password" id="password" required >
							</th>
						</tr>

						<tr>
							<th>Confirm Password</th>
							<th><input type="Password" class="form-control" placeholder="Confirm Password" name="cfmPassword" id="cfmPassword" required ></th>
						</tr>


						<tr>
							<th><button class="btn btn-default" type="submit">Save password</button> 
							<a class="btn btn-default" href="dashboard.jsp">Back to homepage</a>
						</th>
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
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js" name="js" />			

</jsp:include>
<script type="text/JavaScript">

</script>
<!-- footer.jsp -->

<script type="text/javascript">
$('#MePwd').validate({
	rules: {
		 password: "required",
		 cfmPassword : {
		      equalTo: "#password"
		    }
		}
	});

</script>
