<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<c:set var="data" value="${sessionScope.registrationVo }"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0,minimal-ui">
<title>Edit Profile - Intra-Heure</title>
<meta content="Admin Dashboard" name="description">
<meta content="themesdesign" name="author">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/employeeResources/images/favicon.png">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/employeeResources/plugins/animate/animate.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/icons.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/style.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
.pic-container {
	cursor: pointer;
	overflow: hidden;
}

.pic {
	width: 100%;
	height: 100%;
}

.pic-container.pic-xs {
	width: 50px;
	height: 50px;
}

.pic-container.pic-small {
	width: 70px;
	height: 70px;
}

.pic-container.pic-medium {
	width: 150px;
	height: 150px;
}

.pic-container.pic-large {
	width: 250px;
	height: 250px;
}

.pic-container.pic-xl {
	width: 350px;
	height: 350px;
}

.pic-container.pic-circle {
	border-radius: 50%;
}

.pic-overlay {
	background-color: #ccc;
	opacity: 0.5;
	width: 100%;
	height: 100%;
	margin: 0;
	position: relative;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
}

.pic-container:hover .pic-overlay {
	top: -100%;
}

.pic-overlay a {
	display: block;
	padding: 10px;
}

.pic-xs .pic-overlay a {
	padding: 5px;
}

.pic-overlay .fa-window-close-o {
	color: red;
}

.pic-overlay .fa-pencil-square-o {
	color: blue;
}

.pic-medium .pic-overlay a i {
	font-size: 20px;
}

.pic-large .pic-overlay a i {
	font-size: 35px;
}

.pic-xl .pic-overlay a i {
	font-size: 45px;
}
</style>
</head>
<body class="fixed-left">
	<!-- Begin page -->
	<div id="wrapper">
		<!-- ========== Left Sidebar Start ========== -->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- Left Sidebar End -->
		<!-- Start right Content here -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<!-- Top Bar Start -->
				<div class="topbar">
					<jsp:include page="header.jsp"></jsp:include>
				</div>
				<!-- Top Bar End -->
				<div class="page-content-wrapper">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12">
								<div class="page-title-box">
									<h3 class="page-title">Edit Profile</h3>
								</div>
							</div>
						</div>
						<!-- end page title end breadcrumb -->
						<div class="row">
							<div class="col-lg-12">
								<f:form action="updateProfile" modelAttribute="editProfile"
									method="POST" enctype="multipart/form-data">
									<input type="hidden" name="userId" value="${data.userId }">
									<div class="card m-b-30">
										<div class="card-body">
											<div class="pic-container pic-medium pic-circle"
												style="margin: auto;">
												<c:if test="${data.profilePic eq null}">
													<img class="pic rounded-circle mx-auto d-block"
														src="${pageContext.request.contextPath }/employeeResources/images/user.jpg"
														id="profileImg" alt="Profile Picture">
												</c:if>
												<c:if test="${data.profilePic ne null}">
													<img class="pic rounded-circle mx-auto d-block"
														src="${pageContext.request.contextPath }/profilePics/${data.profilePic}"
														id="profileImg" alt="Profile Picture">
												</c:if>

												<div class="pic-overlay">
													<label for="file" class="fas fa-user-edit fa-2x"> <input
														type="file" id="file" style="visibility: hidden;"
														onchange="readURL(this);" name="file"></input>
													</label>
												</div>
											</div>
											<div class="text-center">
												<h4 class="mt-2 mb-0 text-capitalize">${data.firstName }
													${data.lastName }</h4>
												<p class="mt-2 mb-0 text-muted">Employee Id:
													${data.userId}</p>
												<br>
												<h6 class="text-muted">${data.departmentVo.departmentName }
													(${data.designationVo.designationName })</h6>
											</div>
										</div>
									</div>
									<div class="card m-b-30">
										<div class="card-body">
											<h5 class="page-title">Basic Informations</h5>
											<div class="form-group">
												<b>First Name</b> <input type="text" class="form-control"
													required value="${data.firstName }" name="firstName">
											</div>
											<div class="form-group">
												<b>Last Name</b> <input type="text" class="form-control"
													required value="${data.lastName }" name="lastName">
											</div>
											<div class="form-group">
												<b>Gender</b> <select class="custom-select" name="gender"
													id="gender"><option>Select Gender</option>
													<option value="male">Male</option>
													<option value="femmale">Female</option></select>
											</div>
											<div class="form-group">
												<b>Birth Date</b> <input class="form-control" type="date"
													id="example-date-input" name="birthDate"
													value="${data.birthDate }">
											</div>
										</div>
									</div>
									<div class="card m-b-30">
										<div class="card-body">
											<h5 class="page-title">Contact Informations</h5>
											<div class="form-group">
												<b>Address</b>
												<textarea class="form-control" cols="" rows=""
													name="residentialAddress" required>${data.residentialAddress }</textarea>
											</div>
											<div class="form-group">
												<b>State</b>
												<f:select class="custom-select" path="stateVo.stateId"
													onchange="getCityData()" id="state">
													<f:option value="0">Select State</f:option>
													<f:options items="${stateData }" itemValue="stateId"
														itemLabel="stateName" />
												</f:select>
											</div>
											<div class="form-group">
												<b>City</b>
												<f:select class="custom-select" id="city"
													path="cityVo.cityId">
													<f:option value="0">Select City</f:option>
												</f:select>
											</div>
											<div class="form-group">
												<b>Pincode</b> <input type="text" class="form-control"
													required value="${data.pincode }" name="pincode">
											</div>
											<div class="form-group">
												<b>Mobile Number</b> <input type="text" class="form-control"
													required value="${data.mobileNumber }" name="mobileNumber">
											</div>
											<div class="form-group">
												<b>Email Address</b> <input type="email"
													class="form-control" required value="${data.email }"
													name="email">
											</div>
											<div class="form-group">
												<input type="submit" class="btn btn-primary btn-block mb-2"
													value="Save &amp; Update" />
											</div>
										</div>
									</div>
								</f:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END wrapper -->
	</div>
	<!-- Page content Wrapper -->
	<!-- content -->
	<jsp:include page="footer.jsp"></jsp:include>
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
		$(document).ready(function() {
			$("#gender").val("${data.gender}");
			$("#state").val("${data.stateVo.stateId}");
			city.innerHTML = "";
			var op = document.createElement("option");
			op.text = "${data.cityVo.cityName}";
			op.value = "${data.cityVo.cityId}";
			city.options.add(op);
		});
	</script>

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

			htp.open("get",
					"${pageContext.request.contextPath }/searchCityByState?stateVo.stateId="
							+ stateId.value, true);
			htp.send();
		}
	</script>

	<!-- For live profile view -->
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					document.getElementById('profileImg').src = e.target.result;
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>