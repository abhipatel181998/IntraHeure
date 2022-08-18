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
<title>Feedback - Intra-Heure</title>
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
						<h4 class="page-title">Feedback</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table m-b-0"
								id="dataTable">
								<thead>
									<tr>
										<th>Feedback Id</th>
										<th>Feedback From</th>
										<th>Feedback Description</th>
										<th>Created Date</th>
										<th>Ratings</th>
										<th class="text-right">Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${feedbackData }" var="data">
										<c:forEach items="${registrationData }" var="reg">
											<c:if
												test="${data.feedbackFrom.loginId eq reg.loginVo.loginId }">
												<tr>
													<td>${data.feedbackId }</td>
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
																${reg.lastName }<span>${reg.designationVo.designationName }</span>
															</a>
														</h2></td>
													<td>${data.feedbackDesc }</td>
													<td>${data.feedbackDate }</td>
													<td>${data.ratings }</td>
													<td><a
														href="deleteFeedback?feedbackId=${data.feedbackId }"
														class="btn btn-danger">Delete</a></td>
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
		<%-- <div id="reply_complain" class="modal custom-modal fade" role="dialog">
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
								<input type="hidden" name="complainDate" id="editComplainDate">
								<label>Complain Subject <span class="text-danger">*</span></label>
								<input class="form-control" type="text" name="complainSub"
									required="required" readonly="readonly" id="editComplainSub" />
							</div>
							<div class="form-group">
								<label>Complain Description<span class="text-danger">*</span></label>
								<textarea class="form-control" rows="5" cols=""
									name="complainDesc" required="required" readonly="readonly"
									id="editComplainDesc"></textarea>
							</div>
							<div class="form-group">
								<label>Reply Description<span class="text-danger">*</span></label>
								<textarea class="form-control" rows="5" cols="" name="replyDesc"
									required="required"></textarea>
							</div>
							<div class="m-t-20 text-center">
								<input type="submit" class="btn btn-primary" value="Reply" />
							</div>
						</f:form>
					</div>
				</div>
			</div>
		</div> --%>
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