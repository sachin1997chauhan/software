<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<!DOCTYPE html>
<html lang="en">
<head>

<title>NMS | ROU Configuration</title>

<jsp:include page="link.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/darkAdmin/bootstrap.min.css">

<script
	src="${pageContext.request.contextPath}/resources/darkAdmin/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/neon/assets/js/form_validation.js"></script>

<style type="text/css">
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}

th {
	position: relative;
	outline: 0;
	color: white;
	font-size: 15px;
}

td {
	border-bottom: 1px solid #ccc;
	font-size: 11px;
	position: relative;
	outline: 0;
	color: white;
	width: 163px;
}

form label {
	color: white;
	font-size: 1.1rem;
}
</style>
<style>
.nav-tabs>li>a {
	border: medium none;
	color: white;
}

.nav-tabs>li>a:hover {
	background-color: #303136 !important;
	border: medium none;
	border-radius: 0;
	color: #fff;
}

.btn {
	background-color: #DB6574;
	border-color: #DB6574;
	width: 100px;
}

.panel {
	background-color: unset;
}

.block {
	padding: 5px;
	margin-bottom: 10px;
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
		$("#RepeaterDtaForm").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm1").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm2").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm3").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm4").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm5").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm6").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm7").on("submit", function() {
			$("#pageloader").fadeIn();
		});

	});
</script>


