<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/adminResources/images/favicon.png">
<title>Dashboard - Intra-Heure</title>
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
	href="${pageContext.request.contextPath }/adminResources/css/morris.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/adminResources/css/style.css">
<!--[if lt IE 9]>
			<script src="${pageContext.request.contextPath }/adminResources/js/html5shiv.min.js"></script>
			<script src="${pageContext.request.contextPath }/adminResources/js/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<div class="main-wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="page-wrapper">
			<div class="content container-fluid">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-lg-3">
						<div class="dash-widget clearfix card-box">
							<span class="dash-widget-icon"><i class="la la-users"
								aria-hidden="true"></i></span>
							<div class="dash-widget-info">
								<h3>${sessionScope.employeeList }</h3>
								<span>Employees</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-3">
						<div class="dash-widget clearfix card-box">
							<span class="dash-widget-icon"><i class="la la-suitcase"
								aria-hidden="true"></i></span>
							<div class="dash-widget-info">
								<h3>${sessionScope.departmentlist}</h3>
								<span>Department</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-3">
						<div class="dash-widget clearfix card-box">
							<span class="dash-widget-icon"><i
								class="la la-calendar-check-o"></i></span>
							<div class="dash-widget-info">
								<h3>${sessionScope.leaverequestlist}</h3>
								<span>Leave Request</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-3">
						<div class="dash-widget clearfix card-box">
							<span class="dash-widget-icon"><i class="la  la-sign-out"
								aria-hidden="true"></i></span>
							<div class="dash-widget-info">
								<h3>${sessionScope.resignrequestlist}</h3>
								<span>Resign Request</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-lg-3">
						<div class="dash-widget clearfix card-box">
							<span class="dash-widget-icon"><i
								class="la  la-exclamation-triangle" aria-hidden="true"></i></span>
							<div class="dash-widget-info">
								<h3>${sessionScope.complainlist}</h3>
								<span>Complains</span>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 col-lg-3">
						<div class="dash-widget clearfix card-box">
							<span class="dash-widget-icon"><i
								class="fa fa-envelope-open-o" aria-hidden="true"></i></span>
							<div class="dash-widget-info">
								<h3>0</h3>
								<span>Total Request</span>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div id="container"
				style="min-width: 310px; height: 400px; margin: 0 auto"></div>

			<input type="hidden" name="xvalue" value="web development" /> <input
				type="hidden" name="yvalue" value="69" /> <input type="hidden"
				name="xvalue" value="Application development" /> <input
				type="hidden" name="yvalue" value="45" /> <input type="hidden"
				name="xvalue" value="Support development" /> <input type="hidden"
				name="yvalue" value="62" /> <input type="hidden" name="xvalue"
				value="Product development" /> <input type="hidden" name="yvalue"
				value="50" /> <input type="hidden" name="xvalue"
				value="Information department" /> <input type="hidden"
				name="yvalue" value="48" /> <input type="hidden" name="xvalue"
				value="Training department" /> <input type="hidden" name="yvalue"
				value="25" /> <input type="hidden" name="xvalue"
				value="Business department" /> <input type="hidden" name="yvalue"
				value="35" />

		</div>
		<div class="sidebar-overlay" data-reff="#sidebar"></div>
	</div>
	<script
		src="${pageContext.request.contextPath }/adminResources/chart/highcharts.js"></script>
	<script
		src="${pageContext.request.contextPath }/adminResources/chart/exporting.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/jquery.slimscroll.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/morris.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/raphael-min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/chart.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/adminResources/js/app.js"></script>

	<script
		src="${pageContext.request.contextPath }/adminResources/js/html5shiv.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/adminResources/js/respond.min.js"></script>

	<script>
		var xvalue = document.getElementsByName("xvalue");
		var xdata = [];
		var yvalue = document.getElementsByName("yvalue");
		var ydata = [];
		for (var i = 0; i < xvalue.length; i++) {
			xdata.push(xvalue[i].value);
			ydata.push(parseFloat(yvalue[i].value));
		}
		Highcharts.chart({
			chart : {
				renderTo : "container",

				type : 'column'
			},
			title : {
				text : 'Department Wise Employees'
			},

			xAxis : {
				categories : xdata,
				crosshair : true
			},
			yAxis : {
				min : 0,
				title : {
					text : 'Employees'
				}
			},
			plotOptions : {
				column : {
					pointPadding : 0.2,
					borderWidth : 0
				}
			},
			series : [ {
				name : 'Department',
				data : ydata,
				color : 'orange'

			} ]
		});
	</script>
</body>
</html>