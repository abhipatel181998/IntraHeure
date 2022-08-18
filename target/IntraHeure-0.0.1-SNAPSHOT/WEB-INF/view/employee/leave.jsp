<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="en">
<!-- Mirrored from themesdesign.in/dashor/layouts/vertical/tables-datatable.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 03 Jan 2019 15:35:57 GMT -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0,minimal-ui">
<title>Leave - Intra-Huere</title>
<meta content="Admin Dashboard" name="description">
<meta content="themesdesign" name="author">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/employeeResources/images/favicon.png">
<!-- DataTables -->
<link
	href="${pageContext.request.contextPath }/employeeResources/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/employeeResources/css/buttons.bootstrap4.min.css"
	rel="stylesheet" type="text/css">
<!-- Responsive datatable examples -->
<link
	href="${pageContext.request.contextPath }/employeeResources/css/responsive.bootstrap4.min.css"
	rel="stylesheet" type="text/css">
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
<link
	href="${pageContext.request.contextPath }/employeeResources/css/sweetalert2.min.css"
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
										<div class="dropdown"></div>
									</div>
									<h4 class="page-title">Leave History</h4>
								</div>
							</div>
						</div>
						<!-- end page title end breadcrumb -->
						<div class="row">
							<div class="col-md-12">
								<div class="card m-b-30">
									<div class="card-body">
										<h4 class="mt-0 header-title">Leave History</h4>
										<table id="datatable"
											class="table table-bordered dt-responsive nowrap">
											<thead>
												<tr>
													<th>Leave Request Id</th>
													<th>To Date</th>
													<th>From Date</th>
													<th>Leave Type</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${leaveRequestData }" var="data">
													<c:if
														test="${data.loginVo.loginId eq sessionScope.loginId }">
														<tr>
															<th>${data.leaveRequestId }</th>
															<th>${data.toDate }</th>
															<th>${data.fromDate }</th>
															<th>${data.leaveTypeVo.leaveName }</th>
															<th><c:if test="${data.requestStatus == 2}">
																	<h6 class="text-success">Pending</h6>
																</c:if> <c:if test="${data.requestStatus == 1}">
																	<h6 class="text-danger">Decline</h6>
																	<button class="btn btn-primary"
																		onclick="viewreason(${data.leaveRequestId})">click
																		to see reason</button>
																</c:if> <c:if test="${data.requestStatus == 0}">
																	<h6 class="text-primary">Approved</h6>
																</c:if></th>
															<%-- <th><button class="btn btn-primary"
																	onclick="viewComplain(${data.complainId })">View</button>
																<a class="btn btn-danger"
																href="deleteComplain?complainId=${data.complainId }">Delete</a></th> --%>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- end col -->
						</div>
						<!-- end row -->
						<div class="row">
							<div class="col-md-12">
								<div class="card m-b-30"></div>
							</div>
						</div>
					</div>
					<!--end row-->
					<div class="row">
						<div class="col-md-12">
							<div class="card"></div>
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
	<!-- Required datatable js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/dataTables.bootstrap4.min.js"></script>
	<!-- Buttons examples -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/buttons.colVis.min.js"></script>
	<!-- Responsive examples -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/responsive.bootstrap4.min.js"></script>
	<!-- Datatable init js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/datatables.init.js"></script>
	<!-- App js -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/app.js"></script>
	<!-- Sweet-Alert  -->
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/sweet-alert.init.js"></script>
	<script
		src="${pageContext.request.contextPath }/employeeResources/js/sweetalert2.min.js"></script>

	<script type="text/javascript">
		function viewreason(leaveRequestId) {
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var leaveRequestDataJson = JSON.parse(htp.responseText);

					for (var i = 0; i < leaveRequestDataJson.length; i++) {
						var rejectReason = leaveRequestDataJson[i].rejectReason;
					}
					swal({
						  title: "View Complain",
						  html: '<h6>Reject Reason: </h6> <p>'+rejectReason+'</p> <br>',
								 showCancelButton: true,
								 cancelButtonColor: '#d9534f',
								 cancelButtonText:  'Close',
								 showConfirmButton: false,
								  }).catch(swal.noop);
				}
			}
			htp.open("get",
					"${pageContext.request.contextPath }/searchLeaveRequestEmp?leaveRequestId="
							+ leaveRequestId, false);
			htp.send();
		}
	</script>
</body>

</html>