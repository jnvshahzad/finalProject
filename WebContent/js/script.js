$('#role-list a').on('click', function(e) {
	e.preventDefault()
	$(this).tab('show')
})

function clearFunction() {
	document.getElementById("invalidMessage").style.visibility = "hidden";
}

function validateLogin() {
	var userId = document.getElementById("userId").value;
	var pwd = document.getElementById("password").value;

	// user id validation
	if (userId.length < 5 || userId.length >= 10) {
		document.getElementById("messageInvalid").innerHTML = "User ID must have a length between 5 to 10 characters.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('userId').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < userId.length; i++) {
			if (!(userId.charAt(i) >= '0' && userId.charAt(i) <= '9')) {
				document.getElementById("messageInvalid").innerHTML = "User ID must be a number";
				document.getElementById("messageInvalid").style.visibility = "visible";
				document.getElementById('userId').style.borderColor = "red";
				return false;
			}
		}
	}
	// password validation
	if (pwd.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Password cannot be empty";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('password').style.borderColor = "red";
		return false;
	} else if (pwd.length < 3 || pwd.length > 8) {
		document.getElementById("messageInvalid").innerHTML = "Password should be between 3 to 8 characters.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('password').style.borderColor = "red";
		return false;
	}

}

function validateSignUp() {
	var firstName, lastName, dateOfBirth, contactNumber, gender, streetAdd, city, userId, pwd, cnfPwd;
	firstName = document.getElementById("firstName").value;
	lastName = document.getElementById("lastName").value;
	age = document.getElementById("age").value;
	contactNumber = document.getElementById("contactNumber").value;
	gender = document.getElementsByName("gender");
	streetAdd = document.getElementById("addLine1").value;
	city = document.getElementById("city").value;
	userId = document.getElementById("userId").value;
	pwd = document.getElementById("password").value;
	cnfPwd = document.getElementById("cnfPassword").value;

	// First Name Validations
	if (firstName.length <= 2 || firstName.length >= 30) {
		document.getElementById("messageInvalid").innerHTML = "First name must be between 2 to 30 characters.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('firstName').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < firstName.length; i++) {
			if (!((firstName.charAt(i) >= 'a' && firstName.charAt(i) <= 'z') || (firstName
					.charAt(i) >= 'A' && firstName.charAt(i) <= 'Z'))) {
				document.getElementById("messageInvalid").innerHTML = "First name can only be alphabets.";
				document.getElementById("messageInvalid").style.visibility = "visible";
				document.getElementById('firstName').style.borderColor = "red";
				return false;
			}
		}
	}

	// age
	if (age.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Age cannot be empty.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('age').style.borderColor = "red";
		return false;
	} else if (age < 20 || age > 60) {
		document.getElementById("messageInvalid").innerHTML = "Age must be between 20 to 60 years.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('age').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < age.length; i++) {
			if (!((age.charAt(i) >= '0' && age.charAt(i) <= '9'))) {
				document.getElementById("messageInvalid").innerHTML = "Age must be a number.";
				document.getElementById("messageInvalid").style.visibility = "visible";
				document.getElementById('age').style.borderColor = "red";
				return false;
			}
		}
	}

	// phone number validation
	if (!(contactNumber.length == 10)) {
		document.getElementById("messageInvalid").innerHTML = "Phone Number must be of 10 digits.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('contactNumber').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < contactNumber.length; i++) {
			if (!(contactNumber.charAt(i) >= '0' && contactNumber.charAt(i) <= '9')) {
				document.getElementById("messageInvalid").innerHTML = "Phone number can only have digits.";
				document.getElementById("messageInvalid").style.visibility = "visible";
				document.getElementById('contactNumber').style.borderColor = "red";
				return false;
			}
		}
	}
	// Gender validation
	if (gender.length < 1) {
		document.getElementById("messageInvalid").innerHTML = "Select one option in Gender.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('gender').style.borderColor = "red";
		return false;
	}

	// Street Address Line1
	if (streetAdd == "") {
		document.getElementById("messageInvalid").innerHTML = "Address details can't be empty.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('addLine1').style.borderColor = "red";
		return false;
	}

	// City
	if (city == "") {
		document.getElementById("messageInvalid").innerHTML = "City can't be empty";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('city').style.borderColor = "red";
		return false;
	}

	// User ID
	if (userId.length < 6 || userId.length >= 10) {
		document.getElementById("messageInvalid").innerHTML = "User ID must have 5 to 10 characters.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('userId').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < userId.length; i++) {
			if (!(userId.charAt(i) >= '0' && userId.charAt(i) <= '9')) {
				document.getElementById("messageInvalid").innerHTML = "User ID must be a number";
				document.getElementById("messageInvalid").style.visibility = "visible";
				document.getElementById('userId').style.borderColor = "red";
				return false;
			}
		}
	}

	// password validation
	if (pwd.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Password cannot be empty.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('password').style.borderColor = "red";
		return false;
	} else if (pwd.length < 3 || pwd.length > 8) {
		document.getElementById("messageInvalid").innerHTML = "Password must be between 3 to 8 characters.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('password').style.borderColor = "red";
		return false;
	} else if (cnfPwd.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Confirm Password cannot be empty.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('cnfPassword').style.borderColor = "red";
		return false;
	} else if (cnfPwd.length < 3 || cnfPwd.length > 8) {
		document.getElementById("messageInvalid").innerHTML = "Confirm Password must be between 3 to 8 characters.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('cnfPassword').style.borderColor = "red";
		return false;
	} else if (pwd != cnfPwd) {
		document.getElementById("messageInvalid").innerHTML = "Password and Confirm Password must be the same.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('cnfPassword').style.borderColor = "red";
		document.getElementById('cnfPassword').style.borderColor = "red";
		return false;
	}

}

