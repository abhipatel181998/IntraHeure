<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/adminResources/images/favicon.png">
<title>Leave - Intra-Heure</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/line-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/font-awesome.min.css">
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
					<div class="col-sm-8">
						<h4 class="page-title">Manage Leave Requests</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div>
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th>Request Id</th>
										<th>Request From</th>
										<th>Leave Type</th>
										<th>To Date</th>
										<th>From Date</th>
										<th>Status</th>
										<th class="text-right">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${leaveRequestData }" var="data">
										<c:forEach items="${employeeData }" var="emp">
											<c:if test="${data.loginVo.loginId eq emp.loginVo.loginId }">
												<tr>
													<td>${data.leaveRequestId }</td>
													<td><c:if test="${emp.profilePic eq null}">
															<img class="avatar"
																src="${pageContext.request.contextPath }/adminResources/images/user.jpg"
																alt="user" id="profileImg">
														</c:if> <c:if test="${emp.profilePic ne null}">
															<img class="avatar"
																src="${pageContext.request.contextPath }/profilePics/${emp.profilePic}"
																alt="user" id="profileImg">
														</c:if>
														<h2>
															<a href="viewEmployeeProfile?userId=${emp.userId }">${emp.firstName }
																${emp.lastName }<span>${emp.designationVo.designationName }</span>
															</a>
														</h2></td>
													<td>${data.leaveTypeVo.leaveName }</td>
													<td>${data.toDate }</td>
													<td>${data.fromDate }</td>
													<td><c:if test="${data.requestStatus == 2}">
															<i class="fa fa-dot-circle-o text-primary"></i> Pending</c:if> <c:if
															test="${data.requestStatus == 1}">
															<i class="fa fa-dot-circle-o text-danger"></i> Rejected</c:if> <c:if
															test="${data.requestStatus == 0}">
															<i class="fa fa-dot-circle-o text-success"></i> Approved</c:if></td>
													<td class="text-right">
														<div class="dropdown">
															<a href="#" class="action-icon dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-ellipsis-v"></i></a>
															<ul class="dropdown-menu pull-right">
																<li><a href="#" data-toggle="modal"
																	data-target="#view_details" title="view"
																	onclick="viewDetails(${data.leaveRequestId})"><i
																		class="fa fa-pencil m-r-5"></i> View Details</a></li>
																<li><hr></li>
																<li><a href=""><i
																		class="fa fa-check m-r-5 text-success"></i> Approve</a></li>
																<li><a href=""><i
																		class="fa fa-times m-r-5 text-danger"></i> Decline</a></li>
															</ul>
														</div>
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="view_details" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Leave Request Details</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Leave Type </label>
							<p id="leaveType"></p>
						</div>
						<div class="form-group">
							<label>Leave Reason</label>
							<p id="leaveReason"></p>
						</div>
						<div class="form-group">
							<label>From Date</label>
							<p id="fromDate"></p>
						</div>
						<div class="form-group">
							<label>To Date</label>
							<p id="toDate"></p>
						</div>
						<div class="form-group">
							<label>Request Status</label>
							<p id="requestStatus"></p>
						</div>
						<div class="form-group">
							<label>Reject Reason</label>
							<p id="rejectReason"></p>
						</div>
						<div class="m-t-20 text-center">
							<button class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
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
		src="${pageContext.request.contextPath }/adminResources/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/jquery.slimscroll.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/app.js"></script>

	<!-- Data Table Methods -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/customDataTableMethods.js"></script>

	<!--[if lt IE 9]-->
	<script
		src="${pageContext.request.contextPath }/adminResources/js/html5shiv.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/adminResources/js/respond.min.js"></script>


	<script type="text/javascript">
		function viewDetails(leaveRequestId) {
			console.log("run");
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var leaveRequestDataJson = JSON.parse(htp.responseText);
					console.log(leaveRequestDataJson);
					for (var i = 0; i < leaveRequestDataJson.length; i++) {
						var leaveType = leaveRequestDataJson[i].leaveType;
						var leaveReason = leaveRequestDataJson[i].leaveReason;
						var fromDate = leaveRequestDataJson[i].fromDate;
						var toDate = leaveRequestDataJson[i].toDate;
						var rejectReason = leaveRequestDataJson[i].rejectReason;
						var requestStatus = leaveRequestDataJson[i].requestStatus;

						document.getElementById("leaveType").innerHTML = leaveType;
						document.getElementById("leaveReason").innerHTML = leaveReason;
						document.getElementById("rejectReason").innerHTML = rejectReason;
						document.getElementById("fromDate").innerHTML = fromDate;
						document.getElementById("toDate").innerHTML = toDate;
						document.getElementById("rejectReason").innerHTML = rejectReason;
						if (requestStatus == 2) {
							document.getElementById("requestStatus").innerHTML = "Pending";
							document.getElementById("requestStatus").className = "text-primary";
						}
						if (requestStatus == 1) {
							document.getElementById("requestStatus").innerHTML = "Rejected";
							document.getElementById("requestStatus").className = "text-danger";
						}
						if (requestStatus == 0) {
							document.getElementById("requestStatus").innerHTML = "Approved";
							document.getElementById("requestStatus").className = "text-success";
						}
					}
				}
			}
			htp.open("get",
					"${pageContext.request.contextPath}/searchLeaveRequest?leaveRequestId="
							+ leaveRequestId, false);
			htp.send();
		}
	</script>

	<script type="text/javascript">
		$('#dataTable').dataTable({
			"aaSorting" : []
		});
	</script>

</body>
</html>