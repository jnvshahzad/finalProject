<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trainer Pool Management</title>
<link rel="stylesheet"
	href="css/bootstrap.min.css"
	type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,500,700,900&display=swap"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, height=device-height">
<link rel="shortcut icon" href="images/logo.png" />
<script type="text/javascript" src="js/script.js"></script>
<style>
body, html {
	background: linear-gradient(#103a82, #0b2d66);
	font-family: 'Poppins', sans-serif;
	height: 100%;
	width: 100%;
}

.card {
	margin-top: 8%;
	box-shadow: 5px 10px 10px #0b2d66;
	z-index: 1000;
	padding: 0px 5px 0px 5px;
}

.card-title {
	color: #103a82;
	text-transform: uppercase;
	font-weight: 600;
	text-align: center;
}

.card-header .nav .nav-item a {
	color: #103a82;
	font-weight: bold;
	text-transform: uppercase;
	text-decoration: none;
}

.card-header {
	padding: 0px 10px 12px 10px;
}

input[type=submit] {
	background: #103a82;
	color: #ffffff;
	text-transform: uppercase;
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-9 mx-auto">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">sign up form</h4>
						<div class="card-header">
							<ul class="nav nav-tabs nav-justified card-header-tabs row"
								id="role-list" role="tablist">
								<li class="nav-item"><a class="nav-link active" href="#sme"
									role="tab" aria-controls="history" aria-selected="false">SME</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#trainer"
									role="tab" aria-controls="deals" aria-selected="false">TRAINER</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#requestor"
									role="tab" aria-controls="requestor" aria-selected="false">REQUESTOR</a>
								</li>
							</ul>
						</div>
						<div class="tab-content mt-3">
							<div class="tab-pane active" id="sme" role="tabpanel"
								aria-labelledby="history-tab">
								<div class="row" style="text-align: center;">
									<span class="col-11" id="messageInvalid"
										style="color: red; visibility: hidden; font-weight: bold; border-radius: 25px; background: #f2bbbb; width: 100%; 
										padding: 8px 40px; margin: 0px 40px; text-align: center;"></span>
								</div>
								<c:if test="${userExists eq true}">
									<div class="row" style="text-align: center;">
										<span class="col-11" id="messageInvalid"
											style="color: red; font-weight: bold; border-radius: 25px; background: #e89595; width: 100%; padding: 8px 40px; margin: 0px 40px; 
											text-align: center;">Sorry,
											please try again with a different User ID ! </span>
									</div>
								</c:if>
								<c:if test="${errorInsert eq true}">
									<div class="row" style="text-align: center;">
										<span class="col-11" id="messageInvalid"
											style="color: red; font-weight: bold; border-radius: 25px; background: #e89595; width: 100%; padding: 8px 40px; margin: 0px 40px; 
											text-align: center;">Sorry,
											please try again with a different User ID or some error occurred. Please try again! </span>
									</div>
								</c:if>
								<form id="signUpForm" method="POST"
									onsubmit="return validateSignUp()" action="Register">
									<div class="row">
										<div class="form-group col-6">
											<label for="firstName">First Name</label> <input type="text"
												class="form-control" name="firstName" id="firstName"
												placeholder="Enter first name" autofocus /> <input
												type="hidden" class="form-control" name="role" id="role"
												value="SME" />
										</div>
										<div class="form-group col-6">
											<label for="lastName">Last Name</label> <input type="text"
												class="form-control" name="lastName" id="lastName"
												placeholder="Enter last name" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="age">Age</label> <input type="text"
												class="form-control" name="age" id="age"
												placeholder="Enter age" />
										</div>
										<div class="form-group col-6">
											<label for="contactNumber">Contact Number</label> <input
												type="text" class="form-control" name="contactNumber"
												id="contactNumber" placeholder="Contact Number" />
										</div>
									</div>
									<div class="row">
										<div class="col-6">
											Gender <br />
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender"
													id="male" value="Male" checked> <label
													class="form-check-label" for="gender"> Male </label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender"
													id="female" value="Female"> <label
													class="form-check-label" for="gender"> Female </label>
											</div>
										</div>
										<div class="form-group col-6">
											<label for="addLine1">Street Address</label> <input
												type="text" class="form-control" name="addLine1"
												id="addLine1"
												placeholder="Street No. / Flat No. / Floor No." />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-12">
											<label for="addLine2">Address Line 2</label> <input
												type="text" class="form-control" name="addLine2"
												id="addLine2"
												placeholder="Area/ Locality/ Society/ Landmark" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="city">City</label> <input type="text"
												class="form-control" name="city" id="city"
												placeholder="Enter City" />
										</div>
										<div class="form-group col-6">
											<label for="userId">User ID</label> <input type="text"
												class="form-control" name="userId" id="userId"
												placeholder="Enter User ID" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="password">Password</label> <input type="password"
												class="form-control" name="password" id="password"
												placeholder="Enter password" />
										</div>
										<div class="form-group col-6">
											<label for="cnfPassword">Confirm Password</label> <input
												type="password" class="form-control" name="cnfPassword"
												id="cnfPassword" placeholder="Confirm password" />
										</div>
									</div>
									<input type="submit" class="btn" name="Sign Up" value="Sign Up" />
								</form>
							</div>
							<div class="tab-pane" id="trainer" role="tabpanel"
								aria-labelledby="history-tab">
								<div class="row" style="text-align: center;">
									<span class="col-11" id="messageInvalid2"
										style="color: red; visibility: hidden; font-weight: bold; border-radius: 25px; background: #f2bbbb; 
										width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;"></span>
								</div>
								<form id="signUpForm" method="POST"
									onsubmit="return validateSignUp2()" action="Register">
									<div class="row">
										<div class="form-group col-6">
											<label for="firstName2">First Name</label> <input type="text"
												class="form-control" name="firstName2" id="firstName2"
												placeholder="Enter first name" autofocus /> <input
												type="hidden" class="form-control" name="role" id="role"
												value="Trainer" />
										</div>
										<div class="form-group col-6">
											<label for="lastName2">Last Name</label> <input type="text"
												class="form-control" name="lastName2" id="lastName2"
												placeholder="Enter last name" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="age2">Age</label> <input type="text"
												class="form-control" name="age2" id="age2"
												placeholder="Enter age" />
										</div>
										<div class="form-group col-6">
											<label for="contactNumber2">Contact Number</label> <input
												type="text" class="form-control" name="contactNumber2"
												id="contactNumber2" placeholder="Contact Number" />
										</div>
									</div>
									<div class="row">
										<div class="col-6">
											Gender <br />
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender2"
													id="male2" value="Male" checked> <label
													class="form-check-label" for="gender2"> Male </label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender2"
													id="female2" value="Female"> <label
													class="form-check-label" for="gender2"> Female </label>
											</div>
										</div>
										<div class="form-group col-6">
											<label for="addLine1">Street Address</label> <input
												type="text" class="form-control" name="addLine12"
												id="addLine12"
												placeholder="Street No. / Flat No. / Floor No." />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-12">
											<label for="addLine22">Address Line 2</label> <input
												type="text" class="form-control" name="addLine22"
												id="addLine22"
												placeholder="Area/ Locality/ Society/ Landmark" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="city2">City</label> <input type="text"
												class="form-control" name="city2" id="city2"
												placeholder="Enter City" />
										</div>
										<div class="form-group col-6">
											<label for="userId2">User ID</label> <input type="text"
												class="form-control" name="userId2" id="userId2"
												placeholder="Enter User ID" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="password2">Password</label> <input type="password"
												class="form-control" name="password2" id="password2"
												placeholder="Enter password" />
										</div>
										<div class="form-group col-6">
											<label for="cnfPassword2">Confirm Password</label> <input
												type="password" class="form-control" name="cnfPassword2"
												id="cnfPassword2" placeholder="Confirm password" />
										</div>
									</div>
									<input type="submit" class="btn" name="Sign Up" value="Sign Up" />
								</form>
							</div>
							<div class="tab-pane" id="requestor" role="tabpanel"
								aria-labelledby="history-tab">
								<div class="row" style="text-align: center;">
									<span class="col-11" id="messageInvalid3"
										style="color: red; visibility: hidden; font-weight: bold; border-radius: 25px; background: #f2bbbb; width: 100%; 
										padding: 8px 40px; margin: 0px 40px; text-align: center;"></span>
								</div>
								<form id="signUpForm" method="POST"
									onsubmit="return validateSignUp3()" action="Register">
									<div class="row">
										<div class="form-group col-6">
											<label for="firstName3">First Name</label> <input type="text"
												class="form-control" name="firstName3" id="firstName3"
												placeholder="Enter first name" autofocus /> <input
												type="hidden" class="form-control" name="role" id="role"
												value="Requestor" />
										</div>
										<div class="form-group col-6">
											<label for="lastName3">Last Name</label> <input type="text"
												class="form-control" name="lastName3" id="lastName3"
												placeholder="Enter last name" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="age3">Age</label> <input type="text"
												class="form-control" name="age3" id="age3"
												placeholder="Enter age" />
										</div>
										<div class="form-group col-6">
											<label for="contactNumber3">Contact Number</label> <input
												type="text" class="form-control" name="contactNumber3"
												id="contactNumber3" placeholder="Contact Number" />
										</div>
									</div>
									<div class="row">
										<div class="col-6">
											Gender <br />
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender3"
													id="male3" value="Male" checked> <label
													class="form-check-label" for="gender3"> Male </label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender3"
													id="female3" value="Female"> <label
													class="form-check-label" for="gender3"> Female </label>
											</div>
										</div>
										<div class="form-group col-6">
											<label for="addLine13">Street Address</label> <input
												type="text" class="form-control" name="addLine13"
												id="addLine13"
												placeholder="Street No. / Flat No. / Floor No." />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-12">
											<label for="addLine23">Address Line 2</label> <input
												type="text" class="form-control" name="addLine23"
												id="addLine23"
												placeholder="Area/ Locality/ Society/ Landmark" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="city3">City</label> <input type="text"
												class="form-control" name="city3" id="city3"
												placeholder="Enter City" />
										</div>
										<div class="form-group col-6">
											<label for="userId3">User ID</label> <input type="text"
												class="form-control" name="userId3" id="userId3"
												placeholder="Enter User ID" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-6">
											<label for="password3">Password</label> <input type="password"
												class="form-control" name="password3" id="password3"
												placeholder="Enter password" />
										</div>
										<div class="form-group col-6">
											<label for="cnfPassword3">Confirm Password</label> <input
												type="password" class="form-control" name="cnfPassword3"
												id="cnfPassword3" placeholder="Confirm password" />
										</div>
									</div>
									<input type="submit" class="btn" name="Sign Up" value="Sign Up" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#role-list a').on('click', function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>
</body>
</html>