function validateCreateRequest() {
	var requestSubject = document.getElementById("requestSubject").options.length;
	var startDate = document.getElementById("startDate").value;
	var endDate = document.getElementById("endDate").value;
	var state = document.getElementById("state").value;
	var city = document.getElementById("city").value;
	var batchSize = document.getElementById("batchSize").value;

	if (requestSubject == "0") {
		alert("Hi!");
		document.getElementById("messageInvalid").innerHTML = "Please select a subject.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('requestSubject').style.borderColor = "red";
		return false;
	}
	if (startDate.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Please select a Start Date.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('startDate').style.borderColor = "red";
		return false;
	}
	if (endDate.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Please select a End Date.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('endDate').style.borderColor = "red";
		return false;
	}

	if (state.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Please select a State.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('state').style.borderColor = "red";
		return false;
	}

	if (city.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Please select a City.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('city').style.borderColor = "red";
		return false;
	}

	if (batchSize.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Please enter a Batch Size.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('batchSize').style.borderColor = "red";
		return false;
	} else if (batchSize < 20 || batchSize > 40) {
		document.getElementById("messageInvalid").innerHTML = "Batch Size must be between 20 and 40.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('batchSize').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < batchSize.length; i++) {
			if (!((batchSize.charAt(i) >= '0' && batchSize.charAt(i) <= '9'))) {
				document.getElementById("messageInvalid").innerHTML = "Batch Size must be a number.";
				document.getElementById("messageInvalid").style.visibility = "visible";
				document.getElementById('batchSize').style.borderColor = "red";
				return false;
			}
		}
	}
}

