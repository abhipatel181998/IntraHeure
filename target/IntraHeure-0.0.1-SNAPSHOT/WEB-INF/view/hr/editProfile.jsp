<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<c:set var="data" value="${sessionScope.registrationVo }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/adminResources/images/favicon.png">
<title>Edit Profile - Intra-Heure</title>
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
					<div class="col-sm-8">
						<h4 class="page-title">Edit Profile</h4>
					</div>
				</div>
				<f:form modelAttribute="editProfile" action="updateProfile"
					method="POST" enctype="multipart/form-data">
					<input type="hidden" name="userId" value="${data.userId }">
					<div class="card-box">
						<h3 class="card-title">Basic Informations</h3>
						<div class="row">
							<div class="col-md-12">
								<div class="profile-img-wrap">
									<c:if test="${data.profilePic eq null}">
										<img class="inline-block"
											src="${pageContext.request.contextPath }/adminResources/images/user.jpg"
											alt="user" id="profileImg">
									</c:if>
									<c:if test="${data.profilePic ne null}">
										<img class="inline-block"
											src="${pageContext.request.contextPath }/profilePics/${data.profilePic}"
											alt="user" id="profileImg">
									</c:if>
									<div class="fileupload btn btn-default">
										<span class="btn-text">edit</span> <input class="upload"
											type="file" name="file" id="profilePic" onchange="readURL(this)">
									</div>
								</div>
								<div class="profile-basic">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group form-focus">
												<label class="control-label">First Name</label> <input
													type="text" class="form-control floating"
													value="${data.firstName }" name="firstName" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group form-focus">
												<label class="control-label">Last Name</label> <input
													type="text" class="form-control floating"
													value="${data.lastName }" name="lastName" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group form-focus">
												<label class="control-label">Birth Date</label>
												<div class="cal-icon">
													<input class="form-control floating datetimepicker"
														type="text" name="birthDate" value="${data.birthDate }">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group form-focus select-focus">
												<label class="control-label">Gendar</label> <select
													class="select form-control floating" id="gender"
													name="gender">
													<option value="female">Female</option>
													<option value="male">Male</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-box">
						<h3 class="card-title">Contact Informations</h3>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<textarea class="form-control floating" placeholder="Address"
										cols="" rows="5" name="residentialAddress">${data.residentialAddress }</textarea>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group form-focus">
									<label class="control-label">Select State</label>
									<f:select class="select form-control floating"
										path="stateVo.stateId" id="state" onchange="getCityData()">
										<f:option value="0">Select State</f:option>
										<f:options items="${stateData }" itemValue="stateId"
											itemLabel="stateName" />
									</f:select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group form-focus">
									<label class="control-label">Select City</label>
									<f:select class="select form-control floating" id="city"
										path="cityVo.cityId">
										<f:option value="0">Select City</f:option>
									</f:select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group form-focus">
									<label class="control-label">Pin Code</label> <input
										type="text" class="form-control floating"
										value="${data.pincode }" name="pincode" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group form-focus">
									<label class="control-label">Phone Number</label> <input
										type="text" class="form-control floating"
										value="${data.mobileNumber }" name="mobileNumber" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group form-focus">
									<label class="control-label">Email Address</label> <input
										type="email" class="form-control floating"
										value="${data.email }" name="email" />
								</div>
							</div>
						</div>
					</div>
					<div class="text-center m-t-20">
						<input class="btn btn-primary btn-lg" type="submit"
							value="Save &amp; update" />
					</div>
				</f:form>
			</div>
		</div>
	</div>
	<div class="sidebar-overlay" data-reff="#sidebar"></div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/jquery.slimscroll.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/moment.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/bootstrap-datetimepicker.min.js"></script>

	<!--[if lt IE 9]-->
	<script
		src="${pageContext.request.contextPath }/adminResources/js/html5shiv.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/adminResources/js/respond.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#gender").val("${data.gender}");
			$("#state").val("${data.stateVo.stateId}");
			city.innerHTML = "";
			var op = document.createElement("option");
			op.text = "${data.cityVo.cityName}";
			op.value = "${data.cityVo.cityId}";
			city.options.add(op);
		});
	</script>

	<script type="text/javascript">
		function getCityData() {
			var stateId = document.getElementById("state");
			var htp = new XMLHttpRequest();

			htp.onreadystatechange = function() {

				if (htp.readyState == 4) {

					var cityDataJson = JSON.parse(htp.responseText);

					city.innerHTML = "";

					var op = document.createElement("option");
					op.text = "Select City";
					op.value = "0";
					city.options.add(op);

					for (var i = 0; i < cityDataJson.length; i++) {

						var op = document.createElement("option");

						op.text = cityDataJson[i].cityName;
						op.value = cityDataJson[i].cityId;

						city.options.add(op);
					}

				}
			}

			htp.open("get",
					"${pageContext.request.contextPath }/searchCityByState?stateVo.stateId="
							+ stateId.value, true);
			htp.send();
		}
	</script>


	<!-- For live profile view -->
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					document.getElementById('profileImg').src = e.target.result;
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>

	<script type="text/javascript">
		// Sidebar

				!function($) {
					"use strict";
					var Sidemenu = function() {
						this.$menuItem = $("#sidebar-menu a");
					};

					Sidemenu.prototype.init = function() {
						var $this = this;
						$this.$menuItem.on('click', function(e) {
							if ($(this).parent().hasClass("submenu")) {
								e.preventDefault();
							}
							if (!$(this).hasClass("subdrop")) {
								$("ul", $(this).parents("ul:first")).slideUp(
										350);
								$("a", $(this).parents("ul:first"))
										.removeClass("subdrop");
								$(this).next("ul").slideDown(350);
								$(this).addClass("subdrop");
							} else if ($(this).hasClass("subdrop")) {
								$(this).removeClass("subdrop");
								$(this).next("ul").slideUp(350);
							}
						});
						$("#sidebar-menu ul li.submenu a.active").parents(
								"li:last").children("a:first").addClass(
								"active").trigger("click");
					}, $.Sidemenu = new Sidemenu;

				}(window.jQuery),

				$(document)
						.ready(
								function() {

									// Sidebar Initiate

									$.Sidemenu.init();

									// Sidebar overlay

									var $sidebarOverlay = $(".sidebar-overlay");
									$("#mobile_btn, .task-chat")
											.on(
													"click",
													function(e) {
														var $target = $($(this)
																.attr("href"));
														if ($target.length) {
															$target
																	.toggleClass("opened");
															$sidebarOverlay
																	.toggleClass("opened");
															$("html")
																	.toggleClass(
																			"menu-opened");
															$sidebarOverlay
																	.attr(
																			"data-reff",
																			$(
																					this)
																					.attr(
																							"href"));
														}
														e.preventDefault();
													});

									$sidebarOverlay
											.on(
													"click",
													function(e) {
														var $target = $($(this)
																.attr(
																		"data-reff"));
														if ($target.length) {
															$target
																	.removeClass("opened");
															$("html")
																	.removeClass(
																			"menu-opened");
															$(this)
																	.removeClass(
																			"opened");
															$(".main-wrapper")
																	.removeClass(
																			"slide-nav-toggle");
														}
														e.preventDefault();
													});

									// Select2

									if ($('.select').length > 0) {
										$('.select').select2({
											minimumResultsForSearch : -1,
											width : '100%'
										});
									}

									// Modal Popup hide show

									if ($('.modal').length > 0) {
										var modalUniqueClass = ".modal";
										$('.modal')
												.on(
														'show.bs.modal',
														function(e) {
															var $element = $(this);
															var $uniques = $(
																	modalUniqueClass
																			+ ':visible')
																	.not(
																			$(this));
															if ($uniques.length) {
																$uniques
																		.modal('hide');
																$uniques
																		.one(
																				'hidden.bs.modal',
																				function(
																						e) {
																					$element
																							.modal('show');
																				});
																return false;
															}
														});
									}

									// Floating Label

									if ($('.floating').length > 0) {
										$('.floating')
												.on(
														'focus blur',
														function(e) {
															$(this)
																	.parents(
																			'.form-focus')
																	.toggleClass(
																			'focused',
																			(e.type === 'focus' || this.value.length > 0));
														}).trigger('blur');
									}

									// Message Notification Slimscroll

									if ($('.msg-list-scroll').length > 0) {
										$('.msg-list-scroll').slimscroll({
											height : '100%',
											color : '#878787',
											disableFadeOut : true,
											borderRadius : 0,
											size : '4px',
											alwaysVisible : false,
											touchScrollStep : 100
										});
										var h = $(window).height() - 124;
										$('.msg-list-scroll').height(h);
										$('.msg-sidebar .slimScrollDiv')
												.height(h);

										$(window)
												.resize(
														function() {
															var h = $(window)
																	.height() - 124;
															$(
																	'.msg-list-scroll')
																	.height(h);
															$(
																	'.msg-sidebar .slimScrollDiv')
																	.height(h);
														});
									}

									// Sidebar Slimscroll

									if ($('.slimscroll').length > 0) {
										$('.slimscroll').slimScroll({
											height : '100%',
											width : '100%',
											position : 'right',
											size : "7px",
											color : '#ccc',
											wheelStep : 10,
											touchScrollStep : 100
										});
										var h = $(window).height() - 60;
										$('.slimscroll').height(h);
										$('.sidebar .slimScrollDiv').height(h);

										$(window)
												.resize(
														function() {
															var h = $(window)
																	.height() - 60;
															$('.slimscroll')
																	.height(h);
															$(
																	'.sidebar .slimScrollDiv')
																	.height(h);
														});
									}

									// Page Content Height

									if ($('.page-wrapper').length > 0) {
										var height = (window.innerHeight > 0 ? window.innerHeight
												: this.screen.height) - 1;
										$(".page-wrapper").css("min-height",
												height + "px")
									}

									$(window)
											.resize(
													function() {
														if ($('.page-wrapper').length > 0) {
															var height = (window.innerHeight > 0 ? window.innerHeight
																	: this.screen.height) - 1;
															$(".page-wrapper")
																	.css(
																			"min-height",
																			height
																					+ "px")
														}
													});

									// Date Time Picker

									if ($('.datetimepicker').length > 0) {
										$('.datetimepicker').datetimepicker({
											format : 'DD/MM/YYYY'
										});
									}

									// Datatable

									if ($('.datatable').length > 0) {
										$('.datatable').DataTable({
											"bFilter" : false,
										});
									}

									// Tooltip

									if ($('[data-toggle="tooltip"]').length > 0) {
										$('[data-toggle="tooltip"]').tooltip();
									}

									// Button Switch

									if ($('.btn-toggle').length > 0) {
										$('.btn-toggle')
												.click(
														function() {
															$(this)
																	.find(
																			'.btn')
																	.toggleClass(
																			'active');
															if ($(this)
																	.find(
																			'.btn-success')
																	.size() > 0) {
																$(this)
																		.find(
																				'.btn')
																		.toggleClass(
																				'btn-success');
															}
														});
									}

									// Mobile Menu

									if ($('.main-wrapper').length > 0) {
										var $wrapper = $(".main-wrapper");
										$(document)
												.on(
														'click',
														'#mobile_btn',
														function(e) {
															$(
																	".dropdown.open > .dropdown-toggle")
																	.dropdown(
																			"toggle");
															return false;
														});
										$(document)
												.on(
														'click',
														'#mobile_btn',
														function(e) {
															$wrapper
																	.toggleClass('slide-nav-toggle');
															$('#chat_sidebar')
																	.removeClass(
																			'opened');
															return false;
														});
										$(document).on(
												'click',
												'#open_msg_box',
												function(e) {
													$wrapper.toggleClass(
															'open-msg-box')
															.removeClass('');
													$('.dropdown').removeClass(
															'open');
													return false;
												});
									}

									// Message box remove

									if ($('.dropdown-toggle').length > 0) {
										$('.dropdown-toggle')
												.click(
														function() {
															if ($(
																	'.main-wrapper')
																	.hasClass(
																			'open-msg-box')) {
																$(
																		'.main-wrapper')
																		.removeClass(
																				'open-msg-box');
															}
														});
									}

									// Table Dropdown

									$('.table-responsive')
											.on(
													'shown.bs.dropdown',
													function(e) {
														var $table = $(this), $dropmenu = $(
																e.target)
																.find(
																		'.dropdown-menu'), tableOffsetHeight = $table
																.offset().top
																+ $table
																		.height(), menuOffsetHeight = $dropmenu
																.offset().top
																+ $dropmenu
																		.outerHeight(true);

														if (menuOffsetHeight > tableOffsetHeight)
															$table
																	.css(
																			"padding-bottom",
																			menuOffsetHeight
																					- tableOffsetHeight);
													});
									$('.table-responsive').on(
											'hide.bs.dropdown',
											function() {
												$(this)
														.css("padding-bottom",
																0);
											});

									// Custom Modal Backdrop

									$('a[data-toggle="modal"]')
											.on(
													'click',
													function() {
														setTimeout(
																function() {
																	if ($(
																			".modal.custom-modal")
																			.hasClass(
																					'in')) {
																		$(
																				".modal-backdrop")
																				.addClass(
																						'custom-backdrop');

																	}
																}, 500);
													});

									// Email Inbox

									if ($('.clickable-row').length > 0) {
										$(".clickable-row").click(
												function() {
													window.location = $(this)
															.data("href");
												});
									}

									if ($('.checkbox-all').length > 0) {
										$('.checkbox-all').click(function() {
											$('.checkmail').click();
										});
									}
									if ($('.checkmail').length > 0) {
										$('.checkmail')
												.each(
														function() {
															$(this)
																	.click(
																			function() {
																				if ($(
																						this)
																						.closest(
																								'tr')
																						.hasClass(
																								"checked")) {
																					$(
																							this)
																							.closest(
																									'tr')
																							.removeClass(
																									'checked');
																				} else {
																					$(
																							this)
																							.closest(
																									'tr')
																							.addClass(
																									'checked');
																				}
																			});
														});
									}
									if ($('.mail-important').length > 0) {
										$(".mail-important")
												.click(
														function() {
															$(this)
																	.find(
																			'i.fa')
																	.toggleClass(
																			"fa-star");
															$(this)
																	.find(
																			'i.fa')
																	.toggleClass(
																			"fa-star-o");
														});
									}

									// Incoming call popup

									if ($('#incoming_call').length > 0) {
										$(window).on('load', function() {
											$('#incoming_call').modal('show');
											$("body").addClass("call-modal");
										});
									}

									// Small Sidebar

									if (screen.width >= 992) {
										$('#toggle_btn')
												.on(
														'click',
														function() {
															if ($('body')
																	.hasClass(
																			'mini-sidebar')) {
																$('body')
																		.removeClass(
																				'mini-sidebar');
																$(
																		'.subdrop + ul')
																		.slideDown();
															} else {
																$('body')
																		.addClass(
																				'mini-sidebar');
																$(
																		'.subdrop + ul')
																		.slideUp();
															}
															return false;
														});

										$(document)
												.on(
														'mouseover',
														function(e) {
															e.stopPropagation();
															if ($('body')
																	.hasClass(
																			'mini-sidebar')
																	&& $(
																			'#toggle_btn')
																			.is(
																					':visible')) {
																var targ = $(
																		e.target)
																		.closest(
																				'.sidebar').length;
																if (targ) {
																	$('body')
																			.addClass(
																					'expand-menu');
																	$(
																			'.subdrop + ul')
																			.slideDown();
																} else {
																	$('body')
																			.removeClass(
																					'expand-menu');
																	$(
																			'.subdrop + ul')
																			.slideUp();
																}
															}
														});
									}

									// Theme Options

									if ($('.themes-icon').length > 0) {
										$(".themes-icon")
												.click(
														function() {
															$('.themes')
																	.toggleClass(
																			"active");
															$('.main-wrapper')
																	.removeClass(
																			'open-msg-box');
														});
									}

								});
	</script>
</body>
</html>