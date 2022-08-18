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
<title>Designation - Intra-Heure</title>
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
						<h4 class="page-title">Designations</h4>
					</div>
					<div class="col-sm-4 text-right m-b-30">
						<a href="#" class="btn btn-primary rounded" data-toggle="modal"
							data-target="#add_designation"><i class="fa fa-plus"></i> Add
							New Designation</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th>Designation Id</th>
										<th>Department</th>
										<th>Designation</th>
										<th>Designation Description</th>
										<th class="text-right">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${designationData }" var="data">
										<tr>
											<td>${data.designationId }</td>
											<td>${data.departmentVo.departmentName }</td>
											<td>${data.designationName }</td>
											<td>${data.designationDesc }</td>
											<td class="text-right">
												<div class="dropdown">
													<a href="#" class="action-icon dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false"><i
														class="fa fa-ellipsis-v"></i></a>
													<ul class="dropdown-menu pull-right">
														<li><a href="#"
															onclick="designationEditData(${data.designationId}, ${data.departmentVo.departmentId})"
															data-toggle="modal" data-target="#edit_designation"
															title="Edit"><i class="fa fa-pencil m-r-5"></i> Edit</a></li>
														<li><a
															href="deleteDesignation?designationId=${data.designationId }"
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
		<div id="delete_designation" class="modal custom-modal fade"
			role="dialog">
			<div class="modal-dialog">
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Delete Designation</h4>
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
		<div id="add_designation" class="modal custom-modal fade"
			role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Add Designation</h4>
					</div>
					<div class="modal-body">
						<f:form action="addDesignation" modelAttribute="addDesignation"
							method="POST">
							<div class="form-group">
								<label>Select Department<span class="text-danger">*</span></label>
								<f:select path="departmentVo.departmentId" class="form-control">
									<f:option value="0">Select Department</f:option>
									<f:options items="${departmentData }"
										itemLabel="departmentName" itemValue="departmentId"
										class="from-control"></f:options>
								</f:select>
							</div>
							<div class="form-group">
								<label>Designation Name <span class="text-danger">*</span></label>
								<f:input class="form-control" required="required" type="text"
									path="designationName"></f:input>
							</div>


							<div class="form-group">
								<label>City Description</label>
								<f:textarea class="form-control" rows="5" cols=""
									path="designationDesc"></f:textarea>
							</div>
							<div class="m-t-20 text-center">
								<input type="submit" class="btn btn-primary"
									value="Add Designation" />
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div>
		<div id="edit_designation" class="modal custom-modal fade"
			role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Edit Designation</h4>
					</div>
					<div class="modal-body">
						<f:form action="addDesignation" modelAttribute="addDesignation"
							method="POST">
							<f:input type="hidden" id="editDesignationId"
								path="designationId" />
							<div class="form-group">
								<div class="form-group">
									<label>Select State<span class="text-danger">*</span></label>
									<f:select path="departmentVo.departmentId" class="form-control">
										<c:forEach items="${departmentData }" var="data">
											<f:option value="${data.departmentId }"
												id="departmentId${data.departmentId }">${data.departmentName }</f:option>
										</c:forEach>
									</f:select>
								</div>
								<div class="form-group">
									<label>Designation Name <span class="text-danger">*</span></label>
									<f:input class="form-control" type="text"
										id="editDesignationName" path="designationName"
										required="required"></f:input>
								</div>
								<div class="form-group">
									<label>City Description</label>
									<f:textarea class="form-control" rows="5" cols=""
										id="editDesignationDesc" path="designationDesc"></f:textarea>
								</div>
							</div>
							<div class="m-t-20 text-center">
								<input type="submit" class="btn btn-primary"
									value="Edit Designation">
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
		function designationEditData(designationId, departmentId) {
			var htp = new XMLHttpRequest();
			console.log(designationId);
			console.log(departmentId);

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var designationDataJson = JSON.parse(htp.responseText);

					for (var i = 0; i < designationDataJson.length; i++) {
						var designationName = designationDataJson[i].designationName;
						var designationDesc = designationDataJson[i].designationDesc;
					}
					document.getElementById("editDesignationId").value = designationId;
					document.getElementById("editDesignationName").value = designationName;
					document.getElementById("editDesignationDesc").value = designationDesc;
					document.getElementById("departmentId" + departmentId).selected = "selected";
				}
			}
			htp.open("get", "${pageContext.request.contextPath }/searchDesignation?designationId=" + designationId,
					false);
			htp.send();
		}
	</script>
</body>
</html>