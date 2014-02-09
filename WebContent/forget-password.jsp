<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<style>
body {
	background-image: url('img/background-login.png');
}

.panel,.panel-body {
	background-color: white;
	border-radius: 10px;
}

.container {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
}
</style>
</head>
<body>

	<form class="form-signin" method="post" action="ForgetPasswordServlet">
		<div id="page-wrapper">
			<!-- forget password/sign up as volunteer/sign up as member -->
			<div class="container">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-offset-4 col-lg-4">
							<div
								class="alert alert-dismissable ${param.isType } ${param.isHidden}">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">&times;</button>

								${param.msg}
							</div>
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">
											<h1 style="text-align: center;">Can't Sign in?</h1>

											<p>Enter your email and select your role. We'll send you
												password reset instruction shortly.</p>

											<strong> Email </strong> <input type="email"
												class="form-control" placeholder="email" id="email"
												name="email" required autofocus> <strong>You
												are a...</strong><br>

											<div class="radio-inline">
												<small> <label> <input type="radio"
														name="role" id="STAFF" value="STAFF" checked>
														STAFF
												</label></small>
											</div>
											<div class="radio-inline">
													<small><label> <input type="radio" name="role"
														id="VOLUNTEER" value="VOLUNTEER"> VOLUNTEER
													</label></small>
												</div>

												<button class="btn btn-default " type="submit">Send
													me reset instructions</button> 
												<a class="btn btn-default" href="login.jsp">Cancel</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>