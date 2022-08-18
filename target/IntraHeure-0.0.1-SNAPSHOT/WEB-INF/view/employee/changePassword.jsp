<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<!-- Mirrored from themesdesign.in/dashor/layouts/vertical/form-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 03 Jan 2019 15:36:08 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0,minimal-ui">
<title>Change Password - Intra-Heure</title>
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
									<h4 class="page-title">Form Validation</h4>
								</div>
							</div>
						</div>
						<!-- end page title end breadcrumb -->
						<div class="row">
							<div class="col-md-12 col-xl-6">
								<div class="card m-b-30">
									<div class="card-body">
										<c:if test="${sessionScope.message ne null }">
											<div class="alert alert-info" role="alert">
												${sessionScope.message }</div>
											<c:remove var="message" scope="session" />
										</c:if>
										<f:form modelAttribute="loginVo" action="updatePassword"
											method="post" onsubmit="return validate()">
											<c:set var="loginId" value="${sessionScope.loginId }"></c:set>
											<input type="hidden" name="loginId" value="${loginId }">
											<div class="form-group">
												<label>Enter Password</label> <input type="password"
													class="form-control" required
													placeholder="Enter Current Password"
													onblur="checkPassword(${loginId})" id="password"> <span
													id="passwordText" class="text-danger"></span>
											</div>
											<div class="form-group">
												<label>New Password</label>
												<div>
													<input type="password" id="pass2" class="form-control"
														required placeholder="Enter New Password" name="password">
												</div>
												<div class="m-t-10">
													<input type="password" class="form-control" required
														data-parsley-equalto="#pass2"
														placeholder="Re-Type New Password" id="confiremPassword">
													<span id="conPasswordText" class="text-danger"></span>
												</div>
											</div>
											<div class="form-group mb-0">
												<div>
													<button type="submit"
														class="btn btn-secondary waves-effect waves-light"
														disabled="disabled" id="submit">Submit</button>
													<button type="reset"
														class="btn btn-danger waves-effect m-l-5">Cancel</button>
												</div>
											</div>
										</f:form>
									</div>
								</div>
							</div>
							<!-- end col -->
						</div>
						<!-- end row -->
					</div>
					<!-- container -->
				</div>
				<!-- Page content Wrapper -->
			</div>
			<!-- content -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		<!-- End Right content here -->
	</div>
	<!-- END wrapper -->
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
	<!-- Parsley js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/plugins/parsleyjs/parsley.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/pages/form-validation.init.js"></script>
	<!-- App js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/app.js"></script>

	<script type="text/javascript">
		function checkPassword(loginId) {
			var password = document.getElementById("password").value;

			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var status = JSON.parse(htp.responseText);
					if (password == '') {
						document.getElementById("passwordText").innerText = "Field can not be blank";
						document.getElementById("submit").disabled = "disabled";
					}
					if (password != '') {
						if (status == true) {
							document.getElementById("passwordText").innerText = "";
							oldpass = true;
							document.getElementById("submit").removeAttribute(
									"disabled");
						}
						if (status == false) {
							document.getElementById("passwordText").innerText = "Please Enter Right Password";
							oldpass = false;
							document.getElementById("submit").disabled = "disabled";
						}
					}
				}
			}
			htp.open("get",
					"${pageContext.request.contextPath }/validate/checkPassword?loginId="
							+ loginId + "&password=" + password, false);
			htp.send();
		}

		function validate() {
			var newpassword = document.getElementById("pass2").value;
			var conpassword = document.getElementById("confiremPassword").value;

			if (newpassword != conpassword) {
				document.getElementById("conPasswordText").innerText = "New Password and Confirm Password does not match";
				return false;
			}
			return true;
		}
	</script>
</body>
</html>