function validateSignUp2() {
	var firstName, lastName, dateOfBirth, contactNumber, gender, streetAdd, city, userId, pwd, cnfPwd;
	firstName = document.getElementById("firstName2").value;
	lastName = document.getElementById("lastName2").value;
	age = document.getElementById("age2").value;
	contactNumber = document.getElementById("contactNumber2").value;
	gender = document.getElementsByName("gender2");
	streetAdd = document.getElementById("addLine12").value;
	city = document.getElementById("city2").value;
	userId = document.getElementById("userId2").value;
	pwd = document.getElementById("password2").value;
	cnfPwd = document.getElementById("cnfPassword2").value;

	// First Name Validations
	if (firstName.length <= 2 || firstName.length >= 30) {
		document.getElementById("messageInvalid2").innerHTML = "First name must be between 2 to 30 characters.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('firstName2').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < firstName.length; i++) {
			if (!((firstName.charAt(i) >= 'a' && firstName.charAt(i) <= 'z') || (firstName
					.charAt(i) >= 'A' && firstName.charAt(i) <= 'Z'))) {
				document.getElementById("messageInvalid2").innerHTML = "First name can only be alphabets.";
				document.getElementById("messageInvalid2").style.visibility = "visible";
				document.getElementById('firstName2').style.borderColor = "red";
				return false;
			}
		}
	}

	// age
	if (age.length == 0) {
		document.getElementById("messageInvalid2").innerHTML = "Age cannot be empty.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('age2').style.borderColor = "red";
		return false;
	} else if (age < 20 || age > 60) {
		document.getElementById("messageInvalid2").innerHTML = "Age must be between 20 to 60 years.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('age2').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < age.length; i++) {
			if (!((age.charAt(i) >= '0' && age.charAt(i) <= '9'))) {
				document.getElementById("messageInvalid2").innerHTML = "Age must be a number.";
				document.getElementById("messageInvalid2").style.visibility = "visible";
				document.getElementById('age2').style.borderColor = "red";
				return false;
			}
		}
	}

	// phone number validation
	if (!(contactNumber.length == 10)) {
		document.getElementById("messageInvalid2").innerHTML = "Phone Number must be of 10 digits.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('contactNumber2').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < contactNumber.length; i++) {
			if (!(contactNumber.charAt(i) >= '0' && contactNumber.charAt(i) <= '9')) {
				document.getElementById("messageInvalid2").innerHTML = "Phone number can only have digits.";
				document.getElementById("messageInvalid2").style.visibility = "visible";
				document.getElementById('contactNumber2').style.borderColor = "red";
				return false;
			}
		}
	}
	// Gender validation
	if (gender.length < 1) {
		document.getElementById("messageInvalid2").innerHTML = "Select one option in Gender.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('gender2').style.borderColor = "red";
		return false;
	}

	// Street Address Line1
	if (streetAdd == "") {
		document.getElementById("messageInvalid2").innerHTML = "Address details can't be empty.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('addLine12').style.borderColor = "red";
		return false;
	}

	// City
	if (city == "") {
		document.getElementById("messageInvalid2").innerHTML = "City can't be empty";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('city2').style.borderColor = "red";
		return false;
	}

	// User ID
	if (userId.length < 6 || userId.length >= 10) {
		document.getElementById("messageInvalid2").innerHTML = "User ID must have 5 to 10 characters.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('userId2').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < userId.length; i++) {
			if (!(userId.charAt(i) >= '0' && userId.charAt(i) <= '9')) {
				document.getElementById("messageInvalid2").innerHTML = "User ID must be a number";
				document.getElementById("messageInvalid2").style.visibility = "visible";
				document.getElementById('userId2').style.borderColor = "red";
				return false;
			}
		}
	}

	// password validation
	if (pwd.length == 0) {
		document.getElementById("messageInvalid2").innerHTML = "Password cannot be empty.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('password2').style.borderColor = "red";
		return false;
	} else if (pwd.length < 3 || pwd.length > 8) {
		document.getElementById("messageInvalid2").innerHTML = "Password must be between 3 to 8 characters.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('password2').style.borderColor = "red";
		return false;
	} else if (cnfPwd.length == 0) {
		document.getElementById("messageInvalid2").innerHTML = "Confirm Password cannot be empty.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('cnfPassword2').style.borderColor = "red";
		return false;
	} else if (cnfPwd.length < 3 || cnfPwd.length > 8) {
		document.getElementById("messageInvalid2").innerHTML = "Confirm Password must be between 3 to 8 characters.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('cnfPassword2').style.borderColor = "red";
		return false;
	} else if (pwd != cnfPwd) {
		document.getElementById("messageInvalid2").innerHTML = "Password and Confirm Password must be the same.";
		document.getElementById("messageInvalid2").style.visibility = "visible";
		document.getElementById('cnfPassword2').style.borderColor = "red";
		document.getElementById('cnfPassword2').style.borderColor = "red";
		return false;
	}

}