</head>
<body data-ng-app="">

	<%
		String message1 = null;
		String sessionID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("message1"))
					message1 = cookie.getValue();
				if (cookie.getName().equals("FROGNMSID"))
					sessionID = cookie.getValue();
			}
		}
	%>

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

			<section>
				<div class="container-fluid">

					<ol class="breadcrumb bc-3">
						<li><a href="/nms/dashboardView.htm"
							style="font-size: 15px; color: white"><i class="entypo-home"
								style="font-size: 15px; color: white"></i><strong>Home</strong></a></li>


						<li><a href="/nms/RepeaterList.htm"
							style="font-size: 15px; color: white"><strong>
									Site>>Site List</strong></a></li>

						<li style="font-size: 15px; color: white" class="active"><strong>MOU</strong></li>

						<li style="font-size: 15px; color: white" class="active"><strong>Configuration>>
								${message}</strong></li>

						<!-- <li style="font-size: 15px; color: #32CD32" class="active"><strong>online</strong></li> -->
						<%-- <li><c:choose>
								<c:when test="${status==true}">
									<font color="#32CD32"><b>Online</b></font>
								</c:when>
								<c:when test="${status==false}">
									<font color="orange"><b>Offline</b></font>
								</c:when>
							</c:choose></li> --%>

					</ol>

					<%-- <h2>
						<c:if test="${sendval == 'Connection Error...'}">
							<font color="red">Connection Error...</font>
						</c:if>
					</h2>
					<h2>
						<c:if test="${sendval == 'Unsuccessfully Send. Try Again...'}">
							<font color="orange">Unsuccessfully Send. Try Again...</font>
						</c:if>
					</h2>
					<h2>
						<c:if test="${sendval == 'Update Successfully...'}">
							<font color="green">Update Successfully...</font>
						</c:if>
					</h2> --%>

					<div class="row">
						<div class="col-lg-12">
							<div class="block">

								<ul class="nav nav-tabs">

									<li class="active"><a data-toggle="tab" href="#apco"><b>APCO</b></a></li>

									<li><a data-toggle="tab" href="#cdma"><b>CDMA</b></a></li>

									<li><a data-toggle="tab" href="#gsm"><b>GSM</b></a></li>

									<li><a data-toggle="tab" href="#dcs"><b>DCS</b></a></li>

									<li><a data-toggle="tab" href="#wcdma"><b>UMTS</b></a></li>

									<li><a data-toggle="tab" href="#lte1"><b>LTE-1</b></a></li>

									<li><a data-toggle="tab" href="#lte2"><b>LTE-2</b></a></li>

									<li><a data-toggle="tab" href="#sysdetails"><b>System
												Details</b></a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="tab-content">
						<c:forEach items="${repParams}" var="bandDataList"
							varStatus="loop">

							<!-- APCO -->

							<c:if test="${repParams.get(loop.index).getBandName()=='APCO' }">
								<div id="apco" class="tab-pane fade in active">
									<form:form id="RepeaterDtaForm"
										modelAttribute="cofigPageMapper" action="/nms/odasApply.htm"
										method="post">

										<!-- page division -->

										<div class="row">
											<div class="col-lg-4">

												<!-- PA  -->
												<div class="block" style="height: 101px">
													<h4 align="center" style="color: white">
														<strong>PA ON/OFF</strong>
													</h4>

													<table class="table-striped">
														<tbody>

															<tr>
																<td><label for="paon_offul">PA UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			unchecked="true" /><font color="red">OFF</font></td>
																</c:if>
																<td></td>
																<td></td>
															</tr>

															<tr>
																<td><label for="paon_offdl">PA DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			unchecked="false" /><font color="red">OFF</font></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="APCO" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
															<tr class="hide">

																<td><form:label path="city" class="control-label">No.</form:label></td>

																<td><b><form:input path="city"
																			class="form-controlnew" id="city" name="city"
																			value="${repData.getRuIdentifier()}" /> </b></td>

															</tr>

														</tbody>
													</table>
												</div>
												<br>

												<!-- GAIN -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>GAIN</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul" class="control-label">GAIN UL</form:label></td>

																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" min="20" max="60" id="Gainul"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																<td><form:label path="Gainul" class="control-label">dB</form:label></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl" class="control-label">GAIN DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" min="20" max="60" id="Gaindl"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }" /></b></td>
																<td><form:label path="Gaindl" class="control-label">dB</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- ALC -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>ALC</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="alclvlul"
																		class=" control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																<td><form:label path="alclvlul"
																		class="control-label">dBm</form:label></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class=" control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																<td><form:label path="alclvldl"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<!-- OFFSET -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>OFFSET</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="offsetul"
																		class="control-label">OFFSET UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="offsetul"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="control-label">OFFSET DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="offsetdl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div>
												<br>

												<!-- RF Input -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Input</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="powerulin"
																		class=" control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulin"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlin"
																		class="control-label">dBm</form:label></td>
															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- RF Output -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Output</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<!-- <tr>
																<td><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr> -->
															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulout"
																		class="control-label">dBm</form:label></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlout"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<%-- <div class="block">
													<table>
														<tr>
															<td><form:label path="dcsversion"
																	class="control-label">Version</form:label></td>
															<td><b><form:input path="gsmversion"
																		class="form-controlnew" id="gsmversion"
																		name="gsmversion" readonly="true"
																		value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>


															
														</tr>
													</table>
												</div> --%>

												<!-- Compensation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Compensation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllDl"
																		class="control-label">Comp DL</form:label></td>
																<td><b><form:input path="CompensationAllDl"
																			type="number" 
																			name="CompensationAllDl" id="CompensationAllDl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																<td><form:label path="CompensationAllDl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- Attenuation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Attenuation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getAttenuationUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getAttenuationDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- ADC Count -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>ADC Count</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">ADC UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getStartChannel() }"
																			readonly="true" /></b></td>
																<td></td>
															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">ADC DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getStopChannel() }"
																			readonly="true" /></b></td>
																<td></td>

															</tr>
														</tbody>
													</table>
												</div> --%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="block">
													<table>
														<tr>
															<td><label for="alclvlon_off">ALC ON/OFF </label></td>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" checked="true" /><font
																	color="green">ON</font></td>
															</c:if>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" unchecked="false" /><font
																	color="red">OFF</font></td>
															</c:if>

															<form:hidden path="CompensationAllUl" />
															<td><input id="CompensationAllUl"
																name="CompensationAllUl" type="hidden"
																value="${repParams.get(loop.index).getCompensationUl() }" /></td>

															<form:hidden path="CompensationAllDl" />
															<td><input id="CompensationAllDl"
																name="CompensationAllDl" type="hidden"
																value="${repParams.get(loop.index).getCompensationDl() }" /></td>

														</tr>
													</table>
												</div>
											</div>
											<div class="col-lg-4" align="center">
												<c:if test="${userDetails.getRoleId() !='6'}">
													<button type="submit" class="btn btn-success" id="apply">Apply</button>
												</c:if>
											</div>
											<div class="col-lg-4"></div>
										</div>
									</form:form>
								</div>
								<!-- end of APCO -->
							</c:if>

							<!-- CDMA -->

							<c:if test="${repParams.get(loop.index).getBandName()=='CDMA' }">
								<div id="cdma" class="tab-pane fade">
									<form:form id="RepeaterDtaForm1"
										modelAttribute="cofigPageMapper" action="/nms/odasApply.htm"
										method="post">

										<!-- page division -->

										<div class="row">
											<div class="col-lg-4">

												<!-- PA  -->
												<div class="block" style="height: 101px">
													<h4 align="center" style="color: white">
														<strong>PA ON/OFF</strong>
													</h4>

													<table class="table-striped">
														<tbody>

															<tr>
																<td><label for="paon_offul">PA UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			unchecked="true" /><font color="red">OFF</font></td>
																</c:if>
																<td></td>
																<td></td>
															</tr>

															<tr>
																<td><label for="paon_offdl">PA DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			unchecked="false" /><font color="red">OFF</font></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="CDMA" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
															<tr class="hide">

																<td><form:label path="city" class="control-label">No.</form:label></td>

																<td><b><form:input path="city"
																			class="form-controlnew" id="city" name="city"
																			value="${repData.getRuIdentifier()}" /> </b></td>

															</tr>
														</tbody>
													</table>
												</div>
												<br>

												<!-- GAIN -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>GAIN</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul" class="control-label">GAIN UL</form:label></td>

																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" min="20" max="60" id="Gainul"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																<td><form:label path="Gainul" class="control-label">dB</form:label></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl" class="control-label">GAIN DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" min="20" max="60" id="Gaindl"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }" /></b></td>
																<td><form:label path="Gaindl" class="control-label">dB</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>

												<br>

												<!-- ALC -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>ALC</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="alclvlul"
																		class=" control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																<td><form:label path="alclvlul"
																		class="control-label">dBm</form:label></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class=" control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																<td><form:label path="alclvldl"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<!-- OFFSET -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>OFFSET</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="offsetul"
																		class="control-label">OFFSET UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="offsetul"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="control-label">OFFSET DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="offsetdl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div>
												<br>

												<!-- RF Input -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Input</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="powerulin"
																		class=" control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulin"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlin"
																		class="control-label">dBm</form:label></td>
															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- RF Output -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Output</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<!-- <tr>
																<td><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr> -->
															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulout"
																		class="control-label">dBm</form:label></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlout"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<%-- <div class="block">
													<table>
														<tr>
															<td><form:label path="dcsversion"
																	class="control-label">Version</form:label></td>
															<td><b><form:input path="gsmversion"
																		class="form-controlnew" id="gsmversion"
																		name="gsmversion" readonly="true"
																		value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>

															
														</tr>
													</table>
												</div> --%>

												<!-- Compensation -->
												<%-- <div class="block">
													<h4 align="center" style="color: white">
														<strong>Compensation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- Attenuation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Attenuation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- ADC Count -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>ADC Count</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">ADC UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>
																<td></td>
															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">ADC DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>
																<td></td>

															</tr>
														</tbody>
													</table>
												</div> --%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="block">
													<table>
														<tr>
															<td><label for="alclvlon_off">ALC ON/OFF </label></td>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" checked="true" /><font
																	color="green">ON</font></td>
															</c:if>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" unchecked="false" /><font
																	color="red">OFF</font></td>
															</c:if>

															<form:hidden path="CompensationAllUl" />
															<td><input id="CompensationAllUl"
																name="CompensationAllUl" type="hidden"
																value="${repParams.get(loop.index).getCompensationUl() }" /></td>

															<form:hidden path="CompensationAllDl" />
															<td><input id="CompensationAllDl"
																name="CompensationAllDl" type="hidden"
																value="${repParams.get(loop.index).getCompensationDl() }" /></td>

														</tr>
													</table>
												</div>
											</div>
											<div class="col-lg-4" align="center">
												<c:if test="${userDetails.getRoleId() !='6'}">
													<button type="submit" class="btn btn-success" id="apply">Apply</button>
												</c:if>
											</div>
											<div class="col-lg-4"></div>
										</div>
									</form:form>
								</div>
								<!-- end of CDMA -->
							</c:if>

							<!-- GSM -->

							<c:if test="${repParams.get(loop.index).getBandName()=='GSM' }">
								<div id="gsm" class="tab-pane fade">
									<form:form id="RepeaterDtaForm2"
										modelAttribute="cofigPageMapper" action="/nms/odasApply.htm"
										method="post">

										<!-- page division -->

										<div class="row">
											<div class="col-lg-4">

												<!-- PA  -->
												<div class="block" style="height: 101px">
													<h4 align="center" style="color: white">
														<strong>PA ON/OFF</strong>
													</h4>

													<table class="table-striped">
														<tbody>

															<tr>
																<td><label for="paon_offul">PA UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			unchecked="true" /><font color="red">OFF</font></td>
																</c:if>
																<td></td>
																<td></td>
															</tr>

															<tr>
																<td><label for="paon_offdl">PA DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			unchecked="false" /><font color="red">OFF</font></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="GSM" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
															<tr class="hide">

																<td><form:label path="city" class="control-label">No.</form:label></td>

																<td><b><form:input path="city"
																			class="form-controlnew" id="city" name="city"
																			value="${repData.getRuIdentifier()}" /> </b></td>

															</tr>
														</tbody>
													</table>
												</div>
												<br>

												<!-- GAIN -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>GAIN</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul" class="control-label">GAIN UL</form:label></td>

																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" min="20" max="60" id="Gainul"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																<td><form:label path="Gainul" class="control-label">dB</form:label></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl" class="control-label">GAIN DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" min="20" max="60" id="Gaindl"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }" /></b></td>
																<td><form:label path="Gaindl" class="control-label">dB</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>

												<br>

												<!-- ALC -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>ALC</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="alclvlul"
																		class=" control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																<td><form:label path="alclvlul"
																		class="control-label">dBm</form:label></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class=" control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																<td><form:label path="alclvldl"
																		class="control-label">dBm</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<!-- OFFSET -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>OFFSET</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="offsetul"
																		class="control-label">OFFSET UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="offsetul"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="control-label">OFFSET DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="offsetdl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div>
												<br>

												<!-- RF Input -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Input</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="powerulin"
																		class=" control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulin"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlin"
																		class="control-label">dBm</form:label></td>
															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- RF Output -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Output</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<!-- <tr>
																<td><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr> -->
															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulout"
																		class="control-label">dBm</form:label></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlout"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<%-- <div class="block">
													<table>
														<tr>
															<td><form:label path="dcsversion"
																	class="control-label">Version</form:label></td>
															<td><b><form:input path="gsmversion"
																		class="form-controlnew" id="gsmversion"
																		name="gsmversion" readonly="true"
																		value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>

															
														</tr>
													</table>
												</div> --%>

												<!-- Compensation -->
												<%-- <div class="block">
													<h4 align="center" style="color: white">
														<strong>Compensation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- Attenuation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Attenuation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- ADC Count -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>ADC Count</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">ADC UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>
																<td></td>
															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">ADC DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>
																<td></td>

															</tr>
														</tbody>
													</table>
												</div> --%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="block">
													<table>
														<tr>
															<td><label for="alclvlon_off">ALC ON/OFF </label></td>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" checked="true" /><font
																	color="green">ON</font></td>
															</c:if>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" unchecked="false" /><font
																	color="red">OFF</font></td>
															</c:if>

															<form:hidden path="CompensationAllUl" />
															<td><input id="CompensationAllUl"
																name="CompensationAllUl" type="hidden"
																value="${repParams.get(loop.index).getCompensationUl() }" /></td>

															<form:hidden path="CompensationAllDl" />
															<td><input id="CompensationAllDl"
																name="CompensationAllDl" type="hidden"
																value="${repParams.get(loop.index).getCompensationDl() }" /></td>

														</tr>
													</table>
												</div>
											</div>
											<div class="col-lg-4" align="center">
												<c:if test="${userDetails.getRoleId() !='6'}">
													<button type="submit" class="btn btn-success" id="apply">Apply</button>
												</c:if>
											</div>
											<div class="col-lg-4"></div>
										</div>
									</form:form>
								</div>
								<!-- GSM -->
							</c:if>

							<!-- DCS -->

							<c:if test="${repParams.get(loop.index).getBandName()=='DCS' }">
								<div id="dcs" class="tab-pane fade">
									<form:form id="RepeaterDtaForm3"
										modelAttribute="cofigPageMapper" action="/nms/odasApply.htm"
										method="post">

										<!-- page division -->

										<div class="row">
											<div class="col-lg-4">

												<!-- PA  -->
												<div class="block" style="height: 101px">
													<h4 align="center" style="color: white">
														<strong>PA ON/OFF</strong>
													</h4>

													<table class="table-striped">
														<tbody>

															<tr>
																<td><label for="paon_offul">PA UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			unchecked="true" /><font color="red">OFF</font></td>
																</c:if>
																<td></td>
																<td></td>
															</tr>

															<tr>
																<td><label for="paon_offdl">PA DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			unchecked="false" /><font color="red">OFF</font></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="DCS" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
															<tr class="hide">

																<td><form:label path="city" class="control-label">No.</form:label></td>

																<td><b><form:input path="city"
																			class="form-controlnew" id="city" name="city"
																			value="${repData.getRuIdentifier()}" /> </b></td>
															</tr>
														</tbody>
													</table>
												</div>
												<br>

												<!-- GAIN -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>GAIN</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul" class="control-label">GAIN UL</form:label></td>

																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" min="20" max="60" id="Gainul"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																<td><form:label path="Gainul" class="control-label">dB</form:label></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl" class="control-label">GAIN DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" min="20" max="60" id="Gaindl"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }" /></b></td>
																<td><form:label path="Gaindl" class="control-label">dB</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- ALC -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>ALC</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="alclvlul"
																		class=" control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																<td><form:label path="alclvlul"
																		class="control-label">dBm</form:label></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class=" control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																<td><form:label path="alclvldl"
																		class="control-label">dBm</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<!-- OFFSET -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>OFFSET</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="offsetul"
																		class="control-label">OFFSET UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="offsetul"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="control-label">OFFSET DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="offsetdl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div>
												<br>

												<!-- RF Input -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Input</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="powerulin"
																		class=" control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulin"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlin"
																		class="control-label">dBm</form:label></td>
															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- RF Output -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Output</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<!-- <tr>
																<td><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr> -->
															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulout"
																		class="control-label">dBm</form:label></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlout"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<%-- <div class="block">
													<table>
														<tr>
															<td><form:label path="dcsversion"
																	class="control-label">Version</form:label></td>
															<td><b><form:input path="gsmversion"
																		class="form-controlnew" id="gsmversion"
																		name="gsmversion" readonly="true"
																		value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
															
														</tr>
													</table>
												</div> --%>

												<!-- Compensation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Compensation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- Attenuation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Attenuation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- ADC Count -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>ADC Count</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">ADC UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>
																<td></td>
															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">ADC DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>
																<td></td>

															</tr>
														</tbody>
													</table>
												</div> --%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="block">
													<table>
														<tr>
															<td><label for="alclvlon_off">ALC ON/OFF </label></td>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" checked="true" /><font
																	color="green">ON</font></td>
															</c:if>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" unchecked="false" /><font
																	color="red">OFF</font></td>
															</c:if>

															<form:hidden path="CompensationAllUl" />
															<td><input id="CompensationAllUl"
																name="CompensationAllUl" type="hidden"
																value="${repParams.get(loop.index).getCompensationUl() }" /></td>

															<form:hidden path="CompensationAllDl" />
															<td><input id="CompensationAllDl"
																name="CompensationAllDl" type="hidden"
																value="${repParams.get(loop.index).getCompensationDl() }" /></td>

														</tr>
													</table>
												</div>
											</div>
											<div class="col-lg-4" align="center">
												<c:if test="${userDetails.getRoleId() !='6'}">
													<button type="submit" class="btn btn-success" id="apply">Apply</button>
												</c:if>
											</div>
											<div class="col-lg-4"></div>
										</div>
									</form:form>
								</div>
								<!-- end of DCS -->
							</c:if>

							<!-- WCDMA -->

							<c:if test="${repParams.get(loop.index).getBandName()=='UMTS' }">
								<div id="wcdma" class="tab-pane fade">
									<form:form id="RepeaterDtaForm4"
										modelAttribute="cofigPageMapper" action="/nms/odasApply.htm"
										method="post">

										<!-- page division -->

										<div class="row">
											<div class="col-lg-4">

												<!-- PA  -->
												<div class="block" style="height: 101px">
													<h4 align="center" style="color: white">
														<strong>PA ON/OFF</strong>
													</h4>

													<table class="table-striped">
														<tbody>

															<tr>
																<td><label for="paon_offul">PA UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			unchecked="true" /><font color="red">OFF</font></td>
																</c:if>
																<td></td>
																<td></td>
															</tr>

															<tr>
																<td><label for="paon_offdl">PA DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			unchecked="false" /><font color="red">OFF</font></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="UMTS" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
															<tr class="hide">

																<td><form:label path="city" class="control-label">No.</form:label></td>

																<td><b><form:input path="city"
																			class="form-controlnew" id="city" name="city"
																			value="${repData.getRuIdentifier()}" /> </b></td>
															</tr>
														</tbody>
													</table>
												</div>
												<br>

												<!-- GAIN -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>GAIN</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul" class="control-label">GAIN UL</form:label></td>

																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" min="20" max="60" id="Gainul"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																<td><form:label path="Gainul" class="control-label">dB</form:label></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl" class="control-label">GAIN DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" min="20" max="60" id="Gaindl"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }" /></b></td>
																<td><form:label path="Gaindl" class="control-label">dB</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>

												<br>

												<!-- ALC -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>ALC</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="alclvlul"
																		class=" control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																<td><form:label path="alclvlul"
																		class="control-label">dBm</form:label></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class=" control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																<td><form:label path="alclvldl"
																		class="control-label">dBm</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<!-- OFFSET -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>OFFSET</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="offsetul"
																		class="control-label">OFFSET UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="offsetul"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="control-label">OFFSET DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="offsetdl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div>
												<br>

												<!-- RF Input -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Input</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="powerulin"
																		class=" control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulin"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlin"
																		class="control-label">dBm</form:label></td>
															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- RF Output -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Output</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<!-- <tr>
																<td><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr> -->
															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulout"
																		class="control-label">dBm</form:label></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlout"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<%-- <div class="block">
													<table>
														<tr>
															<td><form:label path="dcsversion"
																	class="control-label">Version</form:label></td>
															<td><b><form:input path="gsmversion"
																		class="form-controlnew" id="gsmversion"
																		name="gsmversion" readonly="true"
																		value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
															
														</tr>
													</table>
												</div> --%>

												<!-- Compensation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Compensation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- Attenuation -->
												<%-- <div class="block hidden">
													<h4 align="" style="color: white">
														<strong>Attenuation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- ADC Count -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>ADC Count</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">ADC UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>
																<td></td>
															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">ADC DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>
																<td></td>

															</tr>
														</tbody>
													</table>
												</div> --%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="block">
													<table>
														<tr>
															<td><label for="alclvlon_off">ALC ON/OFF </label></td>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" checked="true" /><font
																	color="green">ON</font></td>
															</c:if>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" unchecked="false" /><font
																	color="red">OFF</font></td>
															</c:if>

															<form:hidden path="CompensationAllUl" />
															<td><input id="CompensationAllUl"
																name="CompensationAllUl" type="hidden"
																value="${repParams.get(loop.index).getCompensationUl() }" /></td>

															<form:hidden path="CompensationAllDl" />
															<td><input id="CompensationAllDl"
																name="CompensationAllDl" type="hidden"
																value="${repParams.get(loop.index).getCompensationDl() }" /></td>

														</tr>
													</table>
												</div>
											</div>
											<div class="col-lg-4" align="center">
												<c:if test="${userDetails.getRoleId() !='6'}">
													<button type="submit" class="btn btn-success" id="apply">Apply</button>
												</c:if>
											</div>
											<div class="col-lg-4"></div>
										</div>
									</form:form>
								</div>
								<!-- end of WCDMA -->
							</c:if>

							<!-- LTE-1 -->

							<c:if test="${repParams.get(loop.index).getBandName()=='LTE-1' }">
								<div id="lte1" class="tab-pane fade">
									<form:form id="RepeaterDtaForm5"
										modelAttribute="cofigPageMapper" action="/nms/odasApply.htm"
										method="post">

										<!-- page division -->

										<div class="row">
											<div class="col-lg-4">

												<!-- PA  -->
												<div class="block" style="height: 101px">
													<h4 align="center" style="color: white">
														<strong>PA ON/OFF</strong>
													</h4>

													<table class="table-striped">
														<tbody>

															<tr>
																<td><label for="paon_offul">PA UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			unchecked="true" /><font color="red">OFF</font></td>
																</c:if>
																<td></td>
																<td></td>
															</tr>

															<tr>
																<td><label for="paon_offdl">PA DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			unchecked="false" /><font color="red">OFF</font></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="LTE-1" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
															<tr class="hide">

																<td><form:label path="city" class="control-label">No.</form:label></td>

																<td><b><form:input path="city"
																			class="form-controlnew" id="city" name="city"
																			value="${repData.getRuIdentifier()}" /> </b></td>
															</tr>
														</tbody>
													</table>
												</div>
												<br>

												<!-- GAIN -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>GAIN</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul" class="control-label">GAIN UL</form:label></td>

																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" min="20" max="60" id="Gainul"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																<td><form:label path="Gainul" class="control-label">dB</form:label></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl" class="control-label">GAIN DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" min="20" max="60" id="Gaindl"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }" /></b></td>
																<td><form:label path="Gaindl" class="control-label">dB</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>

												<br>

												<!-- ALC -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>ALC</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="alclvlul"
																		class=" control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																<td><form:label path="alclvlul"
																		class="control-label">dBm</form:label></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class=" control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																<td><form:label path="alclvldl"
																		class="control-label">dBm</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<!-- OFFSET -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>OFFSET</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="offsetul"
																		class="control-label">OFFSET UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="offsetul"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="control-label">OFFSET DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="offsetdl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div>
												<br>

												<!-- RF Input -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Input</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="powerulin"
																		class=" control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulin"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlin"
																		class="control-label">dBm</form:label></td>
															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- RF Output -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Output</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<!-- <tr>
																<td><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr> -->
															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulout"
																		class="control-label">dBm</form:label></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlout"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<%-- <div class="block">
													<table>
														<tr>
															<td><form:label path="dcsversion"
																	class="control-label">Version</form:label></td>
															<td><b><form:input path="gsmversion"
																		class="form-controlnew" id="gsmversion"
																		name="gsmversion" readonly="true"
																		value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
															
														</tr>
													</table>
												</div> --%>

												<!-- Compensation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Compensation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- Attenuation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Attenuation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- ADC Count -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>ADC Count</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">ADC UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>
																<td></td>
															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">ADC DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>
																<td></td>

															</tr>
														</tbody>
													</table>
												</div> --%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="block">
													<table>
														<tr>
															<td><label for="alclvlon_off">ALC ON/OFF </label></td>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" checked="true" /><font
																	color="green">ON</font></td>
															</c:if>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" unchecked="false" /><font
																	color="red">OFF</font></td>
															</c:if>

															<form:hidden path="CompensationAllUl" />
															<td><input id="CompensationAllUl"
																name="CompensationAllUl" type="hidden"
																value="${repParams.get(loop.index).getCompensationUl() }" /></td>

															<form:hidden path="CompensationAllDl" />
															<td><input id="CompensationAllDl"
																name="CompensationAllDl" type="hidden"
																value="${repParams.get(loop.index).getCompensationDl() }" /></td>

														</tr>
													</table>
												</div>
											</div>
											<div class="col-lg-4" align="center">
												<c:if test="${userDetails.getRoleId() !='6'}">
													<button type="submit" class="btn btn-success" id="apply">Apply</button>
												</c:if>
											</div>
											<div class="col-lg-4"></div>
										</div>
									</form:form>
								</div>
								<!-- end of LTE-1 -->
							</c:if>

							<!-- LTE-2 -->

							<c:if test="${repParams.get(loop.index).getBandName()=='LTE-2' }">
								<div id="lte2" class="tab-pane fade">
									<form:form id="RepeaterDtaForm6"
										modelAttribute="cofigPageMapper" action="/nms/odasApply.htm"
										method="post">

										<!-- page division -->

										<div class="row">
											<div class="col-lg-4">

												<!-- PA  -->
												<div class="block" style="height: 101px">
													<h4 align="center" style="color: white">
														<strong>PA ON/OFF</strong>
													</h4>

													<table class="table-striped">
														<tbody>

															<tr>
																<td><label for="paon_offul">PA UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			unchecked="true" /><font color="red">OFF</font></td>
																</c:if>
																<td></td>
																<td></td>
															</tr>

															<tr>
																<td><label for="paon_offdl">PA DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			checked="true" /><font color="green">ON</font></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			unchecked="false" /><font color="red">OFF</font></td>
																</c:if>
																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="LTE-2" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
															<tr class="hide">

																<td><form:label path="city" class="control-label">No.</form:label></td>

																<td><b><form:input path="city"
																			class="form-controlnew" id="city" name="city"
																			value="${repData.getRuIdentifier()}" /> </b></td>
															</tr>
														</tbody>
													</table>
												</div>
												<br>

												<!-- GAIN -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>GAIN</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul" class="control-label">GAIN UL</form:label></td>

																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" min="20" max="60" id="Gainul"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																<td><form:label path="Gainul" class="control-label">dB</form:label></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl" class="control-label">GAIN DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" min="20" max="60" id="Gaindl"
																			class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }" /></b></td>
																<td><form:label path="Gaindl" class="control-label">dB</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>

												<br>

												<!-- ALC -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>ALC</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="alclvlul"
																		class=" control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																<td><form:label path="alclvlul"
																		class="control-label">dBm</form:label></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class=" control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-43" max="43" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																<td><form:label path="alclvldl"
																		class="control-label">dBm</form:label></td>

															</tr>

														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<!-- OFFSET -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>OFFSET</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="offsetul"
																		class="control-label">OFFSET UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="offsetul"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="control-label">OFFSET DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="offsetdl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div>
												<br>

												<!-- RF Input -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Input</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<tr>
																<td><form:label path="powerulin"
																		class=" control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulin"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlin"
																		class="control-label">dBm</form:label></td>
															</tr>
														</tbody>
													</table>
												</div>

												<br>

												<!-- RF Output -->
												<div class="block">
													<h4 align="center" style="color: white">
														<strong>RF Output</strong>
													</h4>
													<table class="table-striped">
														<tbody>
															<!-- <tr>
																<td><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr> -->
															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerulout"
																		class="control-label">dBm</form:label></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

																<td><form:label path="powerdlout"
																		class="control-label">dBm</form:label></td>

															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="col-lg-4">

												<%-- <div class="block">
													<table>
														<tr>
															<td><form:label path="dcsversion"
																	class="control-label">Version</form:label></td>
															<td><b><form:input path="gsmversion"
																		class="form-controlnew" id="gsmversion"
																		name="gsmversion" readonly="true"
																		value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
															
														</tr>
													</table>
												</div> --%>

												<!-- Compensation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Compensation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Comp DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- Attenuation -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>Attenuation</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>

																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten UL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>
															<tr>
																<td><form:label path="CompensationAllUl"
																		class="control-label">Atten DL</form:label></td>
																<td><b><form:input path="CompensationAllUl"
																			type="number" 
																			name="CompensationAllUl" id="CompensationAllUl"
																			class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																<td><form:label path="CompensationAllUl"
																		class="control-label">dBm</form:label></td>
															</tr>

														</tbody>
													</table>
												</div> --%>
												<br>

												<!-- ADC Count -->
												<%-- <div class="block ">
													<h4 align="center" style="color: white">
														<strong>ADC Count</strong>
													</h4>
													<table class="table-striped">
														<tbody>

															<tr>
																<td><form:label path="powerulout"
																		class=" control-label">ADC UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>
																<td></td>
															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="control-label">ADC DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>
																<td></td>

															</tr>
														</tbody>
													</table>
												</div> --%>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="block">
													<table>
														<tr>
															<td><label for="alclvlon_off">ALC ON/OFF </label></td>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" checked="true" /><font
																	color="green">ON</font></td>
															</c:if>
															<c:if
																test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																<td><form:checkbox path="alclvlon_off"
																		id="alclvlon_off" unchecked="false" /><font
																	color="red">OFF</font></td>
															</c:if>

															<form:hidden path="CompensationAllUl" />
															<td><input id="CompensationAllUl"
																name="CompensationAllUl" type="hidden"
																value="${repParams.get(loop.index).getCompensationUl() }" /></td>

															<form:hidden path="CompensationAllDl" />
															<td><input id="CompensationAllDl"
																name="CompensationAllDl" type="hidden"
																value="${repParams.get(loop.index).getCompensationDl() }" /></td>

														</tr>
													</table>
												</div>
											</div>
											<div class="col-lg-4" align="center">
												<c:if test="${userDetails.getRoleId() !='6'}">
													<button type="submit" class="btn btn-success" id="apply">Apply</button>
												</c:if>
											</div>
											<div class="col-lg-4"></div>
										</div>
									</form:form>
								</div>
								<!-- end of LTE-2 -->
							</c:if>

							<!-- System Details -->

							<div id="sysdetails" class="tab-pane fade">

								<form:form id="RepeaterDtaForm7"
									modelAttribute="cofigPageMapper" action="/nms/odasApply.htm"
									method="post">

									<div class="row">
										<div class="col-sm-6">
											<div class="block margin-bottom-sm">
												<div class="table-responsive">
													<table class="table table-striped">
														<tbody>

															<tr>

																<td><form:label path="city" class="control-label">Rou Identifier</form:label></td>

																<td><b><form:input path="city"
																			class="form-controlnew" id="city" name="city"
																			readonly="true" value="${repData.getRuIdentifier()}" />
																</b></td>
																<td></td>
															</tr>
															<tr>
																<td><form:label path="sysname"
																		class="control-label">System
														Name:</form:label>
																<td><b><form:input path="sysname" type="text"
																			maxlength="20" class="form-controlnew"
																			placeholder="Normal input"
																			value="${repData.getRuSystemName()}" /></b></td>

																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" data-ng-model="snumber"
																	value="${message}" /></td>
															</tr>

															<tr>

																<td><form:label path="partnum"
																		class="control-label">Part
														Number:</form:label>
																<td><b><form:input path="partnum" type="text"
																			maxlength="20" class="form-controlnew"
																			placeholder="Normal input"
																			value="${repData.getRuPartNumber()}" /></b></td>
																<td></td>

															</tr>

															<%-- <tr>

																<td><form:label path="ipaddr" class="control-label">IP
														Address:</form:label></td>


																<td><b><form:input path="ipaddr"
																			class="form-controlnew" placeholder="Normal input"
																			value="${repData.getRuIp()}" readonly="true" /></b></td>
																<td></td>
															</tr> --%>

															<%-- <tr>

																<td><form:label path="port" class="control-label">Port:</form:label></td>


																<td><b><form:input path="port"
																			class="form-controlnew" placeholder="Normal input"
																			value="${repData.getRuPort()}" readonly="true" /></b></td>
																<td></td>
															</tr> --%>
														</tbody>
													</table>
												</div>
											</div>
										</div>


										<div class="col-sm-6">
											<div class="block margin-bottom-sm">
												<div class="table-responsive">
													<table class="table table-striped">
														<tbody>
															<tr>

																<td><form:label path="snumber"
																		class="control-label">Serial
														Number:</form:label></td>


																<td><b><form:input path="snumber"
																			class="form-controlnew" placeholder="Normal input"
																			readonly="true"
																			value="${repData.getRuSerialNumber()}" /></b></td>
																<td></td>

															</tr>
															<%-- <tr>

																<td><form:label path="apn" class="control-label">APN:</form:label>
																<td><b><form:input path="apn"
																			class="form-controlnew" placeholder="Normal input"
																			value="${repData.getRuApn()}" readonly="true" /></b></td>
																<td></td>
															</tr> --%>
															<%-- <tr>

																<td><form:label path="imei" class="control-label">IMEI:
														Number</form:label></td>


																<td><b><form:input path="imei"
																			class="form-controlnew" placeholder="Normal input"
																			value="${repData.getRuApn()}" readonly="true" /></b></td>
																<td></td>
															</tr> --%>

															<tr>
																<td style="color: black"><form:label
																		path="region_name" class="control-label">Region Name:</form:label></td>

																<td><form:select path="region_name">
																		<form:option value="${repData.getRuRegionName()}"
																			label="${repData.getRuRegionName()}" />
																		<option value="Andhra Pradesh">Andhra Pradesh</option>
																		<option value="Assam">Assam</option>
																		<option value="Bihar">Bihar</option>
																		<option value="Chennai">Chennai</option>
																		<option value="Delhi">Delhi</option>
																		<option value="Gujarat">Gujarat</option>
																		<option value="Haryana">Haryana</option>
																		<option value="Himachal Pradesh">Himachal
																			Pradesh</option>
																		<option value="Jammu & Kashmir">Jammu &
																			Kashmir</option>
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
																		<option value="Tamil Nadu">Tamil Nadu</option>
																		<option value="Uttar Pradesh (East)">Uttar
																			Pradesh (East)</option>
																		<option value="Uttar Pradesh (West)">Uttar
																			Pradesh (West)</option>
																		<option value="West Bengal">West Bengal</option>

																	</form:select></td>
																<td></td>
															</tr>

															<%-- <tr>

																<td><form:label path="streetName"
																		class="control-label">Rou Identifier</form:label>
																<td><b><form:input path="streetName"
																			class="form-controlnew" id="streetName"
																			name="streetName" data-ng-model="streetName"
																			data-ng-value="${repData.getRuIdentifier()}" /></b></td>

																<td></td>
															</tr> --%>


															<tr>
																<td><form:label path="dcsversion"
																		class="control-label">Version</form:label></td>
																<td><b><form:input path="gsmversion"
																			class="form-controlnew" id="gsmversion"
																			name="gsmversion" readonly="true"
																			value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<c:if test="${userDetails.getRoleId() !='6'}">
											<div align="center">
												<button type="submit" class="btn btn-success" id="apply16">Apply</button>
											</div>
										</c:if>
									</div>
								</form:form>
							</div>
							<!-- end of system details -->
						</c:forEach>
					</div>
					<!-- end of band tab -->
					<%-- </c:forEach> --%>
				</div>
			</section>
			<br>

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

	<jsp:include page="script.jsp" />



</body>
</html>