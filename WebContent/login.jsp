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
	<!-- sample-content.jsp -->
	<div class="row">
		<div class="col-xs-6 col-md-4"></div>
		<div class="col-xs-6 col-md-4">
			<form class="form-signin" method="post"
				action="/it2299-ffth-reincoast/LogInServlet">
				<h2>LOGIN </h2>
				<input type="text" class="form-control" placeholder="User Name"
					name="userName" required autofocus> <input type="password"
					class="form-control" placeholder="Password" name="password"
					required autofocus> <br> 
					
					<h5>You are
					logging in as... <br></h5>

				<div class="radio-inline">
					<label> <input type="radio" name="optionsRadios" id="STAFF"
						value="STAFF" checked> STAFF</label>
				</div>
				<div class="radio-inline">
					<label> <input type="radio" name="optionsRadios"
						id="VOLUNTEER" value="VOLUNTEER"> VOLUNTEER
					</label>
				</div>

				<button class="btn btn-lg btn-primary btn-block" type="submit">
					SIGN IN</button>

			</form>

		</div>
	</div>
	<br> <br>
	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="/path/to/js1" name="js" />
	</jsp:include>
	<!-- footer.jsp -->