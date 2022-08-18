function confirmPassword() {
	var password = document.getElementById("password").value;
	var confirmpassword = document.getElementById("confirmpassword").value;

	if (password == confirmpassword) {
		document.getElementById("confirmpasswordText").innerText = "";
		confirmpasswordCheck = true;
	}
	if (password != confirmpassword) {
		document.getElementById("confirmpasswordText").innerText = "Password and Confirm Password do not match!";
		confirmpasswordCheck = false;
	}

}

function checkUser() {
	var email = document.getElementById("email").value;

	var htp = new XMLHttpRequest();

	htp.onreadystatechange = function() {
		if (htp.readyState == 4) {
			var userStatus = JSON.parse(htp.responseText);
			if (userStatus == true) {
				document.getElementById("emailText").innerText = "Email already exist!";
				emailCheck = false;
			}
			if (userStatus == false) {
				document.getElementById("emailText").innerText = "";
				emailCheck = true;
			}
		}
	}
	htp.open("get", "validate/checkEmail?email=" + email, false);
	htp.send();
}