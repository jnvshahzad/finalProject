<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/script.js"></script>
</head>
<body>
	<div class="container-fluid"
		style="padding: 0px; margin: 0px; height: 100%;">
		<div class="row">
			<div class="col-lg-7 register d-none d-md-block">
				<img src="images/logo.png" width="60%" />
				<div class="register-head">Manage your trainers on the go !</div>

			</div>
			<div class="col-lg-5 login">
				<h4 class="login-head">
					Trainer Pool <br /> Management
				</h4>
				<h6 class="welcome">Welcome Aboard !</h6>
				<form method="POST" onsubmit="return validateLogin()" action="Login">
					<c:if test="${signUpSuccess eq true}">
						<div class="row" style="text-align: center;">
							<span class="col-11" id="messageInvalid"
								style="color: #62ad42; font-weight: bold; border-radius: 25px; background: #cdeb8d; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;">You
								have been successfully signed up !<br /> Your User ID is :
								${userId}
							</span>
						</div>
					</c:if>
					<c:if test="${signOutSuccess eq true}">
						<div class="row" style="text-align: center;">
							<span class="col-11" id="messageInvalid"
								style="color: #62ad42; font-weight: bold; border-radius: 25px; background: #cdeb8d; width: 100%; padding: 8px 40px; margin: 0px 40px; text-align: center;">You
								have been successfully signed out !
							</span>
						</div>
					</c:if>
					<div class="form-group">
						<label for="userId" class="label">USER ID</label> <input
							type="text" class="form-control" id="userId" name="userId"
							placeholder="Enter User ID" autofocus>
					</div>
					<div class="form-group">
						<label for="password" class="label">PASSWORD</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="Enter password">
					</div>
					<div class="row">
						<span class="col-12" id="messageInvalid"
							style="color: red; visibility: hidden; font-weight: bold; border-radius: 25px; background: #f2bbbb; width: 100%; padding: 8px 40px; text-align: center;"></span>
					</div>
					<div class="row">
						<c:if test="${noUser eq true}">
							<span class="col-12"
								style="color: red; font-weight: bold; border-radius: 25px; background: #f2bbbb; width: 100%; padding: 8px 40px; text-align: center;">Invalid
								User Id or Password. Please try again !</span>
						</c:if>
					</div>
					<input type="submit" class="btn-login form-control" value="LOGIN" />
				</form>
				<div class="signup">- OR -</div>
				<button type="button" class="form-control btn-register"
					onclick="window.location='register.jsp'">JOIN US!</button>
			</div>
		</div>
	</div>
</body>
</html>