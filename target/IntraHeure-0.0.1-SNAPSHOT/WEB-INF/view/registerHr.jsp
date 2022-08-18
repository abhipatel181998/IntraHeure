<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/adminResources/images/favicon.png">
<title>Registration - Intra-Heure</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/line-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/style.css">
</head>
<body>
	<div class="main-wrapper">
		<div class="account-page">
			<div class="container-fluids">
				<div class="account-box">
					<div class="account-wrapper">
						<div class="account-logo">
							<img
								src="${pageContext.request.contextPath }/adminResources/images/favicon.png"
								height="70" alt="Intra-Heure">
						</div>
						<h5 class="account-title">SignUp</h5>
						<f:form action="hrRegister" modelAttribute="hrRegister"
							method="POST">
							<div class="form-group">
								<input class="form-control" type="text"
									placeholder="Enter First Name" name="firstName"
									required="required" id="firstName"> <span
									class="text-danger" id="firstnameText"></span>
							</div>
							<div class="form-group">
								<input class="form-control" type="text"
									placeholder="Enter Last Name" name="lastName"
									required="required" id="lastName"> <span
									class="text-danger" id="lastnameText"></span>
							</div>
							<div class="form-group form-focus select-focus">
								<label class="control-label">Select Gender</label> <select
									class="select form-control floating" name="gender">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select> <span class="text-danger" id="genderText"></span>
							</div>
							<div class="form-group form-focus">
								<label class="control-label">Birth Date</label>
								<div class="cal-icon">
									<input class="form-control floating datetimepicker" type="text"
										name="birthDate" value="${data.birthDate }"
										required="required">
								</div>
							</div>
							<div class="form-group form-focus select-focus">
								<label class="control-label">Select Department</label>
								<f:select class="select form-control floating" id="department"
									path="departmentVo.departmentId"
									onchange="getDesignationByDepartment()">
									<f:option value="0">Select Department</f:option>
									<f:options items="${departmentData }" itemValue="departmentId"
										itemLabel="departmentName" />
								</f:select>
								<span class="text-danger" id="departmentText"></span>
							</div>
							<div class="form-group form-focus select-focus">
								<label class="control-label">Select Post</label> <select
									class="select form-control floating" id="designation"
									name="designationVo.designationId"><option
										selected="selected">Human Resources(HR)</option></select>
							</div>
							<div class="form-group">
								<input placeholder="Enter Email Id" class="form-control"
									type="email" name="loginVo.userName" required="required"
									id="email"> <span class="text-danger" id="emailText"></span>
							</div>
							<div class="form-group">
								<input placeholder="Enter Password"
									class="form-control floating" type="password"
									name="loginVo.password" required="required" id="password">
								<span class="text-danger" id="passwordText"></span>
							</div>
							<div class="form-group">
								<input placeholder="Enter Confirm Password"
									class="form-control floating" type="password"
									required="required" id="confirmpassword"
									onkeypress="checkpassword()"> <span class="text-danger"
									id="confirmpasswordText"></span>
							</div>
							<div class="form-group">
								<input placeholder="Enter Mobile Number"
									class="form-control floating" type="text" name="mobileNumber"
									required="required" id="mobilenumber"> <span
									class="text-danger" id="mobileText"></span>
							</div>
							<div class="form-group">
								<textarea class="form-control floating"
									placeholder="Enter Residential Address"
									name="residentialAddress" required="required" id="address"></textarea>
								<span class="text-danger" id="addressText"></span>
							</div>
							<div class="form-group form-focus select-focus">
								<label class="control-label">Select State</label>
								<f:select class="select form-control floating"
									path="stateVo.stateId" id="state" onchange="getCityData()">
									<f:option value="0">Select State</f:option>
									<f:options items="${stateData }" itemValue="stateId"
										itemLabel="stateName" />
								</f:select>
								<span class="text-danger" id="stateText"></span>
							</div>
							<div class="form-group form-focus select-focus">
								<label class="control-label">Select City</label> <select
									class="select form-control floating" id="city"
									name="cityVo.cityId">
									<option value="0">Select City</option>
								</select> <span class="text-danger" id="cityText"></span>
							</div>
							<div class="form-group">
								<input placeholder="Enter Your Pincode/Areacode"
									class="form-control floating" type="text" name="pincode"
									required="required" id="pincode"> <span
									class="text-danger" id="pincodeText"></span>
							</div>
							<div class="form-group text-center">
								<button class="btn btn-primary btn-block account-btn"
									type="submit">Register</button>
							</div>
							<div class="text-center">
								<a href="login">Already have an account?</a>
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sidebar-overlay" data-reff="#sidebar"></div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/app.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/moment.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/bootstrap-datetimepicker.min.js"></script>

	<!--[if lt IE 9]-->
	<script
		src="${pageContext.request.contextPath }/adminResources/js/html5shiv.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/adminResources/js/respond.min.js"></script>

	<!-- Validation Js -->

	<script type="text/javascript">
		function getCityData() {

			var stateId = document.getElementById("state");
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {

				if (htp.readyState == 4) {

					var cityDataJson = JSON.parse(htp.responseText);

					city.innerHTML = "";

					var op = document.createElement("option");
					op.text = "Select City";
					op.value = "0";
					city.options.add(op);

					for (var i = 0; i < cityDataJson.length; i++) {

						var op = document.createElement("option");

						op.text = cityDataJson[i].cityName;
						op.value = cityDataJson[i].cityId;

						city.options.add(op);
					}

				}
			}

			htp.open("get", "searchCityByState?stateVo.stateId="
					+ stateId.value, true);
			htp.send();
		}

		function getDesignationByDepartment() {

			var departmentId = document.getElementById("department");
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {

				if (htp.readyState == 4) {

					var designationDataJson = JSON.parse(htp.responseText);
					console.log(designationDataJson);
					designation.innerHTML = "";

					var op = document.createElement("option");

					for (var i = 0; i < designationDataJson.length; i++) {

						var op = document.createElement("option");

						if (designationDataJson[i].designationName == "Human Resources(HR)") {
							op.text = designationDataJson[i].designationName;
							op.value = designationDataJson[i].designationId;
							designation.options.add(op);
						}

					}

				}
			}

			htp.open("get",
					"searchDesignationByDepartment?DepartmentVo.DepartmentId="
							+ departmentId.value, true);
			htp.send();

		}
	</script>
</body>
</html>