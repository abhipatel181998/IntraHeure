<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/adminResources/images/favicon.png">
<title>HR - Intra-Heure</title>
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
	href="${pageContext.request.contextPath }/adminResources/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/bootstrap-datetimepicker.min.css">
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
					<div class="col-xs-4">
						<h4 class="page-title">Manage Hr</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th>Name</th>
										<th>Employee ID</th>
										<th>Email</th>
										<th>Mobile</th>
										<th>Join Date</th>
										<th class="text-right">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${hrData }" var="data">
										<tr>
											<td><a href="viewHrProfile?userId=${data.userId }"
												class="avatar"><c:if test="${data.profilePic eq null}">
														${fn:substring(data.firstName,0,1)
													}
													</c:if> <c:if test="${data.profilePic ne null}">
														<img class="avatar"
															src="${pageContext.request.contextPath }/profilePics/${data.profilePic}"
															alt="user">
													</c:if></a>
												<h2>
													<a href="viewHrProfile?userId=${data.userId }">${data.firstName }
														${data.lastName }<span>${data.departmentVo.departmentName}(HR)</span>
													</a>
												</h2></td>
											<td>${data.userId }</td>
											<td>${data.email }</td>
											<td>${data.mobileNumber }</td>
											<td>${data.joiningDate }</td>
											<td><a href="deleteHr?userId=${data.userId }"
												class="btn btn-danger">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
		src="${pageContext.request.contextPath }/adminResources/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/moment.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/bootstrap-datetimepicker.min.js"></script>
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

</body>
</html>