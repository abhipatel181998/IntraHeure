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
<title>Coplain - IntraHeure</title>
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
					<div class="col-xs-8">
						<h4 class="page-title">Complains</h4>
					</div>
					<div class="col-xs-4 text-right m-b-30">
						<a href="#" class="btn btn-primary rounded pull-right"
							data-toggle="modal" data-target="#send_complain"><i
							class="fa fa-plus"></i> Send Complain</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th>Complain Id</th>
										<th>Subject</th>
										<th>Created Date</th>
										<th>Reply Date</th>
										<th>Status</th>
										<th class="text-right">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${complainData }" var="data">
										<tr>
											<td>${data.complainId }</td>
											<td>${data.complainSub }</td>
											<td>${data.complainDate }</td>
											<td>${data.replyDate }</td>
											<td><c:if test="${data.complainStatus == 1}">
													<i class="fa fa-dot-circle-o text-danger"></i> Pending</c:if> <c:if
													test="${data.complainStatus == 0}">
													<i class="fa fa-dot-circle-o text-success"></i> Replied</c:if></td>
											<td class="text-right">
												<div class="dropdown">
													<a href="#" class="action-icon dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false"><i
														class="fa fa-ellipsis-v"></i></a>
													<ul class="dropdown-menu pull-right">
														<li><a href="#" title="Edit" data-toggle="modal"
															data-target="#edit_ticket"
															onclick="viewreply(${data.complainId})"><i
																class="fa fa-pencil m-r-5"></i> View</a></li>
														<li><a
															href="deleteComplain?complainId=${data.complainId }"><i
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
		<div id="send_complain" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-lg">
					<div class="modal-header">
						<h4 class="modal-title">Lodge Complain</h4>
					</div>
					<div class="modal-body">
						<f:form modelAttribute="addComplain" action="sendComplain"
							method="POST">
							<div class="form-group">
								<label>Complain Subject <span class="text-danger">*</span></label>
								<input class="form-control" type="text" name="complainSub"
									required="required" />
							</div>
							<div class="form-group">
								<label>Complain Description<span class="text-danger">*</span></label>
								<textarea class="form-control" rows="5" cols=""
									name="complainDesc" required="required"></textarea>
							</div>
							<div class="m-t-20 text-center">
								<input type="submit" class="btn btn-primary" value="Send" />
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div>
		<div id="edit_ticket" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<f:form action="deleteComplain" method="GET">
					<div class="modal-content modal-lg">
						<input type="hidden" name="complainId" id="complainId" value="">
						<div class="modal-header">
							<h4 class="modal-title">View Complain Details</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Complain Subject</label>
								<p id="complainSub"></p>
							</div>
							<div class="form-group">
								<label>Complain Status: &nbsp;<span id="complainStatus"></span></label>
							</div>
							<div class="form-group">
								<label>Complain Description</label>
								<p id="complainDesc"></p>
							</div>
							<div class="form-group">
								<label>Reply Description</label>
								<p id="replyDesc"></p>
							</div>
							<div class="m-t-20 text-center">
								<input type="submit" class="btn btn-danger" value="Delete" />
							</div>
						</div>
					</div>
				</f:form>
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
		$('#dataTable').dataTable({
			"ordering" : false,
			"language": {
		        "emptyTable":"No Record Found"
		    }
		});
	</script>

	<script type="text/javascript">
		function viewreply(complainId) {
			console.log(complainId)
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var complainDataJson = JSON.parse(htp.responseText);

					for (var i = 0; i < complainDataJson.length; i++) {
						var complainSub = complainDataJson[i].complainSub;
						var complainDesc = complainDataJson[i].complainDesc;
						var replyDesc = complainDataJson[i].replyDesc;
						var complainStatus = complainDataJson[i].complainStatus;
					}
					document.getElementById("complainId").value = complainId;
					document.getElementById("complainSub").innerHTML = complainSub;
					document.getElementById("complainDesc").innerHTML = complainDesc;
					document.getElementById("replyDesc").innerHTML = replyDesc;
					if(complainStatus == 0){
						document.getElementById("complainStatus").innerHTML = "Replied";
						document.getElementById("complainStatus").className = "text-success";
					}
					if(complainStatus == 1){
						document.getElementById("complainStatus").innerHTML = "Pending";
						document.getElementById("complainStatus").className = "text-danger";
					}
				}
			}
			htp.open("get", "${pageContext.request.contextPath }/searchComplain?complainId="+complainId, false);
			htp.send();
		}
	</script>

</body>

</html>