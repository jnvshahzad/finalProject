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
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		if (session.getAttribute("userId") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark"
		style="background: #103a82;">
		<a class="navbar-brand" href="requestor.jsp"> Trainer Pool
			Management</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Requestor?action=createRequest">Create a New Request </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="Requestor?action=viewRequests">View All Requests</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="Requestor?action=editPassword">Change Password</a></li>
				<li class="nav-item active"><a class="nav-link" href="Logout">Logout
				</a></li>

			</ul>
		</div>
	</nav>

	<div class="container-fluid" style="margin-top: 80px;">
		<h5>
			Welcome, ${userId} !<br /> <br /> Browse through any of the options
			to explore !
		</h5>
		<div class="container-fluid" id="editPassword"
			style="padding-top: 10px;">
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
					<form method="POST" action="Requestor?action=editPasswordForm"
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
		</div>
	</div>

	<div class="footer">Copyright &copy; 2019. Trainer Pool
		Management</div>

</body>
</html>