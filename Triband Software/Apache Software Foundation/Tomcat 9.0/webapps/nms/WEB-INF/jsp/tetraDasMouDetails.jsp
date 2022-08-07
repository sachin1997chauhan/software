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

<title>NMS | MOU Configuration</title>


<jsp:include page="link.jsp"></jsp:include>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/neon/assets/js/form_validation.js"></script>

<style type="text/css">
table {
	overflow: hidden;
}

th {
	position: relative;
	outline: 0;
	font-size: 15px;
	background-color: white;
	position: relative;
}

td {
	font-size: 11px;
	position: relative;
	outline: 0;
	font-weight: bold;
	color: #fff;
}

body: not (.nohover ) tbody tr:hover {
	background-color: #ffa;
}

td:hover::after, thead th:not (:empty ):hover::after, td:focus::after,
	thead th:not (:empty ):focus::after {
	content: '';
	height: 10000px;
	left: 0;
	position: absolute;
	top: -5000px;
	width: 100%;
	z-index: -1;
}

td:hover::after, th:hover::after {
	background-color: #ffa;
}

td:focus::after, th:focus::after {
	background-color: lightblue;
}

/* Focus stuff for mobile */
td:focus::before, tbody th:focus::before {
	background-color: lightblue;
	content: '';
	height: 100%;
	top: 0;
	left: -5000px;
	position: absolute;
	width: 10000px;
	z-index: -1;
}

#load {
	width: 100%;
	height: 100%;
	position: fixed;
	z-index: 9999;
	background:
		url("${pageContext.request.contextPath}/resources/images/loading-spinner.gif")
		no-repeat center center rgba(0, 0, 0, 0.50);
	background-size: 150px 150px;
}

.btn {
	background-color: #DB6574;
	border-color: #DB6574;
	width: 125px;
}

#pageloader {
	display: none;
	height: 100%;
	position: fixed;
	width: 100%;
	z-index: 9999;
	background-color: rgba(0, 0, 0, 0.50);
}

#pageloader img {
	left: 45%;
	top: 45%;
	position: absolute;
	width: 150px;
	height: 150px;
	margin-left: -12px;
	margin-top: -12px;
}
</style>

<script type="text/javascript">
	//whatever kind of mobile test you wanna do.
	if (screen.width < 500) {

		$("body").addClass("nohover");
		$("td,  th").attr("tabindex", "1").on("touchstart", function() {
			$(this).focus();
		});

	}
</script>

<script type="text/javascript">
	document.onreadystatechange = function() {
		var state = document.readyState
		if (state == 'complete') {
			setTimeout(function() {
				document.getElementById('interactive');
				document.getElementById('load').style.visibility = "hidden";
			}, 1000);
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#systemDetailForm").on("submit", function() {
			$("#pageloader").fadeIn();
		});
	});
</script>

