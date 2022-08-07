<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="NMS Admin Panel" />
<meta name="author" content="" />

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/neon/assets/images/favicon.ico">

<title>NMS | Configuration</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/css/font-icons/entypo/css/entypo.css">
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/css/neon-core.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/css/neon-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/css/neon-forms.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/css/custom.css">

</head>
<body ng-app="">

	<div class="page-container">
		<!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->



		<div class="sidebar-menu">

			<div class="sidebar-menu-inner">

				<header class="logo-env">

					<!-- logo -->
					<div class="logo">
						<a href="/nms/dashboardView.htm"> <!-- <img src="resources/neon/assets/images/logo-nms.png" width="120" alt="" /> -->
							<img src="resources/neon/assets/images/Frog Logo Transparent.png"
							height="30" width="100" /><br /> <br /> <span class="title"><strong><font
									color="green">NMS Version 1.0.0.0</font></strong></span><br /> <%-- <span><strong><font color="#004080" >User Name: ${name}</font></strong></span> <br/>
						<span><strong><font color="#004080" >Role: Super User</font></strong></span> --%>
						</a>
					</div>

					<!-- logo collapse icon -->
					<div class="sidebar-collapse">
						<a href="#" class="sidebar-collapse-icon"> <!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
							<i class="entypo-menu"></i>
						</a>
					</div>


					<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
					<div class="sidebar-mobile-menu visible-xs">
						<a href="#" class="with-animation"> <!-- add class "with-animation" to support animation -->
							<i class="entypo-menu"></i>
						</a>
					</div>

				</header>


				<ul id="main-menu" class="main-menu">
					<!-- add class "multiple-expanded" to allow multiple submenus to open -->
					<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
					<li></li>
					<li class="active opened"><a href="/nms/dashboardView.htm">
							<i class="entypo-home"></i> <span class="title">Dashboard</span>
					</a></li>

					<!-- <li>
					<a href="/nms/odas.htm" target="_blank">
					<i class="entypo-monitor"></i>
						<span class="title">ODAS</span>
					</a>
				</li> -->

					<!-- <li><a href="/nms/RepeaterList.htm"> <i
							class="entypo-list"></i> <span class="title">Site List</span>
					</a></li> -->

					<li class="has-sub"><a href="forms-main.htm"> <i
							class="entypo-doc-text"></i> <span class="title">Site</span>
					</a>
						<ul>
							<li><a href="/nms/RepeaterList.htm"> <i
									class="entypo-list"></i> <span class="title">Site List</span>
							</a></li>
							<li><a href="/nms/broadcast.htm"> <i class="entypo-list"></i>
									<span class="title">Broadcast</span>
							</a></li>

							<!-- <li><a href="/nms/threshold_broadcast.htm"> <i class="entypo-list"></i>
									<span class="title">Threshold Broadcast</span>
							</a></li> -->

							<!-- <li><a href="/nms/mou.htm"> <i class="entypo-list"></i>
									<span class="title">MOU</span>
							</a></li> -->
						</ul></li>

					<%-- <c:if test=""></c:if> --%>

					<li class="has-sub"><a href="forms-main.htm"> <i
							class="entypo-doc-text"></i> <span class="title">Reports</span>
					</a>
						<ul>
							<li><a href="/nms/inventory.htm"> <i
									class="entypo-doc-text-inv"></i> <span class="title">Inventory</span>
							</a></li>
							<li><a href="/nms/alarmlog.htm"> <i
									class="entypo-doc-text"></i> <span class="title">Alarm
										Log</span>
							</a></li>
						</ul></li>

					<li class="has-sub"><a href="forms-main.htm"> <i
							class="entypo-monitor"></i> <span class="title">Active
								Alarms</span>
					</a>
						<ul>
							<li><a href="/nms/alarmView.htm"> <i class="entypo-bell"></i>
									<span class="title">General Alarm</span>
							</a></li>
							<li><a href="/nms/criticalAlarmView.htm"> <i
									class="entypo-alert"></i> <span class="title">Critical
										Alarm</span>
							</a></li>
						</ul></li>

					<li class="has-sub"><a href="foms-main.htm"> <i
							class="entypo-user"></i> <span class="title">Profile</span>
					</a>
						<ul>
							<li><a href="/nms/profile.htm"> <i class="entypo-user"></i>
									<span class="title">Edit Profile</span>
							</a></li>
							<c:choose>
								<c:when test="${userDetails.getRoleId() =='4'}">
									<li><a href="/nms/manageUser.htm"> <i
											class="entypo-users"></i> <span class="title">Manage
												User</span>
									</a></li>
								</c:when>
							</c:choose>
						</ul> <c:choose>
							<c:when test="${userDetails.getRoleId() =='4'}">
								<li><a href="/nms/maintenance.htm"> <i
										class="entypo-tools right"></i> <span class="title">Maintenance
									</span>
								</a></li>
							</c:when>
						</c:choose> <c:choose>
							<c:when test="${userDetails.getRoleId() =='4'}">
								<li><a href="/nms/notification.htm"> <i
										class="entypo-bell right"></i> <span class="title">Notification
									</span>
								</a></li>
							</c:when>
						</c:choose>
					<li><a href="/nms/login.htm"> <i
							class="entypo-logout right"></i> <span class="title">Log
								Out</span>
					</a></li>

					<li><a href="/nms/FAQ.htm" target="_blank"> <i
							class="entypo-help"></i> <span class="title">Help </span>
					</a></li>

				</ul>

			</div>

		</div>

		<div class="main-content">
		
			<div class="form-group">
				<input type="text" class="form-control" ng-model="username"
					placeholder="username"  />
			</div>
			<div>
				<!-- <p ng-bind="username"></p> -->
				<p>{{username}}</p>
			</div>
			
			


			<div class="row">

				<c:choose>
					<c:when
						test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#gsm"><b>GSM</b></a></li>
							<li><a data-toggle="tab" href="#dcs1"><b>DCS-1</b></a></li>
							<li><a data-toggle="tab" href="#dcs2"><b>DCS-2</b></a></li>
							<li><a data-toggle="tab" href="#umts"><b>WCDMA</b></a></li>
							<li><a data-toggle="tab" href="#sysdetails"><b>System
										Details</b></a></li>
						</ul>
					</c:when>

					<c:when
						test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#gsm"><b>850
										MHz</b></a></li>
							<li><a data-toggle="tab" href="#dcs1"><b>1900 MHz</b></a></li>
							<!-- <li><a data-toggle="tab" href="#dcs2"><b>DCS-2</b></a></li> -->
							<li><a data-toggle="tab" href="#umts"><b>AWS</b></a></li>
							<li><a data-toggle="tab" href="#sysdetails"><b>System
										Details</b></a></li>
						</ul>
					</c:when>

				</c:choose>

			</div>


			<!-- end of class container -->
			<!-- Footer -->
			<footer class="main">

				&copy; 2018 <strong>NMS</strong> Admin Theme by <a
					href="http://www.frogcellsat.com" target="_blank">Frogcellsat
					Limited</a>

			</footer>


		</div>
	</div>


	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/gsap/TweenMax.min.js">
		
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/joinable.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/resizeable.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/neon-api.js"></script>

	<!-- Imported scripts on this page -->
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/bootstrap-switch.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/neon-chat.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/neon-custom.js"></script>

	<!-- Angular JS -->
	<%-- <script
		src="${pageContext.request.contextPath}/resources/angular.min.js"></script> --%>

	<script
		src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.6/angular.min.js"></script>


	<%-- </form:form> --%>
</body>
</html>