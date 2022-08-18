<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0,minimal-ui">
<title>Registration - Intra-Heure</title>
<meta content="Admin Dashboard" name="description">
<meta content="themesdesign" name="author">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/employeeResources/images/favicon.png">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/animate.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/icons.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/style.css"
	rel="stylesheet" type="text/css">
</head>
<body class="fixed-left">
	<!-- Begin page -->
	<!--<div class="accountbg"></div>-->
	<div id="stars"></div>
	<div id="stars2"></div>
	<div class="wrapper-page">
		<div class="card">
			<div class="card-body">
				<h3 class="text-center mt-0">
					<a href="index.html" class="logo logo-admin"><img
						src="${pageContext.request.contextPath }/employeeResources/images/logo.png"
						height="100" alt="logo"></a>
				</h3>
				<h6 class="text-center">Sign Up !</h6>
				<div class="p-3">
					<f:form class="form-horizontal" modelAttribute="addEmployee"
						action="employeeRegister" method="POST">
						<div class="form-group row">
							<div class="col-12">
								<input class="form-control" type="text" placeholder="First Name"
									name="firstName" required="required"></input>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-12">
								<input class="form-control" type="text" placeholder="Last Name"
									name="lastName" required="required"></input>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-4">Gender :</div>
							<div class="col-4">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input"
										id="customRadio1" name="gender" value="male"> <label
										class="custom-control-label" for="customRadio1">Male</label>
								</div>
							</div>
							<div class="col-4">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input"
										id="customRadio2" name="gender" value="female"> <label
										class="custom-control-label" for="customRadio2">Female</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-4">Birth Date:</div>
							<div class="col-8">
								<input class="form-control" type="date" id="example-date-input"
									name="birthDate" value="${data.birthDate }" required="required">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-12">
								<input type="email" class="form-control"
									placeholder="Email Address" name="loginVo.userName"
									required="required">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-12">
								<input type="password" class="form-control"
									placeholder="Password" name="loginVo.password"
									required="required">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-12">
								<input type="text" class="form-control"
									placeholder="Enter Mobile Number" name="mobileNumber"
									required="required"></input>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-6">
								<f:select class="custom-select" id="department"
									path="departmentVo.departmentId"
									onchange="getDesignationByDepartment()">
									<f:option value="0">Select Department</f:option>
									<f:options items="${departmentData }" itemValue="departmentId"
										itemLabel="departmentName" />
								</f:select>
							</div>
							<div class="col-6">
								<f:select class="custom-select" id="designation"
									path="designationVo.designationId">
									<option selected="selected">Select Designation</option>
								</f:select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-12">
								<f:textarea class="form-control"
									placeholder="Enter Residential Address"
									path="residentialAddress" required="required"></f:textarea>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-6">
								<f:select class="custom-select" id="state"
									path="stateVo.stateId" onchange="getCityByState()">
									<f:option value="0">Select State</f:option>
									<f:options items="${stateData }" itemValue="stateId"
										itemLabel="stateName" />
								</f:select>
							</div>
							<div class="col-6">
								<f:select class="custom-select" id="city" path="cityVo.cityId">
									<f:option value="0">Select City</f:option>
								</f:select>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-12">
								<input type="text" class="form-control"
									placeholder="Enter Pincode" name="pincode" required="required"></input>
							</div>
						</div>
						<div class="form-group text-center row m-t-20">
							<div class="col-12">
								<button
									class="btn btn-danger btn-block waves-effect waves-light"
									type="submit">Register</button>
							</div>
						</div>
						<div class="form-group m-t-10 mb-0 row">
							<div class="col-12 m-t-20 text-center">
								<a href="login" class="text-muted">Already have account?</a>
							</div>
						</div>
					</f:form>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/modernizr.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/detect.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery.blockUI.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/waves.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery.nicescroll.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery.scrollTo.min.js"></script>
	<!-- App js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/app.js"></script>

	<script type="text/javascript">
		function getCityByState() {

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

					designation.innerHTML = "";

					var op = document.createElement("option");
					op.text = "Select Designation";
					op.value = "0";
					designation.options.add(op);

					for (var i = 0; i < designationDataJson.length; i++) {

						var op = document.createElement("option");

						if (designationDataJson[i].designationName != "Human Resources(HR)") {
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