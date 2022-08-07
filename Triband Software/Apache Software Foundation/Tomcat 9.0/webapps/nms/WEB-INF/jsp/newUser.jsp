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

<link rel="icon" href="resources/neon/assets/images/favicon.ico">

<title>NMS | New User</title>

<link rel="stylesheet"
	href="resources/neon/assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
<link rel="stylesheet"
	href="resources/neon/assets/css/font-icons/entypo/css/entypo.css">
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
<link rel="stylesheet" href="resources/neon/assets/css/bootstrap.css">
<link rel="stylesheet" href="resources/neon/assets/css/neon-core.css">
<link rel="stylesheet" href="resources/neon/assets/css/neon-theme.css">
<link rel="stylesheet" href="resources/neon/assets/css/neon-forms.css">
<link rel="stylesheet" href="resources/neon/assets/css/custom.css">

<script src="resources/neon/assets/js/jquery-1.11.3.min.js"></script>

<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


</head>
<body class="page-body" data-url="http://neon.dev">

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
								<c:when test="${user.getRoleId() =='4'}">
									<li><a href="/nms/manageUser.htm"> <i
											class="entypo-users"></i> <span class="title">Manage
												User</span>
									</a></li>
								</c:when>
							</c:choose>
						</ul>
						
						<%-- <c:choose>
								<c:when test="${userDetails.getRoleId() =='4'}">
						<li><a href="/nms/maintenance.htm"> <i
							class="entypo-tools right"></i> <span class="title">Maintenance
						</span>
					</a></li></c:when></c:choose>
					
				<c:choose>
								<c:when test="${userDetails.getRoleId() =='4'}">
					<li><a href="/nms/notification.htm"> <i
							class="entypo-bell right"></i> <span class="title">Notification
						</span>
					</a></li></c:when></c:choose> --%>
					
					<li><a href="/nms/logout.htm"> <i
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

			<ol class="breadcrumb bc-3">
				<li><a href="/nms/dashboardView.htm"><i class="fa-home"></i>Home</a>
				</li>
				<li class="active"><strong>New User</strong></li>

			</ol>

			<br>



			<div class="row">
				<div class="col-md-4">

					<%-- <c:forEach items="${userDetails}" var="userDetailsList" varStatus="loop"> --%>

					<form:form id="UserDetailsForm" modelAttribute="UserDetails"
						action="/nms/registerUser.htm" method="post">
						<div class="row">
							<div class="col-sm-5">
								<button type="submit" class="btn btn-success" id="apply">ApplySettings</button>
							</div>
							<div>
								<h4>
									<c:choose>
										<c:when test="${newUser == 'Exist'}">
											<strong>This User Already Exist. Please <a href="/nms/manageUser.htm"> <font
													color="blue">Edit</font></a></strong>
										</c:when>
										<c:when test="${newUser == 'User Registered Successfully...'}">
											<strong>${newUser}</strong>
										</c:when>
									</c:choose>
								</h4>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-12">


								<table
									class="table table-striped table-bordered table-hover table-condensed">
									<tbody>
										<tr>
											<td><form:label path="username"
													class="col-sm-3 control-label">User Name:</form:label>
											<td><b><form:input path="username" type="text"
														maxlength="50" class="form-control"
														placeholder="User Name"
														value="${userDetails.getUsername()}" /></b></td>
										</tr>
										<tr>
											<td><form:label path="password"
													class="col-sm-3 control-label">Password:</form:label>
											<td><b><form:input path="password" type="password"
														maxlength="50" class="form-control" placeholder="Password"
														value="${userDetails.getPassword()}" /></b></td>

										</tr>
										<tr>
											<td><form:label path="EmailId"
													class="col-sm-3 control-label">Email ID:</form:label>
											<td><b><form:input path="EmailId" type="email"
														data-mask="email" autocomplete="off" class="form-control"
														placeholder="Email Id" value="${userDetails.getEmailId()}" /></b></td>
										</tr>
										<tr>
											<td><form:label path="PhoneNumber"
													class="col-sm-3 control-label">Phone Number:</form:label>
											<td><b><form:input path="PhoneNumber" type="text"
														data-mask="phone" autocomplete="off" class="form-control"
														placeholder="Phone Number"
														value="${userDetails.getPhoneNumber()}" /></b></td>
										</tr>
										<tr>
											<td><form:label path="RoleId"
													class="col-sm-3 control-label">Role:</form:label></td>
											<td><form:select path="RoleId">
													<form:option value="${userDetails.getRoleId()}">
														<c:choose>
															<c:when test="${userDetails.getRoleId()==4}">Super
													  </c:when>
															<c:when test="${userDetails.getRoleId()==5}">Admin
													  </c:when>
															<c:when test="${userDetails.getRoleId()==6}">Monitor
													  </c:when>
														</c:choose>
													</form:option>
													<%-- <form:option value="4">Super </form:option> --%>
													<option value="5">Admin</option>
													<option value="6">Monitor</option>
												</form:select></td>

										</tr>
										<tr>
											<c:choose>

												<c:when test="${userDetails.getRoleId()==5}">
													<td><form:label path="assignedRegion"
															class="col-sm-3 control-label">Region:</form:label></td>

													<td><form:select path="assignedRegion">
															<form:option value="${userDetails.getAssignedRegion()}"
																label="${userDetails.getAssignedRegion()}" />
															<option value="Andhra Pradesh">Andhra Pradesh</option>
															<option value="Assam">Assam</option>
															<option value="Bihar">Bihar</option>
															<option value="Delhi">Delhi</option>
															<option value="Gujarat">Gujarat</option>
															<option value="Haryana">Haryana</option>
															<option value="Himachal Pradesh">Himachal
																Pradesh</option>
															<option value="Jammu & Kashmir">Jammu & Kashmir</option>
															<option value="Karnataka">Karnataka</option>
															<option value="Kerala">Kerala</option>
															<option value="Kolkata">Kolkata</option>
															<option value="Madhya Pradesh">Madhya Pradesh</option>
															<option value="Maharashtra">Maharashtra</option>
															<option value="Mumbai">Mumbai</option>
															<option value="Northeast">Northeast</option>
															<option value="Orissa">Orissa</option>
															<option value="Punjab">Punjab</option>
															<option value="Rajasthan">Rajasthan</option>
															<option value="Tami Nadu">Tami Nadu</option>
															<option value="Uttar Pradesh (East)">Uttar
																Pradesh (East)</option>
															<option value="Uttar Pradesh (West)">Uttar
																Pradesh (West)</option>
															<option value="West Bengal">West Bengal</option>
															<option value="Other">Other</option>

														</form:select></td>
												</c:when>

												<c:when
													test="${userDetails.getRoleId()==4 || userDetails.getRoleId()==6}">
													<td><form:label path="assignedRegion"
															class="col-sm-3 control-label">Region Name</form:label></td>
													<td><form:input path="assignedRegion" value="All"
															readonly="true" />
												</c:when>
											</c:choose>
										</tr>
										<tr>

											<td><label id="Comment" class="col-sm-3 control-label">Memo:</label></td>
											<td><textarea id="Comment" name="Comment"
													class="form-control" rows="5" cols="40"
													placeholder="upto 250 characters only"><c:out
														value="${userDetails.getComment()}" /></textarea></td>

										</tr>
										<%-- <tr>
											<td><form:label path="LoginAttempt"
													class="col-sm-3 control-label">Login Attempt</form:label>
											<td><b><form:input path="LoginAttempt" type="text"
														maxlength="50" class="form-control" placeholder="Login Attempt"
														value="${userDetails.getLoginAttempt()}" /></b></td>
										</tr> --%>


									</tbody>
								</table>


					</div>
						</div>
					</form:form>
					<%-- </c:forEach> --%>
				</div>
			</div>



			<script type="text/javascript">
		function phonenumber(inputtxt)
		{
		  var phoneno = /^\d{10}$/;
		  if((inputtxt.value.match(phoneno)))
		        {
		      return true;
		        }
		      else
		        {
		        alert("message");
		        return false;
		        }
		}
		</script>


			<!-- Footer -->
			<footer class="main">

				&copy; 2018 <strong>NMS</strong> Admin Theme by <a
					href="http://frogcellsat.com" target="_blank"> <font
					color="green">Frog Cellsat Limited</font></a>

			</footer>



		</div>

	</div>


	<!-- Bottom scripts (common) -->
	<script src="resources/neon/assets/js/gsap/TweenMax.min.js"></script>
	<script
		src="resources/neon/assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
	<script src="resources/neon/assets/js/bootstrap.js"></script>
	<script src="resources/neon/assets/js/joinable.js"></script>
	<script src="resources/neon/assets/js/resizeable.js"></script>
	<script src="resources/neon/assets/js/neon-api.js"></script>
	<!-- <script src="resources/neon/assets/js/neon-register.js"></script> -->
	<script src="resources/neon/assets/js/jquery.inputmask.bundle.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="resources/neon/assets/js/neon-custom.js"></script>


	<!-- Demo Settings -->
	<script src="resources/neon/assets/js/neon-demo.js"></script>

</body>
</html>