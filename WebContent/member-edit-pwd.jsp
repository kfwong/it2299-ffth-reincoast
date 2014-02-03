<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />

</jsp:include>
<!-- header.jsp -->
<style type="text/css">
.button {
	margin: .4em;
	padding: 1em;
	cursor: pointer;
	background: #000000;
	text-decoration: none;
	color: #666666;
}

/* Bubble Float Bottom */
.bubble-float-bottom {
	display: inline-block;
	position: relative;
	transition-duration: 0.3s;
	transition-property: transform;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	transform: translateZ(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
}

.bubble-float-bottom:before {
	pointer-events: none;
	position: absolute;
	z-index: -1;
	content: '';
	left: calc(50% - 10px);
	bottom: 0;
	border-style: solid;
	border-width: 10px 10px 0 10px;
	border-color: #000 transparent transparent transparent;
	transition-duration: 0.3s;
	transition-property: bottom;
}

.bubble-float-bottom:hover {
	transform: translateY(-5px) translateZ(0);
}

.bubble-float-bottom:hover:before {
	bottom: -10px;
}
}
</style>

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">



	<div class="button bubble-float-bottom">Bubble Float Bottom</div>
	<br> <br>
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
							<th><input type="password" class="form-control"placeholder="Password" name="password" id="password" required autofocus>
							</th>
						</tr>

						<tr>
							<th>Confirm Password</th>
							<th><input type="Password" class="form-control" placeholder="Confirm Password" name="cfmPassword" id="cfmPassword" required autofocus></th>
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
