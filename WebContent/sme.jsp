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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,500,700,900&display=swap"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, height=device-height">
<link rel="shortcut icon" href="images/logo.png" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/script.js"></script>
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #103283;
	color: white;
	padding: 10px;
}

.table th {
	text-align: center;
}

.table td {
	text-align: center;
}
</style>
</head>
<body>
	<%
		/* response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("login.jsp");
		} */
	%>
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark"
		style="background: #103a82;">
		<a class="navbar-brand" href="sme.jsp"> Trainer Pool
			Management</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
  			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="SME?action=viewRequests">View Requests</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="SME?action=editSkills">Add/Edit Skills</a></li>					
				<li class="nav-item active"><a class="nav-link"
					href="SME?action=editAvailability">Add/Edit Availability</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="SME?action=editPassword">Edit Password</a></li>
				<li class="nav-item active"><a class="nav-link" href="Logout">Logout
				</a></li>

			</ul>
		</div>
	</nav>

	<div class="container-fluid" style="margin-top: 80px;">
		<h5>
			Welcome, ${userId} !<br />
			<br /> Browse through any of the options to explore !
		</h5>
		<!-- ============================================================ Edit Skills ============================================================================ -->
		<c:if test="${editSkills eq true}">
			<div class="card" style="width:25%;">
				<div class="card-header">Add/ Edit your skills</div>
				<div class="card-body">
					<div class="row" style="text-align: center;">
						<span class="col-11" id="messageInvalid"
								style="color: red; visibility: hidden; font-weight: bold; border-radius: 25px; background: #f2bbbb; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;"></span>
					</div>
					<form method="POST" action="SME?action=editSkills" onsubmit="return checkSkillLength()">
						<div class="row">
							<div class="form-group col-6">
								<label class="mr-sm-2" for="skills">Select your skills</label><br/>
								<div class="form-check" id="skills">
									<c:forEach items="${skills}" var="skill">
										<input type="checkbox" class="form-check-input" id="skill" name="skill" value="${skill.skillId}">
	    								<label class="form-check-label" for="skill">${skill.skillName}</label><br/>
    								</c:forEach>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-5">
								<input type="submit" class="form-control" name="createRequest"
									style="background: #103a82; color: #ffffff; border-radius:20px;"
									value="Add/ Edit Skills" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</c:if>
		
		<!-- ==================================================== Edit Availability ================================================================= -->
		<c:if test="${editAvailability eq true}">
			<div class="card" style="width:50%;">
				<div class="card-header">Add/ Edit your availability</div>
				<div class="card-body">
					<form method="POST" action="SME?action=editAvailability">
						
					</form>
				</div>
			</div>
		</c:if>
		
		<!-- ===========================================================Edit Password====================================================================== -->
		<c:if test="${editPassword eq true}">
			<div class="card" style="width: 50%;">
				<div class="card-header">Change Password</div>
				<div class="card-body">
					<c:if test="${passwordChanged eq true}">
						<div class="row" style="text-align: center;">
							<span class="col-11" id="messageInvalid"
								style="color: #62ad42; font-weight: bold; border-radius: 25px; background: #cdeb8d; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;">Your
								password has been changed successfully !</span>
						</div>
					</c:if>
					<c:if test="${passwordChanged eq false}">
						<div class="row" style="text-align: center;">
							<span class="col-11"
								style="color: red; font-weight: bold; border-radius: 25px; background: #f29b9b; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;">Error
								occurred while changing the password. Please try again ! </span>
						</div>
					</c:if>
					<form method="POST" action="SME?action=editPasswordForm"
						onsubmit="return validateEditPwd()">
						<div class="row" style="text-align: center;">
							<span class="col-11" id="messageInvalid"
								style="color: red; visibility: hidden; font-weight: bold; border-radius: 25px; background: #f2bbbb; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;"></span>
						</div>
						<div class="row">
							<div class="form-group col-12">
								<label for="previousPassword">Previous Password</label> <input
									type="password" class="form-control" name="previousPassword"
									id="previousPassword"
									placeholder="Enter your previous password" />
							</div>
						</div>
						<div class="form-group">
							<label for="newPassword">New Password</label> <input
								type="password" class="form-control" name="newPassword"
								id="newPassword" placeholder="Enter your new password" />
						</div>
						<div class="form-group">
							<label for="newCnfPassword">Confirm New Password</label> <input
								type="password" class="form-control" name="newCnfPassword"
								id="newCnfPassword" placeholder="Confirm your new password" />
						</div>
						<input type="submit" class="form-control" name="createRequest"
							style="background: #103a82; color: #ffffff;"
							value="Change Password" />
					</form>
				</div>
			</div>
		</c:if>
		
	</div>

	<div class="footer">Copyright &copy; 2019. Trainer Pool
		Management</div>

</body>
</html>