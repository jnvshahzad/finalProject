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
<script type="text/javascript" src="js/script.js"></script>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
body {
	font-family: 'Poppins', sans-serif;
}

.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #103283;
	color: white;
	padding: 10px;
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
		<h5>Welcome, ${userId} !</h5>

		<div class="container-fluid" id="createRequest">
			<div class="card" style="width: 50%; margin-top: 20px;">
				<div class="card-header">
					<h5>Create a new Request</h5>
				</div>
				<div class="card-body">
					<form method="POST" action="Requestor?action=createRequestForm"
						onsubmit="return validateCreateRequest()">
						<c:if test="${requestCreated eq false}">
							<div class="row" style="text-align: center;">
								<span class="col-11"
									style="color: red; font-weight: bold; border-radius: 25px; background: #f29b9b; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;">Error
									creating a new request. Please try again ! </span>
							</div>
						</c:if>
						<div class="row" style="text-align: center;">
							<span class="col-11" id="messageInvalid"
								style="color: red; visibility: hidden; font-weight: bold; border-radius: 25px; background: #f2bbbb; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;"></span>
						</div>
						<div class="row" style="display: none;">
							<div class="form-group col-12">
								<input type="text" class="form-control" id="requestorId"
									name="requestorId" value="${userId}">
							</div>
						</div>
						<div class="row" style="text-align: center;">
							<span class="col-11" id="messageInvalid"
								style="color: red; visibility: hidden; font-weight: bold; border-radius: 25px; background: #f2bbbb; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;"></span>
						</div>
						<div class="row">
							<div class="form-group col-12">
								<label for="requestSubject" class="mr-sm-2">Request
									Subject</label> <select class="custom-select mr-sm-2"
									name="requestSubject">
									<c:forEach items="${skills}" var="skill">
										<option value="${skill.skillName}">${skill.skillName}</option>
										<option value="${skill.skillDuration}" style="display: none;">${skill.skillDuration}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-12">
								<label for="startDate">Start Date</label> <input
									class="form-control" id="startDate" name="startDate"
									width="100%" aria-describedby="startDate"
									placeholder="Enter Start Date">
							</div>
						</div>
						<div class="row">
							<div class="form-group col-12">
								<label for="endDate">End Date</label> <input
									class="form-control" id="endDate" name="endDate" width="100%"
									aria-describedby="endDate" placeholder="Enter End Date">
							</div>
							<script>
								var today = new Date(new Date().getFullYear(),
										new Date().getMonth(), new Date()
												.getDate());
								$('#startDate').datepicker({
									uiLibrary : 'bootstrap4',
									iconsLibrary : 'fontawesome',
									minDate : today,
									maxDate : function() {
										return $('#endDate').val();
									}
								});
								$('#endDate').datepicker({
									uiLibrary : 'bootstrap4',
									iconsLibrary : 'fontawesome',
									minDate : function() {
										return $('#startDate').val();
									}
								});
							</script>

						</div>
						<div class="row">
							<div class="form-group col-12">
								<label for="city">City</label> <input type="text"
									class="form-control" name="city" id="city"
									placeholder="Enter city" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-12">
								<label for="batchSize">Batch Size</label> <input type="text"
									class="form-control" id="batchSize" name="batchSize"
									aria-describedby="batchSize" placeholder="Batch Size">
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col-5">
								<input type="submit" class="form-control" name="createRequest"
									style="background: #103a82; color: #ffffff;"
									value="Create Request" />
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="footer">Copyright &copy; 2019. Trainer Pool
		Management</div>

</body>
</html>