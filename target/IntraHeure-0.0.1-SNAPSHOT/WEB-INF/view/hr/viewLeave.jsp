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
						<h4 class="page-title">Leave Types</h4>
					</div>
					<div class="col-sm-4 text-right m-b-30">
						<a href="#" class="btn btn-primary rounded" data-toggle="modal"
							data-target="#add_department"><i class="fa fa-plus"></i> Add
							New Leave</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div>
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th>Leave Id</th>
										<th>Leave Name</th>
										<th>Leave Description</th>
										<th class="text-right">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${leaveData }" var="data">
										<tr>
											<td>${data.leaveId }</td>
											<td>${data.leaveName }</td>
											<td>${data.leaveDesc }</td>
											<td class="text-right">
												<div class="dropdown">
													<a href="#" class="action-icon dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false"><i
														class="fa fa-ellipsis-v"></i></a>
													<ul class="dropdown-menu pull-right">
														<li><a href="#" data-toggle="modal"
															data-target="#edit_department" title="Edit"
															onclick="editLeaveType(${data.leaveId})"><i
																class="fa fa-pencil m-r-5"></i> Edit</a></li>
														<li><a
															href="deleteLeaveType?leaveId=${data.leaveId }"
															data-toggle="modal" data-target="#delete_department"
															title="Delete"><i class="fa fa-trash-o m-r-5"></i>
																Delete</a></li>
													</ul>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="delete_department" class="modal custom-modal fade"
			role="dialog">
			<div class="modal-dialog">
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Delete Leave</h4>
					</div>
					<div class="modal-body card-box">
						<p>Are you sure want to delete this?</p>
						<div class="m-t-20 text-left">
							<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
							<button type="submit" class="btn btn-danger">Delete</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="add_department" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Add Leave</h4>
					</div>
					<div class="modal-body">
						<f:form action="addLeaveType" modelAttribute="addLeaveType"
							method="POST">
							<div class="form-group">
								<label>Leave Name <span class="text-danger">*</span></label>
								<f:input class="form-control" type="text" path="leaveName"
									required="required" />
							</div>
							<div class="form-group">
								<label>Leave Description</label>
								<f:textarea class="form-control" rows="5" cols=""
									path="leaveDesc"></f:textarea>
							</div>
							<div class="m-t-20 text-center">
								<button class="btn btn-primary">Add Leave</button>
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div>
		<div id="edit_department" class="modal custom-modal fade"
			role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Edit Leave</h4>
					</div>
					<div class="modal-body">
						<f:form modelAttribute="addLeaveType" action="addLeaveType"
							method="POST">
							<f:input type="hidden" id="editLeaveId" path="leaveId" />
							<div class="form-group">
								<label>Leave Name <span class="text-danger">*</span></label>
								<f:input class="form-control" type="text" id="editLeaveName"
									path="leaveName" required="required" />
							</div>
							<div class="form-group">
								<label>Leave Description</label>
								<f:textarea class="form-control" rows="5" cols=""
									id="editLeaveDesc" path="leaveDesc"></f:textarea>
							</div>
							<div class="m-t-20 text-center">
								<button class="btn btn-primary">Save Changes</button>
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
		function editLeaveType(leaveId) {
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var leaveTypeDataJson = JSON.parse(htp.responseText);

					for (var i = 0; i < leaveTypeDataJson.length; i++) {
						var leaveName = leaveTypeDataJson[i].leaveName;
						var leaveDesc = leaveTypeDataJson[i].leaveDesc;
					}
					document.getElementById("editLeaveId").value = leaveId;
					document.getElementById("editLeaveName").value = leaveName;
					document.getElementById("editLeaveDesc").value = leaveDesc;
				}
			}
			htp.open("get", "searchLeaveType?leaveId=" + leaveId, false);
			htp.send();
		}
	</script>

</body>
</html>