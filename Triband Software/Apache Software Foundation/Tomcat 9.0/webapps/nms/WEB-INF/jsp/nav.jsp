<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<nav id="sidebar">
		<!-- logo -->
		<div class="sidebar-header d-flex align-items-center">
			<a href="/nms/dashboardView.htm"> <img
				src="${pageContext.request.contextPath}/resources/neon/assets/images/Frog Logo Transparent.png"
				height="30" width="100" /><br /> <br /> <span class="title"><strong><font
						color="#32CD32">NMS Version 1.0.0.0</font></strong></span><br /> <%-- <span><strong><font color="#004080" >User Name: ${name}</font></strong></span> <br/>
						<span><strong><font color="#004080" >Role: Super User</font></strong></span> --%>
			</a>
		</div>

		<!-- logo collapse icon -->
		<div class="sidebar-toggle">
			<a href="#" class="sidebar-collapse-icon"
				style="font-size: 12px; color: white"> <!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
				<i class="entypo entypo-menu"></i>
			</a>
		</div>


		<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
		<div class="sidebar-mobile-menu visible-xs">
			<a href="#" class="with-animation"
				style="font-size: 12px; color: white"> <!-- add class "with-animation" to support animation -->
				<i class="entypo-menu"></i>
			</a>
		</div>

		<ul class="list-unstyled">

			<li style="font-size: 14px; color: white"><a
				href="/nms/dashboardView.htm"> <i class="entypo-home"></i> <span
					class="title">Dashboard</span>
			</a></li>

			<li class="has-sub" style="font-size: 14px; color: white"><a
				href="#siteDropdownDropdown" aria-expanded="false"
				data-toggle="collapse"> <i class="entypo-doc-text"></i>Site
			</a>
				<ul id="siteDropdownDropdown" class="collapse list-unstyled ">
					<li style="font-size: 12px; color: white"><a
						href="/nms/RepeaterList.htm"> <i class="entypo-list"></i> <span
							class="title">Site List</span>
					</a></li>
					<!-- <li style="font-size: 12px; color: white"><a
						href="/nms/broadcast.htm"> <i class="entypo-list"></i> <span
							class="title">Broadcast</span>
					</a></li> -->
				</ul></li>

			<li style="font-size: 14px; color: white"><a
				href="#reportDropdownDropdown" aria-expanded="false"
				data-toggle="collapse"> <i class="entypo-docs"></i>Reports
			</a>
				<ul id="reportDropdownDropdown" class="collapse list-unstyled ">
					<li style="font-size: 12px; color: white"><a
						href="/nms/inventory.htm"> <i class="entypo-doc-text-inv"></i>
							<span class="title">Inventory List</span>
					</a></li>
					<li style="font-size: 12px; color: white"><a
						href="/nms/alarmlog.htm"> <i class="entypo-doc-text"></i> <span
							class="title">Alarm Log</span>
					</a></li>
				</ul></li>


			<li style="font-size: 14px; color: white"><a
				href="#alarmDropdownDropdown" aria-expanded="false"
				data-toggle="collapse"> <i class="entypo-monitor"></i> Active
					Alarms
			</a>
				<ul id="alarmDropdownDropdown" class="collapse list-unstyled ">
					<li style="font-size: 12px; color: white"><a
						href="/nms/alarmView.htm"> <i class="entypo-bell"></i> <span
							class="title">General Alarm</span>
					</a></li>
					<li style="font-size: 12px; color: white"><a
						href="/nms/criticalAlarmView.htm"> <i class="entypo-alert"></i>
							<span class="title">Critical Alarm</span>
					</a></li>
				</ul></li>

			<li style="font-size: 14px; color: white"><a
				href="#profileDropdownDropdown" aria-expanded="false"
				data-toggle="collapse"> <i class="entypo-user"></i> Profile
			</a>
				<ul id="profileDropdownDropdown" class="collapse list-unstyled ">
					<li style="font-size: 12px; color: white"><a
						href="/nms/profile.htm"> <i class="entypo-user"></i> <span
							class="title">Edit Profile</span>
					</a></li>
					<c:choose>
						<c:when test="${userDetails.getRoleId() =='4'}">
							<li style="font-size: 12px; color: white"><a
								href="/nms/manageUser.htm"> <i class="entypo-users"></i> <span
									class="title">Manage User</span>
							</a></li>
						</c:when>
					</c:choose>
				</ul> <c:choose>
					<c:when test="${userDetails.getRoleId() =='4'}">
						<li style="font-size: 14px; color: white"><a
							href="/nms/maintenance.htm"> <i class="entypo-tools right"></i>
								<span class="title">Maintenance </span>
						</a></li>
					</c:when>
				</c:choose> 
			<li style="font-size: 14px; color: white"><a
				href="/nms/logout.htm"> <i class="entypo-logout right"></i> <span
					class="title">Log Out</span>
			</a></li>

			<li style="font-size: 14px; color: white"><a href="/nms/FAQ.htm"
				target="_blank"> <i class="entypo-help"></i> <span class="title">Help
				</span>
			</a></li>
		</ul>
	</nav>
	<!-- Sidebar Navigation end-->

	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script> --%>

</body>
</html>