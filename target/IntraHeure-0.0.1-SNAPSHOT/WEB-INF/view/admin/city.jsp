<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
<title>City - Intra-Heure</title>
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
						<h4 class="page-title">Manage City</h4>
					</div>
					<div class="col-sm-4 text-right m-b-30">
						<a href="#" class="btn btn-primary rounded" data-toggle="modal"
							data-target="#add_department"><i class="fa fa-plus"></i> Add
							New City</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div>
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th>City Id</th>
										<th>State Name</th>
										<th>City Name</th>
										<th>City Description</th>
										<th class="text-right">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cityData }" var="data">
										<tr>
											<td>${data.cityId }</td>
											<td>${data.stateVo.stateName }</td>
											<td>${data.cityName }</td>
											<td>${data.cityDesc }</td>
											<td class="text-right">
												<div class="dropdown">
													<a href="#" class="action-icon dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false"><i
														class="fa fa-ellipsis-v"></i></a>
													<ul class="dropdown-menu pull-right">
														<li><a href="#"
															onclick="cityEditData(${data.cityId},${data.stateVo.stateId })"
															data-toggle="modal" data-target="#edit_department"
															title="Edit"><i class="fa fa-pencil m-r-5"></i> Edit</a></li>
														<li><a href="deleteCity?cityId=${data.cityId }"><i
																class="fa fa-trash-o m-r-5"></i> Delete</a></li>
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
		<div id="add_department" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-md">
					<div class="modal-header">
						<h4 class="modal-title">Add City</h4>
					</div>
					<div class="modal-body">
						<f:form modelAttribute="addCity" action="addCity" method="POST">
							<div class="form-group">
								<label>Select State<span class="text-danger">*</span></label>
								<f:select path="stateVo.stateId" class="form-control">
									<f:option value="0">Select State</f:option>
									<f:options items="${stateData }" itemLabel="stateName"
										itemValue="stateId"></f:options>
								</f:select>
							</div>
							<div class="form-group">
								<label>City Name <span class="text-danger">*</span></label>
								<f:input class="form-control" type="text" path="cityName"></f:input>
							</div>
							<div class="form-group">
								<label>City Description</label>
								<f:textarea class="form-control" rows="5" cols=""
									path="cityDesc"></f:textarea>
							</div>
							<div class="m-t-20 text-center">
								<input type="submit" class="btn btn-primary" value="Add City" />
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
						<h4 class="modal-title">Edit City</h4>
					</div>
					<div class="modal-body">
						<f:form modelAttribute="addCity" action="addCity" method="POST">
							<f:input type="hidden" path="cityId" id="editCityId"></f:input>
							<div class="form-group">
								<label>Select State<span class="text-danger">*</span></label>
								<f:select path="stateVo.stateId" class="form-control">
									<c:forEach items="${stateData }" var="data">
										<f:option value="${data.stateId }"
											id="stateId${data.stateId }">${data.stateName }</f:option>
									</c:forEach>
								</f:select>
							</div>
							<div class="form-group">
								<label>City Name <span class="text-danger">*</span></label>
								<f:input class="form-control" type="text" id="editCityName"
									path="cityName" required="required"></f:input>
							</div>
							<div class="form-group">
								<label>City Description</label>
								<f:textarea class="form-control" rows="5" cols=""
									path="cityDesc" id="editCityDesc"></f:textarea>
							</div>
							<div class="m-t-20 text-center">
								<input type="submit" class="btn btn-primary"
									value="Save Changes">
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
		function cityEditData(cityId, stateId) {
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var cityDataJson = JSON.parse(htp.responseText);

					for (var i = 0; i < cityDataJson.length; i++) {
						var cityName = cityDataJson[i].cityName;
						var cityDesc = cityDataJson[i].cityDesc;
					}
					document.getElementById("editCityId").value = cityId;
					document.getElementById("editCityName").value = cityName;
					document.getElementById("editCityDesc").value = cityDesc;
					document.getElementById("stateId"+stateId).selected = "selected";
				}
			}
			htp.open("get", "${pageContext.request.contextPath }/searchCity?cityId="+cityId, false);
			htp.send();
		}
	</script>
</body>
</html>