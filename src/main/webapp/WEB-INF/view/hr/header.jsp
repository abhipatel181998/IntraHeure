<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="data" value="${sessionScope.registrationVo }"></c:set>
<div class="header">
	<div class="header-left">
		<a href="/" class="logo logo-big"> <img
			src="../${pageContext.request.contextPath }/adminResources/images/logo.png"
			width="150" height="45" alt="">
		</a> <a href="/" class="logo logo-small"> <img
			src="../${pageContext.request.contextPath }/adminResources/images/logo.png"
			width="35" height="35" alt="">
		</a>
	</div>
	<a id="toggle_btn" href="javascript:void(0);"><i class="la la-bars"></i></a>
	<div class="page-title-box pull-left">
		<h3>Intra-Heure</h3>
	</div>
	<a id="mobile_btn" class="mobile_btn pull-left" href="#sidebar"><i
		class="fa fa-bars" aria-hidden="true"></i></a>
	<ul class="nav navbar-nav navbar-right user-menu pull-right">
		<li class="dropdown"><a href="profile.jsp"
			class="dropdown-toggle user-link" data-toggle="dropdown"
			title="Admin"> <span class="user-img"><c:if
						test="${data.profilePic eq null}">
						<img class="img-circle"
							src="../${pageContext.request.contextPath }/adminResources/images/user.jpg"
							width="40" alt="Admin">
					</c:if> <c:if test="${data.profilePic ne null}">
						<img class="img-circle"
							src="${pageContext.request.contextPath }/profilePics/${data.profilePic}"
							width="40" alt="Admin">
					</c:if> <span class="status online"></span></span> <span class="text-capitalize">${data.firstName }
					${data.lastName }</span> <i class="caret"></i>
		</a>
			<ul class="dropdown-menu">
				<li><a href="profile">My Profile</a></li>
				<li><a href="editProfile">Edit Profile</a></li>
				<li><a href="changePassword">Change Password</a></li>
				<li><a href="${pageContext.request.contextPath }/logout">Logout</a></li>
			</ul></li>
	</ul>
	<div class="dropdown mobile-user-menu pull-right">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown"
			aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
		<ul class="dropdown-menu pull-right">
			<li><a href="profile">My Profile</a></li>
			<li><a href="editProfile">Edit Profile</a></li>
			<li><a href="changePassword">Change Password</a></li>
			<li><a href="${pageContext.request.contextPath }/logout">Logout</a></li>
		</ul>
	</div>
</div>