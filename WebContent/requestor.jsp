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
			Welcome, ${userId} !<br />
			<br /> Browse through any of the options to explore !
		</h5>
		<c:if test="${requestCreated eq true}">
			<div class="row" style="text-align: center;">
				<span class="col-11" id="messageInvalid"
					style="color: #62ad42; font-weight: bold; border-radius: 25px; background: #cdeb8d; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;">Your
					request has been created successfully ! </span>
			</div>
		</c:if>
		<c:if test="${requestDeleted eq true}">
			<div class="row" style="text-align: center;">
				<span class="col-11" id="messageInvalid"
					style="color: #62ad42; font-weight: bold; border-radius: 25px; background: #cdeb8d; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;">Your
					request has been deleted successfully ! </span>
			</div>
		</c:if>
		<c:if test="${requestCreated eq false}">
			<div class="row" style="text-align: center;">
				<span class="col-11"
					style="color: red; font-weight: bold; border-radius: 25px; background: #f29b9b; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;">Error
					occurred while deleting the request. Please try again ! </span>
			</div>
		</c:if>
		<c:if test="${viewRequests eq true}">
			<div class="container-fluid" id="viewRequests"
				style="padding-top: 10px;">
				<h4 style="font-weight: bold; text-align: center;">YOUR
					REQUESTS</h4>
				<form action="Requestor">
					<table class="table table-striped">
						<thead class="thead-light">
							<tr>
								<th scope="col">Subject</th>
								<th scope="col">Start Date</th>
								<th scope="col">End Date</th>
								<th scope="col">City</th>
								<th scope="col">Batch Size</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requests}" var="request">
								<tr>
									<td>${request.requestSubject}</td>
									<td>${request.startDate}</td>
									<td>${request.endDate}</td>
									<td>${request.city}</td>
									<td>${request.batchSize}</td>
									<td>${request.requestStatus}</td>
									<td><a
										href="Requestor?action=deleteRequest&id=${request.requestId}"
										class="btn btn-danger">Delete Request</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</c:if>
	</div>

	<div class="footer">Copyright &copy; 2019. Trainer Pool
		Management</div>

</body>
</html>