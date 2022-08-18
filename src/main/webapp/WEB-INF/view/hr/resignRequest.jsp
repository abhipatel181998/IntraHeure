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
<title>Resign - Intra-Heure</title>
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
						<h4 class="page-title">Resign Requests</h4>
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
										<th>Request Date</th>
										<th>Reason</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${resignationData }" var="data">
										<c:forEach items="${employeeData }" var="emp">
											<c:if
												test="${data.requestFrom.loginId eq emp.loginVo.loginId  and sessionScope.departmentId eq emp.departmentVo.departmentId}">
												<tr>
													<td>${data.resignationId }</td>
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
													<td>${data.requestDate }</td>
													<c:if test="${fn:length(data.reason) gt 45 }">
														<td>${fn:substring(data.reason, 0, 45)}.....</td>
													</c:if>
													<c:if test="${fn:length(data.reason) lt 45 }">
														<td>${fn:substring(data.reason, 0, 45)}</td>
													</c:if>
													<!-- 45words -->
													<td><a class="btn btn-primary" data-toggle="modal"
														data-target="#reply_complain"
														onclick="viewDeatails(${data.resignationId},'${emp.firstName } ${emp.lastName }')">View
															Details</a></td>
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
		<div id="reply_complain" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Resign Request Details</h4>
					</div>
					<div class="modal-body">
						<form action="rejectResignRequest" method="post">
							<input type="hidden" id="resignationId" name="resignationId">
							<div class="form-group">
								<label>Request Form </label>
								<p id="from"></p>
							</div>
							<div class="form-group">
								<label>Date and Time</label>
								<p id="date"></p>
							</div>
							<div class="form-group">
								<label>Reason</label>
								<p id="reason"></p>
							</div>
							<div class="form-group">
								<label>Reason to reject request (write only when
									rejection request) <span class="text-danger">*</span>

								</label>
								<textarea class="form-control" rows="5" cols="" name="reason"
									required="required"></textarea>
							</div>
							<div class="m-t-20 text-center">
								<a id="approve" class="btn btn-success">Approve</a> <input
									class="btn btn-danger" type="submit" value="Reject">
							</div>
						</form>
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
		function viewDeatails(resignationId, name) {
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var Json = JSON.parse(htp.responseText);
					console.log(Json);
					for (var i = 0; i < Json.length; i++) {
						var reason = Json[i].reason;
						var date = Json[i].date;
						var from = Json[i].from;

						document.getElementById("reason").innerHTML = reason;
						document.getElementById("date").innerHTML = date;
						document.getElementById("from").innerHTML = name;
						document.getElementById("approve").href = "approveResignRequest?resignationId="+resignationId;
						document.getElementById("resignationId").value = resignationId;
						}
					}
				}
			htp.open("get",
					"${pageContext.request.contextPath}/searchResignRequest?resignationId="
							+ resignationId, false);
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