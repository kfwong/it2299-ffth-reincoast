<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="/path/to/css1" name="css" />
	<jsp:param value="/path/to/css2" name="css" />
</jsp:include>
<!-- header.jsp -->
<!-- sample-content.jsp -->
<div id="page-wrapper">


	<h2>SIGNUP HERE</h2>
	<form id="VSU" class="Volunteer_SignUp" method="post" action="VolunteerSignUpServlet">
		<div class="row">
			<div class="col-lg-5 col-lg-offset-3 ">
				<div class="form-group">

					<!--------------------------------------NAME -------------------------------------------->
					
						<label for="Name">Name </label> <input type="text"
							class="form-control" placeholder="Name" name="Name"
							id="Name" required autofocus>
				
					<!--------------------------------------NRIC -------------------------------------------->
				
						<label for="NRIC">NRIC</label> <input type="text"
							class="form-control" placeholder="NRIC" name="NRIC" id="NRIC"
							required autofocus>
				

					<!--------------------------------------GENDER -------------------------------------------->
			
						<label for="Gender">Gender</label> <br>
						<div class="radio-inline">
							<label> <input type="radio" name="Gender" id="Male"
								value="Male"> Male
							</label>
					
						<div class="radio-inline">
							<label> <input type="radio" name="Gender" id="Female"
								value="Female">Female
							</label>
						</div>
					</div>
				</div>

				<div class="form-group">
					<!--------------------------------------Contact Number -------------------------------------------->
					
						<label for="Contact_No">Contact No</label> <input type="text"
							class="form-control" placeholder="Contact Number" name="Tel"
							id="Tel" required autofocus>
					
					<!--------------------------------------EMAIL  -------------------------------------------->
					
						<label for="Email">Email</label> <input type="text"
							class="form-control" placeholder="Email" name="Email" id="Email"
							required autofocus>
					
					<!--------------------------------------Address  -------------------------------------------->
					

						<label for="Address">Address </label> <input type="text"
							class="form-control" placeholder="Mailing Address" name="Address"
							id="Address" required autofocus>

					
						<label for="PostalCode">Postal Code </label> <input type="text"
							class="form-control" placeholder="Postal Code" name="PostalCode"
							id="PostalCode" required autofocus>
					</div>
		


				<div class="form-group">
					<!--------------------------------------UserName -------------------------------------------->
					
						<label for="Username">Username</label> <input type="text"
							class="form-control" placeholder="Username" name="Username"
							id="Username" required autofocus>
					
					<!--------------------------------------Password -------------------------------------------->
					
						<label for="Password"> Password</label> <input type="password"
							class="form-control" placeholder="Password" name="Password"
							id="Password" required autofocus>
					
					<!--------------------------------------Confirm Password  -------------------------------------------->
				
						<label for="CfmPassword"> Re-enter Password</label> <input
							type="Password" class="form-control" placeholder="Confirm Password"
							name="CfmPassword" id="CfmPassword" required autofocus>
				
				</div>

				<button class="btn btn-lg btn-primary btn-block" type="submit">
					SIGN UP</button>
				<small>*We will never give your detail to ANYONE</small> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br>
			</div>
		</div>	

	</form>
</div>


<!-- sample-content.jsp -->
	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="/path/to/js1" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->
	
<script type="text/javascript">
$('#VSU').validate({
	rules: {
			Tel : {
				number : true,
				maxlength : 8,
				minlength : 8,

			},

			NRIC : {
				maxlength : 9,
				minlength : 9,
			},

			PostalCode : {
				maxlength : 6,
				minlength : 6,
			},
		}

	
	});

</script>