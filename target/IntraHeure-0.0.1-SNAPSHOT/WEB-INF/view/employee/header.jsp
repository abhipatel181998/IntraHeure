<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="data" value="${sessionScope.registrationVo }"></c:set>
<nav class="navbar-custom">
	<ul class="list-inline float-right mb-0">
		<li class="list-inline-item dropdown notification-list"><a
			class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user"
			data-toggle="dropdown" href="#" role="button" aria-haspopup="false"
			aria-expanded="false"><c:if test="${data.profilePic eq null}">
					<img
						src="../${pageContext.request.contextPath }/adminResources/images/user.jpg"
						alt="${data.firstName } Photo" class="rounded-circle">
				</c:if> <c:if test="${data.profilePic ne null}">
					<img
						src="${pageContext.request.contextPath }/profilePics/${data.profilePic}"
						alt="${data.firstName } Photo" class="rounded-circle">
				</c:if> <b class="text-capitalize" style="color: #f5f5f5">${data.firstName }
					${data.lastName }</b> </a>
			<div class="dropdown-menu dropdown-menu-right profile-dropdown">
				<!-- item-->
				<div class="dropdown-item noti-title">
					<h5>Welcome</h5>
				</div>
				<a class="dropdown-item" href="profile"><i class="fas fa-user"></i>
					Profile</a> <a class="dropdown-item" href="editProfile"><i
					class="fas fa-edit"></i> Edit Profile</a><a class="dropdown-item"
					href="changePassword"><i class="fas fa-edit"></i> Change <br>&emsp;&emsp;Password</a>
				<a class="dropdown-item text-danger" href="/logout"><i
					class="mdi mdi-power text-danger"></i> Logout</a>
			</div></li>
	</ul>
	<ul class="list-inline menu-left mb-0">
		<li class="float-left"><button
				class="button-menu-mobile open-left waves-light waves-effect">
				<i class="mdi mdi-menu"></i>
			</button></li>
	</ul>
	<div class="clearfix"></div>
</nav>