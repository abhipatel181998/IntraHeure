<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
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
<title>Profile - Intra-Heure</title>
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
						<h4 class="page-title">Profile</h4>
					</div>
				</div>
				<div class="card-box">
					<div class="row">
						<c:forEach items="${employeeData }" var="data">
							<div class="col-md-12">
								<div class="profile-view">
									<div class="profile-img-wrap">
										<div class="profile-img">
											<a href="#"><c:if test="${data.profilePic eq null}">
													<img class="avatar"
														src="${pageContext.request.contextPath }/adminResources/images/user.jpg"
														alt="user">
												</c:if> <c:if test="${data.profilePic ne null}">
													<img class="avatar"
														src="${pageContext.request.contextPath }/profilePics/${data.profilePic}"
														alt="user">
												</c:if></a>
										</div>
									</div>
									<div class="profile-basic">
										<div class="row">
											<div class="col-md-5">
												<div class="profile-info-left">
													<h3 class="user-name m-t-0 m-b-0">${data.firstName }
														${data.lastName }</h3>
													<p class="text-muted">${data.departmentVo.departmentName }
														(${data.designationVo.designationName })</p>
													<div class="staff-id">Employee ID : ${data.userId }</div>
												</div>
											</div>
											<div class="col-md-7">
												<ul class="personal-info">
													<li><span class="title">Phone:</span> <span
														class="text"><a>${data.mobileNumber }</a></span></li>
													<li><span class="title">Email:</span> <span
														class="text"><a>${data.email }</a></span></li>
													<li><span class="title">Birth Date:</span> <span
														class="text">24th July</span></li>
													<li><span class="title">Address:</span> <span
														class="text">${data.residentialAddress }</span></li>
													<li><span class="title">City:</span> <span
														class="text">${data.cityVo.cityName }</span></li>
													<li><span class="title">State:</span> <span
														class="text">${data.stateVo.stateName }</span></li>
													<li><span class="title">Pincode:</span> <span
														class="text">${data.pincode }</span></li>
													<li><span class="title">Gender:</span> <span
														class="text" style="text-transform: capitalize;">${data.gender}</span></li>
													<li><span class="title">Joining Date:</span> <span
														class="text">${data.joiningDate }</span></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
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
		src="${pageContext.request.contextPath }/adminResources/js/jquery.slimscroll.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/app.js"></script>

	<!--[if lt IE 9]-->
	<script
		src="${pageContext.request.contextPath }/adminResources/js/html5shiv.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/adminResources/js/respond.min.js"></script>


</body>
</html>