</head>
<body>
	<div id="pageloader">
		<img
			src="${pageContext.request.contextPath}/resources/images/gears.gif" />
	</div>
	<div id="load"></div>
	<div class="d-flex align-items-stretch">

		<!--Navigation bar-->

		<jsp:include page="nav.jsp" />

		<!--end of Navigation bar-->


		<div class="page-content">

			<input class="hide" id="rewind" type="submit" value="">

			<div class="container-fluid">
				<ul class="breadcrumb">
					<li><a href="/nms/dashboardView.htm"
						style="font-size: 15px; color: white"><i class="entypo-home"
							style="font-size: 15px; color: white"></i><strong>Home</strong></a></li>

					<li><a href="/nms/RepeaterList.htm"
						style="font-size: 15px; color: white"><strong>
								Site>>MOU</strong></a></li>

					<li style="font-size: 15px; color: white"><strong>Configuration>>
							${message}</strong></li>

					<li><c:choose>
							<c:when test="${status==true}">
								<font style="font-size: 15px; color: #32CD32"><strong>Online</strong></font>
							</c:when>
							<c:when test="${status==false}">
								<font style="font-size: 15px; color: orange"><strong>Offline</strong></font>
							</c:when>
						</c:choose></li>
				</ul>
			</div>

			<div class="container-fluid">

				<div class="col-sm-12">
					<div class="block">
						<form:form id="systemDetailForm"
							modelAttribute="mouDataPageMapper"
							action="/nms/tetraMouApply.htm" method="post">

							<h1 align="center" style="color: silver;">
								<strong>SYSTEM DETAIL</strong>
							</h1>

							<div class="row">
								<div class="col-sm-6">
									<div class="block ">
										<div class="table-responsive">
											<table class="table table-striped table-bordered">
												<tbody>
													<tr>
														<td><form:label path="MUSiteNmae"
																class="control-label">System
														Name:</form:label>
														<td><b><form:input path="MUSiteNmae" type="text"
																	maxlength="20" class="form-controlnew"
																	placeholder="Normal input"
																	value="${mouDetails.getRepName()}" /></b></td>


													</tr>

													<tr>

														<td><form:label path="MUPartNumber"
																class="control-label">Part
														Number:</form:label>
														<td><b><form:input path="MUPartNumber"
																	type="text" maxlength="20" class="form-controlnew"
																	placeholder="Normal input"
																	value="${mouDetails.getRepPartNumber()}" /></b></td>

													</tr>



													<tr>
														<td style="color: black"><form:label
																path="MUCircleName" class="control-label">Region Name:</form:label></td>

														<td><form:select path="MUCircleName">
																<form:option value="${mouDetails.getRegionName()}"
																	label="${mouDetails.getRegionName()}" />
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
													</tr>

													<tr>

														<td><form:label path="MUSerialNumber"
																class="control-label">Serial
														Number:</form:label></td>


														<td><b><form:input path="MUSerialNumber"
																	class="form-controlnew" placeholder="Normal input"
																	readonly="true" value="${mouDetails.getSerialNumber()}" /></b></td>

													</tr>

													<tr>

														<td><form:label path="MUIp" class="control-label">Device IP
														:</form:label></td>


														<td><b><form:input path="MUIp"
																	class="form-controlnew" placeholder="Normal input"
																	readonly="true" value="${mouDetails.getStreetName()}" /></b></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="block ">
										<div class="table-responsive">
											<table class="table table-striped table-bordered">
												<tbody>
													<tr>

														<td><form:label path="MUPort" class="control-label">Port:</form:label></td>


														<td><b><form:input path="MUPort"
																	class="form-controlnew" placeholder="Normal input"
																	value="${mouDetails.getPort()}"
																	readonly="true" /></b></td>
													</tr>
													<tr>

														<td><form:label path="MUApn" class="control-label">Server IP:</form:label>
														<td><b><form:input path="MUApn"
																	class="form-controlnew" placeholder="Normal input"
																	value="${mouDetails.getSerevrIpAddress()}" readonly="true" /></b></td>
													</tr>

													<tr>

														<td><form:label path="MUVersion"
																class="control-label">Version:</form:label>
														<td><b><form:input path="MUVersion"
																	class="form-controlnew" placeholder="Normal input"
																	value="${mouDetails.getState()}" readonly="true" /></b></td>
													</tr>
													<%-- <tr>

														<td><form:label path="MUImei" class="control-label">IMEI:
														Number</form:label></td>


														<td><b><form:input path="MUImei"
																	class="form-controlnew" placeholder="Normal input"
																	value="${mouDetails.getIMEI()}" readonly="true" /></b></td>
													</tr>

													<tr>

														<td><form:label path="MULac" class="control-label">LAC ID:</form:label>
														<td><b><form:input path="MULac"
																	class="form-controlnew" id="lacId" name="lacId"
																	value="${mouDetails.getLACID()}" readonly="true" /></b></td>
													</tr>

													<tr>

														<td><form:label path="MUCell" class="control-label">CELL ID:</form:label></td>


														<td><b><form:input path="MUCell"
																	class="form-controlnew" id="cellId" name="cellId"
																	value="${mouDetails.getCID()}" readonly="true" /></b></td>
													</tr> --%>


													<%-- <tr>

														<td><form:label path="MUStreet" class="control-label">OP Link:</form:label>
														<td><b><form:input path="MUStreet"
																	class="form-controlnew" id="streetName"
																	name="streetName" data-ng-model="streetName"
																	data-ng-value="${mouDetails.getStreetName()}" /></b></td>

													</tr> --%>

													<%-- <tr>

													<td><form:label path="MUCity" class="control-label">City:</form:label></td>

													<td><b><form:input path="MUCity"
																class="form-controlnew" id="city" name="city"
																value="${mouDetails.getCity()}" /> </b></td>
												</tr> --%>

													<tr>

														<td><form:label path="PdCount" class="control-label">Optical Power (UL):</form:label></td>

														<td><span> <b><form:input path="PdCount"
																		class="form-controlnew" id="PdCount" name="PdCount"
																		readonly="true" value="${mouDetails.getLatitude()}" />
															</b></span> &emsp; <span><b>dBm</b></span></td>
													</tr>

													<tr>

														<td><form:label path="LdCount" class="control-label">Optical Power (DL):</form:label></td>

														<td><span><b><form:input path="LdCount"
																		class="form-controlnew" id="LdCount" name="LdCount"
																		readonly="true" value="${mouDetails.getLongitude()}" /></b></span>
															&emsp;<span><b>dBm</b></span></td>
													</tr>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<c:if test="${userDetails.getRoleId() !='6'}">
										<div align="center">
											<button type="submit" class="btn btn-success" id="apply16">Apply</button>
										</div>
									</c:if>
								</div>
							</div>
						</form:form>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-6">
							<div class="block margin-bottom-sm">

								<h2 align="center" style="color: white">
									<strong>ROU Details</strong>
								</h2>
								<table class="table table-striped" id="myTable">
									<thead>
										<tr>
											<th style="color: black"><b>Serial Number</b></th>
											<th style="color: black"><b>Site Name</b></th>
											<th style="color: black"><b>Circle Name</b></th>
											<th style="color: black"><b>Connection Status</b></th>
											<th style="color: black"><b>Action</b></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${rouData}" var="ru" varStatus="loop">

											<tr>
												<td><c:out
														value="${rouData.get(loop.index).getRuSerialNumber()}" /></td>
												<td><c:out
														value="${rouData.get(loop.index).getRuSystemName()}" /></td>
												<td><c:out
														value="${rouData.get(loop.index).getRuRegionName()}" /></td>
												<td><c:choose>
														<c:when
															test="${rouData.get(loop.index).isConnectionStatus()==true}">
															<font color="#32CD32">Online</font>
														</c:when>
														<c:when
															test="${rouData.get(loop.index).isConnectionStatus()==false}">
															<font color="orange">Offline</font>
														</c:when>
													</c:choose></td>
												<td><a
													href="<c:url value='/tetraRou/${rouData.get(loop.index).getRuSerialNumber()}.htm' />">
														<font color="#32CD32"><i class="entypo-pencil"></i>
															Configuration</font>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="block margin-bottom-sm">

								<h2 align="center" style="color: white">
									<strong>Live Alarms</strong>
								</h2>

								<div class="table-responsive">
									<table class="table table-striped table-sm" id="myTable">
										<thead>
											<tr>
												<th style="color: black" data-hide="phone,tablet"><b>Device
														S/N</b></th>
												<th style="color: black" data-hide="phone,tablet"><b>Device
														Type</b></th>
												<th style="color: black" data-hide="phone,tablet"><b>Band</b></th>
												<th style="color: black" data-hide="phone,tablet"><b>Alarm
														Name</b></th>
												<th style="color: black" data-hide="phone,tablet"><b>Time
														Stamp</b></th>

											</tr>
										<tbody>
											<c:forEach items="${alarmDataList}" var="alarmList"
												varStatus="loop">
												<tr>

													<td><c:out
															value="${alarmDataList.get(loop.index).getRuSerailNumber()}" /></td>

													<td><c:out value="ROU" /></td>
													<td><c:out
															value="${alarmDataList.get(loop.index).getBandName()}" /></td>
													<td><c:if
															test="${alarmDataList.get(loop.index).getElectricityStatus()==0 }">
															<font color="red">Electricity Alarm,</font>
														</c:if> <c:if
															test="${alarmDataList.get(loop.index).getApcoVSWR()==0 }">
															<font color="red">VSWR Alarm,</font>
														</c:if> <c:if
															test="${alarmDataList.get(loop.index).getApcoOVRPWR()==0 }">
															<font color="red">OVERPWR Alarm,</font>
														</c:if> <c:if
															test="${alarmDataList.get(loop.index).getElectricityStatus()==1}">
															<font color="#32CD32">Electricity Alarm Clear,</font>
														</c:if> <c:if
															test="${alarmDataList.get(loop.index).getApcoVSWR()==1 }">
															<font color="#32CD32">VSWR Alarm Clear,</font>
														</c:if> <c:if
															test="${alarmDataList.get(loop.index).getApcoOVRPWR()==1 }">
															<font color="#32CD32">OVERPWR Alarm Clear,</font>
														</c:if></td>
													<td><c:out
															value="${alarmDataList.get(loop.index).getTimestamp()}" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp" />

		</div>
	</div>

	<script type="text/javascript">
		jQuery(document)
				.ready(
						function($) {

							toastr.options = {

								"closeButton" : true,
								"debug" : false,
								"positionClass" : "toast-top-right",
								"onclick" : null,
								"fadeIn" : 300,
								"fadeOut" : 100,
								"timeOut" : 5000,
								"extendedTimeOut" : 1000

							}
							function toastrs() {
								if ("${sendval}" == 'Connection Error...') {
									toastr.error('Connection Error...!!!',
											'Error!!!')
								} else if ("${sendval}" == 'Update Successfully...') {
									toastr.success(
											'Updated Successfully...!!!',
											'Success!!!')
								} else if ("${sendval}" == 'Successfully Send.Waiting for update....') {
									toastr
											.warning(
													'Successfully Send.Waiting for update....!!!',
													'Please wait!!!')
								}
							}

							// Define a callback for when the toast fades in/out
							toastr.options.onFadeIn = function() {
								showToastrs = true;
							};
							toastr.options.onFadeOut = function() {
								showToastrs = false;
							};

							$(function() {

								$("#rewind").on("click", function() {
									// show toastrs :)
									toastrs();
								});

							});

						});
	</script>
	<script>
		window.onload = function() {
			document.getElementById('rewind').click();
		}
	</script>

	<jsp:include page="script.jsp"></jsp:include>s

</body>
</html>