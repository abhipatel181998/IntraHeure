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
<title>Complain - Intra-Heure</title>
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
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th>Complain Id</th>
										<th>Complain From</th>
										<th>Complain To</th>
										<th>Subject</th>
										<th>Created Date</th>
										<th>Status</th>
										<th class="text-right">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${complainData }" var="data">
										<c:forEach items="${registrationData }" var="reg">
											<c:if
												test="${data.complainFrom.loginId eq reg.loginVo.loginId }">
												<tr>
													<td>${data.complainId }</td>
													<td><c:if test="${reg.profilePic eq null}">
															<img class="avatar"
																src="${pageContext.request.contextPath }/adminResources/images/user.jpg"
																alt="user" id="profileImg">
														</c:if> <c:if test="${reg.profilePic ne null}">
															<img class="avatar"
																src="${pageContext.request.contextPath }/profilePics/${reg.profilePic}"
																alt="user" id="profileImg">
														</c:if>
														<h2>
															<a href="viewEmployeeProfile?userId=${reg.userId }">${reg.firstName }
																${reg.lastName }<span>${reg.departmentVo.departmentName }(${reg.designationVo.designationName})</span>
															</a>
														</h2></td>
													<c:forEach items="${registrationData }" var="reg">
														<c:if
															test="${data.complainTo.loginId eq reg.loginVo.loginId }">
															<td><a
																href="viewEmployeeProfile?userId=${reg.userId }"
																class="avatar">${fn:substring(reg.firstName,0,1)}</a>
																<h2>
																	<a href="viewEmployeeProfile?userId=${reg.userId }">${reg.firstName }
																		${reg.lastName }<span>${reg.departmentVo.departmentName }(HR)</span>
																	</a>
																</h2></td>
														</c:if>
													</c:forEach>
													<c:forEach items="${adminData }" var="admin">
														<c:if test="${data.complainTo.loginId eq admin.loginId }">
															<td><a class="avatar">A</a>
																<h2>
																	<a>Admin</a>
																</h2></td>
														</c:if>
													</c:forEach>
													<td>${data.complainSub }</td>
													<td>${data.complainDate }</td>
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
																	data-target="#reply_complain"
																	onclick="reply(${data.complainId})"><i
																		class="fa fa-pencil m-r-5"></i> View/Reply</a></li>
																<li><a
																	href="deleteComplain?complainId=${data.complainId }"><i
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
		<div id="reply_complain" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-content modal-lg">
					<div class="modal-header">
						<h4 class="modal-title">Reply Complain</h4>
					</div>
					<div class="modal-body">
						<f:form modelAttribute="replyComplain" action="replyComplain"
							method="POST">
							<div class="form-group">
								<input type="hidden" name="complainId" id="editComplainId">
								<label>Complain Subject</label>
								<p id="editComplainSub"></p>
							</div>
							<div class="form-group">
								<label>Complain Status: &nbsp;<span id="complainStatus"></span></label>
							</div>
							<div class="form-group">
								<label>Complain Description</label>
								<p id="editComplainDesc"></p>
							</div>
							<div class="form-group">
								<label>Reply Description</label>
								<p id="editReplyDesc"></p>
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
			$("#dataTable").dataTable({
				"ordering" : false
			});
	</script>

	<script type="text/javascript">
		function reply(complainId) {
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {
				if (htp.readyState == 4) {
					var complainDataJson = JSON.parse(htp.responseText);

					for (var i = 0; i < complainDataJson.length; i++) {
						var complainSub = complainDataJson[i].complainSub;
						var complainDesc = complainDataJson[i].complainDesc;
						var complainDate = complainDataJson[i].complainDate;
						var complainStatus = complainDataJson[i].complainStatus;
						var replyDesc = complainDataJson[i].replyDesc;
					}
					document.getElementById("editComplainId").value = complainId;
					document.getElementById("editComplainSub").innerHTML = complainSub;
					document.getElementById("editComplainDesc").innerHTML = complainDesc;
					if(complainStatus == 0){
						document.getElementById("complainStatus").innerHTML = "Replied";
						document.getElementById("complainStatus").className = "text-success";
					}
					if(complainStatus == 1){
						document.getElementById("complainStatus").innerHTML = "Pending";
						document.getElementById("complainStatus").className = "text-danger";
					}
					document.getElementById("editReplyDesc").innerHTML = replyDesc;
				}
			}
			htp.open("get", "${pageContext.request.contextPath }/searchComplain?complainId="+complainId, false);
			htp.send();
		}
	</script>

</body>

</html>