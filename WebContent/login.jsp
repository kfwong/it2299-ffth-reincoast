<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
</jsp:include>


<!-- header.jsp -->

<style type="text/css">
body{
	background-color: #8F8D8D;

}

</style>


<!-- sample-content.jsp -->

<div id="page-wrapper container">
	<!-- sample-content.jsp -->
	<div class="Lbody col-lg-4">
		<div class="row">

				<form class="form-signin" method="post" action="MemberLogInServlet">
					<h2>LOGIN</h2>
					<input type="text" class="form-control" placeholder="User Name"
						name="username" required autofocus> <input type="password"
						class="form-control" placeholder="Password" name="password"
						required autofocus> <br>

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
	<div class="Lbody col-lg-4">
		<div class="row"></div>
	</div>
	</div>
	