<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<link href="css/bootstrap.css" rel="stylesheet">
    	<link href="css/sb-admin.css" rel="stylesheet">
   		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   		
   		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
		
		<style>
		body{
			background-image: url('img/background-login.png');
		}
		
		.panel, .panel-body{
			background-color: white;
			border-radius: 10px;
		}
		
		.container{
			padding-top:30px;
			position: absolute;
			left:50%;
			top:50%;
			transform: translate(-50%, -50%);
			-ms-transform: translate(-50%, -50%);
			-webkit-transform: translate(-50%, -50%);
		}
		
		@media (max-width:768px) {
			.container{
				padding-top:30px;
				width:95%;
				position: absolute;
				left:50%;
				top:50%;
				transform: translate(-50%, -50%);
				-ms-transform: translate(-50%, -50%);
				-webkit-transform: translate(-50%, -50%);
			}
		}
		
		</style>
	</head>
	<body>
		<form class="form-signin" method="post" action="MemberLogInServlet">
			<div id="page-wrapper">
			<!-- forget password/sign up as volunteer/sign up as member -->
				<div class="container">
					<div class="row">
						<div class="col-lg-offset-4 col-lg-4">
							<div class="row">
								<div class="col-lg-12">
									<div class="alert alert-dismissable ${param.isType } ${param.isHidden}" style="padding-top:15px;">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
										
										${param.msg}
									</div>
								</div>
							</div>
							<div class="panel panel-default">
							  <div class="panel-body">
							    <div class="row">
									<div class="col-lg-12">
										<h1 style="text-align:center;">Login</h1>
										
										<hr/>
										
										<div class="form-group">
											<input type="text" class="form-control" placeholder="User Name" name="username" required autofocus> 
										</div>
										
										<div class="form-group">
											<input type="password" class="form-control" placeholder="Password" name="password"required>
										</div>

										<p>
											<small>You are logging in as...</small>
										</p>
										
										<label class="radio-inline">
											<input type="radio" name="role" id="STAFF" value="STAFF" checked> Staff
										</label>
										<label class="radio-inline">
											<input type="radio" name="role" id="VOLUNTEER" value="VOLUNTEER"> Volunteer
										</label>							
									</div>
								</div>
							  </div>
							  <div class="panel-footer">
							  	<p>
									<input class="btn btn-md btn-primary pull-right" type="submit" value="Sign In"></input>
									<div class="clearfix"></div>
								</p>
							  </div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-offset-4 col-lg-4">
								<small>
									<a href="forget-password.jsp?isHidden=hidden" >Forgot password?</a>
									<span style="color:rgb(66, 139, 202);">|</span>
									<a href="volunteer-signup.jsp">Sign up as volunteer</a>
									<span style="color:rgb(66, 139, 202);">|</span>
									<a href="member-signup.jsp">Sign up as member</a>
								</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
