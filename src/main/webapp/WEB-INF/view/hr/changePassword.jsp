<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/adminResources/images/favicon.png">
<title>Change Password - Intra-Heure</title>
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
	href="${pageContext.request.contextPath }/adminResources/css/style.css">
</head>
<body>
	<div class="main-wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<h4 class="page-title">Change Password</h4>
						<c:if test="${sessionScope.message ne null }">
							<div class="alert alert-info" role="alert">${sessionScope.message }</div>
							<c:remove var="message" scope="session" />
						</c:if>
						<c:set var="loginId" value="${sessionScope.loginId }"></c:set>
						<f:form modelAttribute="loginVo" action="updatePassword"
							method="post" onsubmit="return validate()">
							<input type="hidden" name="loginId" value="${loginId }">
							<div class="row">
								<div class="col-xs-12 col-sm-12">
									<div class="form-group">
										<label>Old password</label> <input type="password"
											class="form-control" required="required"
											onblur="checkPassword(${loginId})" id="password" /> <span
											id="passwordText" class="text-danger"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-sm-6">
									<div class="form-group">
										<label>New password</label> <input type="password"
											class="form-control" name="password" id="newPassword" />
									</div>
								</div>
								<div class="col-xs-12  col-sm-6">
									<div class="form-group">
										<label>Confirm password</label> <input type="password"
											class="form-control" id="confiremPassword" /> <span
											id="conPasswordText" class="text-danger"></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 text-center m-t-20">
									<button type="submit" class="btn btn-primary" id="submit"
										disabled="disabled">Update Password</button>
								</div>
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
		src="${pageContext.request.contextPath }/adminResources/js/jquery.slimscroll.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/app.js"></script>

	<!--[if lt IE 9] -->
	<script
		src="${pageContext.request.contextPath }/adminResources/js/html5shiv.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/adminResources/js/respond.min.js"></script>

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
		
		function validate(){
			var newpassword = document.getElementById("newPassword").value;
			var conpassword = document.getElementById("confiremPassword").value;
			
			if (newpassword!=conpassword) {
				document.getElementById("conPasswordText").innerText = "New Password and Confirm Password does not match";
				return false;
			}
			return true;
		}
	</script>
</body>
</html>