<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0,minimal-ui">
<title>Login - Intra-Heure</title>
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
					<a href="login" class="logo logo-admin"><img
						src="${pageContext.request.contextPath }/employeeResources/images/logo.png"
						height="100" alt="logo"></a>
				</h3>
				<h6 class="text-center">Sign In</h6>
				<%
					if (request.getParameter("error") != null) {
				%>
				<div class="alert alert-danger text-center" role="alert"
					style="margin-bottom: 0px;">Please Enter Correct Password.</div>
				<%
					}
				%>
				<c:if test="${sessionScope.message ne null}">
					<div class="alert alert-success text-center" role="alert"
						style="margin-bottom: 0px;">${message }</div>
					<c:remove var="message" scope="session" />
				</c:if>
				<div class="p-3">
					<form class="form-horizontal" action="j_spring_security_check"
						method="post">
						<div class="form-group row">
							<div class="col-12">
								<input class="form-control" type="email" name="username"
									required="required" placeholder="Username"
									onblur="checkUser();" id="username"> <span
									id="userText" class="text-danger"></span>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-12">
								<input class="form-control" type="password" name="password"
									required="required" placeholder="Password">
							</div>
						</div>
						<div class="form-group text-center row m-t-20">
							<div class="col-12">
								<button
									class="btn btn-danger btn-block waves-effect waves-light"
									type="submit" disabled="disabled" id="submit">Log In</button>
							</div>
						</div>
						<div class="form-group m-t-10 mb-0 row">
							<div class="col-sm-7 m-t-20">
								<a href="forgetPassword" class="text-muted"><i
									class="mdi mdi-lock"></i> Forgot your password.</a>
							</div>
							<div class="col-sm-5 m-t-20">
								<a href="registerHr" class="text-muted"><i
									class="mdi mdi-account-circle"></i>Create HR account.</a>
							</div>
							<div class="col-sm-12 m-t-40 text-center">
								<a href="registerEmployee" class="text-muted"><i
									class="mdi mdi-account-circle"></i>Create an Employee account.</a>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
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
		function checkUser() {
			var email = document.getElementById("username").value;

			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var userStatus = JSON.parse(htp.responseText);
					if (email == '') {
						document.getElementById("userText").innerText = "Field can not be blank";
						document.getElementById("submit").disabled = "disabled";
					}
					if (email != '') {
						if (userStatus == true) {
							document.getElementById("submit").removeAttribute(
									"disabled");
							document.getElementById("userText").innerText = "";
						}
						if (userStatus == false) {
							document.getElementById("userText").innerText = "User does not Exist";
							document.getElementById("submit").disabled = "disabled";
						}
					}
				}
			}
			htp.open("get", "validate/checkEmail?email=" + email, false);
			htp.send();
		}
	</script>
</body>
</html>
