<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
	
	    
</jsp:include>
<!-- Latest compiled and minified CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<div id="page-wrapper container">

	<div class="col-lg-4">
	<div class="alert alert-dismissable ${param.isType } ${param.isHidden}">
			<button type="button" class="close" data-dismiss="alert"aria-hidden="true">&times;</button>
			
			${param.msg}
		</div>
		<div class="row">

			<form class="form-signin" method="post" action="MemberLogInServlet">
				<h2>LOGIN</h2>
				<input type="text" class="form-control" placeholder="User Name"
					name="username" required autofocus> <input type="password"
					class="form-control" placeholder="Password" name="password"
					required> <br>

				<h5>
					You are logging in as... <br>
				</h5>

				<div class="radio-inline">
					<label> <input type="radio" name="role" id="STAFF"
						value="STAFF" checked> STAFF
					</label>
				</div>
				<div class="radio-inline">
					<label> <input type="radio" name="role" id="VOLUNTEER"
						value="VOLUNTEER"> VOLUNTEER
					</label>
				</div>

				<button class="btn btn-lg btn-primary btn-block" type="submit">
					SIGN IN</button>

			</form>
		</div>
	</div>
	<div class="col-lg-4">
		<div class="row"></div>
	</div>
</div>
