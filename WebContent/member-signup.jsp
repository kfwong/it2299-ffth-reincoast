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

	<div class="row">
		<div class="col-xs-6 col-md-4"></div>
		<div class="col-xs-6 col-md-4">
			<h2>SIGNUP HERE</h2>
			<form id="SignUp" class="Member_SignUp" method="post" action="/it2299-ffth-reincoast/MemberLogInServlet"> 
		
				<div class="form-group">
					<!--------------------------------------NAME -------------------------------------------->
					<label for="Name">Name</label> <input type="text"
						class="form-control" placeholder="Name (in NRIC)" name="Name" id="Name"
						required autofocus> 
					<!--------------------------------------NRIC -------------------------------------------->
					<label for="NRIC">NRIC</label> <input
						type="text" class="form-control" placeholder="NRIC" name="NRIC" id="Nric"
						required autofocus> 
						
					<!--------------------------------------Contact Number -------------------------------------------->	
					<label for="Contact_No">Contact
						No</label> <input type="text" class="form-control"
						placeholder="Contact Number" name="Contact_No" id="ContactNo" required autofocus>
					</div>
				<div class="form-group">
					<!--------------------------------------UserName -------------------------------------------->
					<label for="Username">Username</label> <input type="text"
						class="form-control" placeholder="Username" name="Username" id="Username"
						required autofocus>
					
						
						
						
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit">
					SIGN UP</button>
				<small>*We will never give your detail to ANYONE</small> <br> <br>
				</form>
				<br> <br> <br> <br> <br>
			</div>
		</div>	
		<div class="col-xs-6 col-md-4"></div>

	<!-- sample-content.jsp -->

	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="/path/to/js1" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->
	
	<script type="text/javascript">
$('#SignUp').validate({
	rules: {

		Contact_No:{
			number: true,
			maxlength: 8,
			minlength: 8,
			
		},
		
		Nric:{
			maxlength: 9,
			minlength: 9
		}
	}
	
	});

</script>