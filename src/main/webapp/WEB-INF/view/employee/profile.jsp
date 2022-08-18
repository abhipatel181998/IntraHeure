<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.intraheure.model.RegistrationVo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="data" value="${sessionScope.registrationVo }"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0,minimal-ui">
<title>Profile - Intra-Heure</title>
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
									<div class="float-right">
										<div class="dropdown">
											<a href="editProfile"><button
													class="btn btn-secondary btn-round px-3">
													<i class="fas fa-edit"></i> Edit Profile
												</button></a>
										</div>
									</div>
									<h3 class="page-title">Profile</h3>
								</div>
							</div>
						</div>
						<!-- end page title end breadcrumb -->
						<div class="row">
							<div class="col-lg-12 col-xl-3">
								<div class="card m-b-30">
									<div class="card-body">
										<c:if test="${data.profilePic eq null}">
											<img class="rounded-circle mx-auto d-block"
												style="width: 150px"
												src="${pageContext.request.contextPath }/adminResources/images/user.jpg"
												alt="user">
										</c:if>
										<c:if test="${data.profilePic ne null}">
											<img class="rounded-circle mx-auto d-block"
												style="width: 150px"
												src="${pageContext.request.contextPath }/profilePics/${data.profilePic}"
												alt="user">
										</c:if>
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
								<div class="row">
									<div class="col-lg-12 col-sm-12">
										<div class="card m-b-30 contact">
											<div class="card-body">
												<h6 class="header-title pb-3">Contact Information</h6>
												<ul class="list-unstyled mb-0">
													<li class=""><i class="fas fa-phone mr-2"></i> <b>phone
													</b>: +91 ${data.mobileNumber }</li>
													<li class="mt-2"><i class="fas fa-at mt-2 mr-2"></i> <b>Email
													</b>: ${data.email }</li>
													<li class="mt-2"><i
														class="fas fa-map-marker-alt mt-2 mr-2"></i> <b>Location</b>
														: ${data.cityVo.cityName }</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-xl-9">
								<div class="card m-b-30">
									<div class="card-body">
										<h5 class="page-title">Basic Informations</h5>
										<div class="row">
											<b class="col-sm-2">Birth Date:</b>
											<div class="col-sm-10">
												<p>
													<%
														RegistrationVo registrationVo = (RegistrationVo) pageContext.getAttribute("data");
														SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
														Date date = format.parse(registrationVo.getBirthDate());
														SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy");
														out.print(format2.format(date));
													%>
												</p>
											</div>
										</div>
										<div class="row">
											<b class="col-sm-2">Address:</b>
											<div class="col-sm-10">
												<p>${data.residentialAddress }</p>
											</div>
										</div>
										<div class="row">
											<b class="col-sm-2">City:</b>
											<div class="col-sm-10">
												<p>${data.cityVo.cityName }</p>
											</div>
										</div>
										<div class="row">
											<b class="col-sm-2">State:</b>
											<div class="col-sm-10">
												<p>${data.stateVo.stateName }</p>
											</div>
										</div>
										<div class="row">
											<b class="col-sm-2">Pincode:</b>
											<div class="col-sm-10">
												<p>${data.pincode }</p>
											</div>
										</div>
										<div class="row">
											<b class="col-sm-2">Gender:</b>
											<div class="col-sm-10">
												<p>${data.gender }</p>
											</div>
										</div>
										<div class="row">
											<b class="col-sm-2">Joining Date:</b>
											<div class="col-sm-10">
												<p>${data.joiningDate }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end row-->
	</div>
	<!-- container -->
	
	<!-- Page content Wrapper -->
	<!-- content -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- End Right content here -->
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
	<!-- App js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/app.js"></script>
</body>
</html>