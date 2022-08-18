<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/adminResources/images/favicon.png">
<title>Salary - Intra-Heure</title>
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
						<h4 class="page-title">Employee Salary</h4>
					</div>
					<div class="col-xs-8 text-right m-b-30">
						<a href="#" class="btn btn-primary rounded pull-right"
							data-toggle="modal" data-target="#add_salary"><i
							class="fa fa-plus"></i> Add Salary</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th style="width: 30%;">Employee</th>
										<th>Employee ID</th>
										<th>Email</th>
										<th>Joining Date</th>
										<!-- <th>Role</th> -->
										<th>Salary</th>
										<th>Payslip</th>
										<th class="text-right">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${salaryData }" var="data">
										<c:forEach items="${employeeData }" var="emp">
											<c:if test="${data.loginVo.loginId eq emp.loginVo.loginId }">
												<tr>
													<td><a href="viewHrProfile?userId=${emp.userId }"
														class="avatar"><c:if test="${emp.profilePic eq null}">
														${fn:substring(emp.firstName,0,1)
													}
													</c:if> <c:if test="${emp.profilePic ne null}">
																<img class="avatar"
																	src="${pageContext.request.contextPath }/profilePics/${emp.profilePic}"
																	alt="user">
															</c:if></a>
														<h2>
															<a href="viewEmployeeProfile?userId=${emp.userId }">${emp.firstName }
																${emp.lastName }<span>${emp.designationVo.designationName }</span>
															</a>
														</h2></td>
													<td>${emp.userId }</td>
													<td>${emp.email }</td>
													<td>1 Jan 2013</td>
													<td>&#8377; ${data.netSalary }</td>
													<td><a class="btn btn-xs btn-primary"
														href="salary-view.jsp">Generate Slip</a></td>
													<td class="text-right">
														<div class="dropdown">
															<a href="#" class="action-icon dropdown-toggle"
																data-toggle="dropdown" aria-expanded="false"><i
																class="fa fa-ellipsis-v"></i></a>
															<ul class="dropdown-menu pull-right">
																<li><a href="#"
																	onclick="editSalary('${data.salaryId}',${data.loginVo.loginId },'${emp.firstName }','${emp.lastName }')"
																	data-toggle="modal" data-target="#edit_salary"
																	title="Edit"><i class="fa fa-pencil m-r-5"></i>
																		Edit</a></li>
																<li><a
																	href="deleteSalary?salaryId=${data.salaryId }"><i
																		class="fa fa-trash-o m-r-5"></i> Delete</a></li>
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
		<div id="add_salary" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-lg">
					<div class="modal-header">
						<h4 class="modal-title">Add Staff Salary</h4>
					</div>
					<div class="modal-body">
						<f:form modelAttribute="addSalary" action="addSalary"
							method="POST">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Select Department</label>
										<f:select class="select" id="department" path=""
											onchange="getDesignationByDepartment()">
											<f:option value="0">Select Department</f:option>
											<f:options items="${departmentData }"
												itemValue="departmentId" itemLabel="departmentName" />
										</f:select>
									</div>
									<div class="form-group">
										<label>Select Designation</label> <select class="select"
											onchange="getEmployeeByDesignation()" id="designation">
											<option value="0">Select Designation</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Select Employee</label>
										<f:select class="select" id="employee" path="loginVo.loginId">
											<f:option value="0">Select Employee</f:option>
										</f:select>
									</div>
									<div class="form-group">
										<label>Net Salary</label>
										<f:input class="form-control" id="netSalary" type="text"
											path="netSalary" readonly="true"></f:input>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<h4 class="text-primary">Earnings</h4>
									<div class="form-group">
										<label>Basic</label>
										<f:input class="form-control" id="basic" type="text"
											onblur="fillSalaryDetails()" path="basicSalary"></f:input>
									</div>
									<div class="form-group">
										<label>House Rent Allowance(15%)</label>
										<f:input class="form-control" id="hra" type="text" path="hra"
											readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>Conveyance Allowance</label>
										<f:input class="form-control" id="conveyance" type="text"
											path="conveyance" readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>Medical Allowance</label>
										<f:input class="form-control" id="medical" type="text"
											path="medical" readonly="true"></f:input>
									</div>
								</div>
								<div class="col-md-6">
									<h4 class="text-primary">Deductions</h4>
									<div class="form-group">
										<label>TDS</label>
										<f:input class="form-control" id="tds" type="text" path="tds"
											readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>Employee's State Insurance</label>
										<f:input class="form-control" id="esi" type="text" path="esi"
											readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>Provident fund</label>
										<f:input class="form-control" id="pf" type="text" path="pf"
											readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>professional Tax</label>
										<f:input class="form-control" id="profTax" type="text"
											path="profTax" readonly="true"></f:input>
									</div>
								</div>
							</div>
							<div class="m-t-20 text-center">
								<input class="btn btn-primary" type="submit"
									value="Create Salary">
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div>
		<div id="edit_salary" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-lg">
					<div class="modal-header">
						<h4 class="modal-title">Edit Staff Salary</h4>
					</div>
					<div class="modal-body">
						<f:form modelAttribute="addSalary" action="addSalary"
							method="POST">
							<f:input type="hidden" id="editSalaryId" path="salaryId" />
							<f:input type="hidden" id="editLoginId" path="loginVo.loginId" />
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Employee Name</label>
										<f:input class="form-control" type="text" id="employeeName"
											path="" readonly="true" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Net Salary</label>
										<f:input class="form-control" id="editNetSalary" type="text"
											path="netSalary" readonly="true"></f:input>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<h4 class="text-primary">Earnings</h4>
									<div class="form-group">
										<label>Basic</label>
										<f:input class="form-control" id="editBasic" type="text"
											onblur="fillEditSalaryDetails()" path="basicSalary"></f:input>
									</div>
									<div class="form-group">
										<label>House Rent Allowance(15%)</label>
										<f:input class="form-control" id="editHra" type="text"
											path="hra" readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>Conveyance Allowance</label>
										<f:input class="form-control" id="editConveyance" type="text"
											path="conveyance" readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>Medical Allowance</label>
										<f:input class="form-control" id="editMedical" type="text"
											path="medical" readonly="true"></f:input>
									</div>
								</div>
								<div class="col-md-6">
									<h4 class="text-primary">Deductions</h4>
									<div class="form-group">
										<label>TDS</label>
										<f:input class="form-control" id="editTds" type="text"
											path="tds" readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>Employee's State Insurance</label>
										<f:input class="form-control" id="editEsi" type="text"
											path="esi" readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>Provident fund</label>
										<f:input class="form-control" id="editPf" type="text"
											path="pf" readonly="true"></f:input>
									</div>
									<div class="form-group">
										<label>professional Tax</label>
										<f:input class="form-control" id="editProfTax" type="text"
											path="profTax" readonly="true"></f:input>
									</div>
								</div>
							</div>
							<div class="m-t-20 text-center">
								<button class="btn btn-primary">Save &amp; Update</button>
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div>
		<div id="delete_salary" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Delete Salary</h4>
					</div>
					<form>
						<div class="modal-body card-box">
							<p>Are you sure want to delete this?</p>
							<div class="m-t-20 text-left">
								<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</div>
					</form>
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

						if (designationDataJson[i].designationName != "Human Resources(HR)") {
							op.text = designationDataJson[i].designationName;
							op.value = designationDataJson[i].designationId;
							designation.options.add(op);
						}
					}

				}
			}

			htp.open("get",
					"${pageContext.request.contextPath }/searchDesignationByDepartment?DepartmentVo.departmentId="
							+ departmentId.value, true);
			htp.send();
		}

		function getEmployeeByDesignation() {

			var designationId = document.getElementById("designation");
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {

				if (htp.readyState == 4) {

					var employeeDataJson = JSON.parse(htp.responseText);

					employee.innerHTML = "";

						var op = document.createElement("option");
						
						op.text = "Select Employee";
						op.value = "0";
						employee.options.add(op);
					for (var i = 0; i < employeeDataJson.length; i++) {
						var op = document.createElement("option");
						
						op.text = employeeDataJson[i].employeeName;
						op.value = employeeDataJson[i].loginId;

						employee.options.add(op);
					}

				}
			}

			htp.open("get",
					"${pageContext.request.contextPath }/searchEmployeeByDesignation?DesignationVo.designationId="
							+ designationId.value, true);
			htp.send();
		}
		function fillSalaryDetails() {
			var basic = document.getElementById("basic").value;

			var hra = ((basic) * 15) / 100;
			document.getElementById("hra").value = hra;

			var conveyance = 19200;
			document.getElementById("conveyance").value = conveyance;

			var medical = 15000;
			document.getElementById("medical").value = medical;

			var tds;
			if (basic <= 250000) {
				tds = 0;
			}
			if (basic > 250000 && basic <= 500000) {
				tds = ((basic) * 5) / 100;
			}
			if (basic > 500000 && basic <= 1000000) {
				tds = 12500 + ((basic) * 20) / 100;
			}
			if (basic > 1000000) {
				tds = 112500 + ((basic) * 30) / 100;
			}
			document.getElementById("tds").value = tds;

			var esi = 0;
			document.getElementById("esi").value = esi;

			var pf = (basic * 12) / 100;
			document.getElementById("pf").value = pf;

			var profTax;
			if (basic / 12 <= 5999) {
				profTax = 0;
			}
			if (basic / 12 > 5999 && basic / 12 <= 8999) {
				profTax = 80 * 12;
			}
			if (basic / 12 < 9000 && basic / 12 <=11999) {
				profTax = 150*12;
			}
			if (basic / 12 >11999) {
				profTax = 200*12;
			}
			document.getElementById("profTax").value = profTax;

			var netSalary = +(+basic + +hra + +conveyance + +medical)
					- +(+tds + +esi + +pf + +profTax);
			document.getElementById("netSalary").value = netSalary;
		}

		function fillEditSalaryDetails() {
			var basic = document.getElementById("editBasic").value;

			var hra = ((basic) * 15) / 100;
			document.getElementById("editHra").value = hra;

			var conveyance = 19200;
			document.getElementById("editConveyance").value = conveyance;

			var medical = 15000;
			document.getElementById("editMedical").value = medical;

			var tds;
			if (basic <= 250000) {
				tds = 0;
			}
			if (basic > 250000 && basic <= 500000) {
				tds = ((basic) * 5) / 100;
			}
			if (basic > 500000 && basic <= 1000000) {
				tds = 12500 + ((basic) * 20) / 100;
			}
			if (basic > 1000000) {
				tds = 112500 + ((basic) * 30) / 100;
			}
			document.getElementById("editTds").value = tds;

			var esi = 0;
			document.getElementById("editEsi").value = esi;

			var pf = (basic * 12) / 100;
			document.getElementById("editPf").value = pf;

			var profTax;
			if (basic / 12 <= 5999) {
				profTax = 0;
			}
			if (basic / 12 > 5999 && basic / 12 <= 8999) {
				profTax = 80 * 12;
			}
			if (basic / 12 < 9000 && basic / 12 <=11999) {
				profTax = 150*12;
			}
			if (basic / 12 >11999) {
				profTax = 200*12;
			}
			document.getElementById("editProfTax").value = profTax;

			var netSalary = +(+basic + +hra + +conveyance + +medical)
					- +(+tds + +esi + +pf + +profTax);
			document.getElementById("editNetSalary").value = netSalary;
		}

		
		function editSalary(salaryId,empLoginId,empFirstName,empLastName){
			document.getElementById("employeeName").value = empFirstName+" "+empLastName;
			document.getElementById("editSalaryId").value = salaryId;
			document.getElementById("editLoginId").value = empLoginId;
			
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var salaryDataJson = JSON.parse(htp.responseText);
					
					for (var i = 0; i < salaryDataJson.length; i++) {
						var basicSalary = salaryDataJson[i].basicSalary;
					}					
					document.getElementById("editBasic").value = basicSalary;
				}
			}
			htp.open("get", "${pageContext.request.contextPath }/searchSalary?salaryId=" + salaryId, false);
			htp.send();
			
			 fillEditSalaryDetails();
		}
	</script>
</body>
</html>