<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0,minimal-ui">
<title>Dashboard - Intra-Huere</title>
<meta content="Admin Dashboard" name="description">
<meta content="themesdesign" name="author">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/employeeResources/images/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/employeeResources/css/MetroJs.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/employeeResources/css/morris.css">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/jquery-jvectormap-2.0.2.css"
	rel="stylesheet">
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

<!-- chatbot css -->
<link
	href="${pageContext.request.contextPath }/employeeResources/css/jquery.mCustomScrollbar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/owl.carousel.min.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath }/employeeResources/css/owl.theme.default.min.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath }/employeeResources/css/chatbot.css"
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
									<div class="float-right"></div>
									<h4 class="page-title">Dashboard</h4>
								</div>
							</div>
						</div>
						<!-- end page title end breadcrumb -->
						<div class="row">
							<div class="col-md-12 col-xl-3">
								<div class="card mini-stat">
									<div class="mini-stat-icon text-right">
										<i class="fas fa-money-bill-alt"></i>
									</div>
									<div class="p-4">
										<h6 class="text-uppercase mb-3">Salary to get this month</h6>

										<h4 class="mb-0">
											Rs.${sessionScope.salaryToGet }<small class="ml-2"></small>
										</h4>
									</div>
								</div>
							</div>
							<div class="col-md-12 col-xl-3">
								<div class="card mini-stat">
									<div class="mini-stat-icon text-right">
										<i class="fa fa-calendar-check"></i>
									</div>
									<div class="p-4">
										<h6 class="text-uppercase mb-3">Leave allow this month</h6>

										<h4 class="mb-0">
											${sessionScope.leaveAllowedThisMonth }<small class="ml-2"></small>
										</h4>
									</div>
								</div>
							</div>
							<div class="col-md-12 col-xl-3">
								<div class="card mini-stat">
									<div class="mini-stat-icon text-right">
										<i class="fa fa-calendar"></i>
									</div>
									<div class="p-4">
										<h6 class="text-uppercase mb-3">Pending leave request</h6>

										<h4 class="mb-0">
											${sessionScope.pendingLeaveRequest }<small class="ml-2"></small>
										</h4>
									</div>
								</div>
							</div>
							<div class="col-md-12 col-xl-3">
								<div class="card mini-stat">
									<div class="mini-stat-icon text-right">
										<i class="mdi mdi-alert"></i>
									</div>
									<div class="p-4">
										<h6 class="text-uppercase mb-3">Pending complain status</h6>
										<div class="float-right"></div>
										<h4 class="mb-0">
											${sessionScope.pendingComplainRequest }<small class="ml-2"></small>
										</h4>
									</div>
								</div>
							</div>
						</div>
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
		src="${pageContext.request.contextPath}/employeeResources/js/detect.js"></script>
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
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/MetroJs.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/dashboard.js"></script>
	<!-- App js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/app.js"></script>

	<!-- chatbot js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/chatbot.js"></script>


	<!--Chat bot div  -->
	<img
		src="${pageContext.request.contextPath }/employeeResources/images/chatbot-logo.png"
		class="chat-launcher" id="chaticon" onclick="fnviewchat()"></img>

	<!-- Popup: Shopping cart items -->
	<!-- <div class="modal fade popup-cart" id="chatbot" tabindex="-1"
		role="dialog" aria-hidden="true" style="padding-top: 150px;">
		<div class="modal-dialog"></div>

	</div> -->
	<!-- chatbot -->
	<jsp:include page="chatbot.jsp"></jsp:include>

	<script>
		$(document).ready(
				function() {

					$('#itemslider').carousel({
						interval : 3000
					});

					$('.carousel-showmanymoveone .item').each(
							function() {
								var itemToClone = $(this);

								for (var i = 1; i < 6; i++) {
									itemToClone = itemToClone.next();

									if (!itemToClone.length) {
										itemToClone = $(this)
												.siblings(':first');
									}

									itemToClone.children(':first-child')
											.clone().addClass(
													"cloneditem-" + (i))
											.appendTo($(this));
								}
							});
				});
	</script>
</body>
</html>