function validateSignUp3() {
	var firstName, lastName, dateOfBirth, contactNumber, gender, streetAdd, city, userId, pwd, cnfPwd;
	firstName = document.getElementById("firstName3").value;
	lastName = document.getElementById("lastName3").value;
	age = document.getElementById("age3").value;
	contactNumber = document.getElementById("contactNumber3").value;
	gender = document.getElementsByName("gender3");
	streetAdd = document.getElementById("addLine13").value;
	city = document.getElementById("city3").value;
	userId = document.getElementById("userId3").value;
	pwd = document.getElementById("password3").value;
	cnfPwd = document.getElementById("cnfPassword3").value;

	// First Name Validations
	if (firstName.length <= 2 || firstName.length >= 30) {
		document.getElementById("messageInvalid3").innerHTML = "First name must be between 2 to 30 characters.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('firstName3').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < firstName.length; i++) {
			if (!((firstName.charAt(i) >= 'a' && firstName.charAt(i) <= 'z') || (firstName
					.charAt(i) >= 'A' && firstName.charAt(i) <= 'Z'))) {
				document.getElementById("messageInvalid3").innerHTML = "First name can only be alphabets.";
				document.getElementById("messageInvalid3").style.visibility = "visible";
				document.getElementById('firstName3').style.borderColor = "red";
				return false;
			}
		}
	}

	// age
	if (age.length == 0) {
		document.getElementById("messageInvalid3").innerHTML = "Age cannot be empty.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('age3').style.borderColor = "red";
		return false;
	} else if (age < 20 || age > 60) {
		document.getElementById("messageInvalid3").innerHTML = "Age must be between 20 to 60 years.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('age3').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < age.length; i++) {
			if (!((age.charAt(i) >= '0' && age.charAt(i) <= '9'))) {
				document.getElementById("messageInvalid3").innerHTML = "Age must be a number.";
				document.getElementById("messageInvalid3").style.visibility = "visible";
				document.getElementById('age3').style.borderColor = "red";
				return false;
			}
		}
	}

	// phone number validation
	if (!(contactNumber.length == 10)) {
		document.getElementById("messageInvalid3").innerHTML = "Phone Number must be of 10 digits.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('contactNumber3').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < contactNumber.length; i++) {
			if (!(contactNumber.charAt(i) >= '0' && contactNumber.charAt(i) <= '9')) {
				document.getElementById("messageInvalid3").innerHTML = "Phone number can only have digits.";
				document.getElementById("messageInvalid3").style.visibility = "visible";
				document.getElementById('contactNumber3').style.borderColor = "red";
				return false;
			}
		}
	}
	// Gender validation
	if (gender.length < 1) {
		document.getElementById("messageInvalid3").innerHTML = "Select one option in Gender.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('gender3').style.borderColor = "red";
		return false;
	}

	// Street Address Line1
	if (streetAdd == "") {
		document.getElementById("messageInvalid3").innerHTML = "Address details can't be empty.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('addLine13').style.borderColor = "red";
		return false;
	}

	// City
	if (city == "") {
		document.getElementById("messageInvalid3").innerHTML = "City can't be empty";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('city3').style.borderColor = "red";
		return false;
	}

	// User ID
	if (userId.length < 6 || userId.length >= 10) {
		document.getElementById("messageInvalid3").innerHTML = "User ID must have 5 to 10 characters.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('userId3').style.borderColor = "red";
		return false;
	} else {
		for (var i = 0; i < userId.length; i++) {
			if (!(userId.charAt(i) >= '0' && userId.charAt(i) <= '9')) {
				document.getElementById("messageInvalid3").innerHTML = "User ID must be a number";
				document.getElementById("messageInvalid3").style.visibility = "visible";
				document.getElementById('userId3').style.borderColor = "red";
				return false;
			}
		}
	}

	// password validation
	if (pwd.length == 0) {
		document.getElementById("messageInvalid3").innerHTML = "Password cannot be empty.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('password3').style.borderColor = "red";
		return false;
	} else if (pwd.length < 3 || pwd.length > 8) {
		document.getElementById("messageInvalid3").innerHTML = "Password must be between 3 to 8 characters.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('password3').style.borderColor = "red";
		return false;
	} else if (cnfPwd.length == 0) {
		document.getElementById("messageInvalid3").innerHTML = "Confirm Password cannot be empty.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('cnfPassword3').style.borderColor = "red";
		return false;
	} else if (cnfPwd.length < 3 || cnfPwd.length > 8) {
		document.getElementById("messageInvalid3").innerHTML = "Confirm Password must be between 3 to 8 characters.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('cnfPassword3').style.borderColor = "red";
		return false;
	} else if (pwd != cnfPwd) {
		document.getElementById("messageInvalid3").innerHTML = "Password and Confirm Password must be the same.";
		document.getElementById("messageInvalid3").style.visibility = "visible";
		document.getElementById('cnfPassword3').style.borderColor = "red";
		document.getElementById('cnfPassword3').style.borderColor = "red";
		return false;
	}

}

function validateEditPwd() {
	var previousPassword, newPassword, newCnfPassword;

	previousPassword = document.getElementById("previousPassword").value;
	newPassword = document.getElementById("newPassword").value;
	newCnfPassword = document.getElementById("newCnfPassword").value;

	if (previousPassword.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Previous Password cannot be empty.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('previousPassword').style.borderColor = "red";
		return false;
	}
	if (newPassword.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Password cannot be empty.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('newPassword').style.borderColor = "red";
		return false;
	}
	if (newPassword.length < 3 || newPassword.length > 8) {
		document.getElementById("messageInvalid").innerHTML = "Password should be between 3 to 8 characters.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('newPassword').style.borderColor = "red";
		return false;
	}
	if (newCnfPassword.length == 0) {
		document.getElementById("messageInvalid").innerHTML = "Confirm Password cannot be empty.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('newCnfPassword').style.borderColor = "red";
		return false;
	}
	if (newCnfPassword.length < 3 || newCnfPassword.length > 8) {
		document.getElementById("messageInvalid").innerHTML = "Password should be between 3 to 8 characters.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('newCnfPassword').style.borderColor = "red";
		return false;
	}
	if (newPassword != newCnfPassword) {
		document.getElementById("messageInvalid").innerHTML = "Password and Confirm Password must be the same.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		document.getElementById('newPassword').style.borderColor = "red";
		document.getElementById('newCnfPassword').style.borderColor = "red";
		return false;
	}
}

function checkSkillLength() {
	var checkedInputLength = document.querySelectorAll('input[type="checkbox"]:checked').length;
	if(checkedInputLength < 3) {
		document.getElementById("messageInvalid").innerHTML = "Please select at least 3 skills.";
		document.getElementById("messageInvalid").style.visibility = "visible";
		return false;
	}
}