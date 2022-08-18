<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
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
<title>Attendance - Intra-Heure</title>
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
	href="${pageContext.request.contextPath }/adminResources/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/attendance.css">
</head>
<body>
	<div class="main-wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="row">
					<div class="col-sm-8">
						<h4 class="page-title">Attendance Sheet</h4>
					</div>
					<div class="col-sm-4 text-right m-b-30">
						<a href="#" class="btn btn-primary rounded" data-toggle="modal"
							data-target="#add_file"><i class="fa fa-plus"></i> Upload
							Attendance File</a>
					</div>
				</div>
				<div class="row filter-row">
					<f:form action="viewAttendance" modelAttribute="uploadFile"
						method="POST">
						<div class="col-sm-4 col-xs-8">
							<div class="form-group form-focus select-focus">
								<label class="control-label">Select Month</label> <select
									class="select floating" name="month">
									<option>Select Month</option>
									<option value="jan">Jan</option>
									<option value="feb">Feb</option>
									<option value="mar">Mar</option>
									<option value="apr">Apr</option>
									<option value="may">May</option>
									<option value="jun">Jun</option>
									<option value="jul">Jul</option>
									<option value="aug">Aug</option>
									<option value="sep">Sep</option>
									<option value="oct">Oct</option>
									<option value="nov">Nov</option>
									<option value="dec">Dec</option>
								</select>
							</div>
						</div>
						<div class="col-sm-4 col-xs-8">
							<div class="form-group form-focus select-focus">
								<label class="control-label">Select Year</label> <select
									class="select floating" name="year">
									<option>Select Year</option>
									<c:forEach begin="2019" end="2039" var="year">
										<option value="${year }">${year }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-4 col-xs-8">
							<input type="submit" class="btn btn-success btn-block"
								value="See Records">
						</div>
					</f:form>
				</div>
				<div class="row filter-row details">
					<div class="col-sm-2 col-xs-6">
						<div class="bggreen title">W</div>
						<p>Working Day</p>
					</div>
					<div class="col-sm-2 col-xs-6">
						<div class="bgblue title">H</div>
						<p>HoliDay</p>
					</div>
					<div class="col-sm-3 col-xs-6">
						<div class="bgred title">P</div>
						<p>Personal Leave</p>
					</div>
					<div class="col-sm-3 col-xs-6">
						<div class="bgyellow title">M</div>
						<p>Medical Leave</p>
					</div>
					<div class="col-sm-2 col-xs-6">
						<div class="bgorange title clear">HL</div>
						<p>Half Leave</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table attendance"
								id="dataTable">
								<thead>
									<%
										List<?> attendanceData = (List<?>) request.getAttribute("attendanceData");
										int row = 0, rows = 0;
										if (attendanceData != null) {
											row = attendanceData.size();
											rows = row - 3;
									%>
									<%
										for (int i = 0; i < 2; i++) {
												List<?> data = (List<?>) attendanceData.get(i);
									%><tr>
										<%
											for (int j = 0; j < data.size(); j++) {
										%><th>
											<%
												out.println(data.get(j));
											%>
										</th>
										<%
											}
										%>
									</tr>
									<%
										}
									%>
								</thead>
								<tbody>
									<%
										for (int i = 2; i < rows; i++) {
												List<?> data = (List<?>) attendanceData.get(i);
									%><tr>
										<%
											for (int j = 0; j < data.size(); j++) {
														String type = data.get(j).toString().toUpperCase().trim();

														if (type.equals("W")) {
										%><td class="middle bggreen">W</td>
										<%
											}

														else if (type.equals("H")) {
										%><td class="middle bgblue">H</td>
										<%
											}

														else if (type.equals("P")) {
										%><td class="middle bgred">P</td>
										<%
											}

														else if (type.equals("M")) {
										%><td class="middle bgyellow">M</td>
										<%
											}

														else if (type.equals("HL")) {
										%><td class="middle bgorange">HL</td>
										<%
											}

														else {
										%>
										<td>
											<%
												out.println(data.get(j));
											%>
										</td>
										<%
											}
													}
										%>
									</tr>
									<%
										}
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="add_file" class="modal custom-modal fade" role="dialog">
		<div class="modal-dialog">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="modal-content modal-md">
				<div class="modal-header">
					<h4 class="modal-title">Upload Attendance File</h4>
				</div>
				<div class="modal-body">
					<f:form action="uploadAttendance" modelAttribute="uploadFile"
						enctype="multipart/form-data" method="POST">
						<div class="form-group">
							<label>Select Month<span class="text-danger">*</span></label> <select
								name="month" class="form-control">
								<option>Select Month</option>
								<option value="jan">Jan</option>
								<option value="feb">Feb</option>
								<option value="mar">Mar</option>
								<option value="apr">Apr</option>
								<option value="may">May</option>
								<option value="jun">Jun</option>
								<option value="jul">Jul</option>
								<option value="aug">Aug</option>
								<option value="sep">Sep</option>
								<option value="oct">Oct</option>
								<option value="nov">Nov</option>
								<option value="dec">Dec</option>
							</select>
						</div>
						<div class="form-group">
							<label>Select Year<span class="text-danger">*</span></label> <select
								name="year" class="form-control">
								<option>Select Year</option>
								<c:forEach begin="2019" end="2039" var="year">
									<option value="${year }">${year }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Select File<span class="text-danger">*</span></label> <input
								type="file" name="file" accept=".xlsx,.xls">
						</div>
						<div class="m-t-20 text-center">
							<input type="submit" class="btn btn-primary" value="Upload">
						</div>
					</f:form>
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