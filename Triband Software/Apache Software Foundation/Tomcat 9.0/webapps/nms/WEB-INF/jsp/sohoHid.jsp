<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<!DOCTYPE html>
<html lang="en">
<head>

<title>NMS | Configuration</title>

<jsp:include page="link.jsp"></jsp:include>

<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 -->


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/darkAdmin/bootstrap.min.css">

<script
	src="${pageContext.request.contextPath}/resources/darkAdmin/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/neon/assets/js/form_validation_soho_hid.js"></script>


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
	font-size: 1.3rem;
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
	width: 120px;
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

		$("#RepeaterDtaForm8").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm9").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm10").on("submit", function() {
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

						<li style="font-size: 15px; color: white" class="active"><strong>Configuration>>
								${message}</strong></li>

						<li><c:choose>
								<c:when test="${status==true}">
									<font color="#32CD32"><b>Online</b></font>
								</c:when>
								<c:when test="${status==false}">
									<font color="orange"><b>Offline</b></font>
								</c:when>
							</c:choose></li>

					</ol>

					<div align="left">
						<a href="/nms/getLiveData.htm"><button
								style="border-radius: 4px">
								Get Live Data <img
									src="${pageContext.request.contextPath}/resources/images/Button-Refresh.ico"
									id="refresh" title="Get Live Data" width="25" height="25">
							</button></a>
					</div>
					<br>

					<div class="row">
						<div class="col-lg-12">
							<div class="block">
								<ul class="nav nav-tabs">

									<li class="active"><a data-toggle="tab" href="#sysdetails"><b>System
												Details</b></a></li>
									<c:forEach items="${repParams}" var="bandDataList"
										varStatus="loop">

										<c:if test="${repParams.get(loop.index).getBandName()=='800'}">
											<li><a data-toggle="tab" href="#800"><b>800Mhz</b></a></li>
										</c:if>
										<c:if test="${repParams.get(loop.index).getBandName()=='850'}">
											<li><a data-toggle="tab" href="#850"><b>850Mhz</b></a></li>
										</c:if>
										<c:if test="${repParams.get(loop.index).getBandName()=='900'}">
											<li><a data-toggle="tab" href="#900"><b>900Mhz</b></a></li>
										</c:if>
										<c:if
											test="${repParams.get(loop.index).getBandName()=='1800'}">
											<li><a data-toggle="tab" href="#1800"><b>1800Mhz</b></a></li>
										</c:if>
										<c:if
											test="${repParams.get(loop.index).getBandName()=='2100'}">
											<li><a data-toggle="tab" href="#2100"><b>2100Mhz</b></a></li>
										</c:if>
									</c:forEach>

								</ul>

							</div>
						</div>
					</div>


					<div class="tab-content">
						<c:forEach items="${repParams}" var="bandDataList"
							varStatus="loop">

							<!-- 800 -->

							<c:if test="${repParams.get(loop.index).getBandName()=='800'}">

								<div id="800" class="tab-pane fade">

									<!-- <br /> -->

									<div class="row">
										<div class="col-sm-12">
											<div class="block">
												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab"
														href="#800home1"><b>Main Params</b></a></li>

													<li><a data-toggle="tab" href="#800thresholdvalue1"><b>Threshold
																Value</b></a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="tab-content">

										<div id="800home1" class="tab-pane fade in active">

											<form:form id="RepeaterDtaForm"
												modelAttribute="cofigPageMapper"
												action="/nms/sohoHidApply.htm" method="post">


												<!-- page division -->

												<div class="row">
													<div class="col-sm-4">

														<!-- PA  -->
														<div class="block" style="height: 101px">
															<h4 align="center" style="color: white">
																<strong>PA ON/OFF</strong>
															</h4>

															<table class="table-striped">
																<tbody>
																	<tr>
																		<td><label for="paon_offul">UL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='1'}">
																			<td><form:checkbox path="paon_offul"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='0'}">
																			<td><form:checkbox path="paon_offul"
																					unchecked="true" /><font color="red">OFF</font></td>
																		</c:if>

																		<form:hidden path="BandName" />
																		<td><input id="BandName" name="BandName"
																			type="hidden" value="800" /></td>

																		<form:hidden path="snumber" />
																		<td><input id="snumber" name="snumber"
																			type="hidden" value="${message}" /></td>

																	</tr>

																	<tr>
																		<td><label for="paon_offdl">DL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='1'}">
																			<td><form:checkbox path="paon_offdl"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='0'}">
																			<td><form:checkbox path="paon_offdl"
																					unchecked="false" /><font color="red">OFF</font></td>
																		</c:if>


																		<form:hidden path="threshold_flag" />
																		<td><input id="threshold_flag"
																			name="threshold_flag" type="hidden" value="0" /></td>

																		<form:hidden path="RepeaterPwr" />
																		<td><input id="RepeaterPwr" name="RepeaterPwr"
																			type="hidden"
																			value="${repParams.get(loop.index).getTotalHumpCount()}" /></td>
																	</tr>
																	<tr class="hide">
																		<td><b><form:input path="Identifier"
																					class="form-controlnew" id="Identifier"
																					name="Identifier" readonly="true"
																					value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<!-- GAIN -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>GAIN</strong>
															</h4>

															<table class="table-striped">
																<tbody>
																	<c:choose>
																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()<='27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()>'27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>
																	</c:choose>
																</tbody>
															</table>
														</div>

														<!-- ALC -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>ALC</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="alclvlul"
																				class="control-label">LVL UL</form:label></td>


																		<td><b><form:input path="alclvlul"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																		<td><form:label path="alclvlul"
																				class="control-label">dBm</form:label></td>

																	</tr>
																	<tr>

																		<td><form:label path="alclvldl"
																				class="control-label">LVL DL</form:label></td>


																		<td><b><form:input path="alclvldl"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																		<td><form:label path="alclvldl"
																				class="control-label">dBm</form:label></td>

																	</tr>

																</tbody>
															</table>
														</div>
													</div>

													<div class="col-sm-4">
														<div class="block">

															<!-- OFFSET -->
															<h4 align="center" style="color: white">
																<strong>OFFSET</strong>
															</h4>

															<table class=" table-striped">
																<tbody>

																	<tr>

																		<td><form:label path="offsetul"
																				class=" control-label">UL</form:label></td>
																		<td><b><form:input path="offsetul"
																					type="number" min="-9" max="9" name="offsetul"
																					id="offsetul" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																		<td><form:label path="offsetul"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>
																		<td><form:label path="offsetdl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="offsetdl"
																					type="number" min="-9" max="9" name="offsetdl"
																					id="offsetdl" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																		<td><form:label path="offsetdl"
																				class="control-label">dBm</form:label></td>
																	</tr>

																	<!-- hidden compensation value -->
																	<tr class="hide">

																		<td><form:label path="CompensationAllUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="CompensationAllUl"
																					class="form-control" required="required"
																					value="${repParams.get(loop.index).getAttenuationUl() }" /></b></td>

																		<td><form:label path="CompensationAllUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="CompensationAllDl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="CompensationAllDl"
																					class="form-control" required="required"
																					value="${repParams.get(loop.index).getAttenuationDl() }" /></b></td>

																		<td><form:label path="CompensationAllDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="Compensation1HumpUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="Compensation1HumpDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Input Power -->
															<h4 align="center" style="color: white">
																<strong>RF Input</strong>
															</h4>

															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulin"
																				class="control-label">Power UL</form:label></td>

																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">

																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getPowerInUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="OFF" readonly="true" /></b></td>

																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>

																		<td><form:label path="powerdlin"
																				class="control-label">Power DL</form:label></td>

																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin"
																							value="${repParams.get(loop.index).getPowerInDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>



																		<td><form:label path="powerdlin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Output Power -->
															<h4 align="center" style="color: white">
																<strong>RF Output</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulout"
																				class="control-label">Power UL</form:label></td>

																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout"
																							value="${repParams.get(loop.index).getPowerOutUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>


																		<td><form:label path="powerulout"
																				class="control-label">dBm</form:label></td>

																	</tr>

																	<tr>
																		<td><form:label path="powerdlout"
																				class="control-label">Power DL</form:label></td>

																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout"
																							value="${repParams.get(loop.index).getPowerOutDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlout"
																				class="control-label">dBm</form:label></td>

																	</tr>
																</tbody>
															</table>
														</div>
													</div>


													<div class="col-lg-4">
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>Channel Information</strong>
															</h4>

															<c:choose>
																<c:when test="${repData.getReptype() == '7'}">

																	<table class="table table-striped">
																		<tbody>

																			<tr>
																				<td><form:label path="startchg0"
																						class="control-label">Start
																			Freq UL</form:label></td>


																				<td><b><form:input path="startchg0"
																							id="startchg80" type="number"
																							class="form-control" required="required"
																							onblur="cfCalculator800();"
																							value="${repParams.get(loop.index).getStartChannel()/10 }"
																							min="832" max="862" step="0.1" /></b></td>


																				<td><form:label path="startchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="stopchg0"
																						class="control-label">Stop
																			Freq UL</form:label></td>


																				<td><b><form:input path="stopchg0"
																							id="stopchg80" type="number" class="form-control"
																							required="required" onblur="cfCalculator800();"
																							value="${repParams.get(loop.index).getStopChannel()/10 }"
																							min="832" max="862" step="0.1" /></b></td>


																				<td><form:label path="stopchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofrequl0"
																						class="control-label">CF
																			UL</form:label></td>


																				<td><b><form:input path="lofrequl0"
																							id="lofrequl80" type="number" readonly="true"
																							class="form-control"
																							value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																				<td><form:label path="lofrequl0"
																						class="control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofreqdl0"
																						class="control-label">CF
																			DL</form:label></td>


																				<td><b><form:input path="lofreqdl0"
																							id="lofreqdl80" type="number" readonly="true"
																							class="form-control"
																							value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																				<td><form:label path="lofreqdl0"
																						class="control-label">Mhz</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="bwg0"
																						class="control-label">Bandwidth</form:label></td>

																				<td><b><form:input path="bwg0" id="bwg80"
																							class="form-control" readonly="true"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																				<td><form:label path="bwg0"
																						class="control-label">Mhz</form:label></td>

																			</tr>

																			<tr class="hide">

																				<td><b><form:input path="sawbw0"
																							class="form-control"
																							value="${repParams.get(loop.index).getSawBandwidth()}" /></b></td>

																				<td><b><form:input path="oldbwg0"
																							class="form-control"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																			</tr>

																		</tbody>
																	</table>
																</c:when>
															</c:choose>
														</div>
														<div class="block">
															<table>
																<tr>
																	<td><label for="LoED">Auto Shutdown </label></td>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				checked="true" /><font color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				unchecked="false" /><font color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>
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
																			color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																		<td><form:checkbox path="alclvlon_off"
																				id="alclvlon_off" unchecked="false" /><font
																			color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>
													</div>

													<div class="col-lg-4" align="center">
														<c:if test="${userDetails.getRoleId() !='6'}">
															<button type="submit" class="btn btn-success"
																id="apply_800">Apply</button>
														</c:if>
													</div>

												</div>
											</form:form>
										</div>


										<div id="band" class="tab-pane fade"></div>

										<c:forEach items="${repParams}" var="bandDataList"
											varStatus="loop">
											<c:if
												test="${repParams.get(loop.index).getBandName()=='800' }">
												<div id="800thresholdvalue1" class="tab-pane fade">

													<form:form id="RepeaterDtaForm1"
														modelAttribute="cofigPageMapper"
														action="/nms/sohoHidApply.htm" method="post">

														<div class="row">
															<div class="col-md-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>800 Threshold Value</strong>
																			</h3>
																		</div>

																		<div class="panel-body">
																			<table class="table table-striped">
																				<tbody>
																					<tr>

																						<td><form:label path="thlvlulgsm"
																								class="control-label">800 Threshold UL</form:label></td>


																						<td><b><form:input path="thlvlulgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="800" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>

																					</tr>


																					<tr>
																						<td><form:label path="thlvldlgsm"
																								class="control-label">800 Threshold DL</form:label></td>


																						<td><b><form:input path="thlvldlgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1" /></td>

																						<td></td>
																					</tr>
																					<tr class="hide">
																						<td><b><form:input path="Identifier"
																									class="form-controlnew" id="Identifier"
																									name="Identifier" readonly="true"
																									value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>

															<div class="col-sm-12">
																<div align="center">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<button type="submit" class="btn btn-success"
																			id="apply11">Apply</button>
																	</c:if>
																</div>
															</div>
														</div>
													</form:form>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<!-- end of 800 -->

							<!-- 850 -->

							<c:if test="${repParams.get(loop.index).getBandName()=='850'}">

								<div id="850" class="tab-pane fade">

									<!-- <br /> -->

									<div class="row">
										<div class="col-sm-12">
											<div class="block">
												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab"
														href="#850home1"><b>Main Params</b></a></li>

													<li><a data-toggle="tab" href="#850thresholdvalue1"><b>Threshold
																Value</b></a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="tab-content">

										<div id="850home1" class="tab-pane fade in active">

											<form:form id="RepeaterDtaForm2"
												modelAttribute="cofigPageMapper"
												action="/nms/sohoHidApply.htm" method="post">


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
																		<td><label for="paon_offul">UL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='1'}">
																			<td><form:checkbox path="paon_offul"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='0'}">
																			<td><form:checkbox path="paon_offul"
																					unchecked="true" /><font color="red">OFF</font></td>
																		</c:if>
																		<form:hidden path="BandName" />
																		<td><input id="BandName" name="BandName"
																			type="hidden" value="850" /></td>
																		<form:hidden path="snumber" />
																		<td><input id="snumber" name="snumber"
																			type="hidden" value="${message}" /></td>

																	</tr>

																	<tr>
																		<td><label for="paon_offdl">DL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='1'}">
																			<td><form:checkbox path="paon_offdl"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='0'}">
																			<td><form:checkbox path="paon_offdl"
																					unchecked="false" /><font color="red">OFF</font></td>
																		</c:if>


																		<form:hidden path="threshold_flag" />
																		<td><input id="threshold_flag"
																			name="threshold_flag" type="hidden" value="0" /></td>
																		<form:hidden path="RepeaterPwr" />
																		<td><input id="RepeaterPwr" name="RepeaterPwr"
																			type="hidden"
																			value="${repParams.get(loop.index).getTotalHumpCount()}" /></td>
																	</tr>
																	<tr class="hide">
																		<td><b><form:input path="Identifier"
																					class="form-controlnew" id="Identifier"
																					name="Identifier" readonly="true"
																					value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<!-- GAIN -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>GAIN</strong>
															</h4>

															<table class="table-striped">
																<tbody>

																	<c:choose>
																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()<='27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()>'27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>
																	</c:choose>
																</tbody>
															</table>
														</div>

														<!-- ALC -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>ALC</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="alclvlul"
																				class="control-label">LVL UL</form:label></td>


																		<td><b><form:input path="alclvlul"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																		<td><form:label path="alclvlul"
																				class="control-label">dBm</form:label></td>

																	</tr>
																	<tr>

																		<td><form:label path="alclvldl"
																				class="control-label">LVL DL</form:label></td>


																		<td><b><form:input path="alclvldl"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																		<td><form:label path="alclvldl"
																				class="control-label">dBm</form:label></td>

																	</tr>

																</tbody>
															</table>
														</div>
													</div>

													<div class="col-sm-4">
														<div class="block">

															<!-- OFFSET -->
															<h4 align="center" style="color: white">
																<strong>OFFSET</strong>
															</h4>

															<table class=" table-striped">
																<tbody>

																	<tr>

																		<td><form:label path="offsetul"
																				class=" control-label">UL</form:label></td>
																		<td><b><form:input path="offsetul"
																					type="number" min="-9" max="9" name="offsetul"
																					id="offsetul" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																		<td><form:label path="offsetul"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>
																		<td><form:label path="offsetdl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="offsetdl"
																					type="number" min="-9" max="9" name="offsetdl"
																					id="offsetdl" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																		<td><form:label path="offsetdl"
																				class="control-label">dBm</form:label></td>
																	</tr>

																	<!-- hidden compensation value -->
																	<tr class="hide">

																		<td><form:label path="CompensationAllUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="CompensationAllUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getAttenuationUl() }" /></b></td>

																		<td><form:label path="CompensationAllUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="CompensationAllDl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="CompensationAllDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getAttenuationDl() }" /></b></td>

																		<td><form:label path="CompensationAllDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="Compensation1HumpUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="Compensation1HumpDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Input Power -->
															<h4 align="center" style="color: white">
																<strong>RF Input</strong>
															</h4>

															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulin"
																				class="control-label">Power UL</form:label></td>



																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">

																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getPowerInUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="OFF" readonly="true" /></b></td>

																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>

																		<td><form:label path="powerdlin"
																				class="control-label">Power DL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin"
																							value="${repParams.get(loop.index).getPowerInDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Output Power -->
															<h4 align="center" style="color: white">
																<strong>RF Output</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulout"
																				class="control-label">Power UL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout"
																							value="${repParams.get(loop.index).getPowerOutUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulout"
																				class="control-label">dBm</form:label></td>

																	</tr>

																	<tr>
																		<td><form:label path="powerdlout"
																				class="control-label">Power DL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout"
																							value="${repParams.get(loop.index).getPowerOutDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlout"
																				class="control-label">dBm</form:label></td>

																	</tr>
																</tbody>
															</table>
														</div>
													</div>


													<div class="col-lg-4">
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>Channel Information</strong>
															</h4>

															<c:choose>
																<c:when test="${repData.getReptype() == '7'}">

																	<table class="table table-striped">
																		<tbody>

																			<tr>
																				<td><form:label path="startchg0"
																						class="control-label">Start
																			Freq UL</form:label></td>


																				<td><b><form:input path="startchg0"
																							id="startchg85" type="number"
																							class="form-control" required="required"
																							onblur="cfCalculator850();"
																							value="${repParams.get(loop.index).getStartChannel()/10 }"
																							min="835" max="870" step="0.1" /></b></td>


																				<td><form:label path="startchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="stopchg0"
																						class="control-label">Stop
																			Freq UL</form:label></td>


																				<td><b><form:input path="stopchg0"
																							id="stopchg85" type="number" class="form-control"
																							required="required" onblur="cfCalculator850();"
																							value="${repParams.get(loop.index).getStopChannel()/10 }"
																							min="835" max="870" step="0.1" /></b></td>


																				<td><form:label path="stopchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofrequl0"
																						class="control-label">CF
																			UL</form:label></td>


																				<td><b><form:input path="lofrequl0"
																							id="lofrequl85" type="number" readonly="true"
																							class="form-control"
																							value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																				<td><form:label path="lofrequl0"
																						class="control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofreqdl0"
																						class="control-label">CF
																			DL</form:label></td>


																				<td><b><form:input path="lofreqdl0"
																							id="lofreqdl85" type="number" readonly="true"
																							class="form-control"
																							value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																				<td><form:label path="lofreqdl0"
																						class="control-label">Mhz</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="bwg0"
																						class="control-label">Bandwidth</form:label></td>

																				<td><b><form:input path="bwg0" id="bwg85"
																							class="form-control" readonly="true"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																				<td><form:label path="bwg0"
																						class="control-label">Mhz</form:label></td>

																			</tr>
																			<tr class="hide">

																				<td><b><form:input path="sawbw0"
																							class="form-control"
																							value="${repParams.get(loop.index).getSawBandwidth()}" /></b></td>
																				<td><b><form:input path="oldbwg0"
																							class="form-control"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																			</tr>
																		</tbody>
																	</table>
																</c:when>
															</c:choose>
														</div>
														<div class="block">
															<table>
																<tr>
																	<td><label for="LoED">Auto Shutdown </label></td>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				checked="true" /><font color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				unchecked="false" /><font color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>

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
																			color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																		<td><form:checkbox path="alclvlon_off"
																				id="alclvlon_off" unchecked="false" /><font
																			color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>
													</div>
													<div class="col-lg-4" align="center">
														<c:if test="${userDetails.getRoleId() !='6'}">
															<button type="submit" class="btn btn-success"
																id="apply_850">Apply</button>
														</c:if>
													</div>

												</div>
											</form:form>
										</div>


										<div id="band" class="tab-pane fade"></div>

										<c:forEach items="${repParams}" var="bandDataList"
											varStatus="loop">
											<c:if
												test="${repParams.get(loop.index).getBandName()=='850' }">
												<div id="850thresholdvalue1" class="tab-pane fade">

													<form:form id="RepeaterDtaForm3"
														modelAttribute="cofigPageMapper"
														action="/nms/sohoHidApply.htm" method="post">

														<div class="row">
															<div class="col-md-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>850 Threshold Value</strong>
																			</h3>
																		</div>

																		<div class="panel-body">
																			<table class="table table-striped">
																				<tbody>
																					<tr>

																						<td><form:label path="thlvlulgsm"
																								class="control-label">850 Threshold UL</form:label></td>


																						<td><b><form:input path="thlvlulgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="850" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>

																					</tr>


																					<tr>
																						<td><form:label path="thlvldlgsm"
																								class="control-label">850 Threshold DL</form:label></td>


																						<td><b><form:input path="thlvldlgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1" /></td>

																						<td></td>
																					</tr>
																					<tr class="hide">
																						<td><b><form:input path="Identifier"
																									class="form-controlnew" id="Identifier"
																									name="Identifier" readonly="true"
																									value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>

															<div class="col-sm-12">
																<div align="center">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<button type="submit" class="btn btn-success"
																			id="apply11">Apply</button>
																	</c:if>
																</div>
															</div>
														</div>
													</form:form>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<!-- end of 850 -->

							<!-- 900 -->



							<c:if test="${repParams.get(loop.index).getBandName()=='900'}">

								<%-- <c:set var="band2"
								value="${repParams.get(loop.index).getBandName()}" /> --%>

								<div id="900" class="tab-pane fade">

									<!-- <br /> -->

									<div class="row">
										<div class="col-sm-12">
											<div class="block">
												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab"
														href="#900home1"><b>Main Params</b></a></li>

													<li><a data-toggle="tab" href="#900thresholdvalue1"><b>Threshold
																Value</b></a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="tab-content">

										<div id="900home1" class="tab-pane fade in active">

											<form:form id="RepeaterDtaForm4"
												modelAttribute="cofigPageMapper"
												action="/nms/sohoHidApply.htm" method="post">


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
																		<td><label for="paon_offul">UL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='1'}">
																			<td><form:checkbox path="paon_offul"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='0'}">
																			<td><form:checkbox path="paon_offul"
																					unchecked="true" /><font color="red">OFF</font></td>
																		</c:if>

																		<form:hidden path="BandName" />
																		<td><input id="BandName" name="BandName"
																			type="hidden" value="900" /></td>
																		<form:hidden path="snumber" />
																		<td><input id="snumber" name="snumber"
																			type="hidden" value="${message}" /></td>

																	</tr>

																	<tr>
																		<td><label for="paon_offdl">DL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='1'}">
																			<td><form:checkbox path="paon_offdl"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='0'}">
																			<td><form:checkbox path="paon_offdl"
																					unchecked="false" /><font color="red">OFF</font></td>
																		</c:if>

																		<form:hidden path="threshold_flag" />
																		<td><input id="threshold_flag"
																			name="threshold_flag" type="hidden" value="0" /></td>

																		<form:hidden path="RepeaterPwr" />
																		<td><input id="RepeaterPwr" name="RepeaterPwr"
																			type="hidden"
																			value="${repParams.get(loop.index).getTotalHumpCount()}" /></td>

																	</tr>
																	<tr class="hide">
																		<td><b><form:input path="Identifier"
																					class="form-controlnew" id="Identifier"
																					name="Identifier" readonly="true"
																					value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<!-- GAIN -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>GAIN</strong>
															</h4>

															<table class="table-striped">
																<tbody>
																	<c:choose>
																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()<='27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()>'27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>
																	</c:choose>
																</tbody>
															</table>
														</div>

														<!-- ALC -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>ALC</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="alclvlul"
																				class="control-label">LVL UL</form:label></td>


																		<td><b><form:input path="alclvlul"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																		<td><form:label path="alclvlul"
																				class="control-label">dBm</form:label></td>

																	</tr>
																	<tr>

																		<td><form:label path="alclvldl"
																				class="control-label">LVL DL</form:label></td>


																		<td><b><form:input path="alclvldl"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																		<td><form:label path="alclvldl"
																				class="control-label">dBm</form:label></td>

																	</tr>

																</tbody>
															</table>
														</div>
													</div>

													<div class="col-sm-4">
														<div class="block">

															<!-- OFFSET -->
															<h4 align="center" style="color: white">
																<strong>OFFSET</strong>
															</h4>

															<table class=" table-striped">
																<tbody>

																	<tr>

																		<td><form:label path="offsetul"
																				class=" control-label">UL</form:label></td>
																		<td><b><form:input path="offsetul"
																					type="number" min="-9" max="9" name="offsetul"
																					id="offsetul" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																		<td><form:label path="offsetul"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>
																		<td><form:label path="offsetdl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="offsetdl"
																					type="number" min="-9" max="9" name="offsetdl"
																					id="offsetdl" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																		<td><form:label path="offsetdl"
																				class="control-label">dBm</form:label></td>
																	</tr>

																	<!-- hidden compensation value -->
																	<tr class="hide">

																		<td><form:label path="CompensationAllUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="CompensationAllUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getAttenuationUl() }" /></b></td>

																		<td><form:label path="CompensationAllUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="CompensationAllDl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="CompensationAllDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getAttenuationDl() }" /></b></td>

																		<td><form:label path="CompensationAllDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="Compensation1HumpUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="Compensation1HumpDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Input Power -->
															<h4 align="center" style="color: white">
																<strong>RF Input</strong>
															</h4>

															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulin"
																				class="control-label">Power UL</form:label></td>



																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">

																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getPowerInUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="OFF" readonly="true" /></b></td>

																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>

																		<td><form:label path="powerdlin"
																				class="control-label">Power DL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin"
																							value="${repParams.get(loop.index).getPowerInDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Output Power -->
															<h4 align="center" style="color: white">
																<strong>RF Output</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulout"
																				class="control-label">Power UL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout"
																							value="${repParams.get(loop.index).getPowerOutUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulout"
																				class="control-label">dBm</form:label></td>

																	</tr>

																	<tr>
																		<td><form:label path="powerdlout"
																				class="control-label">Power DL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout"
																							value="${repParams.get(loop.index).getPowerOutDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlout"
																				class="control-label">dBm</form:label></td>

																	</tr>
																</tbody>
															</table>
														</div>
													</div>


													<div class="col-lg-4">
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>Channel Information</strong>
															</h4>
															<%-- <table class="table-striped">
																<tbody>
																	<tr>
																		<!-- <td><label for="LoED">LO Enable</label></td> -->

																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='1'}">
																			<td><form:checkbox path="LoED" id="LoED"
																					checked="true" />Testing</td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='0'}">
																			<td><form:checkbox path="LoED" id="LoED"
																					unchecked="false" /> Testing</td>
																		</c:if>
																	
																	</tr>
																</tbody>
															</table> --%>


															<c:choose>
																<c:when test="${repData.getReptype() == '7'}">

																	<table class="table table-striped">
																		<tbody>

																			<tr>
																				<td><form:label path="startchg0"
																						class="control-label">Start
																			Freq UL</form:label></td>


																				<td><b><form:input path="startchg0"
																							id="startchg90" type="number"
																							class="form-control" required="required"
																							onblur="cfCalculator900();"
																							value="${repParams.get(loop.index).getStartChannel()/10 }"
																							min="890" max="915" step="0.1" /></b></td>


																				<td><form:label path="startchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="stopchg0"
																						class="control-label">Stop
																			Freq UL</form:label></td>


																				<td><b><form:input path="stopchg0"
																							id="stopchg90" type="number" class="form-control"
																							required="required" onblur="cfCalculator900();"
																							value="${repParams.get(loop.index).getStopChannel()/10 }"
																							min="890" max="915" step="0.1" /></b></td>


																				<td><form:label path="stopchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofrequl0"
																						class="control-label">CF
																			UL</form:label></td>


																				<td><b><form:input path="lofrequl0"
																							id="lofrequl90" type="number" readonly="true"
																							class="form-control"
																							value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																				<td><form:label path="lofrequl0"
																						class="control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofreqdl0"
																						class="control-label">CF
																			DL</form:label></td>


																				<td><b><form:input path="lofreqdl0"
																							id="lofreqdl90" type="number" readonly="true"
																							class="form-control"
																							value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																				<td><form:label path="lofreqdl0"
																						class="control-label">Mhz</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="bwg0"
																						class="control-label">Bandwidth</form:label></td>

																				<td><b><form:input path="bwg0" id="bwg90"
																							class="form-control" readonly="true"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																				<td><form:label path="bwg0"
																						class="control-label">Mhz</form:label></td>

																			</tr>
																			<tr class="hide">

																				<td><b><form:input path="sawbw0"
																							class="form-control"
																							value="${repParams.get(loop.index).getSawBandwidth()}" /></b></td>

																				<td><b><form:input path="oldbwg0"
																							class="form-control"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>
																			</tr>
																		</tbody>
																	</table>
																</c:when>
															</c:choose>
														</div>
														<div class="block">
															<table>
																<tr>
																	<td><label for="LoED">Auto Shutdown </label></td>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				checked="true" /><font color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				unchecked="false" /><font color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>

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
																			color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																		<td><form:checkbox path="alclvlon_off"
																				id="alclvlon_off" unchecked="false" /><font
																			color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>
													</div>
													<div class="col-lg-4" align="center">
														<c:if test="${userDetails.getRoleId() !='6'}">
															<button type="submit" class="btn btn-success"
																id="apply_900">Apply</button>
														</c:if>
													</div>

												</div>
											</form:form>
										</div>


										<div id="band" class="tab-pane fade"></div>

										<c:forEach items="${repParams}" var="bandDataList"
											varStatus="loop">
											<c:if
												test="${repParams.get(loop.index).getBandName()=='900' }">
												<div id="900thresholdvalue1" class="tab-pane fade">

													<form:form id="RepeaterDtaForm5"
														modelAttribute="cofigPageMapper"
														action="/nms/sohoHidApply.htm" method="post">

														<div class="row">
															<div class="col-md-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>900 Threshold Value</strong>
																			</h3>
																		</div>

																		<div class="panel-body">
																			<table class="table table-striped">
																				<tbody>
																					<tr>

																						<td><form:label path="thlvlulgsm"
																								class="control-label">900 Threshold UL</form:label></td>


																						<td><b><form:input path="thlvlulgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="900" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>

																					</tr>


																					<tr>
																						<td><form:label path="thlvldlgsm"
																								class="control-label">900 Threshold DL</form:label></td>


																						<td><b><form:input path="thlvldlgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1" /></td>

																						<td></td>
																					</tr>
																					<tr class="hide">
																						<td><b><form:input path="Identifier"
																									class="form-controlnew" id="Identifier"
																									name="Identifier" readonly="true"
																									value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>

															<div class="col-sm-12">
																<div align="center">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<button type="submit" class="btn btn-success"
																			id="apply11">Apply</button>
																	</c:if>
																</div>
															</div>
														</div>
													</form:form>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:if>

							<!-- end of 900 -->

							<!-- 1800 -->

							<c:if test="${repParams.get(loop.index).getBandName()=='1800'}">

								<%-- <c:set var="band2"
								value="${repParams.get(loop.index).getBandName()}" /> --%>

								<div id="1800" class="tab-pane fade">

									<!-- <br /> -->

									<div class="row">
										<div class="col-sm-12">
											<div class="block">
												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab"
														href="#1800home1"><b>Main Params</b></a></li>

													<li><a data-toggle="tab" href="#1800thresholdvalue1"><b>Threshold
																Value</b></a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="tab-content">

										<div id="1800home1" class="tab-pane fade in active">

											<form:form id="RepeaterDtaForm6"
												modelAttribute="cofigPageMapper"
												action="/nms/sohoHidApply.htm" method="post">


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
																		<td><label for="paon_offul">UL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='1'}">
																			<td><form:checkbox path="paon_offul"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='0'}">
																			<td><form:checkbox path="paon_offul"
																					unchecked="true" /><font color="red">OFF</font></td>
																		</c:if>

																		<form:hidden path="BandName" />
																		<td><input id="BandName" name="BandName"
																			type="hidden" value="1800" /></td>
																		<form:hidden path="snumber" />
																		<td><input id="snumber" name="snumber"
																			type="hidden" value="${message}" /></td>

																	</tr>

																	<tr>
																		<td><label for="paon_offdl">DL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='1'}">
																			<td><form:checkbox path="paon_offdl"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='0'}">
																			<td><form:checkbox path="paon_offdl"
																					unchecked="false" /><font color="red">OFF</font></td>
																		</c:if>


																		<form:hidden path="threshold_flag" />
																		<td><input id="threshold_flag"
																			name="threshold_flag" type="hidden" value="0" /></td>

																		<form:hidden path="RepeaterPwr" />
																		<td><input id="RepeaterPwr" name="RepeaterPwr"
																			type="hidden"
																			value="${repParams.get(loop.index).getTotalHumpCount()}" /></td>
																	</tr>
																	<tr class="hide">
																		<td><b><form:input path="Identifier"
																					class="form-controlnew" id="Identifier"
																					name="Identifier" readonly="true"
																					value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<!-- GAIN -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>GAIN</strong>
															</h4>

															<table class="table-striped">
																<tbody>
																	<c:choose>
																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()<='27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()>'27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>
																	</c:choose>
																</tbody>
															</table>
														</div>

														<!-- ALC -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>ALC</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="alclvlul"
																				class="control-label">LVL UL</form:label></td>


																		<td><b><form:input path="alclvlul"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																		<td><form:label path="alclvlul"
																				class="control-label">dBm</form:label></td>

																	</tr>
																	<tr>

																		<td><form:label path="alclvldl"
																				class="control-label">LVL DL</form:label></td>


																		<td><b><form:input path="alclvldl"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																		<td><form:label path="alclvldl"
																				class="control-label">dBm</form:label></td>

																	</tr>

																</tbody>
															</table>
														</div>
													</div>

													<div class="col-sm-4">
														<div class="block">

															<!-- OFFSET -->
															<h4 align="center" style="color: white">
																<strong>OFFSET</strong>
															</h4>

															<table class=" table-striped">
																<tbody>

																	<tr>

																		<td><form:label path="offsetul"
																				class=" control-label">UL</form:label></td>
																		<td><b><form:input path="offsetul"
																					type="number" min="-9" max="9" name="offsetul"
																					id="offsetul" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																		<td><form:label path="offsetul"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>
																		<td><form:label path="offsetdl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="offsetdl"
																					type="number" min="-9" max="9" name="offsetdl"
																					id="offsetdl" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																		<td><form:label path="offsetdl"
																				class="control-label">dBm</form:label></td>
																	</tr>

																	<!-- hidden compensation value -->
																	<tr class="hide">

																		<td><form:label path="CompensationAllUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="CompensationAllUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getAttenuationUl() }" /></b></td>

																		<td><form:label path="CompensationAllUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="CompensationAllDl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="CompensationAllDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getAttenuationDl() }" /></b></td>

																		<td><form:label path="CompensationAllDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="Compensation1HumpUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="Compensation1HumpDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Input Power -->
															<h4 align="center" style="color: white">
																<strong>RF Input</strong>
															</h4>

															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulin"
																				class="control-label">Power UL</form:label></td>



																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">

																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getPowerInUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="OFF" readonly="true" /></b></td>

																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>

																		<td><form:label path="powerdlin"
																				class="control-label">Power DL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin"
																							value="${repParams.get(loop.index).getPowerInDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Output Power -->
															<h4 align="center" style="color: white">
																<strong>RF Output</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulout"
																				class="control-label">Power UL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout"
																							value="${repParams.get(loop.index).getPowerOutUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulout"
																				class="control-label">dBm</form:label></td>

																	</tr>

																	<tr>
																		<td><form:label path="powerdlout"
																				class="control-label">Power DL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout"
																							value="${repParams.get(loop.index).getPowerOutDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlout"
																				class="control-label">dBm</form:label></td>

																	</tr>
																</tbody>
															</table>
														</div>
													</div>


													<div class="col-lg-4">
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>Channel Information</strong>
															</h4>

															<c:choose>
																<c:when test="${repData.getReptype() == '7'}">

																	<table class="table table-striped">
																		<tbody>

																			<tr>
																				<td><form:label path="startchg0"
																						class="control-label">Start
																			Freq UL</form:label></td>


																				<td><b><form:input path="startchg0"
																							id="startchg180" type="number"
																							class="form-control" required="required"
																							onblur="cfCalculator1800();"
																							value="${repParams.get(loop.index).getStartChannel()/10 }"
																							min="1710" max="1785" step="0.1" /></b></td>


																				<td><form:label path="startchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="stopchg0"
																						class="control-label">Stop
																			Freq UL</form:label></td>


																				<td><b><form:input path="stopchg0"
																							id="stopchg180" type="number"
																							class="form-control" required="required"
																							onblur="cfCalculator1800();"
																							value="${repParams.get(loop.index).getStopChannel()/10 }"
																							min="1710" max="1785" step="0.1" /></b></td>


																				<td><form:label path="stopchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofrequl0"
																						class="control-label">CF
																			UL</form:label></td>


																				<td><b><form:input path="lofrequl0"
																							id="lofrequl180" type="number" readonly="true"
																							class="form-control"
																							value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																				<td><form:label path="lofrequl0"
																						class="control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofreqdl0"
																						class="control-label">CF
																			DL</form:label></td>


																				<td><b><form:input path="lofreqdl0"
																							id="lofreqdl180" type="number" readonly="true"
																							class="form-control"
																							value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																				<td><form:label path="lofreqdl0"
																						class="control-label">Mhz</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="bwg0"
																						class="control-label">Bandwidth</form:label></td>

																				<td><b><form:input path="bwg0" id="bwg180"
																							class="form-control" readonly="true"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																				<td><form:label path="bwg0"
																						class="control-label">Mhz</form:label></td>

																			</tr>

																			<tr class="hide">

																				<td><b><form:input path="sawbw0"
																							class="form-control"
																							value="${repParams.get(loop.index).getSawBandwidth()}" /></b></td>

																				<td><b><form:input path="oldbwg0"
																							class="form-control"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>
																			</tr>

																		</tbody>
																	</table>
																</c:when>
															</c:choose>
														</div>
														<div class="block">
															<table>
																<tr>
																	<td><label for="LoED">Auto Shutdown </label></td>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				checked="true" /><font color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				unchecked="false" /><font color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>

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
																			color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																		<td><form:checkbox path="alclvlon_off"
																				id="alclvlon_off" unchecked="false" /><font
																			color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>
													</div>

													<div class="col-lg-4" align="center">
														<c:if test="${userDetails.getRoleId() !='6'}">
															<button type="submit" class="btn btn-success"
																id="apply_1800">Apply</button>
														</c:if>
													</div>

												</div>

											</form:form>
										</div>


										<div id="band" class="tab-pane fade"></div>

										<c:forEach items="${repParams}" var="bandDataList"
											varStatus="loop">
											<c:if
												test="${repParams.get(loop.index).getBandName()=='1800' }">
												<div id="1800thresholdvalue1" class="tab-pane fade">

													<form:form id="RepeaterDtaForm7"
														modelAttribute="cofigPageMapper"
														action="/nms/sohoHidApply.htm" method="post">

														<div class="row">
															<div class="col-md-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>1800 Threshold Value</strong>
																			</h3>
																		</div>

																		<div class="panel-body">
																			<table class="table table-striped">
																				<tbody>
																					<tr>

																						<td><form:label path="thlvlulgsm"
																								class="control-label">1800 Threshold UL</form:label></td>


																						<td><b><form:input path="thlvlulgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="1800" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>

																					</tr>


																					<tr>
																						<td><form:label path="thlvldlgsm"
																								class="control-label">1800 Threshold DL</form:label></td>


																						<td><b><form:input path="thlvldlgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1" /></td>

																						<td></td>
																					</tr>
																					<tr class="hide">
																						<td><b><form:input path="Identifier"
																									class="form-controlnew" id="Identifier"
																									name="Identifier" readonly="true"
																									value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>

															<div class="col-sm-12">
																<div align="center">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<button type="submit" class="btn btn-success"
																			id="apply11">Apply</button>
																	</c:if>
																</div>
															</div>
														</div>
													</form:form>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<!-- end of 1800 -->

							<!-- 2100 -->
							<c:if test="${repParams.get(loop.index).getBandName()=='2100' }">

								<div id="2100" class="tab-pane fade">

									<div class="row">
										<div class="col-lg-12">
											<div class="block">

												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab"
														href="#2100home"><b>Main Params</b></a></li>

													<li><a data-toggle="tab" href="#2100thresholdvalue"><b>Threshold
																Value</b></a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="tab-content">

										<div id="2100home" class="tab-pane fade in active">

											<form:form id="RepeaterDtaForm8"
												modelAttribute="cofigPageMapper"
												action="/nms/sohoHidApply.htm" method="post">


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
																		<td><label for="paon_offul">UL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='1'}">
																			<td><form:checkbox path="paon_offul"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPAUL()=='0'}">
																			<td><form:checkbox path="paon_offul"
																					unchecked="true" /><font color="red">OFF</font></td>
																		</c:if>

																		<form:hidden path="BandName" />
																		<td><input id="BandName" name="BandName"
																			type="hidden" value="2100" /></td>
																		<form:hidden path="snumber" />
																		<td><input id="snumber" name="snumber"
																			type="hidden" value="${message}" /></td>
																	</tr>
																	<tr>

																		<td><label for="paon_offdl">DL </label></td>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='1'}">
																			<td><form:checkbox path="paon_offdl"
																					checked="true" /><font color="#32CD32">ON</font></td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getPADL()=='0'}">
																			<td><form:checkbox path="paon_offdl"
																					unchecked="false" /><font color="red">OFF</font></td>
																		</c:if>


																		<form:hidden path="threshold_flag" />
																		<td><input id="threshold_flag"
																			name="threshold_flag" type="hidden" value="0" /></td>

																		<form:hidden path="RepeaterPwr" />
																		<td><input id="RepeaterPwr" name="RepeaterPwr"
																			type="hidden"
																			value="${repParams.get(loop.index).getTotalHumpCount()}" /></td>
																	</tr>
																	<tr class="hide">
																		<td><b><form:input path="Identifier"
																					class="form-controlnew" id="Identifier"
																					name="Identifier" readonly="true"
																					value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																	</tr>

																</tbody>
															</table>
														</div>

														<!-- GAIN -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>GAIN</strong>
															</h4>

															<table class="table-striped">
																<tbody>
																	<c:choose>
																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()<='27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl()}"
																							min="${repParams.get(loop.index).getMuSerialNumber()-30}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when
																			test="${repParams.get(loop.index).getTotalHumpCount()>'27'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="${repParams.get(loop.index).getMuSerialNumber()-40}"
																							max="${repParams.get(loop.index).getMuSerialNumber()}" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>
																	</c:choose>
																</tbody>
															</table>
														</div>

														<!-- ALC -->
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>ALC</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="alclvlul"
																				class="control-label">LVL UL</form:label></td>


																		<td><b><form:input path="alclvlul"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																		<td><form:label path="alclvlul"
																				class="control-label">dBm</form:label></td>

																	</tr>
																	<tr>

																		<td><form:label path="alclvldl"
																				class="control-label">LVL DL</form:label></td>


																		<td><b><form:input path="alclvldl"
																					type="number"
																					min="-${repParams.get(loop.index).getTotalHumpCount()+2}"
																					max="${repParams.get(loop.index).getTotalHumpCount()+2}"
																					class="form-control" required="required"
																					placeholder="Normal input"
																					value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																		<td><form:label path="alclvldl"
																				class="control-label">dBm</form:label></td>

																	</tr>

																</tbody>
															</table>
														</div>
													</div>

													<div class="col-sm-4">
														<div class="block">

															<!-- OFFSET -->
															<h4 align="center" style="color: white">
																<strong>OFFSET</strong>
															</h4>

															<table class=" table-striped">
																<tbody>

																	<tr>

																		<td><form:label path="offsetul"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="offsetul"
																					type="number" min="-9" max="9" name="offsetul"
																					id="offsetul" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>

																		<td><form:label path="offsetul"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>
																		<td><form:label path="offsetdl"
																				class="control-label">DL</form:label></td>
																		<td><b><form:input path="offsetdl"
																					type="number" min="-9" max="9" name="offsetdl"
																					id="offsetdl" class="form-control"
																					required="required"
																					value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																		<td><form:label path="offsetdl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<!-- hidden compensation value -->
																	<tr class="hide">

																		<td><form:label path="CompensationAllUl"
																				class="control-label">UL</form:label></td>
																		<td><b><form:input path="CompensationAllUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getAttenuationUl() }" /></b></td>

																		<td><form:label path="CompensationAllUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="CompensationAllDl"
																				class=" control-label">DL</form:label></td>
																		<td><b><form:input path="CompensationAllDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getAttenuationDl() }" /></b></td>

																		<td><form:label path="CompensationAllDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">

																		<td><form:label path="Compensation1HumpUl"
																				class=" control-label">UL</form:label></td>
																		<td><b><form:input path="Compensation1HumpUl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																		<td><form:label path="Compensation1HumpUl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr class="hide">
																		<td><form:label path="Compensation1HumpDl"
																				class=" control-label">DL</form:label></td>
																		<td><b><form:input path="Compensation1HumpDl"
																					class="form-control"
																					value="${repParams.get(loop.index).getCompensationDl() }" /></b></td>

																		<td><form:label path="Compensation1HumpDl"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Input Power -->
															<h4 align="center" style="color: white">
																<strong>RF Input</strong>
															</h4>

															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulin"
																				class=" control-label">Power UL</form:label></td>



																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">

																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="${repParams.get(loop.index).getPowerInUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulin"
																							name="powerulin" id="powerulin"
																							class="form-control" required="required"
																							value="OFF" readonly="true" /></b></td>

																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>

																		<td><form:label path="powerdlin"
																				class="control-label">Power DL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin"
																							value="${repParams.get(loop.index).getPowerInDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlin"
																							class="form-control" required="required"
																							id="powerdlin" name="powerdlin" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																</tbody>
															</table>
														</div>

														<div class="block">

															<!-- Output Power -->
															<h4 align="center" style="color: white">
																<strong>RF Output</strong>
															</h4>
															<table class="table-striped">
																<tbody>

																	<tr>
																		<td><form:label path="powerulout"
																				class=" control-label">Power UL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPAUL()=='1'}">
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout"
																							value="${repParams.get(loop.index).getPowerOutUl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerulout"
																							class="form-control" required="required"
																							id="powerulout" name="powerulout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerulout"
																				class="control-label">dBm</form:label></td>

																	</tr>

																	<tr>
																		<td><form:label path="powerdlout"
																				class="control-label">Power DL</form:label></td>


																		<c:choose>
																			<c:when
																				test="${repParams.get(loop.index).getPADL()=='1'}">
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout"
																							value="${repParams.get(loop.index).getPowerOutDl() }"
																							readonly="true" /></b></td>
																			</c:when>
																			<c:otherwise>
																				<td><b><form:input path="powerdlout"
																							class="form-control" required="required"
																							id="powerdlout" name="powerdlout" value="OFF"
																							readonly="true" /></b></td>
																			</c:otherwise>
																		</c:choose>

																		<td><form:label path="powerdlout"
																				class="control-label">dBm</form:label></td>

																	</tr>
																</tbody>
															</table>
														</div>
													</div>


													<div class="col-lg-4">
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>Channel Information</strong>
															</h4>

															<c:choose>
																<c:when test="${repData.getReptype() == '7'}">

																	<table class="table table-striped">
																		<tbody>

																			<tr>
																				<td><form:label path="startchg0"
																						class=" control-label">Start
																			Freq UL</form:label></td>


																				<td><b><form:input path="startchg0"
																							id="startchg210" type="number"
																							class="form-control" required="required"
																							onblur="cfCalculator2100();"
																							value="${repParams.get(loop.index).getStartChannel()/10 }"
																							min="1920" max="1980" step="0.1" /></b></td>

																				<td><form:label path="startchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="stopchg0"
																						class=" control-label">Stop
																			Freq UL</form:label></td>


																				<td><b><form:input path="stopchg0"
																							id="stopchg210" type="number"
																							class="form-control" required="required"
																							onblur="cfCalculator2100();"
																							value="${repParams.get(loop.index).getStopChannel()/10 }"
																							min="1920" max="1980" step="0.1" /></b></td>

																				<td><form:label path="stopchg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofrequl0"
																						class=" control-label">CF
																			UL</form:label></td>


																				<td><b><form:input path="lofrequl0"
																							id="lofrequl210" class="form-control"
																							type="number" readonly="true"
																							value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																				<td><form:label path="lofrequl0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>
																				<td><form:label path="lofreqdl0"
																						class="control-label">CF
																			DL</form:label></td>


																				<td><b><form:input path="lofreqdl0"
																							id="lofreqdl210" class="form-control"
																							type="number" readonly="true"
																							value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																				<td><form:label path="lofreqdl0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr>

																				<td><form:label path="bwg0"
																						class=" control-label">Bandwidth</form:label></td>

																				<td><b><form:input path="bwg0" id="bwg210"
																							class="form-control" readonly="true"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																				<td><form:label path="bwg0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>

																			<tr class="hide">

																				<td><b><form:input path="sawbw0"
																							class="form-control"
																							value="${repParams.get(loop.index).getSawBandwidth()}" /></b></td>

																				<td><b><form:input path="oldbwg0"
																							class="form-control"
																							value="${repParams.get(loop.index).getBandWidth()}" /></b></td>
																			</tr>
																		</tbody>
																	</table>
																</c:when>
															</c:choose>
														</div>
														<div class="block">
															<table>
																<tr>
																	<td><label for="LoED">Auto Shutdown </label></td>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				checked="true" /><font color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">
																		<td><form:checkbox path="LoED" id="LoED"
																				unchecked="false" /><font color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>

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
																			color="#32CD32">ON</font></td>
																	</c:if>
																	<c:if
																		test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																		<td><form:checkbox path="alclvlon_off"
																				id="alclvlon_off" unchecked="false" /><font
																			color="red">OFF</font></td>
																	</c:if>
																	<td></td>
																</tr>
															</table>
														</div>
													</div>
													<div class="col-lg-4" align="center">
														<c:if test="${userDetails.getRoleId() !='6'}">
															<button type="submit" class="btn btn-success"
																id="apply_2100">Apply</button>
														</c:if>
													</div>

												</div>

											</form:form>
										</div>


										<div id="band" class="tab-pane fade"></div>

										<c:forEach items="${repParams}" var="bandDataList"
											varStatus="loop">
											<c:if
												test="${repParams.get(loop.index).getBandName()=='2100' }">
												<div id="2100thresholdvalue" class="tab-pane fade">

													<form:form id="RepeaterDtaForm9"
														modelAttribute="cofigPageMapper"
														action="/nms/sohoHidApply.htm" method="post">

														<div class="row">
															<div class="col-md-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>2100 Threshold Value</strong>
																			</h3>
																		</div>

																		<div class="panel-body">
																			<table class="table table-striped">
																				<tbody>
																					<tr>

																						<td><form:label path="thlvlulgsm"
																								class="control-label">2100 Threshold UL</form:label></td>


																						<td><b><form:input path="thlvlulgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="2100" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>

																					</tr>


																					<tr>
																						<td><form:label path="thlvldlgsm"
																								class="control-label">2100 Threshold DL</form:label></td>


																						<td><b><form:input path="thlvldlgsm"
																									class="form-control" required="required"
																									type="number" min="-50" max="50"
																									value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1" /></td>

																						<td></td>
																					</tr>
																					<tr class="hide">
																						<td><b><form:input path="Identifier"
																									class="form-controlnew" id="Identifier"
																									name="Identifier" readonly="true"
																									value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>

															<div class="col-sm-12">
																<div align="center">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<button type="submit" class="btn btn-success"
																			id="apply11">Apply</button>
																	</c:if>
																</div>
															</div>
														</div>
													</form:form>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</c:if>
							<!-- end of 2100 -->
						</c:forEach>

						<div id="sysdetails" class="tab-pane in active">
							<form:form id="RepeaterDtaForm10"
								modelAttribute="cofigPageMapper" action="/nms/sohoHidApply.htm"
								method="post">

								<div class="row">
									<div class="col-sm-12">
										<div class="block ">

											<div style="color: white">
												<h3 align="center">
													<strong>System Details</strong>
												</h3>
											</div>

											<div class="row">
												<div class="col-sm-6">
													<div class="block margin-bottom-sm">
														<div class="table-responsive">
															<table class="table table-striped">
																<tbody>
																	<tr>
																		<td><form:label path="sysname"
																				class="control-label">Site
														Name:</form:label>
																		<td><b><form:input path="sysname"
																					id="sysname" required="required" type="text"
																					maxlength="20" class="form-controlnew"
																					placeholder="Normal input"
																					value="${repData.getRepName()}" /></b></td>

																		<form:hidden path="snumber" />
																		<td style="display: none"><input name="snumber"
																			type="hidden" data-ng-model="snumber"
																			value="${message}" /></td>
																	</tr>

																	<tr>
																		<td style="color: black"><form:label
																				path="region_name" class="control-label">Region Name:</form:label></td>

																		<td><form:select path="region_name"
																				id="region_name" required="required"
																				style="width: 160px">
																				<form:option value="${repData.getRegionName()}"
																					label="${repData.getRegionName()}" />

																				<option value="AP & Telangana">AP &
																					Telangana</option>
																				<option value="Assam">Assam</option>
																				<option value="Bihar Jharkhand">Bihar
																					Jharkhand</option>
																				<option value="Chennai">Chennai</option>
																				<option value="Delhi & NCR">Delhi & NCR</option>
																				<option value="Gujarat">Gujarat</option>
																				<option value="Haryana">Haryana</option>
																				<option value="Himachal Pradesh">Himachal
																					Pradesh</option>
																				<option value="Jammu & Kashmir">Jammu &
																					Kashmir</option>
																				<option value="Karnataka">Karnataka</option>
																				<option value="Kerala">Kerala</option>
																				<option value="Kolkata">Kolkata</option>
																				<option value="MP & Chhattisgarah">MP &
																					Chhattisgarah</option>
																				<option value="Maharashtra & Goa">Maharashtra
																					& Goa</option>
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
																	</tr>

																	<tr>

																		<td><form:label path="streetName"
																				class="control-label">Site Address:</form:label>
																		<td><b><form:input path="streetName"
																					required="required" maxlength="30"
																					class="form-controlnew" id="streetName"
																					name="streetName"
																					value="${repData.getStreetName()}" /></b></td>

																	</tr>

																	<tr>

																		<td><form:label path="snumber"
																				class="control-label">Serial
														Number:</form:label></td>


																		<td><b><form:input path="snumber"
																					class="form-controlnew" placeholder="Normal input"
																					readonly="true"
																					value="${repData.getSerialNumber()}" /></b></td>

																	</tr>

																	<tr>

																		<td><form:label path="partnum"
																				class="control-label">Part
														Number:</form:label>
																		<td><b><form:input path="partnum"
																					required="required" readonly="true" type="text"
																					maxlength="20" class="form-controlnew"
																					placeholder="Normal input"
																					value="${repData.getRepPartNumber()}" /></b></td>

																	</tr>

																	<tr>

																		<td><form:label path="ipaddr"
																				class="control-label">IP
														Address:</form:label></td>


																		<td><b><form:input path="ipaddr"
																					class="form-controlnew" placeholder="Normal input"
																					value="${repData.getSerevrIpAddress()}"
																					readonly="true" /></b></td>
																	</tr>

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

																		<td><form:label path="port" class="control-label">Port:</form:label></td>


																		<td><b><form:input path="port"
																					class="form-controlnew" placeholder="Normal input"
																					value="${repData.getPort()}" readonly="true" /></b></td>
																	</tr>

																	<tr>

																		<td><form:label path="apn" class="control-label">APN:</form:label>
																		<td><b><form:input path="apn"
																					class="form-controlnew" placeholder="Normal input"
																					value="${repData.getAPN()}" readonly="true" /></b></td>
																	</tr>
																	<tr>

																		<td><form:label path="imei" class="control-label">IMEI:
														Number</form:label></td>


																		<td><b><form:input path="imei"
																					class="form-controlnew" placeholder="Normal input"
																					value="${repData.getIMEI()}" readonly="true" /></b></td>
																	</tr>

																	<tr>
																		<td><form:label path="dcsversion"
																				class="control-label">Firmware Version</form:label></td>
																		<td><b><form:input path="dcsversion"
																					class="form-controlnew" id="dcsversion"
																					name="dcsversion" readonly="true"
																					value="${repData.getState()}" /></b></td>

																	</tr>

																	<tr class="hide">

																		<td><form:label path="lacId"
																				class="control-label">LAC ID:</form:label>
																		<td><b><form:input path="lacId"
																					class="form-controlnew" id="lacId" name="lacId"
																					value="${repData.getLACID()}" readonly="true" /></b></td>
																	</tr>

																	<tr class="hide">

																		<td><form:label path="cellId"
																				class="control-label">CELL ID:</form:label></td>


																		<td><b><form:input path="cellId"
																					class="form-controlnew" id="cellId" name="cellId"
																					value="${repData.getCID()}" readonly="true" /></b></td>
																	</tr>

																	<tr>

																		<td><form:label path="country"
																				class="control-label">Network Mode:</form:label></td>


																		<td><b><form:input path="country"
																					class="form-controlnew" id="country" name="country"
																					readonly="true" value="${repData.getCountry()}" /></b></td>
																	</tr>


																	<tr class="hide">

																		<td><form:label path="city" class="control-label">Band Available:</form:label></td>

																		<td><b><form:input path="city"
																					class="form-controlnew" id="city" name="city"
																					readonly="true" value="${repData.getCity()}" /> </b></td>
																	</tr>

																	<tr class="hide">

																		<td><form:label path="state"
																				class="control-label">Protocol Version:</form:label></td>


																		<td><b><form:input path="state"
																					class="form-controlnew" id="state" name="state"
																					readonly="true" value="${repData.getRU()}" /></b></td>
																	</tr>

																</tbody>
															</table>
														</div>
													</div>
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

									<!-- end of primary body -->
								</div>
							</form:form>
						</div>
						<!-- end of system details -->

					</div>
					<!-- end of band tab -->
				</div>
			</section>
			<br>

			<jsp:include page="footer.jsp" />

		</div>

	</div>

	<!-- <script>
		jQuery(document).ready(function($) {

			$("#RepeaterDtaForm10").submit(function(event) {

				// Disble the search button
				enableSubmitButton(false);

				// Prevent the form from submitting via the browser.
				event.preventDefault();

				sendData();

			});

		});

		function sendData() {

			var systemDetails = {}
			systemDetails["sysname"] = $("#sysname").val();
			systemDetails["region_name"] = $("#region_name").val();

			console.log("Inside Ajax call");

			console.log(systemDetails);

			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/nms/soho/sohoSystemApply",
				data : JSON.stringify(systemDetails),
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					display(data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
					display(e);
				},
				done : function(e) {
					console.log("DONE");
					enableSearchButton(true);
				}
			});

		}

		function enableSubmitButton(flag) {
			$("#apply16").prop("disabled", flag);
		}

		function display(data) {
			var json = "<h4>Ajax Response</h4><pre>"
					+ JSON.stringify(data, null, 4) + "</pre>";
			$('#feedback').html(json);
		}
	</script> -->

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
								} else if ("${sendval}" == 'Live Data Refreshed....') {
									toastr.success(
											'Live Data Refreshed....!!!',
											'Success!!!')
								} else if ("${sendval}" == 'Successfully Send.Waiting for update....') {
									toastr
											.success(
													'Successfully Send.Waiting for update....!!!',
													'Success!!!')
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

	<script>
		$('#refresh').click(function() {
			location.reload();
		});
	</script>



	<jsp:include page="script.jsp" />


</body>
</html>