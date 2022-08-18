<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/adminResources/images/favicon.png">
<title>Employees - Intra-Heure</title>
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
						<h4 class="page-title">Manage Employees</h4>
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
									<c:forEach items="${employeeData }" var="data">
										<c:if
											test="${departmentId eq data.departmentVo.departmentId }">
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
														<a href="viewEmployeeProfile?userId=${data.userId }">${data.firstName }
															${data.lastName }<span>${data.designationVo.designationName }</span>
														</a>
													</h2></td>
												<td>${data.userId }</td>
												<td>${data.email }</td>
												<td>${data.mobileNumber }</td>
												<td>${data.joiningDate }</td>
												<td class="text-right">
													<div class="dropdown">
														<a href="#" class="action-icon dropdown-toggle"
															data-toggle="dropdown" aria-expanded="false"><i
															class="fa fa-ellipsis-v"></i></a>
														<ul class="dropdown-menu pull-right">
															<li><a href="#" title="Edit" data-toggle="modal"
																data-target="#view_employee"
																onclick="searchEmp(${data.userId},${data.departmentVo.departmentId },${data.designationVo.designationId })"><i
																	class="fa fa-pencil m-r-5"></i> View Details</a></li>
															<li><a href="deleteEmployee?userId=${data.userId }"><i
																	class="fa fa-trash-o m-r-5"></i> Delete</a></li>
														</ul>
													</div>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div id="view_employee" class="modal custom-modal fade" role="dialog">
				<div class="modal-dialog">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div class="modal-content modal-lg">
						<div class="modal-header">
							<h4 class="modal-title">Employee details</h4>
						</div>
						<div class="modal-body">
							<f:form class="m-b-30" modelAttribute="editDesignation"
								action="editDesignnation">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">First Name </label> <input
												class="form-control" type="text" id="firstName"
												disabled="disabled">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">Last Name</label> <input
												class="form-control" type="text" id="lastName"
												disabled="disabled">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">Email </label> <input
												class="form-control" type="email" id="email"
												disabled="disabled">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">Phone Number</label> <input
												class="form-control" type="text" id="mobileNumber"
												disabled="disabled">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">Joining Date </label>
											<div class="cal-icon">
												<input class="form-control datetimepicker" type="text"
													id="joiningDate" disabled="disabled">
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">Address</label>
											<textarea class="form-control" id="address"
												disabled="disabled"></textarea>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">State</label> <input
												class="form-control" type="text" id="state"
												disabled="disabled">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">City</label> <input
												class="form-control" type="text" id="city"
												disabled="disabled">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">Pincode</label> <input
												class="form-control" type="text" id="pincode"
												disabled="disabled">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">Department</label>
											<f:select path="stateVo.stateId" class="form-control"
												id="department" onchange="getDesignationByDepartment()">
												<c:forEach items="${departmentData }" var="data">
													<f:option value="${data.departmentId }"
														id="departmentId${data.departmentId }">${data.departmentName }</f:option>
												</c:forEach>
											</f:select>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="control-label">Designation</label>
											<f:select path="stateVo.stateId" class="form-control"
												id="designation">
												<c:forEach items="${designationData }" var="data">
													<f:option value="${data.designationId }"
														id="designationId${data.designationId }">${data.designationName }</f:option>
												</c:forEach>
											</f:select>
										</div>
									</div>
								</div>
								<div class="m-t-20 text-center">
									<input class="btn btn-primary" type="submit"
										value="Save Changes">
								</div>
							</f:form>
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
	<script type="text/javascript">
		function searchEmp(userId, departmentId, designationId) {
			var htp = new XMLHttpRequest();
			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var employeeDataJson = JSON.parse(htp.responseText);
					
					console.log(employeeDataJson);

					for (var i = 0; i < employeeDataJson.length; i++) {
						var firstName = employeeDataJson[i].firstName;
						var lastName = employeeDataJson[i].lastName;
						var gender = employeeDataJson[i].gender;
						var email = employeeDataJson[i].email;
						var mobileNumber = employeeDataJson[i].mobileNumber;
						var joiningDate = employeeDataJson[i].joiningDate;
						var address = employeeDataJson[i].address;
						var state = employeeDataJson[i].state;
						var city = employeeDataJson[i].city;
						var pincode = employeeDataJson[i].pincode;
						var department = employeeDataJson[i].department;
						var designation = employeeDataJson[i].designation;
					}
					document.getElementById("firstName").value = firstName;
					document.getElementById("lastName").value = lastName;
					document.getElementById("email").value = email;
					document.getElementById("mobileNumber").value = mobileNumber;
					document.getElementById("joiningDate").value = joiningDate;
					document.getElementById("address").value = address;
					document.getElementById("state").value = state;
					document.getElementById("city").value = city;
					document.getElementById("pincode").value = pincode;					
					document.getElementById("departmentId"+departmentId).selected = "selected";
					document.getElementById("designationId"+designationId).selected = "selected";
				}
			}
			htp.open("get", "${pageContext.request.contextPath }/searchEmployee?userId="+userId, false);
			htp.send();
		}
		
		function getDesignationByDepartment() {

			var departmentId = document.getElementById("department");
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {

				if (htp.readyState == 4) {

					var designationDataJson = JSON.parse(htp.responseText);

					designation.innerHTML = "";

					var op = document.createElement("option");
					op.text = "Select Designation";
					op.value = "0";
					designation.options.add(op);

					for (var i = 0; i < designationDataJson.length; i++) {

						var op = document.createElement("option");

						op.text = designationDataJson[i].designationName;
						op.value = designationDataJson[i].designationId;

						designation.options.add(op);
					}

				}
			}

			htp.open("get","${pageContext.request.contextPath }/searchDesignationByDepartment?DepartmentVo.DepartmentId="+ departmentId.value, true);
			htp.send();
		}
	</script>

</body>
</html>