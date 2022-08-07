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

		$("#RepeaterDtaForm_1").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm_2").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm4").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm5").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm_3").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm6").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm_4").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm9").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm8").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm10").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm11").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm12").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm13").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm14").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm_5").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm_6").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm16").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm21").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm21_1").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm21_2").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm18").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm18_1").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm18_2").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm_800").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm1_800").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm2_800").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm_1_800").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#RepeaterDtaForm_2_800").on("submit", function() {
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


					<div class="row">
						<div class="col-lg-12">
							<div class="block">
								<c:choose>

									<c:when
										test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

										<ul class="nav nav-tabs">

											<li class="active"><a data-toggle="tab"
												href="#sysdetails"><b>System Details</b></a></li>
											<c:forEach items="${repParams}" var="bandDataList"
												varStatus="loop">

												<c:if
													test="${repParams.get(loop.index).getBandName()=='800'}">
													<li><a data-toggle="tab" href="#800"><b>800</b></a></li>
												</c:if>
												<c:if
													test="${repParams.get(loop.index).getBandName()=='GSM'}">
													<li><a data-toggle="tab" href="#gsm"><b>900</b></a></li>
												</c:if>
												<c:if
													test="${repParams.get(loop.index).getBandName()=='DCS1' && repParams.get(loop.index).getStartChannel() > 5000}">
													<li><a data-toggle="tab" href="#dcs1"><b>800</b></a></li>
												</c:if>
												<c:if
													test="${repParams.get(loop.index).getBandName()=='DCS1' && repParams.get(loop.index).getStartChannel() < 5000}">
													<li><a data-toggle="tab" href="#dcs1"><b>1800</b></a></li>
												</c:if>
												<c:if
													test="${repParams.get(loop.index).getBandName()=='DCS2'  && repParams.get(loop.index).getStartChannel() < 5000}">
													<li><a data-toggle="tab" href="#dcs2"><b>1800</b></a></li>
												</c:if>
												<c:if
													test="${repParams.get(loop.index).getBandName()=='UMTS'}">
													<li><a data-toggle="tab" href="#umts"><b>2100</b></a></li>
												</c:if>

											</c:forEach>

										</ul>
									</c:when>

									<c:when
										test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab" href="#gsm"><b>850MHz</b></a></li>
											<li><a data-toggle="tab" href="#dcs1"><b>1900MHz</b></a></li>
											<li><a data-toggle="tab" href="#umts"><b>AWS</b></a></li>
											<li><a data-toggle="tab" href="#sysdetails"><b>System
														Details</b></a></li>
										</ul>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>

					<div class="tab-content">
						<c:forEach items="${repParams}" var="bandDataList"
							varStatus="loop">

							<c:if test="${repParams.get(loop.index).getBandName()=='800' }">

								<div id="800" class="tab-pane fade">

									<div class="row">
										<div class="col-lg-12">
											<div class="block">

												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab" href="#home8"><b>Main
																Params</b></a></li>
													<c:choose>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==0}">
															<li class="disabled"><a href="#8_12hump"
																title='Not available'><b>Hump 1-2</b></a></li>
														</c:when>
														<c:otherwise>
															<li><a data-toggle="tab" href="#8_12hump"><b>Hump
																		1-2</b></a></li>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==0 || repParams.get(loop.index).getTotalHumpCount()==1 ||repParams.get(loop.index).getTotalHumpCount()==2}">
															<li class="disabled"><a href="#8_34hump"
																title='Not available'><b>Hump 3-4</b></a></li>
														</c:when>
														<c:otherwise>
															<li><a data-toggle="tab" href="#8_34hump"><b>Hump
																		3-4</b></a></li>
														</c:otherwise>
													</c:choose>

													<li><a data-toggle="tab" href="#thresholdvalue8"><b>Threshold
																Value</b></a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="tab-content">

										<div id="home8" class="tab-pane fade in active">


											<form:form id="RepeaterDtaForm_800"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">


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
																		<form:hidden path="BandName" />
																		<td><input id="BandName" name="BandName"
																			type="hidden" value="800" /></td>
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



																		<form:hidden path="snumber" />
																		<td><input id="snumber" name="snumber"
																			type="hidden" value="${message}" /></td>

																	</tr>

																	<tr>
																		<td><label for="paon_offdl">DL </label></td>
																		<td></td>
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

																		<c:when test="${repData.getRepeaterModel()=='0'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="60" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="60" /></b></td>
																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='1'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='2'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='3'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='4'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="45" max="75" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="45" max="75" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='5'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="80" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="80" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='6'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="50" max="90" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="50" max="90" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='7'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="50" max="90" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="50" max="90" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='8'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="55" max="95" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="55" max="95" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='9'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class=" control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="80" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="80" /></b></td>

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
																	<c:choose>

																		<c:when test="${repData.getRepeaterModel()=='0'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class=" control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-12" max="12"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class=" control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-12" max="12"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='1'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class=" control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-19" max="19"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class=" control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-19" max="19"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='2'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class=" control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-21" max="21"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-21" max="21"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='3'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-25" max="25"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-25" max="25"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='4'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-29" max="29"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-29" max="29"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='5'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-35" max="35"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-35" max="35"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='6'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-39" max="39"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-39" max="39"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='7'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-42" max="42"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-42" max="42"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='8'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-45" max="45"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-45" max="45"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='9'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-32" max="32"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-32" max="32"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>
																	</c:choose>

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



																		<td><b><form:input path="powerulin"
																					name="powerulin" id="powerulin"
																					class="form-control"
																					value="${repParams.get(loop.index).getPowerInUl() }"
																					readonly="true" /></b></td>

																		<td><form:label path="powerulin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>

																		<td><form:label path="powerdlin"
																				class="control-label">Power DL</form:label></td>


																		<td><b><form:input path="powerdlin"
																					class="form-control" id="powerdlin"
																					name="powerdlin"
																					value="${repParams.get(loop.index).getPowerInDl() }"
																					readonly="true" /></b></td>

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


													<div class="col-sm-4">
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>Channel Information</strong>
															</h4>

															<table class="table-striped">
																<tbody>
																	<tr>
																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='1'}">
																			<td><form:checkbox path="LoED" id="LoED"
																					checked="true" /> Manual</td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='0'}">
																			<td><form:checkbox path="LoED" id="LoED"
																					unchecked="false" /> Auto</td>
																		</c:if>
																		<c:choose>

																			<c:when
																				test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">



																				<td class="col-sm-2"><form:select
																						path="TotalHump">
																						<form:option
																							value="${repParams.get(loop.index).getTotalHumpCount()}"
																							label="${repParams.get(loop.index).getTotalHumpCount()}" />
																						<option value="0">0</option>
																						<option value="1">1</option>
																						<option value="2">2</option>
																						<option value="3">3</option>
																						<option value="4">4</option>
																					</form:select></td>
																				<td><form:label path="bw8_0"
																						class=" control-label" style="color: white">Total Hump</form:label></td>
																			</c:when>

																		</c:choose>

																	</tr>
																</tbody>
															</table>

															<c:choose>
																<c:when
																	test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">
																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">

																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="startch8_0"
																							class=" control-label">Start
																			Channel</form:label></td>


																					<td><b><form:input path="startch8_0"
																								type="number" class="form-control"
																								readonly="true"
																								value="${repParams.get(loop.index).getStartChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopch8_0"
																							class="control-label">Stop
																			Channel</form:label></td>


																					<td><b><form:input path="stopch8_0"
																								type="number" class="form-control"
																								readonly="true"
																								value="${repParams.get(loop.index).getStopChannel() }" /></b></td>
																					<td></td>

																				</tr>


																				<tr>
																					<td><form:label path="lofrequl8_0"
																							class=" control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequl8_0"
																								readonly="true" class="form-control"
																								type="number"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequl8_0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdl8_0"
																							class=" control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdl8_0"
																								readonly="true" class="form-control"
																								type="number"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdl8_0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>

																					<td><form:label path="bw8_0"
																							class="control-label">Bandwidth</form:label></td>

																					<td><b><form:input path="bw8_0"
																								class="form-control" readonly="true" value="0.1" /></b></td>

																					<td><form:label path="bw8_0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>
																				<tr>
																					<td><form:label path="sawbw0"
																							class=" control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								readonly="true" class="form-control"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>
																			</tbody>
																		</table>

																	</c:if>

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">

																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="startch8_0"
																							class=" control-label">Start
																			Channel</form:label></td>


																					<td><b><form:input path="startch8_0"
																								type="number" class="form-control" min="6150"
																								max="6449" onblur="cfCalculator800h0();"
																								value="${repParams.get(loop.index).getStartChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopch8_0"
																							class=" control-label">Stop
																			Channel</form:label></td>


																					<td><b><form:input path="stopch8_0"
																								type="number" class="form-control" min="6150"
																								max="6449" onblur="cfCalculator800h0();"
																								value="${repParams.get(loop.index).getStopChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofrequl8_0"
																							class=" control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequl8_0"
																								class="form-control" type="number"
																								readonly="true"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequl8_0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdl8_0"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdl8_0"
																								class="form-control" type="number"
																								readonly="true"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdl8_0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>

																					<td><form:label path="bw8_0"
																							class=" control-label">Bandwidth</form:label></td>

																					<td><b><form:input path="bw8_0"
																								class="form-control" readonly="true" value="0.1" /></b></td>

																					<td><form:label path="bw8_0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>


																				<tr>
																					<td><form:label path="sawbw0"
																							class=" control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								class="form-control"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																			</tbody>
																		</table>
																	</c:if>
																</c:when>
															</c:choose>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-sm-4">
														<div class="block">
															<table>
																<tr>
																	<td><label for="alclvlon_off">ALC ON/OFF </label></td>
																	<td></td>
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
																id="apply_800">ApplySettings</button>
														</c:if>
													</div>

													<div class="col-sm-4">
														<div class="block">
															<table>
																<tr>
																	<td><form:label path="version_800"
																			class="control-label">
																			Version</form:label></td>


																	<td><b><form:input path="version_800"
																				class="form-controlnew" readonly="true"
																				value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>

																	<td></td>

																</tr>
															</table>
														</div>
													</div>

												</div>
											</form:form>
										</div>
										<c:choose>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==0}">
												<li class="hide" style="display: hidden;"></li>
												<div id="8_12hump" style="display: hidden;"></div>
												<li class="hide" style="display: hidden;"></li>
												<div id="8_34hump" style="display: hidden;"></div>
											</c:when>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==1}">

												<style>
.8_2hump {
	display: none;
}
</style>

												<li class="hide" style="display: hidden;"></li>
												<div id="8_34hump" style="display: hidden;"></div>
											</c:when>

											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==2}">
												<div id="8_34hump" style="display: hidden;"></div>
											</c:when>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==3}">
												<!-- <li id="8_hump4" style="display: hidden;"></li> -->
												<style>
.8_4hump {
	display: none;
}
</style>

											</c:when>

										</c:choose>

										<!-- end of active pane -->

										<!-- 800 1 & 2 Hump Params -->
										<div id="8_12hump" class="tab-pane fade">

											<form:form id="RepeaterDtaForm1_800"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">


												<div class="row">

													<div class="tab-content">

														<c:choose>

															<c:when
																test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																<c:forEach items="${humpParams}" var="humpDataList"
																	varStatus="loop">



																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='800' && humpParams.get(loop.index).getHumpId()== 1}">



																		<div id="g1hump" class="col-sm-6">
																			<div class="block">
																				<table class="table table-striped">
																					<thead>
																						<tr>
																							<th><b>Hump-1</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="Compensation1HumpUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpUl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="Compensation1HumpDl"
																									class="control-label">DL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpDl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>

																						<tr>

																							<td><label for="humpon_off1">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" unchecked="false" /></td>
																							</c:if>

																							<form:hidden path="Identifier" />
																							<td><input id="Identifier" name="Identifier"
																								type="hidden" value="12" /></td>
																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="800" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>

																						</tr>

																						<tr>
																							<td><form:label path="startch8_1"
																									class="control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startch8_1"
																										type="number" name="startChannel"
																										class="form-control" min="6150" max="6449"
																										onblur="cfCalculator800h1();"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopch8_1"
																									class="control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopch8_1"
																										type="number" name="stopChannel"
																										class="form-control" min="6150" max="6449"
																										onblur="cfCalculator800h1();"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequl8_1"
																									class="control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl8_1"
																										name="cful" type="number" step="0.1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<td><form:label path="lofrequl8_1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl8_1"
																									class=" control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl8_1"
																										name="cfdl" type="number" step="0.1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdl8_1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="bw8_1"
																									class=" control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bw8_1"
																										class="form-control" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth()}" /></b></td>

																							<td><form:label path="bw8_1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw1"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>

																	<!-- end of hump-1 -->
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='800' && humpParams.get(loop.index).getHumpId()== 2}">
																		<div class="8_2hump col-sm-6 ">
																			<div class="block">
																				<table class="table table-striped">
																					<thead>
																						<tr>
																							<th><b>Hump-2</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="CompensationAllUl"
																									class=" control-label">UL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllUl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="CompensationAllDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllDl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>
																						<tr>

																							<td><label for="humpon_off2">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" unchecked="false" /></td>
																							</c:if>
																							<td></td>

																						</tr>



																						<tr>
																							<td><form:label path="startch8_2"
																									class=" control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startch8_2"
																										class="form-control" type="number" min="6150"
																										max="6449" onblur="cfCalculator800h2();"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopch8_2"
																									class=" control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopch8_2"
																										class="form-control" type="number" min="6150"
																										max="6449" onblur="cfCalculator800h2();"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequl8_2"
																									class=" control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl8_2"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<%-- min="890.0" max="914.8" --%>
																							<td><form:label path="lofrequl8_2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl8_2"
																									class="control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl8_2"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>
																							<%-- min="935.0" max="959.8" --%>

																							<td><form:label path="lofreqdl8_2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="bw8_2"
																									class=" control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bw8_2"
																										class="form-control" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth()}" /></b></td>

																							<td><form:label path="bw8_2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw2"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw2"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>

																	<!-- end of hump-2 -->

																</c:forEach>

															</c:when>

														</c:choose>
													</div>

													<!-- </div> -->

												</div>

												<!-- apply button for 1 -2 Hump Params -->
												<div class="col-lg-12">

													<c:if test="${userDetails.getRoleId() !='6'}">

														<div align="center">
															<button type="submit" class="btn btn-success"
																id="apply1_800">ApplySettings</button>
														</div>
													</c:if>

												</div>

											</form:form>
										</div>

										<!-- 800 3 & 4 Hump Params -->
										<div id="8_34hump" class="tab-pane fade">

											<form:form id="RepeaterDtaForm2_800"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">

												<div class="row">


													<div class="tab-content">

														<c:choose>

															<c:when
																test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																<c:forEach items="${humpParams}" var="humpDataList"
																	varStatus="loop">
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='800' && humpParams.get(loop.index).getHumpId()== 3}">
																		<div id="g3hump" class="col-sm-6">
																			<div class="block">
																				<table class="table table-striped">

																					<thead>
																						<tr>
																							<th><b>Hump-3</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="Compensation1HumpUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpUl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="Compensation1HumpDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpDl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>

																						<tr>
																							<td><label for="humpon_off3">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off3"
																										id="humpon_off3" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off3"
																										id="humpon_off3" unchecked="false" /></td>
																							</c:if>



																							<form:hidden path="Identifier" />
																							<td><input id="Identifier" name="Identifier"
																								type="hidden" value="34" /></td>
																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="800" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>
																						</tr>



																						<tr>
																							<td><form:label path="startch8_3"
																									class="control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startch8_3"
																										type="number" class="form-control" min="6150"
																										max="6449" onblur="cfCalculator800h3();"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopch8_3"
																									class="control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopch8_3"
																										type="number" class="form-control" min="6150"
																										max="6449" onblur="cfCalculator800h3();"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequl8_3"
																									class=" control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl8_3"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<%-- min="890.0" max="914.8" --%>
																							<td><form:label path="lofrequl8_3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>


																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl8_3"
																									class=" control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl8_3"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>
																							<%-- min="935.0" max="959.8" --%>

																							<td><form:label path="lofreqdl8_3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>


																						</tr>

																						<tr>
																							<td><form:label path="bw8_3"
																									class="control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bw8_3"
																										class="form-control" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth()}" /></b></td>

																							<td><form:label path="bw8_3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw3"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw3"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-3 -->
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='800' && humpParams.get(loop.index).getHumpId()== 4}">
																		<div class="8_4hump col-sm-6">
																			<div class="block">
																				<table class="table table-striped">
																					<thead>
																						<tr>
																							<th><b>Hump-4</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="CompensationAllUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllUl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="CompensationAllDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllDl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>
																						<tr>
																							<td><label for="humpon_off4">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off4"
																										id="humpon_off4" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off4"
																										id="humpon_off4" unchecked="false" /></td>
																							</c:if>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="startch8_4"
																									class="control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startch8_4"
																										type="number" class="form-control" min="6150"
																										max="6449" onblur="cfCalculator800h4();"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopch8_4"
																									class="control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopch8_4"
																										type="number" class="form-control" min="6150"
																										max="6449" onblur="cfCalculator800h4();"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequl8_4"
																									class=" control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl8_4"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<%-- min="890.0" max="914.8" --%>

																							<td><form:label path="lofrequl8_4"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl8_4"
																									class=" control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl8_4"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdl8_4"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="bw8_4"
																									class="control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bw8_4"
																										class="form-control" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth()}" /></b></td>

																							<td><form:label path="bw8_4"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw4"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw4"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw4"
																									class=" control-label">Mhz</form:label></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																		<!-- end of hump-4 -->
																	</c:if>
																</c:forEach>
															</c:when>


														</c:choose>
													</div>
													<!-- apply button for 3-4 Hump Params -->
													<div class="col-sm-12">

														<c:if test="${userDetails.getRoleId() !='6'}">

															<div align="center">
																<button type="submit" class="btn btn-success"
																	id="apply2_800">ApplySettings</button>
															</div>
														</c:if>

													</div>

												</div>
											</form:form>
										</div>


										<c:forEach items="${repParams}" var="bandDataList"
											varStatus="loop">
											<c:if
												test="${repParams.get(loop.index).getBandName()=='800' }">
												<div id="thresholdvalue8" class="tab-pane fade">

													<form:form id="RepeaterDtaForm_1_800"
														modelAttribute="cofigPageMapper" action="/nms/apply.htm"
														method="post">

														<div class="row">
															<div class="col-lg-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>800 Threshold UL</strong>
																			</h3>
																		</div>

																		<div class="panel-body">

																			<table class="table">
																				<tbody>
																					<tr>

																						<td><form:label path="thlvlul800"
																								class="control-label">800 Threshold UL</form:label></td>


																						<td><b><form:input path="thlvlul800"
																									class="form-control" type="number" min="-50"
																									max="50"
																									value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>
																						<c:if test="${userDetails.getRoleId() !='6'}">
																							<td><button type="submit"
																									class="btn btn-success" id="apply_1_800">ApplySettings</button></td>
																						</c:if>


																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="800" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>
																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1ul" /></td>
																					</tr>

																				</tbody>
																			</table>

																		</div>

																	</div>
																</div>

															</div>
														</div>
													</form:form>

													<form:form id="RepeaterDtaForm_2_800"
														modelAttribute="cofigPageMapper" action="/nms/apply.htm"
														method="post">

														<div class="row">
															<div class="col-lg-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>800 Threshold DL</strong>
																			</h3>
																		</div>

																		<div class="panel-body">

																			<table class="table">
																				<tbody>
																					<tr>
																						<td><form:label path="thlvldl800"
																								class="control-label">800 Threshold DL</form:label></td>


																						<td><b><form:input path="thlvldl800"
																									class="form-control" type="number" min="-50"
																									max="50"
																									value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>
																						<c:if test="${userDetails.getRoleId() !='6'}">
																							<td><button type="submit"
																									class="btn btn-success" id="apply_2_800">ApplySettings</button></td>
																						</c:if>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="800" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>
																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1dl" /></td>
																					</tr>

																				</tbody>
																			</table>

																		</div>

																	</div>
																</div>
															</div>
														</div>
													</form:form>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<!-- end of 800 -->
							</c:if>


							<!-- GSM -->

							<c:if test="${repParams.get(loop.index).getBandName()=='GSM' }">

								<div id="gsm" class="tab-pane fade">

									<div class="row">
										<div class="col-lg-12">
											<div class="block">

												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab" href="#home"><b>Main
																Params</b></a></li>
													<c:choose>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==0}">
															<li class="disabled"><a href="#g12hump"
																title='Not available'><b>Hump 1-2</b></a></li>
														</c:when>
														<c:otherwise>
															<li><a data-toggle="tab" href="#g12hump"><b>Hump
																		1-2</b></a></li>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==0 || repParams.get(loop.index).getTotalHumpCount()==1 ||repParams.get(loop.index).getTotalHumpCount()==2}">
															<li class="disabled"><a href="#g34hump"
																title='Not available'><b>Hump 3-4</b></a></li>
														</c:when>
														<c:otherwise>
															<li><a data-toggle="tab" href="#g34hump"><b>Hump
																		3-4</b></a></li>
														</c:otherwise>
													</c:choose>
													<!-- <li><a data-toggle="tab" href="#g34hump"><b>Hump
																3-4</b></a></li> -->
													<li><a data-toggle="tab" href="#thresholdvalue"><b>Threshold
																Value</b></a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="tab-content">

										<div id="home" class="tab-pane fade in active">

											<form:form id="RepeaterDtaForm"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">


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
																		<form:hidden path="BandName" />
																		<td><input id="BandName" name="BandName"
																			type="hidden" value="GSM" /></td>
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



																		<form:hidden path="snumber" />
																		<td><input id="snumber" name="snumber"
																			type="hidden" value="${message}" /></td>

																	</tr>

																	<tr>
																		<td><label for="paon_offdl">DL </label></td>
																		<td></td>
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

																		<c:when test="${repData.getRepeaterModel()=='0'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="60" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="60" /></b></td>
																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='1'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='2'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='3'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="70" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='4'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="45" max="75" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="45" max="75" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='5'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="80" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="80" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='6'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="50" max="90" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="50" max="90" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='7'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="50" max="90" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="50" max="90" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='8'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="55" max="95" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="55" max="95" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='9'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class=" control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }"
																							min="40" max="80" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }"
																							min="40" max="80" /></b></td>

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
																	<c:choose>

																		<c:when test="${repData.getRepeaterModel()=='0'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class=" control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-12" max="12"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class=" control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-12" max="12"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='1'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class=" control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-19" max="19"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class=" control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-19" max="19"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='2'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class=" control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-21" max="21"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-21" max="21"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='3'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-25" max="25"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-25" max="25"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='4'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-29" max="29"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-29" max="29"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='5'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-35" max="35"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-35" max="35"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='6'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-39" max="39"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-39" max="39"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='7'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-42" max="42"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-42" max="42"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='8'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-45" max="45"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-45" max="45"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='9'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" min="-32" max="32"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" min="-32" max="32"
																							class="form-control" placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>
																	</c:choose>

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



																		<td><b><form:input path="powerulin"
																					name="powerulin" id="powerulin"
																					class="form-control"
																					value="${repParams.get(loop.index).getPowerInUl() }"
																					readonly="true" /></b></td>

																		<td><form:label path="powerulin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>

																		<td><form:label path="powerdlin"
																				class="control-label">Power DL</form:label></td>


																		<td><b><form:input path="powerdlin"
																					class="form-control" id="powerdlin"
																					name="powerdlin"
																					value="${repParams.get(loop.index).getPowerInDl() }"
																					readonly="true" /></b></td>

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


													<div class="col-sm-4">
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>Channel Information</strong>
															</h4>

															<table class="table-striped">
																<tbody>
																	<tr>
																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='1'}">
																			<td><form:checkbox path="LoED" id="LoED"
																					checked="true" /> Manual</td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='0'}">
																			<td><form:checkbox path="LoED" id="LoED"
																					unchecked="false" /> Auto</td>
																		</c:if>
																		<c:choose>

																			<c:when
																				test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">



																				<td class="col-sm-2"><form:select
																						path="TotalHump">
																						<form:option
																							value="${repParams.get(loop.index).getTotalHumpCount()}"
																							label="${repParams.get(loop.index).getTotalHumpCount()}" />
																						<option value="0">0</option>
																						<option value="1">1</option>
																						<option value="2">2</option>
																						<option value="3">3</option>
																						<option value="4">4</option>
																					</form:select></td>
																				<td><form:label path="bwg0"
																						class=" control-label" style="color: white">Total Hump</form:label></td>
																			</c:when>

																			<c:when
																				test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																				<td class="col-sm-2"><form:select
																						path="TotalHump">
																						<form:option
																							value="${repParams.get(loop.index).getTotalHumpCount()}"
																							label="${repParams.get(loop.index).getTotalHumpCount()}" />
																						<option value="0">0</option>
																						<option value="1">1</option>
																						<option value="2">2</option>
																					</form:select></td>
																				<td><form:label path="bwg0"
																						class=" control-label" style="color: white">Total Hump</form:label></td>
																			</c:when>
																		</c:choose>

																	</tr>
																</tbody>
															</table>

															<c:choose>
																<c:when
																	test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">

																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="startchg0"
																							class=" control-label">Start
																			Channel</form:label></td>


																					<td><b><form:input path="startchg0"
																								type="number" class="form-control"
																								readonly="true" min="1" max="124"
																								value="${repParams.get(loop.index).getStartChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopchg0"
																							class="control-label">Stop
																			Channel</form:label></td>


																					<td><b><form:input path="stopchg0"
																								type="number" class="form-control"
																								readonly="true" min="1" max="124"
																								value="${repParams.get(loop.index).getStopChannel() }" /></b></td>
																					<td></td>

																				</tr>


																				<tr>
																					<td><form:label path="lofrequl0"
																							class=" control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequl0"
																								readonly="true" class="form-control"
																								type="number" min="890.0" max="914.8" step="0.1"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequl0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdl0"
																							class=" control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdl0"
																								readonly="true" class="form-control"
																								type="number" min="935.0" max="959.8" step="0.1"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdl0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>

																					<td><form:label path="bwg0"
																							class="control-label">Bandwidth</form:label></td>

																					<td><b><form:input path="bwg0"
																								class="form-control" readonly="true" value="0.2" /></b></td>

																					<td><form:label path="bwg0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>
																				<tr>
																					<td><form:label path="sawbw0"
																							class=" control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								readonly="true" class="form-control"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>
																			</tbody>
																		</table>

																	</c:if>

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">

																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="startchg0"
																							class=" control-label">Start
																			Channel</form:label></td>


																					<td><b><form:input path="startchg0"
																								type="number" class="form-control"
																								onblur="cfCalculatorGSMh0();" min="1" max="124"
																								value="${repParams.get(loop.index).getStartChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopchg0"
																							class=" control-label">Stop
																			Channel</form:label></td>


																					<td><b><form:input path="stopchg0"
																								type="number" class="form-control"
																								onblur="cfCalculatorGSMh0();" min="1" max="124"
																								value="${repParams.get(loop.index).getStopChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofrequl0"
																							class=" control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequl0"
																								class="form-control" type="number" min="890.0"
																								readonly="true" max="914.8" step="0.1"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequl0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdl0"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdl0"
																								class="form-control" type="number" min="935.0"
																								readonly="true" max="959.8" step="0.1"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdl0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>

																					<td><form:label path="bwg0"
																							class=" control-label">Bandwidth</form:label></td>

																					<td><b><form:input path="bwg0"
																								class="form-control" readonly="true" value="0.2" /></b></td>

																					<td><form:label path="bwg0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>


																				<tr>
																					<td><form:label path="sawbw0"
																							class=" control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								class="form-control"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>
																			</tbody>
																		</table>
																	</c:if>

																</c:when>

																<c:when
																	test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">


																		<table class="table table-striped">

																			<tbody>

																				<tr>
																					<td><form:label path="lofrequl0"
																							class=" control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequl0"
																								readonly="true" class="form-control"
																								type="number" min="824.0" max="849.0" step="0.1"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequl0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdl0"
																							class=" control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdl0"
																								readonly="true" class="form-control"
																								type="number" min="869.0" max="894.0" step="0.1"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdl0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>
																				<tr>
																					<td><form:label path="sawbw0"
																							class=" control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								readonly="true" class="form-control"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>
																			</tbody>
																		</table>
																	</c:if>

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">

																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="lofrequl0"
																							class="control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequl0"
																								class="form-control" type="number" min="824.0"
																								max="849.0" step="0.1"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequl0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdl0"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdl0"
																								class="form-control" type="number" min="869.0"
																								max="894.0" step="0.1"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdl0"
																							class=" control-label">Mhz</form:label></td>

																				</tr>

																			</tbody>
																			<tr>
																				<td><form:label path="sawbw0"
																						class="control-label">Saw
																			BW</form:label></td>


																				<td><b><form:input path="sawbw0"
																							class="form-control"
																							value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																				<td><form:label path="sawbw0"
																						class=" control-label">Mhz</form:label></td>

																			</tr>
																			</tbody>
																		</table>
																	</c:if>

																</c:when>

															</c:choose>

														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-sm-4">
														<div class="block">
															<table>
																<tr>
																	<td><label for="alclvlon_off">ALC ON/OFF </label></td>
																	<td></td>
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
															<button type="submit" class="btn btn-success" id="apply">ApplySettings</button>
														</c:if>
													</div>

													<div class="col-sm-4">
														<div class="block">
															<table>
																<tr>
																	<td><form:label path="gsmversion"
																			class="control-label">
																			Version</form:label></td>


																	<td><b><form:input path="gsmversion"
																				class="form-controlnew" readonly="true"
																				value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>

																	<td></td>

																</tr>
															</table>
														</div>
													</div>

												</div>
											</form:form>

										</div>
										<c:choose>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==0}">
												<li class="hide" style="display: hidden;"></li>
												<div id="g12hump" style="display: hidden;"></div>
												<li class="hide" style="display: hidden;"></li>
												<div id="g34hump" style="display: hidden;"></div>
											</c:when>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==1}">

												<style>
.g2hump {
	display: none;
}
</style>

												<li class="hide" style="display: hidden;"></li>
												<div id="g34hump" style="display: hidden;"></div>
											</c:when>

											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==2}">
												<div id="g34hump" style="display: hidden;"></div>
											</c:when>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==3}">
												<!-- <li id="ghump4" style="display: hidden;"></li> -->
												<style>
.g4hump {
	display: none;
}
</style>

											</c:when>

										</c:choose>

										<!-- end of active pane -->

										<!-- GSM 1 & 2 Hump Params -->
										<div id="g12hump" class="tab-pane fade">

											<form:form id="RepeaterDtaForm1"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">

												<div class="row">
													<div class="tab-content">

														<c:choose>

															<c:when
																test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																<c:forEach items="${humpParams}" var="humpDataList"
																	varStatus="loop">



																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='GSM' && humpParams.get(loop.index).getHumpId()== 1}">



																		<div id="g1hump" class="col-sm-6">
																			<div class="block">
																				<table class="table table-striped">
																					<thead>
																						<tr>
																							<th><b>Hump-1</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="Compensation1HumpUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpUl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="Compensation1HumpDl"
																									class="control-label">DL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpDl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>

																						<tr>

																							<td><label for="humpon_off1">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" unchecked="false" /></td>
																							</c:if>

																							<form:hidden path="Identifier" />
																							<td><input id="Identifier" name="Identifier"
																								type="hidden" value="12" /></td>
																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="GSM" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>

																						</tr>

																						<tr>
																							<td><form:label path="startchg1"
																									class="control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startchg1"
																										type="number" name="startChannel"
																										class="form-control"
																										onblur="cfCalculatorGSMh1();" min="1"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopchg1"
																									class="control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopchg1"
																										type="number" name="stopChannel"
																										class="form-control"
																										onblur="cfCalculatorGSMh1_Stop();" min="1"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequl1"
																									class="control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl1"
																										name="cful" type="number" step="0.1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<!-- min="890.0" max="914.8"  -->

																							<td><form:label path="lofrequl1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl1"
																									class=" control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl1"
																										name="cfdl" type="number" step="0.1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>
																							<!-- min="935.0" max="959.8"  -->

																							<td><form:label path="lofreqdl1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="bwg1"
																									class=" control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bwg1"
																										class="form-control" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth()}" /></b></td>

																							<td><form:label path="bwg1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw1"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>

																	<!-- end of hump-1 -->
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='GSM' && humpParams.get(loop.index).getHumpId()== 2}">
																		<div class="g2hump col-sm-6 ">
																			<div class="block">
																				<table class="table table-striped">
																					<thead>
																						<tr>
																							<th><b>Hump-2</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="CompensationAllUl"
																									class=" control-label">UL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllUl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="CompensationAllDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllDl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>
																						<tr>

																							<td><label for="humpon_off2">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" unchecked="false" /></td>
																							</c:if>
																							<td></td>

																						</tr>



																						<tr>
																							<td><form:label path="startchg2"
																									class=" control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startchg2"
																										class="form-control" type="number"
																										onblur="cfCalculatorGSMh2();" min="1"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopchg2"
																									class=" control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopchg2"
																										class="form-control" type="number"
																										onblur="cfCalculatorGSMh2_Stop();" min="1"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequl2"
																									class=" control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl2"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<%-- min="890.0" max="914.8" --%>
																							<td><form:label path="lofrequl2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl2"
																									class="control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl2"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>
																							<%-- min="935.0" max="959.8" --%>

																							<td><form:label path="lofreqdl2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="bwg2"
																									class=" control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bwg2"
																										class="form-control" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth()}" /></b></td>

																							<td><form:label path="bwg2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw2"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw2"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>

																	<!-- end of hump-2 -->

																</c:forEach>

															</c:when>

															<c:when
																test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																<c:forEach items="${humpParams}" var="humpDataList"
																	varStatus="loop">

																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='GSM' && humpParams.get(loop.index).getHumpId()== 1}">

																		<div id="g1hump" class="col-sm-6">
																			<div class="block">
																				<table class="table">

																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="Compensation1HumpUl"
																									class=" control-label">UL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpUl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="Compensation1HumpDl"
																									class="control-label">DL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpDl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>

																						<tr>


																							<td><label for="humpon_off1">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" unchecked="false" /></td>
																							</c:if>

																							<form:hidden path="Identifier" />
																							<td><input id="Identifier" name="Identifier"
																								type="hidden" value="12" /></td>
																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="GSM" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofrequl1"
																									class="control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl1"
																										name="cful" type="number" step="0.1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<!-- min="890.0" max="914.8"  -->

																							<td><form:label path="lofrequl1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>


																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl1"
																									class=" control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl1"
																										name="cfdl" type="number" step="0.1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>
																							<!-- min="935.0" max="959.8"  -->

																							<td><form:label path="lofreqdl1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw1"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw1"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw1"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-1 -->
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='GSM' && humpParams.get(loop.index).getHumpId()== 2}">
																		<div class="g2hump col-sm-6">
																			<div class="block">
																				<table class="table">
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="CompensationAllUl"
																									class=" control-label">UL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllUl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="CompensationAllDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllDl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>
																						<tr>

																							<td><label for="humpon_off2">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" unchecked="false" /></td>
																							</c:if>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofrequl2"
																									class=" control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl2"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																							<td><form:label path="lofrequl2"
																									class=" control-label">Mhz</form:label></td>


																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl2"
																									class=" control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl2"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdl2"
																									class=" control-label">Mhz</form:label></td>


																						</tr>

																						<tr>
																							<td><form:label path="sawbw2"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw2"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw2"
																									class=" control-label">Mhz</form:label></td>

																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-2 -->

																</c:forEach>

															</c:when>

														</c:choose>
													</div>

													<!-- </div> -->

												</div>

												<!-- apply button for 1 -2 Hump Params -->
												<div class="col-lg-12">

													<c:if test="${userDetails.getRoleId() !='6'}">

														<div align="center">
															<button type="submit" class="btn btn-success" id="apply1">ApplySettings</button>
														</div>
													</c:if>

												</div>

											</form:form>
										</div>

										<!-- GSM 3 & 4 Hump Params -->
										<div id="g34hump" class="tab-pane fade">

											<form:form id="RepeaterDtaForm2"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">

												<c:if
													test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">
													<div id="gsmhump3_4_tab" style="display: hidden;"></div>
												</c:if>


												<div class="row">


													<!-- <h3 style="color: white">Hump Configurations</h3>

															<ul class="nav nav-tabs">
																<li id="ghump3" class="active"><a data-toggle="tab"
																	href="#hump3"><b>Hump-3</b></a></li>
																<li id="ghump4"><a data-toggle="tab" href="#hump4"><b>Hump-4</b></a></li>
															</ul> -->

													<div class="tab-content">
														<c:choose>

															<c:when
																test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																<c:forEach items="${humpParams}" var="humpDataList"
																	varStatus="loop">
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='GSM' && humpParams.get(loop.index).getHumpId()== 3}">
																		<div id="g3hump" class="col-sm-6">
																			<div class="block">
																				<table class="table table-striped">

																					<thead>
																						<tr>
																							<th><b>Hump-3</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="Compensation1HumpUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpUl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="Compensation1HumpDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpDl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>

																						<tr>
																							<td><label for="humpon_off3">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off3"
																										id="humpon_off3" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off3"
																										id="humpon_off3" unchecked="false" /></td>
																							</c:if>



																							<form:hidden path="Identifier" />
																							<td><input id="Identifier" name="Identifier"
																								type="hidden" value="34" /></td>
																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="GSM" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>
																						</tr>



																						<tr>
																							<td><form:label path="startchg3"
																									class="control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startchg3"
																										type="number" class="form-control"
																										onblur="cfCalculatorGSMh3();" min="1"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopchg3"
																									class="control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopchg3"
																										type="number" class="form-control"
																										onblur="cfCalculatorGSMh3_Stop();" min="1"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequl3"
																									class=" control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl3"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<%-- min="890.0" max="914.8" --%>
																							<td><form:label path="lofrequl3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>


																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl3"
																									class=" control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl3"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>
																							<%-- min="935.0" max="959.8" --%>

																							<td><form:label path="lofreqdl3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>


																						</tr>

																						<tr>
																							<td><form:label path="bwg3"
																									class="control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bwg3"
																										class="form-control" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth()}" /></b></td>

																							<td><form:label path="bwg3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw3"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw3"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-3 -->
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='GSM' && humpParams.get(loop.index).getHumpId()== 4}">
																		<div class="g4hump col-sm-6">
																			<div class="block">
																				<table class="table table-striped">
																					<thead>
																						<tr>
																							<th><b>Hump-4</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="CompensationAllUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllUl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="CompensationAllDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllDl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>
																						<tr>
																							<td><label for="humpon_off4">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off4"
																										id="humpon_off4" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off4"
																										id="humpon_off4" unchecked="false" /></td>
																							</c:if>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="startchg4"
																									class="control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startchg4"
																										type="number" class="form-control"
																										onblur="cfCalculatorGSMh4();" min="1"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopchg4"
																									class="control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopchg4"
																										type="number" class="form-control"
																										onblur="cfCalculatorGSMh4_Stop();" min="1"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequl4"
																									class=" control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl4"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>
																							<%-- min="890.0" max="914.8" --%>

																							<td><form:label path="lofrequl4"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl4"
																									class=" control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl4"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>
																							<%-- min="935.0" max="959.8" --%>

																							<td><form:label path="lofreqdl4"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="bwg4"
																									class="control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bwg4"
																										class="form-control" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth()}" /></b></td>

																							<td><form:label path="bwg4"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw4"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw4"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw4"
																									class=" control-label">Mhz</form:label></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																		<!-- end of hump-4 -->
																	</c:if>
																</c:forEach>
															</c:when>

															<c:when
																test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																<c:forEach items="${humpParams}" var="humpDataList"
																	varStatus="loop">
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='GSM' && humpParams.get(loop.index).getHumpId()== 3}">
																		<div id="g3hump" class="col-sm-6">
																			<div class="block">
																				<table class="table">
																					<tbody>
																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="Compensation1HumpUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpUl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="Compensation1HumpDl"
																									class="control-label">DL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpDl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>

																						<tr>
																							<td><label for="humpon_off3">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off3"
																										id="humpon_off3" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off3"
																										id="humpon_off3" unchecked="false" /></td>
																							</c:if>



																							<form:hidden path="Identifier" />
																							<td><input id="Identifier" name="Identifier"
																								type="hidden" value="34" /></td>
																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="GSM" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>
																						</tr>


																						<tr>
																							<td><form:label path="lofrequl3"
																									class="control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl3"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																							<td><form:label path="lofrequl3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl3"
																									class="control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl3"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdl3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw3"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw3"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw3"
																									class=" control-label">Mhz</form:label></td>
																							<td></td>
																							<td></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-3 -->
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='GSM' && humpParams.get(loop.index).getHumpId()== 4}">
																		<div id="g4hump" class="col-sm-6">
																			<div class="block">
																				<table class="table">
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="CompensationAllUl"
																									class=" control-label">UL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllUl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="CompensationAllDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllDl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>
																						<tr>
																							<td><label for="humpon_off4">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off4"
																										id="humpon_off4" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off4"
																										id="humpon_off4" unchecked="false" /></td>
																							</c:if>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofrequl4"
																									class=" control-label">CF
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequl4"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																							<td><form:label path="lofrequl4"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdl4"
																									class="control-label">CF
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdl4"
																										type="number" step="0.1" class="form-control"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdl4"
																									class=" control-label">Mhz</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="sawbw4"
																									class="control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw4"
																										class="form-control"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw4"
																									class=" control-label">Mhz</form:label></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																		<!-- end of hump-4 -->
																	</c:if>
																</c:forEach>
															</c:when>

														</c:choose>
													</div>
													<!-- apply button for 3-4 Hump Params -->
													<div class="col-sm-12">

														<c:if test="${userDetails.getRoleId() !='6'}">

															<div align="center">
																<button type="submit" class="btn btn-success"
																	id="apply2">ApplySettings</button>
															</div>
														</c:if>

													</div>

												</div>
											</form:form>
										</div>

										<div id="band" class="tab-pane fade"></div>

										<c:forEach items="${repParams}" var="bandDataList"
											varStatus="loop">
											<c:if
												test="${repParams.get(loop.index).getBandName()=='GSM' }">
												<div id="thresholdvalue" class="tab-pane fade">

													<form:form id="RepeaterDtaForm_1"
														modelAttribute="cofigPageMapper" action="/nms/apply.htm"
														method="post">

														<div class="row">
															<div class="col-lg-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>900 Threshold UL</strong>
																			</h3>
																		</div>

																		<div class="panel-body">

																			<table class="table">
																				<tbody>
																					<tr>

																						<td><form:label path="thlvlulgsm"
																								class="control-label">900 Threshold UL</form:label></td>


																						<td><b><form:input path="thlvlulgsm"
																									class="form-control" type="number" min="-50"
																									max="50"
																									value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>
																						<c:if test="${userDetails.getRoleId() !='6'}">
																							<td><button type="submit"
																									class="btn btn-success" id="apply_1">ApplySettings</button></td>
																						</c:if>


																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="GSM" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>
																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1ul" /></td>
																					</tr>

																				</tbody>
																			</table>

																		</div>

																	</div>
																</div>

															</div>
														</div>
													</form:form>

													<form:form id="RepeaterDtaForm_2"
														modelAttribute="cofigPageMapper" action="/nms/apply.htm"
														method="post">

														<div class="row">
															<div class="col-lg-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>900 Threshold DL</strong>
																			</h3>
																		</div>

																		<div class="panel-body">

																			<table class="table">
																				<tbody>
																					<tr>
																						<td><form:label path="thlvldlgsm"
																								class="control-label">900 Threshold DL</form:label></td>


																						<td><b><form:input path="thlvldlgsm"
																									class="form-control" type="number" min="-50"
																									max="50"
																									value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>
																						<c:if test="${userDetails.getRoleId() !='6'}">
																							<td><button type="submit"
																									class="btn btn-success" id="apply_2">ApplySettings</button></td>
																						</c:if>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="GSM" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>
																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1dl" /></td>
																					</tr>

																				</tbody>
																			</table>

																		</div>

																	</div>
																</div>
															</div>
														</div>
													</form:form>
												</div>
											</c:if>
										</c:forEach>

									</div>
									<!-- end of tab content sha-->
									<%-- </c:if> --%>
								</div>
								<!-- end of gsm -->
							</c:if>

							<c:if test="${repParams.get(loop.index).getBandName()=='DCS1' }">


								<div id="dcs1" class="tab-pane fade">

									<div class="row">
										<div class="col-sm-12">
											<div class="block">
												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab" href="#home1"><b>Main
																Params</b></a></li>
													<c:choose>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==0}">
															<li class="disabled"><a href="#d112hump"
																title='Not available'><b>Hump 1-2</b></a></li>
														</c:when>
														<c:otherwise>
															<li><a data-toggle="tab" href="#d112hump"><b>Hump
																		1-2</b></a></li>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==0 || repParams.get(loop.index).getTotalHumpCount()==1 ||repParams.get(loop.index).getTotalHumpCount()==2}">
															<li class="disabled"><a href="#d134hump"
																title='Not available'><b>Hump 3-4</b></a></li>
														</c:when>
														<c:otherwise>
															<li><a data-toggle="tab" href="#d134hump"><b>Hump
																		3-4</b></a></li>
														</c:otherwise>
													</c:choose>

													<li><a data-toggle="tab" href="#thresholdvalue1"><b>Threshold
																Value</b></a></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="tab-content">

										<div id="home1" class="tab-pane fade in active">

											<form:form id="RepeaterDtaForm4"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">


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
																		<form:hidden path="BandName" />
																		<td><input id="BandName" name="BandName"
																			type="hidden" value="DCS1" /></td>
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



																		<form:hidden path="snumber" />
																		<td><input id="snumber" name="snumber"
																			type="hidden" value="${message}" /></td>

																	</tr>

																	<tr>
																		<td><label for="paon_offdl">DL </label></td>
																		<td></td>
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

																		<c:when test="${repData.getRepeaterModel()=='0'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='1'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='2'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='3'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='4'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='5'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='6'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='7'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='8'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

																				<td><form:label path="Gaindl"
																						class="control-label">dB</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='9'}">

																			<tr>
																				<!-- <div class="form-group"> -->
																				<td><form:label path="Gainul"
																						class="control-label">UL</form:label></td>

																				<!-- <div class="col-sm-5"> -->
																				<td><b><form:input path="Gainul"
																							name="Gainul" type="number" id="Gainul"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainUl() }" /></b></td>

																				<td><form:label path="Gainul"
																						class="control-label">dB</form:label></td>
																			</tr>

																			<tr>
																				<td><form:label path="Gaindl"
																						class="control-label">DL</form:label></td>

																				<td><b><form:input path="Gaindl"
																							name="Gaindl" type="number" id="Gaindl"
																							class="form-control"
																							value="${repParams.get(loop.index).getGainDl() }" /></b></td>

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
																	<c:choose>

																		<c:when test="${repData.getRepeaterModel()=='0'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='1'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='2'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='3'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='4'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='5'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='6'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='7'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='8'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>

																		<c:when test="${repData.getRepeaterModel()=='9'}">
																			<tr>
																				<td><form:label path="alclvlul"
																						class="control-label">LVL UL</form:label></td>


																				<td><b><form:input path="alclvlul"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																				<td><form:label path="alclvlul"
																						class="control-label">dBm</form:label></td>

																			</tr>
																			<tr>

																				<td><form:label path="alclvldl"
																						class="control-label">LVL DL</form:label></td>


																				<td><b><form:input path="alclvldl"
																							type="number" class="form-control"
																							placeholder="Normal input"
																							value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																				<td><form:label path="alclvldl"
																						class="control-label">dBm</form:label></td>

																			</tr>
																		</c:when>
																	</c:choose>

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



																		<td><b><form:input path="powerulin"
																					name="powerulin" id="powerulin"
																					class="form-control"
																					value="${repParams.get(loop.index).getPowerInUl() }"
																					readonly="true" /></b></td>

																		<td><form:label path="powerulin"
																				class="control-label">dBm</form:label></td>
																	</tr>
																	<tr>

																		<td><form:label path="powerdlin"
																				class="control-label">Power DL</form:label></td>


																		<td><b><form:input path="powerdlin"
																					class="form-control" id="powerdlin"
																					name="powerdlin"
																					value="${repParams.get(loop.index).getPowerInDl() }"
																					readonly="true" /></b></td>

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


													<div class="col-sm-4">
														<div class="block">
															<h4 align="center" style="color: white">
																<strong>Channel Information</strong>
															</h4>

															<table class="table-striped">
																<tbody>
																	<tr>
																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='1'}">
																			<td><form:checkbox path="LoED" id="LoED"
																					checked="true" /> Manual</td>
																		</c:if>
																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='0'}">
																			<td><form:checkbox path="LoED" id="LoED"
																					unchecked="false" /> Auto</td>
																		</c:if>
																		<c:choose>

																			<c:when
																				test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">



																				<td class="col-sm-2"><form:select
																						path="TotalHump">
																						<form:option
																							value="${repParams.get(loop.index).getTotalHumpCount()}"
																							label="${repParams.get(loop.index).getTotalHumpCount()}" />
																						<option value="0">0</option>
																						<option value="1">1</option>
																						<option value="2">2</option>
																						<option value="3">3</option>
																						<option value="4">4</option>
																					</form:select></td>
																				<td><form:label path="bwg0"
																						class=" control-label" style="color: white">Total Hump</form:label></td>
																			</c:when>

																			<c:when
																				test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																				<td class="col-sm-2"><form:select
																						path="TotalHump">
																						<form:option
																							value="${repParams.get(loop.index).getTotalHumpCount()}"
																							label="${repParams.get(loop.index).getTotalHumpCount()}" />
																						<option value="0">0</option>
																						<option value="1">1</option>
																						<option value="2">2</option>
																					</form:select></td>
																				<td><form:label path="bwg0"
																						class=" control-label" style="color: white">Total Hump</form:label></td>
																			</c:when>
																		</c:choose>

																	</tr>
																</tbody>
															</table>

															<c:choose>
																<c:when
																	test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">


																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="startchd10"
																							class="control-label">Start
																			Channel</form:label></td>


																					<td><b><form:input path="startchd10"
																								type="number" class="form-control"
																								readonly="true" onblur="cfCalculatorDCS1h0();"
																								value="${repParams.get(loop.index).getStartChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopchd10"
																							class="control-label">Stop
																			Channel</form:label></td>


																					<td><b><form:input path="stopchd10"
																								type="number" class="form-control"
																								readonly="true" onblur="cfCalculatorDCS1h0();"
																								value="${repParams.get(loop.index).getStopChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofrequld10"
																							class="control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequld10"
																								type="number" readonly="true" step="0.1"
																								class="form-control"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdld10"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdld10"
																								type="number" readonly="true" step="0.1"
																								class="form-control"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdld10"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="bwd10"
																							class="control-label">Bandwidth</form:label></td>

																					<td><b><form:input path="bwd10"
																								class="form-control" readonly="true" value="0.2" /></b></td>

																					<td><form:label path="bwd10"
																							class="control-label">dBm</form:label></td>

																				</tr>


																				<tr>
																					<td><form:label path="sawbw0"
																							class="control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								class="form-control" readonly="true"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</tbody>
																		</table>

																	</c:if>

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">

																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="startchd10"
																							class="control-label">Start
																			Channel</form:label></td>


																					<td><b><form:input path="startchd10"
																								type="number" class="form-control"
																								onblur="cfCalculatorDCS1h0();"
																								value="${repParams.get(loop.index).getStartChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopchd10"
																							class="control-label">Stop
																			Channel</form:label></td>


																					<td><b><form:input path="stopchd10"
																								type="number" class="form-control"
																								onblur="cfCalculatorDCS1h0();"
																								value="${repParams.get(loop.index).getStopChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofrequld10"
																							class="control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequld10"
																								type="number" readonly="true" step="0.1"
																								class="form-control"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdld10"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdld10"
																								type="number" readonly="true" step="0.1"
																								class="form-control"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>

																					<td><form:label path="bwd10"
																							class="control-label">Bandwidth</form:label></td>

																					<td><b><form:input path="bwd10"
																								class="form-control" readonly="true" value="0.2" /></b></td>

																					<td><form:label path="bwd10"
																							class="control-label">dBm</form:label></td>

																				</tr>


																				<tr>
																					<td><form:label path="sawbw0"
																							class="control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								class="form-control" value="0.2" /></b></td>

																					<td><form:label path="sawbw0"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</tbody>
																		</table>

																	</c:if>

																</c:when>

																<c:when
																	test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">

																		<table class="table table-striped">

																			<tbody>

																				<tr>
																					<td><form:label path="lofrequld10"
																							class="control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequld10"
																								type="number" min="1850.0" max="1910.0"
																								readonly="true" step="0.1" class="form-control"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdld10"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdld10"
																								type="number" min="1930.0" max="1990.0"
																								readonly="true" step="0.1" class="form-control"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="sawbw0"
																							class="control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								class="form-control" readonly="true"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</tbody>
																		</table>

																	</c:if>

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">


																		<table class="table table-striped">

																			<tbody>

																				<tr>
																					<td><form:label path="lofrequld10"
																							class="control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequld10"
																								type="number" min="1850.0" max="1910.0"
																								step="0.1" class="form-control"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdld10"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdld10"
																								type="number" min="1930.0" max="1990.0"
																								step="0.1" class="form-control"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="sawbw0"
																							class="control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								class="form-control"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</tbody>
																		</table>

																	</c:if>

																</c:when>

																<c:when test="${repData.getReptype() == '6' }">

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='0'}">


																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="startchd10"
																							class="control-label">Start
																			Channel</form:label></td>


																					<td><b><form:input path="startchd10"
																								type="number" class="form-control"
																								readonly="true" onblur="cfCalculatorDCS1h0();"
																								value="${repParams.get(loop.index).getStartChannel() }"
																								min="512" max="885" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopchd10"
																							class="control-label">Stop
																			Channel</form:label></td>


																					<td><b><form:input path="stopchd10"
																								type="number" class="form-control"
																								readonly="true" onblur="cfCalculatorDCS1h0();"
																								value="${repParams.get(loop.index).getStopChannel() }"
																								min="512" max="885" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofrequld10"
																							class="control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequld10"
																								type="number" min="1710.2" max="1784.8"
																								readonly="true" step="0.1" class="form-control"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdld10"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdld10"
																								type="number" min="1805.2" max="1879.8"
																								readonly="true" step="0.1" class="form-control"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdld10"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="bwd10"
																							class="control-label">Bandwidth</form:label></td>

																					<td><b><form:input path="bwd10"
																								class="form-control" readonly="true"
																								value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																					<td><form:label path="bwd10"
																							class="control-label">dBm</form:label></td>

																				</tr>


																				<tr>
																					<td><form:label path="sawbw0"
																							class="control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								class="form-control" readonly="true"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</tbody>
																		</table>

																	</c:if>

																	<c:if
																		test="${repParams.get(loop.index).getLoEnable()=='1'}">

																		<table class="table table-striped">
																			<tbody>

																				<tr>
																					<td><form:label path="startchd10"
																							class="control-label">Start
																			Channel</form:label></td>


																					<td><b><form:input path="startchd10"
																								type="number" class="form-control"
																								onblur="cfCalculatorDCS1h0();"
																								value="${repParams.get(loop.index).getStartChannel() }"
																								min="512" max="885" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopchd10"
																							class="control-label">Stop
																			Channel</form:label></td>


																					<td><b><form:input path="stopchd10"
																								type="number" class="form-control"
																								onblur="cfCalculatorDCS1h0();"
																								value="${repParams.get(loop.index).getStopChannel() }"
																								min="512" max="885" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofrequld10"
																							class="control-label">LO
																			UL</form:label></td>


																					<td><b><form:input path="lofrequld10"
																								type="number" min="1710.2" max="1784.8"
																								readonly="true" step="0.1" class="form-control"
																								value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdld10"
																							class="control-label">LO
																			DL</form:label></td>


																					<td><b><form:input path="lofreqdld10"
																								type="number" min="1805.2" max="1879.8"
																								readonly="true" step="0.1" class="form-control"
																								value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdld10"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>

																					<td><form:label path="bwd10"
																							class="control-label">Bandwidth</form:label></td>

																					<td><b><form:input path="bwd10"
																								class="form-control" readonly="true"
																								value="${repParams.get(loop.index).getBandWidth()}" /></b></td>

																					<td><form:label path="bwd10"
																							class="control-label">dBm</form:label></td>

																				</tr>


																				<tr>
																					<td><form:label path="sawbw0"
																							class="control-label">Saw
																			BW</form:label></td>


																					<td><b><form:input path="sawbw0"
																								class="form-control"
																								value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																					<td><form:label path="sawbw0"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</tbody>
																		</table>

																	</c:if>

																</c:when>

															</c:choose>

														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-sm-4">
														<div class="block">
															<table>
																<tr>
																	<td><label for="alclvlon_off">ALC ON/OFF </label></td>
																	<td></td>
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

													<div class="col-sm-4" align="center">
														<c:if test="${userDetails.getRoleId() !='6'}">
															<button type="submit" class="btn btn-success"
																id="apply12">ApplySettings</button>
														</c:if>
													</div>

													<div class="col-sm-4">
														<div class="block">
															<table>
																<tr>
																	<td><form:label path="dcsversion"
																			class="control-label">
																			Version</form:label></td>


																	<td><b><form:input path="dcsversion"
																				class="form-controlnew" readonly="true"
																				value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>

																	<td></td>

																</tr>
															</table>
														</div>
													</div>

												</div>
											</form:form>
										</div>

										<c:choose>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==0}">
												<li class="hide" style="display: hidden;"></li>
												<div id="d112hump" style="display: hidden;"></div>
												<li class="hide" style="display: hidden;"></li>
												<div id="d134hump" style="display: hidden;"></div>
											</c:when>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==1}">
												<style>
.humpd12 {
	display: none;
}
</style>

												<li class="hide" style="display: hidden;"></li>
												<div id="d134hump" style="display: hidden;"></div>
											</c:when>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==2}">
												<div id="d134hump" style="display: hidden;"></div>
											</c:when>
											<c:when
												test="${repParams.get(loop.index).getTotalHumpCount()==3}">

												<style>
.humpd14 {
	display: none;
}
</style>


											</c:when>
										</c:choose>

										<!-- end of active pane -->

										<!-- DCS1 1 & 2 Hump Params -->
										<div id="d112hump" class="tab-pane fade">
											<form:form id="RepeaterDtaForm5"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">
												<div class="row">												
													<div class="tab-content">
														<c:choose>
															<c:when
																test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																<c:forEach items="${humpParams}" var="humpDataList"
																	varStatus="loop">

																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='DCS1' && humpParams.get(loop.index).getHumpId()== 1}">


																		<div id="humpd11" class="col-lg-6">
																			<div class="block">
																				<table class="table table-striped">

																					<thead>
																						<tr>
																							<th><b>Hump-1</b></th>
																						</tr>
																					</thead>

																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="Compensation1HumpUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpUl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="Compensation1HumpDl"
																									class="control-label">DL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpDl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																						</tr>
																						<tr>

																							<td><label for="humpon_off1">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" unchecked="false" /></td>
																							</c:if>


																							<form:hidden path="Identifier" />
																							<td><input id="Identifier" name="Identifier"
																								type="hidden" value="12" /></td>
																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="DCS1" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>
																						</tr>



																						<tr>
																							<td><form:label path="startchd11"
																									class="control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startchd11"
																										onblur="cfCalculatorDCS1h1();"
																										class="form-control" type="number"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopchd11"
																									class="control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopchd11"
																										class="form-control" type="number"
																										onblur="cfCalculatorDCS1h1();"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																							<td></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequld11"
																									class="control-label">LO
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequld11"
																										type="number" step="0.1" class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																							<td><form:label path="lofrequld11"
																									class="control-label">dBm</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdld11"
																									class="control-label">LO
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdld11"
																										type="number" step="0.1" class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdld11"
																									class="control-label">dBm</form:label></td>
																							<td></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="bwd11"
																									class="control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bwd11"
																										class="form-control"
																										placeholder="Normal input" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																							<td><form:label path="bwd11"
																									class="control-label">dBm</form:label></td>
																							<td></td>
																							<td></td>
																							<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																						</tr>

																						<tr>
																							<td><form:label path="sawbw1"
																									class="control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw1"
																										class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw1"
																									class="control-label">dBm</form:label></td>
																							<td></td>
																							<td></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-1 -->
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='DCS1' && humpParams.get(loop.index).getHumpId()== 2}">
																		<div class="humpd12 col-lg-6">
																			<div class="block">
																				<table class="table table-striped">

																					<thead>
																						<tr>
																							<th><b>Hump-2</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="CompensationAllUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllUl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>

																							<td><form:label path="CompensationAllUl"
																									class="control-label">dBm</form:label></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="CompensationAllDl"
																									class=" control-label">DL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllDl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>

																							<td><form:label path="CompensationAllDl"
																									class="control-label">dBm</form:label></td>
																						</tr>
																						<tr>

																							<td><label for="humpon_off2">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" unchecked="false" /></td>
																							</c:if>
																							<td></td>
																						</tr>



																						<tr>
																							<td><form:label path="startchd12"
																									class=" control-label">Start
																					Channel</form:label></td>


																							<td><b><form:input path="startchd12"
																										class="form-control" type="number"
																										onblur="cfCalculatorDCS1h2();"
																										value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																							<td></td>

																						</tr>

																						<tr>
																							<td><form:label path="stopchd12"
																									class="control-label">Stop
																					Channel</form:label></td>


																							<td><b><form:input path="stopchd12"
																										class="form-control" type="number"
																										onblur="cfCalculatorDCS1h2();"
																										value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																							<td></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequld12"
																									class="control-label">LO
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequld12"
																										type="number" step="0.1" class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																							<td><form:label path="lofrequld12"
																									class="control-label">dBm</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdld12"
																									class="control-label">LO
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdld12"
																										type="number" step="0.1" class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdld12"
																									class="control-label">dBm</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="bwd12"
																									class="control-label">Bandwidth</form:label></td>


																							<td><b><form:input path="bwd12"
																										class="form-control"
																										placeholder="Normal input" readonly="true"
																										value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																							<td><form:label path="bwd12"
																									class="control-label">dBm</form:label></td>
																							<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																						</tr>

																						<tr>
																							<td><form:label path="sawbw2"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw2"
																										class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw2"
																									class="control-label">dBm</form:label></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-2 -->

																</c:forEach>
															</c:when>

															<c:when
																test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																<c:forEach items="${humpParams}" var="humpDataList"
																	varStatus="loop">

																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='DCS1' && humpParams.get(loop.index).getHumpId()== 1}">

																		<div id="humpd11" class="col-lg-6">
																			<div class="block">
																				<table class="table table-striped">

																					<thead>
																						<tr>
																							<th><b>Hump-1</b></th>
																						</tr>
																					</thead>
																					<tbody>



																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="Compensation1HumpUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpUl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>

																							<td><form:label path="Compensation1HumpUl"
																									class="control-label">dBm</form:label></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="Compensation1HumpDl"
																									class="control-label">DL</form:label></td>
																							<td><b><form:input
																										path="Compensation1HumpDl"
																										class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>

																							<td><form:label path="Compensation1HumpDl"
																									class="control-label">dBm</form:label></td>
																						</tr>
																						<tr>

																							<td><label for="humpon_off1">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off1"
																										id="humpon_off1" unchecked="false" /></td>
																							</c:if>


																							<form:hidden path="Identifier" />
																							<td><input id="Identifier" name="Identifier"
																								type="hidden" value="12" /></td>
																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="DCS1" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequld11"
																									class="control-label">LO
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequld11"
																										type="number" step="0.1" class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																							<td><form:label path="lofrequld11"
																									class="control-label">dBm</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdld11"
																									class="control-label">LO
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdld11"
																										type="number" step="0.1" class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdld11"
																									class="control-label">dBm</form:label></td>

																						</tr>



																						<tr>
																							<td><form:label path="sawbw1"
																									class="control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw1"
																										class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw1"
																									class="control-label">dBm</form:label></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-1 -->
																	<c:if
																		test="${humpParams.get(loop.index).getBandName()=='DCS1' && humpParams.get(loop.index).getHumpId()== 2}">
																		<div class="humpd12 col-lg-6">
																			<div class="block">
																				<table class="table table-striped">

																					<thead>
																						<tr>
																							<th><b>Hump-2</b></th>
																						</tr>
																					</thead>
																					<tbody>

																						<!-- hidden compensation value -->
																						<tr class="hide">

																							<td><form:label path="CompensationAllUl"
																									class="control-label">UL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllUl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>

																							<td><form:label path="CompensationAllUl"
																									class="control-label">dBm</form:label></td>
																						</tr>
																						<tr class="hide">
																							<td><form:label path="CompensationAllDl"
																									class="control-label">DL</form:label></td>
																							<td><b><form:input
																										path="CompensationAllDl" class="form-control"
																										value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>

																							<td><form:label path="CompensationAllDl"
																									class="control-label">dBm</form:label></td>
																						</tr>
																						<tr>

																							<td><label for="humpon_off2">ON/OFF
																							</label></td>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" checked="true" /></td>
																							</c:if>
																							<c:if
																								test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																								<td><form:checkbox path="humpon_off2"
																										id="humpon_off2" unchecked="false" /></td>
																							</c:if>
																						</tr>

																						<tr>
																							<td><form:label path="lofrequld12"
																									class="control-label">LO
																					Freq UL</form:label></td>


																							<td><b><form:input path="lofrequld12"
																										type="number" step="0.1" class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																							<td><form:label path="lofrequld12"
																									class="control-label">dBm</form:label></td>

																						</tr>

																						<tr>
																							<td><form:label path="lofreqdld12"
																									class="control-label">LO
																					Freq DL</form:label></td>


																							<td><b><form:input path="lofreqdld12"
																										type="number" step="0.1" class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																							<td><form:label path="lofreqdld12"
																									class="control-label">dBm</form:label></td>

																						</tr>



																						<tr>
																							<td><form:label path="sawbw2"
																									class=" control-label">Saw
																					BW</form:label></td>


																							<td><b><form:input path="sawbw2"
																										class="form-control"
																										placeholder="Normal input"
																										value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																							<td><form:label path="sawbw2"
																									class="control-label">dBm</form:label></td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</c:if>
																	<!-- end of hump-2 -->

																</c:forEach>
															</c:when>

														</c:choose>
													</div>

													<!-- apply button for 1 -2 Hump Params -->
													<div class="col-lg-12">

														<c:if test="${userDetails.getRoleId() !='6'}">
															<div align="center">
																<button type="submit" class="btn btn-success"
																	id="apply5">ApplySettings</button>
															</div>
														</c:if>

													</div>
												</div>
											</form:form>
										</div>

										<!-- DCS-1 3 & 4 Hump Params -->
										<div id="d134hump" class="tab-pane fade">

											<form:form id="RepeaterDtaForm6"
												modelAttribute="cofigPageMapper" action="/nms/apply.htm"
												method="post">

												<div class="row">

													<div class="tab-content">

														<c:forEach items="${humpParams}" var="humpDataList"
															varStatus="loop">
															<c:if
																test="${humpParams.get(loop.index).getBandName()=='DCS1' && humpParams.get(loop.index).getHumpId()== 3}">
																<div id="humpd13" class="col-lg-6">
																	<div class="block">
																		<table class="table table-striped">

																			<thead>
																				<tr>
																					<th><b>Hump-3</b></th>
																				</tr>
																			</thead>
																			<tbody>



																				<!-- hidden compensation value -->
																				<tr class="hide">

																					<td><form:label path="Compensation1HumpUl"
																							class="control-label">UL</form:label></td>
																					<td><b><form:input
																								path="Compensation1HumpUl" class="form-control"
																								value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																				</tr>
																				<tr class="hide">
																					<td><form:label path="Compensation1HumpDl"
																							class="control-label">DL</form:label></td>
																					<td><b><form:input
																								path="Compensation1HumpDl" class="form-control"
																								value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																				</tr>
																				<tr>
																					<td><label for="humpon_off3">ON/OFF </label></td>
																					<c:if
																						test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																						<td><form:checkbox path="humpon_off3"
																								id="humpon_off3" checked="true" /></td>
																					</c:if>
																					<c:if
																						test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																						<td><form:checkbox path="humpon_off3"
																								id="humpon_off3" unchecked="false" /></td>
																					</c:if>

																					<form:hidden path="Identifier" />
																					<td><input id="Identifier" name="Identifier"
																						type="hidden" value="34" /></td>
																					<form:hidden path="BandName" />
																					<td><input id="BandName" name="BandName"
																						type="hidden" value="DCS1" /></td>
																					<form:hidden path="snumber" />
																					<td><input id="snumber" name="snumber"
																						type="hidden" value="${message}" /></td>
																				</tr>



																				<tr>
																					<td><form:label path="startchd13"
																							class="control-label">Start
																					Channel</form:label></td>


																					<td><b><form:input path="startchd13"
																								class="form-control" type="number"
																								onblur="cfCalculatorDCS1h3();"
																								value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																					<td></td>
																					<td></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopchd13"
																							class="control-label">Stop
																					Channel</form:label></td>


																					<td><b><form:input path="stopchd13"
																								class="form-control" type="number"
																								onblur="cfCalculatorDCS1h3();"
																								value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																					<td></td>
																					<td></td>
																					<td></td>
																				</tr>

																				<tr>
																					<td><form:label path="lofrequld13"
																							class="control-label">LO
																					Freq UL</form:label></td>


																					<td><b><form:input path="lofrequld13"
																								type="number" step="0.1" class="form-control"
																								placeholder="Normal input"
																								value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequld13"
																							class="control-label">dBm</form:label></td>
																					<td></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdld13"
																							class="control-label">LO
																					Freq DL</form:label></td>


																					<td><b><form:input path="lofreqdld13"
																								type="number" step="0.1" class="form-control"
																								placeholder="Normal input"
																								value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdld13"
																							class="control-label">dBm</form:label></td>
																					<td></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="bwd13"
																							class="control-label">Bandwidth</form:label></td>


																					<td><b><form:input path="bwd13"
																								class="form-control" placeholder="Normal input"
																								readonly="true"
																								value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																					<td><form:label path="bwd13"
																							class="control-label">dBm</form:label></td>
																					<td></td>
																					<td></td>
																					<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																				</tr>

																				<tr>
																					<td><form:label path="sawbw3"
																							class="control-label">Saw
																					BW</form:label></td>


																					<td><b><form:input path="sawbw3"
																								class="form-control" placeholder="Normal input"
																								value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																					<td><form:label path="sawbw3"
																							class="control-label">dBm</form:label></td>
																					<td></td>
																					<td></td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
															</c:if>
															<!-- end of hump-3 -->
															<c:if
																test="${humpParams.get(loop.index).getBandName()=='DCS1' && humpParams.get(loop.index).getHumpId()== 4}">
																<div class="humpd14 col-lg-6">
																	<div class="block">
																		<table class="table table-striped">

																			<thead>
																				<tr>
																					<th><b>Hump-4</b></th>
																				</tr>
																			</thead>
																			<tbody>

																				<!-- hidden compensation value -->
																				<tr class="hide">

																					<td><form:label path="CompensationAllUl"
																							class="control-label">UL</form:label></td>
																					<td><b><form:input
																								path="CompensationAllUl" class="form-control"
																								value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>

																					<td><form:label path="CompensationAllUl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr class="hide">
																					<td><form:label path="CompensationAllDl"
																							class=" control-label">DL</form:label></td>
																					<td><b><form:input
																								path="CompensationAllDl" class="form-control"
																								value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>

																					<td><form:label path="CompensationAllDl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr>
																					<td><label for="humpon_off4">ON/OFF </label></td>
																					<c:if
																						test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																						<td><form:checkbox path="humpon_off4"
																								id="humpon_off4" checked="true" /></td>
																					</c:if>
																					<c:if
																						test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																						<td><form:checkbox path="humpon_off4"
																								id="humpon_off4" unchecked="false" /></td>
																					</c:if>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="startchd14"
																							class="control-label">Start
																					Channel</form:label></td>


																					<td><b><form:input path="startchd14"
																								class="form-control" type="number"
																								onblur="cfCalculatorDCS1h4();"
																								value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																					<td></td>

																				</tr>

																				<tr>
																					<td><form:label path="stopchd14"
																							class="control-label">Stop
																					Channel</form:label></td>


																					<td><b><form:input path="stopchd14"
																								class="form-control" type="number"
																								onblur="cfCalculatorDCS1h4();"
																								value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																					<td></td>
																				</tr>

																				<tr>
																					<td><form:label path="lofrequld14"
																							class=" control-label">LO
																					Freq UL</form:label></td>


																					<td><b><form:input path="lofrequld14"
																								type="number" step="0.1" class="form-control"
																								placeholder="Normal input"
																								value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																					<td><form:label path="lofrequld14"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="lofreqdld14"
																							class="control-label">LO
																					Freq DL</form:label></td>


																					<td><b><form:input path="lofreqdld14"
																								type="number" step="0.1" class="form-control"
																								placeholder="Normal input"
																								value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																					<td><form:label path="lofreqdld14"
																							class="control-label">dBm</form:label></td>

																				</tr>

																				<tr>
																					<td><form:label path="bwd14"
																							class="col-sm-3 control-label">Bandwidth</form:label></td>


																					<td><b><form:input path="bwd14"
																								class="form-control" placeholder="Normal input"
																								readonly="true"
																								value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																					<td><form:label path="bwd14"
																							class="control-label">dBm</form:label></td>
																					<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																				</tr>

																				<tr>
																					<td><form:label path="sawbw4"
																							class="control-label">Saw
																					BW</form:label></td>


																					<td><b><form:input path="sawbw4"
																								class="form-control" placeholder="Normal input"
																								value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																					<td><form:label path="sawbw4"
																							class="control-label">dBm</form:label></td>
																				</tr>
																			</tbody>
																		</table>
																	</div>
																</div>
																<!-- end of hump-4 -->
															</c:if>
														</c:forEach>
													</div>


													<!-- apply button for 3-4 Hump Params -->
													<div class="col-sm-12">

														<c:if test="${userDetails.getRoleId() !='6'}">
															<div align="center">
																<button type="submit" class="btn btn-success"
																	id="apply6">ApplySettings</button>
															</div>
														</c:if>

													</div>
												</div>
											</form:form>
										</div>


										<div id="band" class="tab-pane fade"></div>

										<c:forEach items="${repParams}" var="bandDataList"
											varStatus="loop">
											<c:if
												test="${repParams.get(loop.index).getBandName()=='DCS1' }">
												<div id="thresholdvalue1" class="tab-pane fade">

													<form:form id="RepeaterDtaForm_3"
														modelAttribute="cofigPageMapper" action="/nms/apply.htm"
														method="post">

														<div class="row">
															<div class="col-md-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>1800 Threshold UL</strong>
																			</h3>
																		</div>

																		<div class="panel-body">

																			<table class="table">
																				<tbody>
																					<tr>

																						<td><form:label path="thlvluldcs1"
																								class=" control-label">1800 Threshold UL</form:label></td>


																						<td><b><form:input path="thlvluldcs1"
																									class="form-control" type="number" min="-50"
																									max="50"
																									value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																						<c:if test="${userDetails.getRoleId() !='6'}">
																							<td><button type="submit"
																									class="btn btn-success" id="apply_3">ApplySettings</button></td>
																						</c:if>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="DCS1" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>
																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1ul" /></td>
																					</tr>


																				</tbody>
																			</table>

																		</div>

																	</div>
																</div>

															</div>
														</div>
													</form:form>

													<form:form id="RepeaterDtaForm_4"
														modelAttribute="cofigPageMapper" action="/nms/apply.htm"
														method="post">

														<div class="row">
															<div class="col-md-12">
																<div class="block">

																	<div class="panel " data-collapsed="0">

																		<div style="color: white">
																			<h3 align="center">
																				<strong>1800 Threshold DL</strong>
																			</h3>
																		</div>

																		<div class="panel-body">

																			<table class="table">
																				<tbody>

																					<tr>

																						<td><form:label path="thlvldldcs1"
																								class=" control-label">1800 Threshold DL</form:label></td>


																						<td><b><form:input path="thlvldldcs1"
																									class="form-control" type="number" min="-50"
																									max="50"
																									value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																						<c:if test="${userDetails.getRoleId() !='6'}">
																							<td><button type="submit"
																									class="btn btn-success" id="apply_4">ApplySettings</button></td>
																						</c:if>

																						<form:hidden path="BandName" />
																						<td><input id="BandName" name="BandName"
																							type="hidden" value="DCS1" /></td>
																						<form:hidden path="snumber" />
																						<td><input id="snumber" name="snumber"
																							type="hidden" value="${message}" /></td>
																						<form:hidden path="threshold_flag" />
																						<td><input id="threshold_flag"
																							name="threshold_flag" type="hidden" value="1dl" /></td>
																					</tr>

																				</tbody>
																			</table>

																		</div>

																	</div>

																</div>
															</div>
														</div>
													</form:form>

												</div>
											</c:if>
										</c:forEach>

									</div>
									<!-- end of tab content sha-->
								</div>
								<!-- end of dcs1 -->
							</c:if>

							<c:choose>

								<c:when test="${repData.getReptype()=='1'}">

									<c:forEach items="${repParams}" var="bandDataList"
										varStatus="loop">

										<c:if
											test="${repParams.get(loop.index).getBandName()=='DCS1'}">

											<c:set var="band3"
												value="${repParams.get(loop.index).getBandName()}" />

											<div id="dcs2" class="tab-pane fade">
												<div class="row">
													<div class="col-sm-12">
														<div class="block">
															<ul class="nav nav-tabs">
																<li class="active"><a data-toggle="tab"
																	href="#home2"><b>Main Params</b></a></li>
																<c:choose>
																	<c:when test="${dcs2HumpCount==0}">
																		<li class="disabled"><a href="#d212hump"
																			title='Not available'><b>Hump 1-2</b></a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a data-toggle="tab" href="#d212hump"><b>Hump
																					1-2</b></a></li>
																	</c:otherwise>
																</c:choose>
																<c:choose>
																	<c:when
																		test="${dcs2HumpCount==0 || dcs2HumpCount==1 ||dcs2HumpCount==2}">
																		<li class="disabled"><a href="#d234hump"
																			title='Not available'><b>Hump 3-4</b></a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a data-toggle="tab" href="#d234hump"><b>Hump
																					3-4</b></a></li>
																	</c:otherwise>
																</c:choose>

																<li><a data-toggle="tab" href="#thresholdvalue2"><b>Threshold
																			Value</b></a></li>
															</ul>
														</div>
													</div>
												</div>

												<div class="tab-content">

													<div id="home2" class="tab-pane fade in active">
														<form:form id="RepeaterDtaForm8"
															modelAttribute="cofigPageMapper" action="/nms/apply.htm"
															method="post">


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
																					<form:hidden path="BandName" />
																					<td><input id="BandName" name="BandName"
																						type="hidden" value="DCS2" /></td>
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



																					<form:hidden path="snumber" />
																					<td><input id="snumber" name="snumber"
																						type="hidden" value="${message}" /></td>

																				</tr>

																				<tr>
																					<td><label for="paon_offdl">DL </label></td>
																					<td></td>
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

																					<c:when test="${repData.getRepeaterModel()=='0'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="60" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="60" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='1'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='2'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='3'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='4'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="45" max="75" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="45" max="75" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='5'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="80" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="80" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='6'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="50" max="90" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="50" max="90" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='7'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="50" max="90" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="50" max="90" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='8'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="55" max="95" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="55" max="95" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='9'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="80" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="80" /></b></td>

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
																				<c:choose>

																					<c:when test="${repData.getRepeaterModel()=='0'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-12" max="12"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-12" max="12"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='1'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-19" max="19"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-19" max="19"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='2'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-21" max="21"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-21" max="21"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='3'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-25" max="25"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-25" max="25"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='4'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-29" max="29"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-29" max="29"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='5'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-35" max="35"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-35" max="35"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='6'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-39" max="39"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-39" max="39"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='7'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-42" max="42"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-42" max="42"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='8'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-45" max="45"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-45" max="45"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='9'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-32" max="32"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-32" max="32"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>
																				</c:choose>

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
																								value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																					<td><form:label path="offsetdl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<!-- hidden compensation value -->
																				<tr class="hide">

																					<td><form:label path="CompensationAllUl"
																							class="control-label">UL</form:label></td>
																					<td><b><form:input
																								path="CompensationAllUl" class="form-control"
																								value="${repParams.get(loop.index).getAttenuationUl() }" /></b></td>

																					<td><form:label path="CompensationAllUl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr class="hide">
																					<td><form:label path="CompensationAllDl"
																							class=" control-label">DL</form:label></td>
																					<td><b><form:input
																								path="CompensationAllDl" class="form-control"
																								value="${repParams.get(loop.index).getAttenuationDl() }" /></b></td>

																					<td><form:label path="CompensationAllDl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr class="hide">

																					<td><form:label path="Compensation1HumpUl"
																							class=" control-label">UL</form:label></td>
																					<td><b><form:input
																								path="Compensation1HumpUl" class="form-control"
																								value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																					<td><form:label path="Compensation1HumpUl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr class="hide">
																					<td><form:label path="Compensation1HumpDl"
																							class=" control-label">DL</form:label></td>
																					<td><b><form:input
																								path="Compensation1HumpDl" class="form-control"
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



																					<td><b><form:input path="powerulin"
																								name="powerulin" id="powerulin"
																								class="form-control"
																								value="${repParams.get(loop.index).getPowerInUl() }"
																								readonly="true" /></b></td>

																					<td><form:label path="powerulin"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr>

																					<td><form:label path="powerdlin"
																							class="control-label">Power DL</form:label></td>


																					<td><b><form:input path="powerdlin"
																								class="form-control" id="powerdlin"
																								name="powerdlin"
																								value="${repParams.get(loop.index).getPowerInDl() }"
																								readonly="true" /></b></td>

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


																<div class="col-sm-4">
																	<div class="block">
																		<h4 align="center" style="color: white">
																			<strong>Channel Information</strong>
																		</h4>

																		<table class="table-striped">
																			<tbody>
																				<tr>
																					<c:if
																						test="${repParams.get(loop.index).getLoEnable()=='1'}">
																						<td><form:checkbox path="LoED" id="LoED"
																								checked="true" /> Manual</td>
																					</c:if>
																					<c:if
																						test="${repParams.get(loop.index).getLoEnable()=='0'}">
																						<td><form:checkbox path="LoED" id="LoED"
																								unchecked="false" /> Auto</td>
																					</c:if>
																					<c:choose>

																						<c:when
																							test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">



																							<td class="col-sm-2"><form:select
																									path="TotalHump">
																									<form:option
																										value="${repParams.get(loop.index).getTotalHumpCount()}"
																										label="${repParams.get(loop.index).getTotalHumpCount()}" />
																									<option value="0">0</option>
																									<option value="1">1</option>
																									<option value="2">2</option>
																									<option value="3">3</option>
																									<option value="4">4</option>
																								</form:select></td>
																							<td><form:label path="bwg0"
																									class=" control-label" style="color: white">Total Hump</form:label></td>
																						</c:when>

																						<c:when
																							test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																							<td class="col-sm-2"><form:select
																									path="TotalHump">
																									<form:option
																										value="${repParams.get(loop.index).getTotalHumpCount()}"
																										label="${repParams.get(loop.index).getTotalHumpCount()}" />
																									<option value="0">0</option>
																									<option value="1">1</option>
																									<option value="2">2</option>
																								</form:select></td>
																							<td><form:label path="bwg0"
																									class=" control-label" style="color: white">Total Hump</form:label></td>
																						</c:when>
																					</c:choose>

																				</tr>
																			</tbody>
																		</table>

																		<c:choose>
																			<c:when
																				test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																				<c:if
																					test="${repParams.get(loop.index).getLoEnable()=='0'}">

																					<table class="table table-striped">
																						<tbody>

																							<tr>
																								<td><form:label path="startchd20"
																										class="control-label">Start
																			Channel</form:label></td>


																								<td><b><form:input path="startchd20"
																											type="number" class="form-control"
																											readonly="true"
																											onblur="cfCalculatorDCS2h0();"
																											value="${repParams.get(loop.index).getStartChannel() }"
																											min="512" max="885" /></b></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="stopchd20"
																										class="control-label">Stop
																			Channel</form:label></td>


																								<td><b><form:input path="stopchd20"
																											type="number" class="form-control"
																											readonly="true"
																											onblur="cfCalculatorDCS2h0();"
																											value="${repParams.get(loop.index).getStopChannel() }"
																											min="512" max="885" /></b></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofrequld20"
																										class="control-label">LO
																			UL</form:label></td>


																								<td><b><form:input path="lofrequld20"
																											type="number" min="1710.2" max="1784.8"
																											readonly="true" step="0.1"
																											class="form-control"
																											value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequld20"
																										class="control-label">dBm</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdld20"
																										class="control-label">LO
																			DL</form:label></td>


																								<td><b><form:input path="lofreqdld20"
																											type="number" min="1805.2" max="1879.8"
																											readonly="true" step="0.1"
																											class="form-control"
																											value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdld20"
																										class="control-label">dBm</form:label></td>

																							</tr>

																							<tr>

																								<td><form:label path="bwd20"
																										class="control-label">Bandwidth</form:label></td>

																								<td><b><form:input path="bwd20"
																											class="form-control" readonly="true"
																											value="0.2" /></b></td>

																								<td><form:label path="bwd20"
																										class="control-label">dBm</form:label></td>

																							</tr>


																							<tr>
																								<td><form:label path="sawbw0"
																										class="control-label">Saw
																			BW</form:label></td>


																								<td><b><form:input path="sawbw0"
																											class="form-control" readonly="true"
																											value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																								<td><form:label path="sawbw0"
																										class="control-label">dBm</form:label></td>

																							</tr>
																						</tbody>
																					</table>
																				</c:if>

																				<c:if
																					test="${repParams.get(loop.index).getLoEnable()=='1'}">

																					<table class=" table table-striped">
																						<tbody>

																							<tr>
																								<td><form:label path="startchd20"
																										class="control-label">Start
																			Channel</form:label></td>


																								<td><b><form:input path="startchd20"
																											type="number" class="form-control"
																											onblur="cfCalculatorDCS2h0();"
																											value="${repParams.get(loop.index).getStartChannel() }"
																											min="512" max="885" /></b></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="stopchd20"
																										class="control-label">Stop
																			Channel</form:label></td>


																								<td><b><form:input path="stopchd20"
																											type="number" class="form-control"
																											onblur="cfCalculatorDCS2h0();"
																											value="${repParams.get(loop.index).getStopChannel() }"
																											min="512" max="885" /></b></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofrequld20"
																										class="control-label">LO
																			UL</form:label></td>


																								<td><b><form:input path="lofrequld20"
																											type="number" min="1710.2" max="1784.8"
																											readonly="true" step="0.1"
																											class="form-control"
																											value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequld20"
																										class="control-label">dBm</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdld20"
																										class="control-label">LO
																			DL</form:label></td>


																								<td><b><form:input path="lofreqdld20"
																											type="number" min="1805.2" max="1879.8"
																											readonly="true" step="0.1"
																											class="form-control"
																											value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdld20"
																										class="control-label">dBm</form:label></td>

																							</tr>

																							<tr>

																								<td><form:label path="bwd20"
																										class="control-label">Bandwidth</form:label></td>

																								<td><b><form:input path="bwd20"
																											class="form-control" readonly="true"
																											value="0.2" /></b></td>

																								<td><form:label path="bwd20"
																										class="control-label">dBm</form:label></td>

																							</tr>


																							<tr>
																								<td><form:label path="sawbw0"
																										class="control-label">Saw
																			BW</form:label></td>


																								<td><b><form:input path="sawbw0"
																											class="form-control"
																											value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																								<td><form:label path="sawbw0"
																										class="control-label">dBm</form:label></td>

																							</tr>
																						</tbody>
																					</table>
																				</c:if>
																			</c:when>

																			<c:when
																				test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																				<c:if
																					test="${repParams.get(loop.index).getLoEnable()=='0'}">

																					<table class="table table-striped">

																						<tbody>

																							<tr>
																								<td><form:label path="lofrequld20"
																										class="control-label">LO
																			UL</form:label></td>


																								<td><b><form:input path="lofrequld20"
																											type="number" min="1710.2" max="1784.8"
																											readonly="true" step="0.1"
																											class="form-control"
																											value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequld20"
																										class="control-label">dBm</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdld20"
																										class="control-label">LO
																			DL</form:label></td>


																								<td><b><form:input path="lofreqdld20"
																											type="number" min="1805.2" max="1879.8"
																											readonly="true" step="0.1"
																											class="form-control"
																											value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdld20"
																										class="control-label">dBm</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw0"
																										class="control-label">Saw
																			BW</form:label></td>


																								<td><b><form:input path="sawbw0"
																											class="form-control" readonly="true"
																											value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																								<td><form:label path="sawbw0"
																										class="control-label">dBm</form:label></td>

																							</tr>
																						</tbody>
																					</table>
																				</c:if>

																				<c:if
																					test="${repParams.get(loop.index).getLoEnable()=='1'}">


																					<table class=" table table-striped">

																						<tbody>

																							<tr>
																								<td><form:label path="lofrequld20"
																										class="control-label">LO
																			UL</form:label></td>


																								<td><b><form:input path="lofrequld20"
																											type="number" min="1710.2" max="1784.8"
																											step="0.1" class="form-control"
																											value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequld20"
																										class="control-label">dBm</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdld20"
																										class="control-label">LO
																			DL</form:label></td>


																								<td><b><form:input path="lofreqdld20"
																											type="number" min="1805.2" max="1879.8"
																											step="0.1" class="form-control"
																											value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdld20"
																										class="control-label">dBm</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw0"
																										class="control-label">Saw
																			BW</form:label></td>


																								<td><b><form:input path="sawbw0"
																											class="form-control"
																											value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																								<td><form:label path="sawbw0"
																										class="control-label">dBm</form:label></td>

																							</tr>
																						</tbody>
																					</table>
																				</c:if>
																			</c:when>

																		</c:choose>

																	</div>
																</div>
															</div>

															<div class="row">
																<div class="col-sm-4">
																	<div class="block">
																		<table>
																			<tr>
																				<td><label for="alclvlon_off">ALC
																						ON/OFF </label></td>
																				<td></td>
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

																<div class="col-sm-4" align="center">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<button type="submit" class="btn btn-success"
																			id="apply8">ApplySettings</button>
																	</c:if>
																</div>

																<div class="col-sm-4">
																	<div class="block">
																		<table>
																			<tr>
																				<td><form:label path="dcsversion"
																						class="control-label">
																			Version</form:label></td>


																				<td><b><form:input path="dcsversion"
																							class="form-controlnew" readonly="true"
																							value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>

																				<td></td>

																			</tr>
																		</table>
																	</div>
																</div>

															</div>
														</form:form>


													</div>

													<c:choose>
														<c:when test="${dcs2HumpCount==0}">
															<li class="hide" style="display: hidden;"></li>
															<div id="d212hump" style="display: hidden;"></div>
															<li class="hide" style="display: hidden;"></li>
															<div id="d234hump" style="display: hidden;"></div>
														</c:when>
														<c:when test="${dcs2HumpCount==1}">

															<style>
.humpd22 {
	display: none;
}
</style>

															<li class="hide" style="display: hidden;"></li>
															<div id="d234hump" style="display: hidden;"></div>
														</c:when>
														<c:when test="${dcs2HumpCount==2}">
															<div id="d234hump" style="display: hidden;"></div>
														</c:when>
														<c:when test="${dcs2HumpCount==3}">
															<style>
.humpd24 {
	display: none;
}
</style>

														</c:when>
													</c:choose>

													<!-- end of active pane -->

													<!-- DCS2 1 & 2 Hump Params -->
													<div id="d212hump" class="tab-pane fade">

														<form:form id="RepeaterDtaForm9"
															modelAttribute="cofigPageMapper" action="/nms/apply.htm"
															method="post">

															<div class="row">


																<div class="tab-content">
																	<c:choose>

																		<c:when
																			test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																			<c:forEach items="${humpParams}" var="humpDataList"
																				varStatus="loop">

																				<c:if
																					test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 1}">

																					<div id="humpd21" class="col-lg-6">
																						<div class="block">
																							<table class="table table-striped">
																								<thead>
																									<tr>
																										<th><b>Hump-1</b></th>
																									</tr>
																								</thead>
																								<tbody>

																									<!-- hidden compensation value -->
																									<tr class="hide">

																										<td><form:label
																												path="Compensation1HumpUl"
																												class="control-label">UL</form:label></td>
																										<td><b><form:input
																													path="Compensation1HumpUl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																									</tr>
																									<tr class="hide">
																										<td><form:label
																												path="Compensation1HumpDl"
																												class="control-label">DL</form:label></td>
																										<td><b><form:input
																													path="Compensation1HumpDl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																									</tr>
																									<tr>
																										<td><label for="humpon_off1">ON/OFF
																										</label></td>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																											<td><form:checkbox path="humpon_off1"
																													id="humpon_off1" checked="true" /></td>
																										</c:if>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																											<td><form:checkbox path="humpon_off1"
																													id="humpon_off1" unchecked="false" /></td>
																										</c:if>

																										<form:hidden path="Identifier" />
																										<td><input id="Identifier"
																											name="Identifier" type="hidden" value="12" /></td>
																										<form:hidden path="BandName" />
																										<td><input id="BandName" name="BandName"
																											type="hidden" value="DCS2" /></td>
																										<form:hidden path="snumber" />
																										<td><input id="snumber" name="snumber"
																											type="hidden" value="${message}" /></td>
																										<form:hidden path="TotalHump" />
																										<td class="hide"><input id="TotalHump"
																											name="TotalHump" type="hidden"
																											value="${dcs2HumpCount}" /></td>

																									</tr>



																									<tr>
																										<td><form:label path="startchd21"
																												class="control-label">Start
																					Channel</form:label></td>


																										<td><b><form:input path="startchd21"
																													class="form-control" type="number"
																													min="512" max="885"
																													onblur="cfCalculatorDCS2h1();"
																													value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																										<td></td>
																										<td></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="stopchd21"
																												class="control-label">Stop
																					Channel</form:label></td>


																										<td><b><form:input path="stopchd21"
																													class="form-control" type="number"
																													min="512" max="885"
																													onblur="cfCalculatorDCS2h1();"
																													value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																										<td></td>
																										<td></td>
																										<td></td>
																									</tr>

																									<tr>
																										<td><form:label path="lofrequld21"
																												class="control-label">LO
																					Freq UL</form:label></td>


																										<td><b><form:input path="lofrequld21"
																													type="number" min="1710.2" max="1784.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																										<td><form:label path="lofrequld21"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofreqdld21"
																												class="control-label">LO
																					Freq DL</form:label></td>


																										<td><b><form:input path="lofreqdld21"
																													type="number" min="1805.2" max="1879.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																										<td><form:label path="lofreqdld21"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="bwd21"
																												class="control-label">Bandwidth</form:label></td>


																										<td><b><form:input path="bwd21"
																													class="form-control"
																													placeholder="Normal input" readonly="true"
																													value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																										<td><form:label path="bwd21"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>
																										<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																									</tr>

																									<tr>
																										<td><form:label path="sawbw1"
																												class="control-label">Saw
																					BW</form:label></td>


																										<td><b><form:input path="sawbw1"
																													class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																										<td><form:label path="sawbw1"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</c:if>
																				<!-- end of hump-1 -->
																				<c:if
																					test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 2}">
																					<div class="humpd22 col-lg-6">
																						<div class="block">
																							<table class="table table-striped">
																								<thead>
																									<tr>
																										<th><b>Hump-2</b></th>
																									</tr>
																								</thead>
																								<tbody>
																									<!-- hidden compensation value -->
																									<tr class="hide">

																										<td><form:label path="CompensationAllUl"
																												class="control-label">UL</form:label></td>
																										<td><b><form:input
																													path="CompensationAllUl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																									</tr>
																									<tr class="hide">
																										<td><form:label path="CompensationAllDl"
																												class="control-label">DL</form:label></td>
																										<td><b><form:input
																													path="CompensationAllDl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																									</tr>
																									<tr>
																										<td><label for="humpon_off2">ON/OFF
																										</label></td>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																											<td><form:checkbox path="humpon_off2"
																													id="humpon_off2" checked="true" /></td>
																										</c:if>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																											<td><form:checkbox path="humpon_off2"
																													id="humpon_off2" unchecked="false" /></td>
																										</c:if>
																										<td></td>
																									</tr>



																									<tr>
																										<td><form:label path="startchd22"
																												class="control-label">Start
																					Channel</form:label></td>


																										<td><b><form:input path="startchd22"
																													class="form-control" type="number"
																													min="512" max="885"
																													onblur="cfCalculatorDCS2h2();"
																													value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="stopchd22"
																												class="control-label">Stop
																					Channel</form:label></td>


																										<td><b><form:input path="stopchd22"
																													class="form-control" type="number"
																													min="512" max="885"
																													onblur="cfCalculatorDCS2h2();"
																													value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																										<td></td>
																									</tr>

																									<tr>
																										<td><form:label path="lofrequld22"
																												class="control-label">LO
																					Freq UL</form:label></td>


																										<td><b><form:input path="lofrequld22"
																													type="number" min="1710.2" max="1784.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																										<td><form:label path="lofrequld22"
																												class="control-label">Mhz</form:label></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofreqdld22"
																												class="control-label">LO
																					Freq DL</form:label></td>


																										<td><b><form:input path="lofreqdld22"
																													type="number" min="1805.2" max="1879.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																										<td><form:label path="lofreqdld22"
																												class="control-label">Mhz</form:label></td>

																									</tr>

																									<tr>
																										<td><form:label path="bwd22"
																												class="control-label">Bandwidth</form:label></td>


																										<td><b><form:input path="bwd22"
																													class="form-control"
																													placeholder="Normal input" readonly="true"
																													value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																										<td><form:label path="bwd22"
																												class="control-label">Mhz</form:label></td>
																										<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																									</tr>

																									<tr>
																										<td><form:label path="sawbw2"
																												class="control-label">Saw
																					BW</form:label></td>


																										<td><b><form:input path="sawbw2"
																													class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																										<td><form:label path="sawbw2"
																												class="control-label">Mhz</form:label></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</c:if>
																				<!-- end of hump-2 -->
																			</c:forEach>
																		</c:when>

																		<c:when
																			test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																			<c:forEach items="${humpParams}" var="humpDataList"
																				varStatus="loop">

																				<c:if
																					test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 1}">
																					<div id="humpd21" class="col-lg-6">
																						<div class="block">
																							<table class="table table-striped">
																								<thead>
																									<tr>
																										<th><b>Hump-1</b></th>
																									</tr>
																								</thead>
																								<tbody>

																									<!-- hidden compensation value -->
																									<tr class="hide">

																										<td><form:label
																												path="Compensation1HumpUl"
																												class="control-label">UL</form:label></td>
																										<td><b><form:input
																													path="Compensation1HumpUl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>


																									</tr>
																									<tr class="hide">
																										<td><form:label
																												path="Compensation1HumpDl"
																												class="control-label">DL</form:label></td>
																										<td><b><form:input
																													path="Compensation1HumpDl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																									</tr>
																									<tr>
																										<td><label for="humpon_off1">ON/OFF
																										</label></td>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																											<td><form:checkbox path="humpon_off1"
																													id="humpon_off1" checked="true" /></td>
																										</c:if>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																											<td><form:checkbox path="humpon_off1"
																													id="humpon_off1" unchecked="false" /></td>
																										</c:if>

																										<form:hidden path="Identifier" />
																										<td><input id="Identifier"
																											name="Identifier" type="hidden" value="12" /></td>
																										<form:hidden path="BandName" />
																										<td><input id="BandName" name="BandName"
																											type="hidden" value="DCS2" /></td>
																										<form:hidden path="snumber" />
																										<td><input id="snumber" name="snumber"
																											type="hidden" value="${message}" /></td>
																									</tr>

																									<tr>
																										<td><form:label path="lofrequld21"
																												class="control-label">LO
																					Freq UL</form:label></td>


																										<td><b><form:input path="lofrequld21"
																													type="number" min="1710.2" max="1784.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																										<td><form:label path="lofrequld21"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofreqdld21"
																												class="control-label">LO
																					Freq DL</form:label></td>


																										<td><b><form:input path="lofreqdld21"
																													type="number" min="1805.2" max="1879.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																										<td><form:label path="lofreqdld21"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>

																									</tr>



																									<tr>
																										<td><form:label path="sawbw1"
																												class="control-label">Saw
																					BW</form:label></td>


																										<td><b><form:input path="sawbw1"
																													class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																										<td><form:label path="sawbw1"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</c:if>
																				<!-- end of hump-1 -->
																				<c:if
																					test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 2}">
																					<div class="humpd22 col-lg-6">
																						<div class="block">
																							<table class="table table-striped">
																								<thead>
																									<tr>
																										<th><b>Hump-2</b></th>
																									</tr>
																								</thead>
																								<tbody>

																									<!-- hidden compensation value -->
																									<tr class="hide">

																										<td><form:label path="CompensationAllUl"
																												class="control-label">UL</form:label></td>
																										<td><b><form:input
																													path="CompensationAllUl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																									</tr>
																									<tr class="hide">
																										<td><form:label path="CompensationAllDl"
																												class="control-label">DL</form:label></td>
																										<td><b><form:input
																													path="CompensationAllDl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																									</tr>
																									<tr>
																										<td><label for="humpon_off2">ON/OFF
																										</label></td>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																											<td><form:checkbox path="humpon_off2"
																													id="humpon_off2" checked="true" /></td>
																										</c:if>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																											<td><form:checkbox path="humpon_off2"
																													id="humpon_off2" unchecked="false" /></td>
																										</c:if>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofrequld22"
																												class="control-label">LO
																					Freq UL</form:label></td>


																										<td><b><form:input path="lofrequld22"
																													type="number" min="1710.2" max="1784.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																										<td><form:label path="lofrequld22"
																												class="control-label">Mhz</form:label></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofreqdld22"
																												class="control-label">LO
																					Freq DL</form:label></td>


																										<td><b><form:input path="lofreqdld22"
																													type="number" min="1805.2" max="1879.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																										<td><form:label path="lofreqdld22"
																												class="control-label">Mhz</form:label></td>

																									</tr>



																									<tr>
																										<td><form:label path="sawbw2"
																												class="control-label">Saw
																					BW</form:label></td>


																										<td><b><form:input path="sawbw2"
																													class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																										<td><form:label path="sawbw2"
																												class="control-label">Mhz</form:label></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</c:if>
																				<!-- end of hump-2 -->
																			</c:forEach>
																		</c:when>
																	</c:choose>
																</div>


																<!-- apply button for 1 -2 Hump Params -->
																<div class="col-sm-12">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<div align="center">
																			<button type="submit" class="btn btn-success"
																				id="apply9">ApplySettings</button>
																		</div>
																	</c:if>
																</div>
															</div>
														</form:form>
													</div>

													<!-- DCS2 3 & 4 Hump Params -->
													<div id="d234hump" class="tab-pane fade">

														<form:form id="RepeaterDtaForm10"
															modelAttribute="cofigPageMapper" action="/nms/apply.htm"
															method="post">

															<div class="row">


																<div class="tab-content">

																	<c:choose>
																		<c:when
																			test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																			<c:forEach items="${humpParams}" var="humpDataList"
																				varStatus="loop">
																				<c:if
																					test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 3}">
																					<div id="humpd23" class="col-lg-6">
																						<div class="block">
																							<table class="table table-striped">
																								<thead>
																									<tr>
																										<th><b>Hump-3</b></th>
																									</tr>
																								</thead>
																								<tbody>

																									<!-- hidden compensation value -->
																									<tr class="hide">

																										<td><form:label
																												path="Compensation1HumpUl"
																												class="control-label">UL</form:label></td>
																										<td><b><form:input
																													path="Compensation1HumpUl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																									</tr>
																									<tr class="hide">
																										<td><form:label
																												path="Compensation1HumpDl"
																												class="control-label">DL</form:label></td>
																										<td><b><form:input
																													path="Compensation1HumpDl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																									</tr>
																									<tr>
																										<td><label for="humpon_off3">ON/OFF
																										</label></td>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																											<td><form:checkbox path="humpon_off3"
																													id="humpon_off3" checked="true" /></td>
																										</c:if>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																											<td><form:checkbox path="humpon_off3"
																													id="humpon_off3" unchecked="false" /></td>
																										</c:if>

																										<form:hidden path="Identifier" />
																										<td><input id="Identifier"
																											name="Identifier" type="hidden" value="34" /></td>
																										<form:hidden path="BandName" />
																										<td><input id="BandName" name="BandName"
																											type="hidden" value="DCS2" /></td>
																										<form:hidden path="snumber" />
																										<td><input id="snumber" name="snumber"
																											type="hidden" value="${message}" /></td>
																									</tr>

																									<tr>
																										<td><form:label path="startchd23"
																												class="control-label">Start
																					Channel</form:label></td>


																										<td><b><form:input path="startchd23"
																													class="form-control" type="number"
																													min="512" max="885"
																													onblur="cfCalculatorDCS2h3();"
																													value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																										<td></td>
																										<td></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="stopchd23"
																												class="control-label">Stop
																					Channel</form:label></td>


																										<td><b><form:input path="stopchd23"
																													class="form-control" type="number"
																													min="512" max="885"
																													onblur="cfCalculatorDCS2h3();"
																													value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																										<td></td>
																										<td></td>
																										<td></td>
																									</tr>

																									<tr>
																										<td><form:label path="lofrequld23"
																												class="control-label">LO
																					Freq UL</form:label></td>


																										<td><b><form:input path="lofrequld23"
																													type="number" min="1710.2" max="1784.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																										<td><form:label path="lofrequld23"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofreqdld23"
																												class="control-label">LO
																					Freq DL</form:label></td>


																										<td><b><form:input path="lofreqdld23"
																													type="number" min="1805.2" max="1879.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																										<td><form:label path="lofreqdld23"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="bwd23"
																												class="control-label">Bandwidth</form:label></td>


																										<td><b><form:input path="bwd23"
																													class="form-control"
																													placeholder="Normal input" readonly="true"
																													value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																										<td><form:label path="bwd23"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>
																										<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																									</tr>

																									<tr>
																										<td><form:label path="sawbw3"
																												class="control-label">Saw
																					BW</form:label></td>


																										<td><b><form:input path="sawbw3"
																													class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																										<td><form:label path="sawbw3"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</c:if>
																				<!-- end of hump-3 -->
																				<c:if
																					test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 4}">
																					<div class="humpd24 col-lg-6">
																						<div class="block">
																							<table class="table table-striped">
																								<thead>
																									<tr>
																										<th><b>Hump-4</b></th>
																									</tr>
																								</thead>
																								<tbody>



																									<!-- hidden compensation value -->
																									<tr class="hide">

																										<td><form:label path="CompensationAllUl"
																												class="control-label">UL</form:label></td>
																										<td><b><form:input
																													path="CompensationAllUl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																									</tr>
																									<tr class="hide">
																										<td><form:label path="CompensationAllDl"
																												class="control-label">DL</form:label></td>
																										<td><b><form:input
																													path="CompensationAllDl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																									</tr>
																									<tr>
																										<td><label for="humpon_off4">ON/OFF
																										</label></td>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																											<td><form:checkbox path="humpon_off4"
																													id="humpon_off4" checked="true" /></td>
																										</c:if>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																											<td><form:checkbox path="humpon_off4"
																													id="humpon_off4" unchecked="false" /></td>
																										</c:if>
																										<td></td>
																									</tr>



																									<tr>
																										<td><form:label path="startchd24"
																												class="control-label">Start
																					Channel</form:label></td>


																										<td><b><form:input path="startchd24"
																													class="form-control" type="number"
																													min="512" max="885"
																													onblur="cfCalculatorDCS2h4();"
																													value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="stopchd24"
																												class="control-label">Stop
																					Channel</form:label></td>


																										<td><b><form:input path="stopchd24"
																													class="form-control" type="number"
																													min="512" max="885"
																													onblur="cfCalculatorDCS2h4();"
																													value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																										<td></td>
																									</tr>

																									<tr>
																										<td><form:label path="lofrequld24"
																												class="control-label">LO
																					Freq UL</form:label></td>


																										<td><b><form:input path="lofrequld24"
																													type="number" min="1710.2" max="1784.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																										<td><form:label path="lofrequld24"
																												class="control-label">Mhz</form:label></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofreqdld24"
																												class="control-label">LO
																					Freq DL</form:label></td>


																										<td><b><form:input path="lofreqdld24"
																													type="number" min="1805.2" max="1879.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																										<td><form:label path="lofreqdld24"
																												class="control-label">Mhz</form:label></td>

																									</tr>

																									<tr>
																										<td><form:label path="bwd24"
																												class="control-label">Bandwidth</form:label></td>


																										<td><b><form:input path="bwd24"
																													class="form-control"
																													placeholder="Normal input" readonly="true"
																													value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																										<td><form:label path="bwd24"
																												class="control-label">Mhz</form:label></td>
																										<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																									</tr>

																									<tr>
																										<td><form:label path="sawbw4"
																												class="control-label">Saw
																					BW</form:label></td>


																										<td><b><form:input path="sawbw4"
																													class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																										<td><form:label path="sawbw4"
																												class="control-label">Mhz</form:label></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- end of hump-4 -->
																				</c:if>
																			</c:forEach>
																		</c:when>

																		<c:when
																			test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																			<c:forEach items="${humpParams}" var="humpDataList"
																				varStatus="loop">
																				<c:if
																					test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 3}">
																					<div id="humpd23" class="col-lg-6">
																						<div class="block">
																							<table class="table table-striped">
																								<thead>
																									<tr>
																										<th><b>Hump-3</b></th>
																									</tr>
																								</thead>
																								<tbody>



																									<!-- hidden compensation value -->
																									<tr class="hide">

																										<td><form:label
																												path="Compensation1HumpUl"
																												class="control-label">UL</form:label></td>
																										<td><b><form:input
																													path="Compensation1HumpUl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																									</tr>
																									<tr class="hide">
																										<td><form:label
																												path="Compensation1HumpDl"
																												class="control-label">DL</form:label></td>
																										<td><b><form:input
																													path="Compensation1HumpDl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																									</tr>
																									<tr>
																										<td><label for="humpon_off3">ON/OFF
																										</label></td>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																											<td><form:checkbox path="humpon_off3"
																													id="humpon_off3" checked="true" /></td>
																										</c:if>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																											<td><form:checkbox path="humpon_off3"
																													id="humpon_off3" unchecked="false" /></td>
																										</c:if>

																										<form:hidden path="Identifier" />
																										<td><input id="Identifier"
																											name="Identifier" type="hidden" value="34" /></td>
																										<form:hidden path="BandName" />
																										<td><input id="BandName" name="BandName"
																											type="hidden" value="DCS2" /></td>
																										<form:hidden path="snumber" />
																										<td><input id="snumber" name="snumber"
																											type="hidden" value="${message}" /></td>
																									</tr>




																									<tr>
																										<td><form:label path="lofrequld23"
																												class="control-label">LO
																					Freq UL</form:label></td>


																										<td><b><form:input path="lofrequld23"
																													type="number" min="1710.2" max="1784.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																										<td><form:label path="lofrequld23"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofreqdld23"
																												class="control-label">LO
																					Freq DL</form:label></td>


																										<td><b><form:input path="lofreqdld23"
																													type="number" min="1805.2" max="1879.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																										<td><form:label path="lofreqdld23"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>

																									</tr>


																									<tr>
																										<td><form:label path="sawbw3"
																												class="control-label">Saw
																					BW</form:label></td>


																										<td><b><form:input path="sawbw3"
																													class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																										<td><form:label path="sawbw3"
																												class="control-label">Mhz</form:label></td>
																										<td></td>
																										<td></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</c:if>
																				<!-- end of hump-3 -->
																				<c:if
																					test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 4}">
																					<div class="humpd24 col-lg-6">
																						<div class="block">
																							<table class="table table-striped">
																								<thead>
																									<tr>
																										<th><b>Hump-4</b></th>
																									</tr>
																								</thead>
																								<tbody>



																									<!-- hidden compensation value -->
																									<tr class="hide">

																										<td><form:label path="CompensationAllUl"
																												class="control-label">UL</form:label></td>
																										<td><b><form:input
																													path="CompensationAllUl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																									</tr>
																									<tr class="hide">
																										<td><form:label path="CompensationAllDl"
																												class="control-label">DL</form:label></td>
																										<td><b><form:input
																													path="CompensationAllDl"
																													class="form-control"
																													value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																									</tr>
																									<tr>
																										<td><label for="humpon_off4">ON/OFF
																										</label></td>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																											<td><form:checkbox path="humpon_off4"
																													id="humpon_off4" checked="true" /></td>
																										</c:if>
																										<c:if
																											test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																											<td><form:checkbox path="humpon_off4"
																													id="humpon_off4" unchecked="false" /></td>
																										</c:if>
																										<td></td>
																									</tr>

																									<tr>
																										<td><form:label path="lofrequld24"
																												class="control-label">LO
																					Freq UL</form:label></td>


																										<td><b><form:input path="lofrequld24"
																													type="number" min="1710.2" max="1784.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																										<td><form:label path="lofrequld24"
																												class="control-label">Mhz</form:label></td>

																									</tr>

																									<tr>
																										<td><form:label path="lofreqdld24"
																												class="control-label">LO
																					Freq DL</form:label></td>


																										<td><b><form:input path="lofreqdld24"
																													type="number" min="1805.2" max="1879.8"
																													step="0.1" class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																										<td><form:label path="lofreqdld24"
																												class="control-label">Mhz</form:label></td>

																									</tr>

																									<tr>
																										<td><form:label path="sawbw4"
																												class="control-label">Saw
																					BW</form:label></td>


																										<td><b><form:input path="sawbw4"
																													class="form-control"
																													placeholder="Normal input"
																													value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																										<td><form:label path="sawbw4"
																												class="control-label">Mhz</form:label></td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- end of hump-4 -->
																				</c:if>
																			</c:forEach>
																		</c:when>
																	</c:choose>
																</div>

																<!-- apply button for 3-4 Hump Params -->
																<div class="col-sm-12">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<div align="center">
																			<button type="submit" class="btn btn-success"
																				id="apply10">ApplySettings</button>
																		</div>
																	</c:if>
																</div>
															</div>
														</form:form>
													</div>

													<div id="band" class="tab-pane fade"></div>

													<c:forEach items="${repParams}" var="bandDataList"
														varStatus="loop">
														<c:if
															test="${repParams.get(loop.index).getBandName()=='DCS2' }">
															<div id="thresholdvalue2" class="tab-pane fade">

																<form:form id="RepeaterDtaForm11"
																	modelAttribute="cofigPageMapper"
																	action="/nms/apply.htm" method="post">

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

																						<table class="table">
																							<tbody>
																								<tr>

																									<td><form:label path="thlvluldcs2"
																											class="control-label">TH Level UL</form:label></td>


																									<td><b><form:input path="thlvluldcs2"
																												class="form-control" type="number" min="-50"
																												max="50"
																												value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																									<form:hidden path="BandName" />
																									<td><input id="BandName" name="BandName"
																										type="hidden" value="DCS2" /></td>
																									<form:hidden path="snumber" />
																									<td><input id="snumber" name="snumber"
																										type="hidden" value="${message}" /></td>
																									<form:hidden path="threshold_flag" />
																									<td><input id="threshold_flag"
																										name="threshold_flag" type="hidden" value="1" /></td>
																								</tr>


																								<tr>
																									<td><form:label path="thlvldldcs2"
																											class="control-label">TH Level DL</form:label></td>


																									<td><b><form:input path="thlvldldcs2"
																												class="form-control" type="number" min="-50"
																												max="50"
																												value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>
																									<td></td>
																									<td></td>
																									<td></td>
																								</tr>
																							</tbody>
																						</table>
																					</div>
																				</div>
																			</div>
																		</div>

																		<div class="col-sm-12">
																			<div align="center">
																				<button type="submit" class="btn btn-success"
																					id="apply11">ApplySettings</button>
																			</div>
																		</div>
																	</div>
																</form:form>
															</div>
														</c:if>
													</c:forEach>
												</div>
												<!-- end of tab content sha-->
												<%-- </c:if> --%>
											</div>
											<!-- end of dcs2 -->
										</c:if>
									</c:forEach>
								</c:when>

								<c:when test="${repData.getReptype()=='2'}">

									<c:forEach items="${repParams}" var="bandDataList"
										varStatus="loop">

										<c:if
											test="${repParams.get(loop.index).getBandName()=='DCS2' }">

											<c:set var="band3"
												value="${repParams.get(loop.index).getBandName()}" />



											<div id="dcs2" class="tab-pane fade">

												<div class="row">
													<div class="col-sm-12">
														<div class="block">
															<ul class="nav nav-tabs">
																<li class="active"><a data-toggle="tab"
																	href="#home2"><b>Main Params</b></a></li>
																<c:choose>
																	<c:when
																		test="${repParams.get(loop.index).getTotalHumpCount()==0}">
																		<li class="disabled"><a href="#d212hump"
																			title='Not available'><b>Hump 1-2</b></a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a data-toggle="tab" href="#d212hump"><b>Hump
																					1-2</b></a></li>
																	</c:otherwise>
																</c:choose>
																<c:choose>
																	<c:when
																		test="${repParams.get(loop.index).getTotalHumpCount()==0 || repParams.get(loop.index).getTotalHumpCount()==1 ||repParams.get(loop.index).getTotalHumpCount()==2}">
																		<li class="disabled"><a href="#d234hump"
																			title='Not available'><b>Hump 3-4</b></a></li>
																	</c:when>
																	<c:otherwise>
																		<li><a data-toggle="tab" href="#d234hump"><b>Hump
																					3-4</b></a></li>
																	</c:otherwise>
																</c:choose>
																<!-- <li><a data-toggle="tab" href="#d212hump"><b>Hump
																			1-2</b></a></li>
																<li><a data-toggle="tab" href="#d234hump"><b>Hump
																			3-4</b></a></li> -->
																<li><a data-toggle="tab" href="#thresholdvalue2"><b>Threshold
																			Value</b></a></li>
															</ul>
														</div>
													</div>
												</div>

												<div class="tab-content">

													<div id="home2" class="tab-pane fade in active">
														<form:form id="RepeaterDtaForm8"
															modelAttribute="cofigPageMapper" action="/nms/apply.htm"
															method="post">


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
																					<form:hidden path="BandName" />
																					<td><input id="BandName" name="BandName"
																						type="hidden" value="DCS2" /></td>
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



																					<form:hidden path="snumber" />
																					<td><input id="snumber" name="snumber"
																						type="hidden" value="${message}" /></td>

																				</tr>

																				<tr>
																					<td><label for="paon_offdl">DL </label></td>
																					<td></td>
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

																					<c:when test="${repData.getRepeaterModel()=='0'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="60" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="60" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='1'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='2'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='3'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="70" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='4'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="45" max="75" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="45" max="75" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='5'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="80" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="80" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='6'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="50" max="90" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="50" max="90" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='7'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="50" max="90" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="50" max="90" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='8'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="55" max="95" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="55" max="95" /></b></td>

																							<td><form:label path="Gaindl"
																									class="control-label">dB</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='9'}">

																						<tr>
																							<!-- <div class="form-group"> -->
																							<td><form:label path="Gainul"
																									class="control-label">UL</form:label></td>

																							<!-- <div class="col-sm-5"> -->
																							<td><b><form:input path="Gainul"
																										name="Gainul" type="number" id="Gainul"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainUl() }"
																										min="40" max="80" /></b></td>

																							<td><form:label path="Gainul"
																									class="control-label">dB</form:label></td>
																						</tr>

																						<tr>
																							<td><form:label path="Gaindl"
																									class="control-label">DL</form:label></td>

																							<td><b><form:input path="Gaindl"
																										name="Gaindl" type="number" id="Gaindl"
																										class="form-control"
																										value="${repParams.get(loop.index).getGainDl() }"
																										min="40" max="80" /></b></td>

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
																				<c:choose>

																					<c:when test="${repData.getRepeaterModel()=='0'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-12" max="12"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-12" max="12"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='1'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-19" max="19"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-19" max="19"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='2'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-21" max="21"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-21" max="21"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='3'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-25" max="25"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-25" max="25"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='4'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-29" max="29"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-29" max="29"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='5'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-35" max="35"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-35" max="35"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='6'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-39" max="39"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-39" max="39"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='7'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-42" max="42"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-42" max="42"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='8'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-45" max="45"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-45" max="45"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>

																					<c:when test="${repData.getRepeaterModel()=='9'}">
																						<tr>
																							<td><form:label path="alclvlul"
																									class="control-label">LVL UL</form:label></td>


																							<td><b><form:input path="alclvlul"
																										type="number" min="-32" max="32"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																							<td><form:label path="alclvlul"
																									class="control-label">dBm</form:label></td>

																						</tr>
																						<tr>

																							<td><form:label path="alclvldl"
																									class="control-label">LVL DL</form:label></td>


																							<td><b><form:input path="alclvldl"
																										type="number" min="-32" max="32"
																										class="form-control"
																										placeholder="Normal input"
																										value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																							<td><form:label path="alclvldl"
																									class="control-label">dBm</form:label></td>

																						</tr>
																					</c:when>
																				</c:choose>

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
																								value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>

																					<td><form:label path="offsetdl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<!-- hidden compensation value -->
																				<tr class="hide">

																					<td><form:label path="CompensationAllUl"
																							class="control-label">UL</form:label></td>
																					<td><b><form:input
																								path="CompensationAllUl" class="form-control"
																								value="${repParams.get(loop.index).getAttenuationUl() }" /></b></td>

																					<td><form:label path="CompensationAllUl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr class="hide">
																					<td><form:label path="CompensationAllDl"
																							class=" control-label">DL</form:label></td>
																					<td><b><form:input
																								path="CompensationAllDl" class="form-control"
																								value="${repParams.get(loop.index).getAttenuationDl() }" /></b></td>

																					<td><form:label path="CompensationAllDl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr class="hide">

																					<td><form:label path="Compensation1HumpUl"
																							class=" control-label">UL</form:label></td>
																					<td><b><form:input
																								path="Compensation1HumpUl" class="form-control"
																								value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																					<td><form:label path="Compensation1HumpUl"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr class="hide">
																					<td><form:label path="Compensation1HumpDl"
																							class=" control-label">DL</form:label></td>
																					<td><b><form:input
																								path="Compensation1HumpDl" class="form-control"
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



																					<td><b><form:input path="powerulin"
																								name="powerulin" id="powerulin"
																								class="form-control"
																								value="${repParams.get(loop.index).getPowerInUl() }"
																								readonly="true" /></b></td>

																					<td><form:label path="powerulin"
																							class="control-label">dBm</form:label></td>
																				</tr>
																				<tr>

																					<td><form:label path="powerdlin"
																							class="control-label">Power DL</form:label></td>


																					<td><b><form:input path="powerdlin"
																								class="form-control" id="powerdlin"
																								name="powerdlin"
																								value="${repParams.get(loop.index).getPowerInDl() }"
																								readonly="true" /></b></td>

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


																<div class="col-sm-4">
																	<div class="block">
																		<h4 align="center" style="color: white">
																			<strong>Channel Information</strong>
																		</h4>

																		<table class="table-striped">
																			<tbody>
																				<tr>
																					<c:if
																						test="${repParams.get(loop.index).getLoEnable()=='1'}">
																						<td><form:checkbox path="LoED" id="LoED"
																								checked="true" /> Manual</td>
																					</c:if>
																					<c:if
																						test="${repParams.get(loop.index).getLoEnable()=='0'}">
																						<td><form:checkbox path="LoED" id="LoED"
																								unchecked="false" /> Auto</td>
																					</c:if>
																					<c:choose>

																						<c:when
																							test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">



																							<td class="col-sm-2"><form:select
																									path="TotalHump">
																									<form:option
																										value="${repParams.get(loop.index).getTotalHumpCount()}"
																										label="${repParams.get(loop.index).getTotalHumpCount()}" />
																									<option value="0">0</option>
																									<option value="1">1</option>
																									<option value="2">2</option>
																									<option value="3">3</option>
																									<option value="4">4</option>
																								</form:select></td>
																							<td><form:label path="bwg0"
																									class=" control-label" style="color: white">Total Hump</form:label></td>
																						</c:when>

																						<c:when
																							test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																							<td class="col-sm-2"><form:select
																									path="TotalHump">
																									<form:option
																										value="${repParams.get(loop.index).getTotalHumpCount()}"
																										label="${repParams.get(loop.index).getTotalHumpCount()}" />
																									<option value="0">0</option>
																									<option value="1">1</option>
																									<option value="2">2</option>
																								</form:select></td>
																							<td><form:label path="bwg0"
																									class=" control-label" style="color: white">Total Hump</form:label></td>
																						</c:when>
																					</c:choose>

																				</tr>
																			</tbody>
																		</table>

																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='0'}">

																			<table class="table table-striped">
																				<tbody>

																					<tr>
																						<td><form:label path="startchd20"
																								class="control-label">Start
																			Channel</form:label></td>


																						<td><b><form:input path="startchd20"
																									type="number" class="form-control"
																									readonly="true" onblur="cfCalculatorDCS2h0();"
																									value="${repParams.get(loop.index).getStartChannel() }"
																									min="512" max="885" /></b></td>
																						<td></td>

																					</tr>

																					<tr>
																						<td><form:label path="stopchd20"
																								class="control-label">Stop
																			Channel</form:label></td>


																						<td><b><form:input path="stopchd20"
																									type="number" class="form-control"
																									readonly="true" onblur="cfCalculatorDCS2h0();"
																									value="${repParams.get(loop.index).getStopChannel() }"
																									min="512" max="885" /></b></td>
																						<td></td>

																					</tr>

																					<tr>
																						<td><form:label path="lofrequld20"
																								class="control-label">LO
																			UL</form:label></td>


																						<td><b><form:input path="lofrequld20"
																									type="number" min="1710.2" max="1784.8"
																									readonly="true" step="0.1" class="form-control"
																									value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>


																						<td><form:label path="lofrequld20"
																								class="control-label">Mhz</form:label></td>

																					</tr>

																					<tr>
																						<td><form:label path="lofreqdld20"
																								class="control-label">LO
																			DL</form:label></td>


																						<td><b><form:input path="lofreqdld20"
																									type="number" min="1805.2" max="1879.8"
																									readonly="true" step="0.1" class="form-control"
																									value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																						<td><form:label path="lofreqdld20"
																								class="control-label">Mhz</form:label></td>

																					</tr>

																					<tr>

																						<td><form:label path="bwd20"
																								class="control-label">Bandwidth</form:label></td>

																						<td><b><form:input path="bwd20"
																									class="form-control" readonly="true"
																									value="0.2" /></b></td>

																						<td><form:label path="bwd20"
																								class="control-label">Mhz</form:label></td>

																					</tr>


																					<tr>
																						<td><form:label path="sawbw0"
																								class="control-label">Saw
																			BW</form:label></td>


																						<td><b><form:input path="sawbw0"
																									class="form-control" readonly="true"
																									value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																						<td><form:label path="sawbw0"
																								class="control-label">Mhz</form:label></td>

																					</tr>
																				</tbody>
																			</table>
																		</c:if>

																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='1'}">

																			<table class="table table-striped">
																				<tbody>

																					<tr>
																						<td><form:label path="startchd20"
																								class="control-label">Start
																			Channel</form:label></td>


																						<td><b><form:input path="startchd20"
																									type="number" class="form-control"
																									onblur="cfCalculatorDCS2h0();"
																									value="${repParams.get(loop.index).getStartChannel() }"
																									min="512" max="885" /></b></td>
																						<td></td>

																					</tr>

																					<tr>
																						<td><form:label path="stopchd20"
																								class="control-label">Stop
																			Channel</form:label></td>


																						<td><b><form:input path="stopchd20"
																									type="number" class="form-control"
																									onblur="cfCalculatorDCS2h0();"
																									value="${repParams.get(loop.index).getStopChannel() }"
																									min="512" max="885" /></b></td>
																						<td></td>

																					</tr>

																					<tr>
																						<td><form:label path="lofrequld20"
																								class="control-label">LO
																			UL</form:label></td>


																						<td><b><form:input path="lofrequld20"
																									type="number" min="1710.2" max="1784.8"
																									readonly="true" step="0.1" class="form-control"
																									value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																						<td><form:label path="lofrequld20"
																								class="control-label">Mhz</form:label></td>

																					</tr>

																					<tr>
																						<td><form:label path="lofreqdld20"
																								class="control-label">LO
																			DL</form:label></td>


																						<td><b><form:input path="lofreqdld20"
																									type="number" min="1805.2" max="1879.8"
																									readonly="true" step="0.1" class="form-control"
																									value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																						<td><form:label path="lofreqdld20"
																								class="control-label">Mhz</form:label></td>

																					</tr>

																					<tr>

																						<td><form:label path="bwd20"
																								class="control-label">Bandwidth</form:label></td>

																						<td><b><form:input path="bwd20"
																									class="form-control" readonly="true"
																									value="0.2" /></b></td>

																						<td><form:label path="bwd20"
																								class="control-label">Mhz</form:label></td>

																					</tr>


																					<tr>
																						<td><form:label path="sawbw0"
																								class="control-label">Saw
																			BW</form:label></td>


																						<td><b><form:input path="sawbw0"
																									class="form-control"
																									value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																						<td><form:label path="sawbw0"
																								class="control-label">Mhz</form:label></td>

																					</tr>
																				</tbody>
																			</table>
																		</c:if>


																	</div>
																</div>
															</div>

															<div class="row">
																<div class="col-sm-4">
																	<div class="block">
																		<table>
																			<tr>
																				<td><label for="alclvlon_off">ALC
																						ON/OFF </label></td>
																				<td></td>
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

																<div class="col-sm-4" align="center">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<button type="submit" class="btn btn-success"
																			id="apply8">ApplySettings</button>
																	</c:if>
																</div>

																<div class="col-sm-4">
																	<div class="block">
																		<table>
																			<tr>
																				<td><form:label path="dcsversion"
																						class="control-label">
																			Version</form:label></td>


																				<td><b><form:input path="dcsversion"
																							class="form-controlnew" readonly="true"
																							value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>

																				<td></td>

																			</tr>
																		</table>
																	</div>
																</div>

															</div>
														</form:form>

													</div>

													<c:choose>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==0}">
															<li class="hide" style="display: hidden;"></li>
															<div id="d212hump" style="display: hidden;"></div>
															<li class="hide" style="display: hidden;"></li>
															<div id="d234hump" style="display: hidden;"></div>
														</c:when>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==1}">
															<style>
.humpd22 {
	display: none;
}
</style>

															<li class="hide" style="display: hidden;"></li>
															<div id="d234hump" style="display: hidden;"></div>
														</c:when>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==2}">
															<div id="d234hump" style="display: hidden;"></div>
														</c:when>
														<c:when
															test="${repParams.get(loop.index).getTotalHumpCount()==3}">
															<style>
.humpd24 {
	display: none;
}
</style>

														</c:when>
													</c:choose>

													<!-- end of active pane -->

													<!-- DCS2 1 & 2 Hump Params -->
													<div id="d212hump" class="tab-pane fade">

														<form:form id="RepeaterDtaForm9"
															modelAttribute="cofigPageMapper" action="/nms/apply.htm"
															method="post">


															<div class="row">


																<div class="tab-content">


																	<c:forEach items="${humpParams}" var="humpDataList"
																		varStatus="loop">

																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 1}">

																			<div id="humpd21" class="col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-1</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="Compensation1HumpUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpUl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="Compensation1HumpDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpDl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off1">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off1"
																											id="humpon_off1" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off1"
																											id="humpon_off1" unchecked="false" /></td>
																								</c:if>

																								<form:hidden path="Identifier" />
																								<td><input id="Identifier"
																									name="Identifier" type="hidden" value="12" /></td>
																								<form:hidden path="BandName" />
																								<td><input id="BandName" name="BandName"
																									type="hidden" value="DCS2" /></td>
																								<form:hidden path="snumber" />
																								<td><input id="snumber" name="snumber"
																									type="hidden" value="${message}" /></td>
																							</tr>



																							<tr>
																								<td><form:label path="startchd21"
																										class="control-label">Start
																					Channel</form:label></td>


																								<td><b><form:input path="startchd21"
																											class="form-control" type="number" min="512"
																											max="885" onblur="cfCalculatorDCS2h1();"
																											value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																								<td></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="stopchd21"
																										class="control-label">Stop
																					Channel</form:label></td>


																								<td><b><form:input path="stopchd21"
																											class="form-control" type="number" min="512"
																											max="885" onblur="cfCalculatorDCS2h1();"
																											value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																								<td></td>
																								<td></td>
																								<td></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequld21"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequld21"
																											type="number" min="1710.2" max="1784.8"
																											step="0.1" class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequld21"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdld21"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdld21"
																											type="number" min="1805.2" max="1879.8"
																											step="0.1" class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdld21"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="bwd21"
																										class="control-label">Bandwidth</form:label></td>


																								<td><b><form:input path="bwd21"
																											class="form-control"
																											placeholder="Normal input" readonly="true"
																											value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																								<td><form:label path="bwd21"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																								<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																							</tr>

																							<tr>
																								<td><form:label path="sawbw1"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw1"
																											class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw1"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-1 -->
																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 2}">
																			<div class="humpd22 col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-2</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="CompensationAllUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllUl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="CompensationAllDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllDl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off2">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off2"
																											id="humpon_off2" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off2"
																											id="humpon_off2" unchecked="false" /></td>
																								</c:if>
																								<td></td>

																							</tr>



																							<tr>
																								<td><form:label path="startchd22"
																										class="control-label">Start
																					Channel</form:label></td>


																								<td><b><form:input path="startchd22"
																											class="form-control" type="number" min="512"
																											max="885" onblur="cfCalculatorDCS2h2();"
																											value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="stopchd22"
																										class="control-label">Stop
																					Channel</form:label></td>


																								<td><b><form:input path="stopchd22"
																											class="form-control" type="number" min="512"
																											max="885" onblur="cfCalculatorDCS2h2();"
																											value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																								<td></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequld22"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequld22"
																											type="number" min="1710.2" max="1784.8"
																											step="0.1" class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequld22"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdld22"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdld22"
																											type="number" min="1805.2" max="1879.8"
																											step="0.1" class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdld22"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="bwd22"
																										class="control-label">Bandwidth</form:label></td>


																								<td><b><form:input path="bwd22"
																											class="form-control"
																											placeholder="Normal input" readonly="true"
																											value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																								<td><form:label path="bwd22"
																										class="control-label">Mhz</form:label></td>
																								<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																							</tr>

																							<tr>
																								<td><form:label path="sawbw2"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw2"
																											class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw2"
																										class="control-label">Mhz</form:label></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-2 -->

																	</c:forEach>
																</div>

																<!-- apply button for 1 -2 Hump Params -->
																<div class="col-lg-12">
																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<div align="center">
																			<button type="submit" class="btn btn-success"
																				id="apply9">ApplySettings</button>
																		</div>
																	</c:if>
																</div>
															</div>
														</form:form>
													</div>

													<!-- GSM 3 & 4 Hump Params -->
													<div id="d234hump" class="tab-pane fade">

														<form:form id="RepeaterDtaForm10"
															modelAttribute="cofigPageMapper" action="/nms/apply.htm"
															method="post">

															<div class="row">


																<div class="tab-content">
																	<c:forEach items="${humpParams}" var="humpDataList"
																		varStatus="loop">
																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 3}">
																			<div id="humpd23" class="col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-3</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="Compensation1HumpUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpUl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="Compensation1HumpDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpDl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off3">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off3"
																											id="humpon_off3" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off3"
																											id="humpon_off3" unchecked="false" /></td>
																								</c:if>

																								<form:hidden path="Identifier" />
																								<td><input id="Identifier"
																									name="Identifier" type="hidden" value="34" /></td>
																								<form:hidden path="BandName" />
																								<td><input id="BandName" name="BandName"
																									type="hidden" value="DCS2" /></td>
																								<form:hidden path="snumber" />
																								<td><input id="snumber" name="snumber"
																									type="hidden" value="${message}" /></td>
																							</tr>



																							<tr>
																								<td><form:label path="startchd23"
																										class="control-label">Start
																					Channel</form:label></td>


																								<td><b><form:input path="startchd23"
																											class="form-control" type="number" min="512"
																											max="885" onblur="cfCalculatorDCS2h3();"
																											value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																								<td></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="stopchd23"
																										class="control-label">Stop
																					Channel</form:label></td>


																								<td><b><form:input path="stopchd23"
																											class="form-control" type="number" min="512"
																											max="885" onblur="cfCalculatorDCS2h3();"
																											value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																								<td></td>
																								<td></td>
																								<td></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequld23"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequld23"
																											type="number" min="1710.2" max="1784.8"
																											step="0.1" class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdld23"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdld23"
																											type="number" min="1805.2" max="1879.8"
																											step="0.1" class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdld23"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="bwd23"
																										class="control-label">Bandwidth</form:label></td>


																								<td><b><form:input path="bwd23"
																											class="form-control"
																											placeholder="Normal input" readonly="true"
																											value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																								<td><form:label path="bwd23"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																								<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																							</tr>

																							<tr>
																								<td><form:label path="sawbw3"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw3"
																											class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-3 -->
																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='DCS2' && humpParams.get(loop.index).getHumpId()== 4}">
																			<div class="humpd24 col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-4</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="CompensationAllUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllUl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="CompensationAllDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllDl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off4">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off4"
																											id="humpon_off4" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off4"
																											id="humpon_off4" unchecked="false" /></td>
																								</c:if>
																								<td></td>
																							</tr>



																							<tr>
																								<td><form:label path="startchd24"
																										class="control-label">Start
																					Channel</form:label></td>


																								<td><b><form:input path="startchd24"
																											class="form-control" type="number" min="512"
																											max="885" onblur="cfCalculatorDCS2h4();"
																											value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="stopchd24"
																										class="control-label">Stop
																					Channel</form:label></td>


																								<td><b><form:input path="stopchd24"
																											class="form-control" type="number" min="512"
																											max="885" onblur="cfCalculatorDCS2h4();"
																											value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																								<td></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequld24"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequld24"
																											type="number" min="1710.2" max="1784.8"
																											step="0.1" class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequld24"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdld24"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdld24"
																											type="number" min="1805.2" max="1879.8"
																											step="0.1" class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdld24"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="bwd24"
																										class="control-label">Bandwidth</form:label></td>


																								<td><b><form:input path="bwd24"
																											class="form-control"
																											placeholder="Normal input" readonly="true"
																											value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																								<td><form:label path="bwd24"
																										class="control-label">Mhz</form:label></td>
																								<%-- value="${humpParams.get(loop.index).getBandWidth() }"> --%>
																							</tr>

																							<tr>
																								<td><form:label path="sawbw4"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw4"
																											class="form-control"
																											placeholder="Normal input"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw4"
																										class="control-label">Mhz</form:label></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																			<!-- end of hump-4 -->
																		</c:if>
																	</c:forEach>
																</div>


																<!-- apply button for 3-4 Hump Params -->
																<div class="col-sm-12">

																	<c:if test="${userDetails.getRoleId() !='6'}">
																		<div align="center">
																			<button type="submit" class="btn btn-success"
																				id="apply10">ApplySettings</button>
																		</div>
																	</c:if>
																</div>
															</div>
														</form:form>
													</div>


													<div id="band" class="tab-pane fade"></div>

													<c:forEach items="${repParams}" var="bandDataList"
														varStatus="loop">
														<c:if
															test="${repParams.get(loop.index).getBandName()=='DCS2' }">
															<div id="thresholdvalue2" class="tab-pane fade">

																<form:form id="RepeaterDtaForm11"
																	modelAttribute="cofigPageMapper"
																	action="/nms/apply.htm" method="post">

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

																						<table class="table">
																							<tbody>
																								<tr>

																									<td><form:label path="thlvluldcs2"
																											class="control-label">TH Level UL</form:label></td>


																									<td><b><form:input path="thlvluldcs2"
																												class="form-control" type="number" min="-50"
																												max="50"
																												value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																									<form:hidden path="BandName" />
																									<td><input id="BandName" name="BandName"
																										type="hidden" value="DCS2" /></td>
																									<form:hidden path="snumber" />
																									<td><input id="snumber" name="snumber"
																										type="hidden" value="${message}" /></td>
																									<form:hidden path="threshold_flag" />
																									<td><input id="threshold_flag"
																										name="threshold_flag" type="hidden" value="1" /></td>
																								</tr>


																								<tr>
																									<td><form:label path="thlvldldcs2"
																											class="control-label">TH Level DL</form:label></td>


																									<td><b><form:input path="thlvldldcs2"
																												class="form-control" type="number" min="-50"
																												max="50"
																												value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>
																									<td></td>
																									<td></td>
																									<td></td>
																								</tr>

																							</tbody>
																						</table>

																					</div>

																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<div align="center">
																			<button type="submit" class="btn btn-success"
																				id="apply11">ApplySettings</button>
																		</div>
																	</div>
																</form:form>
															</div>
														</c:if>
													</c:forEach>
												</div>
												<!-- end of tab content sha-->
												<%-- </c:if> --%>
											</div>
											<!-- end of dcs2 -->
										</c:if>
									</c:forEach>
								</c:when>
							</c:choose>

							<!-- UMTS -->

							<c:forEach items="${repParams}" var="bandDataList"
								varStatus="loop">

								<c:if test="${repParams.get(loop.index).getBandName()=='UMTS' }">

									<c:set var="band4"
										value="${repParams.get(loop.index).getBandName()}" />

									<div id="umts" class="tab-pane fade">

										<div class="row">
											<div class="col-sm-12">
												<div class="block">
													<ul class="nav nav-tabs">
														<li class="active"><a data-toggle="tab" href="#home3"><b>Main
																	Params</b></a></li>
														<c:choose>
															<c:when
																test="${repParams.get(loop.index).getTotalHumpCount()==0}">
																<li class="disabled"><a href="#u12hump"
																	title='Not available'><b>Hump 1-2</b></a></li>
															</c:when>
															<c:otherwise>
																<li><a data-toggle="tab" href="#u12hump"><b>Hump
																			1-2</b></a></li>
															</c:otherwise>
														</c:choose>
														<c:choose>
															<c:when
																test="${repParams.get(loop.index).getTotalHumpCount()==0 || repParams.get(loop.index).getTotalHumpCount()==1 ||repParams.get(loop.index).getTotalHumpCount()==2}">
																<li class="disabled"><a href="#u34hump"
																	title='Not available'><b>Hump 3-4</b></a></li>
															</c:when>
															<c:otherwise>
																<li><a data-toggle="tab" href="#u34hump"><b>Hump
																			3-4</b></a></li>
															</c:otherwise>
														</c:choose>
														<li><a data-toggle="tab" href="#thresholdvalue3"><b>Threshold
																	Value</b></a></li>
													</ul>
												</div>
											</div>
										</div>

										<div class="tab-content">

											<div id="home3" class="tab-pane fade in active">

												<form:form id="RepeaterDtaForm12"
													modelAttribute="cofigPageMapper" action="/nms/apply.htm"
													method="post">


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
																			<form:hidden path="BandName" />
																			<td><input id="BandName" name="BandName"
																				type="hidden" value="UMTS" /></td>
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



																			<form:hidden path="snumber" />
																			<td><input id="snumber" name="snumber"
																				type="hidden" value="${message}" /></td>

																		</tr>

																		<tr>
																			<td><label for="paon_offdl">DL </label></td>
																			<td></td>
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

																			<c:when test="${repData.getRepeaterModel()=='0'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class=" control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="40" max="60" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="40" max="60" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='1'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class=" control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="40" max="70" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="40" max="70" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='2'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class="control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="40" max="70" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="40" max="70" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='3'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class="control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="40" max="70" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class=" control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="40" max="70" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='4'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class="control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="45" max="75" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="45" max="75" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='5'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class="control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="40" max="80" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="40" max="80" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='6'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class="control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="50" max="90" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="50" max="90" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='7'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class="control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="50" max="90" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="50" max="90" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='8'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class=" control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="55" max="95" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="55" max="95" /></b></td>

																					<td><form:label path="Gaindl"
																							class="control-label">dB</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='9'}">

																				<tr>
																					<!-- <div class="form-group"> -->
																					<td><form:label path="Gainul"
																							class="control-label">UL</form:label></td>

																					<!-- <div class="col-sm-5"> -->
																					<td><b><form:input path="Gainul"
																								name="Gainul" type="number" id="Gainul"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainUl() }"
																								min="40" max="80" /></b></td>

																					<td><form:label path="Gainul"
																							class="control-label">dB</form:label></td>
																				</tr>

																				<tr>
																					<td><form:label path="Gaindl"
																							class="control-label">DL</form:label></td>

																					<td><b><form:input path="Gaindl"
																								name="Gaindl" type="number" id="Gaindl"
																								class="form-control"
																								value="${repParams.get(loop.index).getGainDl() }"
																								min="40" max="80" /></b></td>

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
																		<c:choose>

																			<c:when test="${repData.getRepeaterModel()=='0'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-12" max="12"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-12" max="12"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='1'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-19" max="19"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-19" max="19"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='2'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class=" control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-21" max="21"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-21" max="21"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='3'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-25" max="25"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-25" max="25"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='4'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-29" max="29"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-29" max="29"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='5'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-35" max="35"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-35" max="35"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='6'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-39" max="39"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-39" max="39"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='7'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-42" max="42"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-42" max="42"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='8'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-45" max="45"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-45" max="45"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>

																			<c:when test="${repData.getRepeaterModel()=='9'}">
																				<tr>
																					<td><form:label path="alclvlul"
																							class="control-label">LVL UL</form:label></td>


																					<td><b><form:input path="alclvlul"
																								type="number" min="-32" max="32"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

																					<td><form:label path="alclvlul"
																							class="control-label">dBm</form:label></td>

																				</tr>
																				<tr>

																					<td><form:label path="alclvldl"
																							class="control-label">LVL DL</form:label></td>


																					<td><b><form:input path="alclvldl"
																								type="number" min="-32" max="32"
																								class="form-control" placeholder="Normal input"
																								value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

																					<td><form:label path="alclvldl"
																							class="control-label">dBm</form:label></td>

																				</tr>
																			</c:when>
																		</c:choose>

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
																			<td><b><form:input
																						path="Compensation1HumpUl" class="form-control"
																						value="${repParams.get(loop.index).getCompensationUl() }" /></b></td>

																			<td><form:label path="Compensation1HumpUl"
																					class="control-label">dBm</form:label></td>
																		</tr>
																		<tr class="hide">
																			<td><form:label path="Compensation1HumpDl"
																					class=" control-label">DL</form:label></td>
																			<td><b><form:input
																						path="Compensation1HumpDl" class="form-control"
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



																			<td><b><form:input path="powerulin"
																						name="powerulin" id="powerulin"
																						class="form-control"
																						value="${repParams.get(loop.index).getPowerInUl() }"
																						readonly="true" /></b></td>

																			<td><form:label path="powerulin"
																					class="control-label">dBm</form:label></td>
																		</tr>
																		<tr>

																			<td><form:label path="powerdlin"
																					class="control-label">Power DL</form:label></td>


																			<td><b><form:input path="powerdlin"
																						class="form-control" id="powerdlin"
																						name="powerdlin"
																						value="${repParams.get(loop.index).getPowerInDl() }"
																						readonly="true" /></b></td>

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


														<div class="col-sm-4">
															<div class="block">
																<h4 align="center" style="color: white">
																	<strong>Channel Information</strong>
																</h4>

																<table class="table-striped">
																	<tbody>
																		<tr>
																			<c:if
																				test="${repParams.get(loop.index).getLoEnable()=='1'}">
																				<td><form:checkbox path="LoED" id="LoED"
																						checked="true" /> Manual</td>
																			</c:if>
																			<c:if
																				test="${repParams.get(loop.index).getLoEnable()=='0'}">
																				<td><form:checkbox path="LoED" id="LoED"
																						unchecked="false" /> Auto</td>
																			</c:if>
																			<c:choose>

																				<c:when
																					test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">



																					<td class="col-sm-2"><form:select
																							path="TotalHump">
																							<form:option
																								value="${repParams.get(loop.index).getTotalHumpCount()}"
																								label="${repParams.get(loop.index).getTotalHumpCount()}" />
																							<option value="0">0</option>
																							<option value="1">1</option>
																							<option value="2">2</option>
																							<option value="3">3</option>
																							<option value="4">4</option>
																						</form:select></td>
																					<td><form:label path="bwg0"
																							class=" control-label" style="color: white">Total Hump</form:label></td>
																				</c:when>

																				<c:when
																					test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																					<td class="col-sm-2"><form:select
																							path="TotalHump">
																							<form:option
																								value="${repParams.get(loop.index).getTotalHumpCount()}"
																								label="${repParams.get(loop.index).getTotalHumpCount()}" />
																							<option value="0">0</option>
																							<option value="1">1</option>
																							<option value="2">2</option>
																						</form:select></td>
																					<td><form:label path="bwg0"
																							class=" control-label" style="color: white">Total Hump</form:label></td>
																				</c:when>
																			</c:choose>

																		</tr>
																	</tbody>
																</table>

																<c:choose>
																	<c:when
																		test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">
																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='0'}">

																			<table class="table table-striped">
																				<tbody>

																					<tr>
																						<td><form:label path="startchu0"
																								class="control-label">Start
																			Channel</form:label></td>


																						<td><b><form:input path="startchu0"
																									type="number" class="form-control"
																									readonly="true" onblur="cfCalculatorUMTSh0();"
																									min="10550" max="10850"
																									value="${repParams.get(loop.index).getStartChannel() }" /></b></td>
																						<td></td>

																					</tr>

																					<tr>
																						<td><form:label path="stopchu0"
																								class="control-label">Stop
																			Channel</form:label></td>


																						<td><b><form:input path="stopchu0"
																									type="number" class="form-control"
																									readonly="true" onblur="cfCalculatorUMTSh0();"
																									min="10550" max="10850"
																									value="${repParams.get(loop.index).getStopChannel() }" /></b></td>
																						<td></td>

																					</tr>

																					<tr>
																						<td><form:label path="lofrequlu0"
																								class="control-label">LO
																			UL</form:label></td>


																						<td><b><form:input path="lofrequlu0"
																									type="number" step="0.1" class="form-control"
																									min="1920.0" max="1980.0" readonly="true"
																									value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																						<td><form:label path="lofrequlu0"
																								class="control-label">Mhz</form:label></td>

																					</tr>

																					<tr>
																						<td><form:label path="lofreqdlu0"
																								class="control-label">LO
																			DL</form:label></td>


																						<td><b><form:input path="lofreqdlu0"
																									type="number" step="0.1" class="form-control"
																									min="2110.0" max="2170.0" readonly="true"
																									value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																						<td><form:label path="lofreqdlu0"
																								class="control-label">Mhz</form:label></td>

																					</tr>

																					<tr>

																						<td><form:label path="bwu0"
																								class="control-label">Bandwidth</form:label></td>

																						<td><b><form:input path="bwu0"
																									class="form-control" readonly="true"
																									value="0.2" /></b></td>

																						<td><form:label path="bwu0"
																								class="control-label">Mhz</form:label></td>

																					</tr>


																					<tr>
																						<td><form:label path="sawbw0"
																								class="control-label">Saw
																			BW</form:label></td>


																						<td><b><form:input path="sawbw0"
																									class="form-control" readonly="true"
																									value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																						<td><form:label path="sawbw0"
																								class="control-label">Mhz</form:label></td>

																					</tr>
																				</tbody>
																			</table>
																		</c:if>

																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='1'}">

																			<table class="table table-striped">
																				<tbody>

																					<tr>
																						<td><form:label path="startchu0"
																								class="control-label">Start
																			Channel</form:label></td>


																						<td><b><form:input path="startchu0"
																									type="number" class="form-control"
																									onblur="cfCalculatorUMTSh0();" min="10550"
																									max="10850"
																									value="${repParams.get(loop.index).getStartChannel() }" /></b></td>
																						<td></td>


																					</tr>

																					<tr>
																						<td><form:label path="stopchu0"
																								class="control-label">Stop
																			Channel</form:label></td>


																						<td><b><form:input path="stopchu0"
																									type="number" class="form-control"
																									onblur="cfCalculatorUMTSh0();" min="10550"
																									max="10850"
																									value="${repParams.get(loop.index).getStopChannel() }" /></b></td>
																						<td></td>


																					</tr>

																					<tr>
																						<td><form:label path="lofrequlu0"
																								class="control-label">LO
																			UL</form:label></td>


																						<td><b><form:input path="lofrequlu0"
																									type="number" step="0.1" class="form-control"
																									min="1920.0" max="1980.0" readonly="true"
																									value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																						<td><form:label path="lofrequlu0"
																								class="control-label">Mhz</form:label></td>


																					</tr>

																					<tr>
																						<td><form:label path="lofreqdlu0"
																								class="control-label">LO
																			DL</form:label></td>


																						<td><b><form:input path="lofreqdlu0"
																									type="number" step="0.1" class="form-control"
																									min="2110.0" max="2170.0" readonly="true"
																									value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																						<td><form:label path="lofreqdlu0"
																								class="control-label">Mhz</form:label></td>


																					</tr>

																					<tr>

																						<td><form:label path="bwu0"
																								class="control-label">Bandwidth</form:label></td>

																						<td><b><form:input path="bwu0"
																									class="form-control" readonly="true"
																									value="0.2" /></b></td>

																						<td><form:label path="bwu0"
																								class="control-label">Mhz</form:label></td>

																					</tr>


																					<tr>
																						<td><form:label path="sawbw0"
																								class="control-label">Saw
																			BW</form:label></td>


																						<td><b><form:input path="sawbw0"
																									class="form-control"
																									value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																						<td><form:label path="sawbw0"
																								class="control-label">Mhz</form:label></td>

																					</tr>
																				</tbody>
																			</table>
																		</c:if>
																	</c:when>

																	<c:when
																		test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='0'}">

																			<table class="table table-striped">

																				<tbody>

																					<tr>
																						<td><form:label path="lofrequlu0"
																								class="control-label">LO
																			UL</form:label></td>


																						<td><b><form:input path="lofrequlu0"
																									type="number" step="0.1" class="form-control"
																									min="1710.0" max="1755.0" readonly="true"
																									value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																						<td><form:label path="lofrequlu0"
																								class="control-label">Mhz</form:label></td>
																						<%--  --%>

																					</tr>

																					<tr>
																						<td><form:label path="lofreqdlu0"
																								class="control-label">LO
																			DL</form:label></td>


																						<td><b><form:input path="lofreqdlu0"
																									type="number" step="0.1" class="form-control"
																									min="2110.0" max="2155.0" readonly="true"
																									value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																						<td><form:label path="lofreqdlu0"
																								class="control-label">Mhz</form:label></td>
																						<%--  --%>

																					</tr>

																					<tr>
																						<td><form:label path="sawbw0"
																								class="control-label">Saw
																			BW</form:label></td>


																						<td><b><form:input path="sawbw0"
																									class="form-control" readonly="true"
																									value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																						<td><form:label path="sawbw0"
																								class="control-label">Mhz</form:label></td>

																					</tr>
																				</tbody>
																			</table>

																		</c:if>

																		<c:if
																			test="${repParams.get(loop.index).getLoEnable()=='1'}">


																			<table class="table table-striped">

																				<tbody>

																					<tr>
																						<td><form:label path="lofrequlu0"
																								class="control-label">LO
																			UL</form:label></td>


																						<td><b><form:input path="lofrequlu0"
																									type="number" step="0.1" class="form-control"
																									min="1710.0" max="1755.0"
																									value="${repParams.get(loop.index).getCfFreqUL()/10 }" /></b></td>

																						<td><form:label path="lofrequlu0"
																								class="control-label">Mhz</form:label></td>
																						<%--  --%>

																					</tr>

																					<tr>
																						<td><form:label path="lofreqdlu0"
																								class="control-label">LO
																			DL</form:label></td>


																						<td><b><form:input path="lofreqdlu0"
																									type="number" step="0.1" class="form-control"
																									min="2110.0" max="2155.0"
																									value="${repParams.get(loop.index).getCfFreqDL()/10 }" /></b></td>

																						<td><form:label path="lofreqdlu0"
																								class="control-label">Mhz</form:label></td>


																					</tr>

																					<tr>
																						<td><form:label path="sawbw0"
																								class="control-label">Saw
																			BW</form:label></td>


																						<td><b><form:input path="sawbw0"
																									class="form-control"
																									value="${repParams.get(loop.index).getSawBandwidth()/10 }" /></b></td>

																						<td><form:label path="sawbw0"
																								class="control-label">Mhz</form:label></td>

																					</tr>
																				</tbody>
																			</table>
																		</c:if>
																	</c:when>

																</c:choose>

															</div>
														</div>
													</div>

													<div class="row">
														<div class="col-sm-4">
															<div class="block">
																<table>
																	<tr>
																		<td><label for="alclvlon_off">ALC ON/OFF
																		</label></td>
																		<td></td>
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

														<div class="col-sm-4" align="center">
															<c:if test="${userDetails.getRoleId() !='6'}">
																<button type="submit" class="btn btn-success"
																	id="apply12">ApplySettings</button>
															</c:if>
														</div>

														<div class="col-sm-4">
															<div class="block">
																<table>
																	<tr>
																		<td><form:label path="umtsversion"
																				class="control-label">
																			Version</form:label></td>


																		<td><b><form:input path="umtsversion"
																					class="form-controlnew" readonly="true"
																					value="${repParams.get(loop.index).getFirmwareVersion()}" /></b></td>

																		<td></td>

																	</tr>
																</table>
															</div>
														</div>

													</div>
												</form:form>

											</div>

											<c:choose>
												<c:when
													test="${repParams.get(loop.index).getTotalHumpCount()==0}">
													<li class="hide" style="display: hidden;"></li>
													<div id="u12hump" style="display: hidden;"></div>
													<li class="hide" style="display: hidden;"></li>
													<div id="u34hump" style="display: hidden;"></div>
												</c:when>
												<c:when
													test="${repParams.get(loop.index).getTotalHumpCount()==1}">
													<style>
.humpu2 {
	display: none;
}
</style>
													<!-- <li class="hide" style="display: hidden;"></li>
													<div id="humpu2" style="display: hidden;"></div> -->
													<li class="hide" style="display: hidden;"></li>
													<div id="u34hump" style="display: hidden;"></div>
												</c:when>
												<c:when
													test="${repParams.get(loop.index).getTotalHumpCount()==2}">
													<div id="u34hump" style="display: hidden;"></div>
												</c:when>
												<c:when
													test="${repParams.get(loop.index).getTotalHumpCount()==3}">
													<style>
.humpu4 {
	display: none;
}
</style>
													<!-- <script>
                                                      document.getElementById('humpu4').style.display = "none";
													</script> -->
												</c:when>
											</c:choose>

											<!-- end of active pane -->

											<!-- UMTS 1 & 2 Hump Params -->
											<div id="u12hump" class="tab-pane fade">

												<form:form id="RepeaterDtaForm13"
													modelAttribute="cofigPageMapper" action="/nms/apply.htm"
													method="post">

													<div class="row">

														<div class="tab-content">
															<c:choose>
																<c:when
																	test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																	<c:forEach items="${humpParams}" var="humpDataList"
																		varStatus="loop">

																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='UMTS' && humpParams.get(loop.index).getHumpId()== 1}">

																			<div id="humpu1" class="col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-1</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="Compensation1HumpUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpUl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="Compensation1HumpDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpDl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off1">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off1"
																											id="humpon_off1" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off1"
																											id="humpon_off1" unchecked="false" /></td>
																								</c:if>

																								<form:hidden path="Identifier" />
																								<td><input id="Identifier"
																									name="Identifier" type="hidden" value="12" /></td>
																								<form:hidden path="BandName" />
																								<td><input id="BandName" name="BandName"
																									type="hidden" value="UMTS" /></td>
																								<form:hidden path="snumber" />
																								<td><input id="snumber" name="snumber"
																									type="hidden" value="${message}" /></td>
																							</tr>

																							<tr>
																								<td><form:label path="startchu1"
																										class="control-label">Start
																					Channel</form:label></td>


																								<td><b><form:input path="startchu1"
																											class="form-control" type="number"
																											onblur="cfCalculatorUMTSh1();" min="10550"
																											max="10850"
																											value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																								<td></td>
																								<td></td>
																								<td></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="stopchu1"
																										class="control-label">Stop
																					Channel</form:label></td>


																								<td><b><form:input path="stopchu1"
																											class="form-control" type="number"
																											onblur="cfCalculatorUMTSh1();" min="10550"
																											max="10850"
																											value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																								<td></td>
																								<td></td>
																								<td></td>
																								<%--  --%>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequlu1"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequlu1"
																											class="form-control" type="number"
																											min="1920.0" max="1980.0" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu1"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdlu1"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdlu1"
																											class="form-control" type="number"
																											min="2110.0" max="2170.0" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdlu1"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="bwu1"
																										class="control-label">Bandwidth</form:label></td>


																								<td><b><form:input path="bwu1"
																											class="form-control" placeholder="Bandwidth"
																											readonly="true"
																											value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																								<td><form:label path="bwu1"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw1"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw1"
																											class="form-control"
																											placeholder="Saw Bandwidth"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw1"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-1 -->
																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='UMTS' && humpParams.get(loop.index).getHumpId()== 2}">
																			<div class="humpu2 col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-2</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="CompensationAllUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllUl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="CompensationAllDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllDl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off2">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off2"
																											id="humpon_off2" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off2"
																											id="humpon_off2" unchecked="false" /></td>
																								</c:if>
																								<td></td>
																							</tr>



																							<tr>
																								<td><form:label path="startchu2"
																										class="control-label">Start
																					Channel</form:label></td>


																								<td><b><form:input path="startchu2"
																											class="form-control" type="number"
																											onblur="cfCalculatorUMTSh2();" min="10550"
																											max="10850"
																											value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																								<td></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="stopchu2"
																										class=" control-label">Stop
																					Channel</form:label></td>


																								<td><b><form:input path="stopchu2"
																											class="form-control" type="number"
																											onblur="cfCalculatorUMTSh2();" min="10550"
																											max="10850"
																											value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																								<td></td>
																								<%--  --%>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequlu2"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequlu2"
																											class="form-control" type="number" step="0.1"
																											min="1920.0" max="1980.0"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu2"
																										class="control-label">Mhz</form:label></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdlu2"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdlu2"
																											class="form-control" type="number"
																											min="2110.0" max="2170.0" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdlu2"
																										class="control-label">Mhz</form:label></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="bwu2"
																										class="control-label">Bandwidth</form:label></td>


																								<td><b><form:input path="bwu2"
																											class="form-control" placeholder="Bandwidth"
																											readonly="true"
																											value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																								<td><form:label path="bwu2"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw2"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw2"
																											class="form-control"
																											placeholder="Saw Bandwidth"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw2"
																										class="control-label">Mhz</form:label></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-2 -->

																	</c:forEach>
																</c:when>

																<c:when
																	test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																	<c:forEach items="${humpParams}" var="humpDataList"
																		varStatus="loop">

																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='UMTS' && humpParams.get(loop.index).getHumpId()== 1}">


																			<div id="humpu1" class="col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-1</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="Compensation1HumpUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpUl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="Compensation1HumpDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpDl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off1">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off1"
																											id="humpon_off1" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off1"
																											id="humpon_off1" unchecked="false" /></td>
																								</c:if>

																								<form:hidden path="Identifier" />
																								<td><input id="Identifier"
																									name="Identifier" type="hidden" value="12" /></td>
																								<form:hidden path="BandName" />
																								<td><input id="BandName" name="BandName"
																									type="hidden" value="UMTS" /></td>
																								<form:hidden path="snumber" />
																								<td><input id="snumber" name="snumber"
																									type="hidden" value="${message}" /></td>
																							</tr>


																							<tr>
																								<td><form:label path="lofrequlu1"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequlu1"
																											class="form-control" type="number" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu1"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdlu1"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdlu1"
																											class="form-control" type="number" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdlu1"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw1"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw1"
																											class="form-control"
																											placeholder="Saw Bandwidth"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw1"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-1 -->
																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='UMTS' && humpParams.get(loop.index).getHumpId()== 2}">
																			<div class="humpu2 col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-2</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="CompensationAllUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllUl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="CompensationAllDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllDl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off2">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off2"
																											id="humpon_off2" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off2"
																											id="humpon_off2" unchecked="false" /></td>
																								</c:if>
																								<td></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequlu2"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequlu2"
																											class="form-control" type="number" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu2"
																										class="control-label">Mhz</form:label></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdlu2"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdlu2"
																											class="form-control" type="number" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdlu2"
																										class="control-label">Mhz</form:label></td>
																								<%--  --%>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw2"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw2"
																											class="form-control"
																											placeholder="Saw Bandwidth"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw2"
																										class="control-label">Mhz</form:label></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-2 -->
																	</c:forEach>
																</c:when>
															</c:choose>
														</div>


														<!-- apply button for 1 -2 Hump Params -->
														<div class="col-lg-12">
															<c:if test="${userDetails.getRoleId() !='6'}">
																<div align="center">
																	<button type="submit" class="btn btn-success"
																		id="apply13">ApplySettings</button>
																</div>
															</c:if>
														</div>
													</div>
												</form:form>
											</div>


											<!-- UMTS 3 & 4 Hump Params -->
											<div id="u34hump" class="tab-pane fade">

												<form:form id="RepeaterDtaForm14"
													modelAttribute="cofigPageMapper" action="/nms/apply.htm"
													method="post">

													<div class="row">



														<div class="tab-content">

															<c:choose>
																<c:when
																	test="${repData.getReptype() == '1' || repData.getReptype() == '2'}">

																	<c:forEach items="${humpParams}" var="humpDataList"
																		varStatus="loop">
																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='UMTS' && humpParams.get(loop.index).getHumpId()== 3}">
																			<div id="humpu3" class="col-lg-6">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-3</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="Compensation1HumpUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpUl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="Compensation1HumpDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpDl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off3">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off3"
																											id="humpon_off3" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off3"
																											id="humpon_off3" unchecked="false" /></td>
																								</c:if>

																								<form:hidden path="Identifier" />
																								<td><input id="Identifier"
																									name="Identifier" type="hidden" value="34" /></td>
																								<form:hidden path="BandName" />
																								<td><input id="BandName" name="BandName"
																									type="hidden" value="UMTS" /></td>
																								<form:hidden path="snumber" />
																								<td><input id="snumber" name="snumber"
																									type="hidden" value="${message}" /></td>
																							</tr>



																							<tr>
																								<td><form:label path="startchu3"
																										class="control-label">Start
																					Channel</form:label></td>


																								<td><b><form:input path="startchu3"
																											class="form-control" type="number"
																											min="10550" max="10850"
																											onblur="cfCalculatorUMTSh3();"
																											value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																								<td></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="stopchu3"
																										class="control-label">Stop
																					Channel</form:label></td>


																								<td><b><form:input path="stopchu3"
																											class="form-control" type="number"
																											min="10550" max="10850"
																											onblur="cfCalculatorUMTSh3();"
																											value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																								<td></td>
																								<td></td>
																								<td></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequlu3"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequlu3"
																											class="form-control" type="number"
																											min="1920.0" max="1980.0" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdlu3"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdlu3"
																											class="form-control" type="number"
																											min="2110.0" max="2170.0" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdlu3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="bwu3"
																										class="control-label">Bandwidth</form:label></td>


																								<td><b><form:input path="bwu3"
																											class="form-control" placeholder="Bandwidth"
																											readonly="true"
																											value="${humpParams.get(loop.index).getBandWidth() }" /></b></td>

																								<td><form:label path="bwu3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw3"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw3"
																											class="form-control"
																											placeholder="Saw Bandwidth"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-3 -->

																		<c:if
																			test="${ humpParams.get(loop.index).getHumpId()== 4 && humpParams.get(loop.index).getBandName()=='UMTS'}">



																			<div class="humpu4 col-lg-6">

																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-4</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="CompensationAllUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllUl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="CompensationAllDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllDl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off4">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off4"
																											id="humpon_off4" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off4"
																											id="humpon_off4" unchecked="false" /></td>
																								</c:if>
																								<td></td>
																							</tr>



																							<tr>
																								<td><form:label path="startchu4"
																										class="control-label">Start
																					Channel</form:label></td>


																								<td><b><form:input path="startchu4"
																											class="form-control" type="number"
																											min="10550" max="10850"
																											onblur="cfCalculatorUMTSh4();"
																											value="${humpParams.get(loop.index).getStartChannel() }" /></b></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="stopchu4"
																										class="control-label">Stop
																					Channel</form:label></td>


																								<td><b><form:input path="stopchu4"
																											class="form-control" type="number"
																											min="10550" max="10850"
																											onblur="cfCalculatorUMTSh4();"
																											value="${humpParams.get(loop.index).getStopChannel() }" /></b></td>
																								<td></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequlu4"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequlu4"
																											class="form-control" type="number"
																											min="1920.0" max="1980.0" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu4"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdlu4"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdlu4"
																											class="form-control" type="number"
																											min="2110.0" max="2170.0" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdlu3"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="bwu4"
																										class="control-label">Bandwidth</form:label></td>


																								<td><b><form:input path="bwu4"
																											class="form-control" placeholder="Bandwidth"
																											readonly="true"
																											value="${humpParams.get(loop.index).getBandWidth() }" />
																								</b></td>
																								<td><form:label path="bwu4"
																										class="control-label">Mhz</form:label></td>
																							</tr>

																							<tr>
																								<td><form:label path="sawbw4"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw4"
																											class="form-control"
																											placeholder="Saw Bandwidth"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw4"
																										class="control-label">Mhz</form:label></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																			<!-- end of hump-4 -->
																		</c:if>


																	</c:forEach>
																</c:when>

																<c:when
																	test="${repData.getReptype() == '4' || repData.getReptype() == '5'}">

																	<c:forEach items="${humpParams}" var="humpDataList"
																		varStatus="loop">
																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='UMTS' && humpParams.get(loop.index).getHumpId()== 3}">
																			<div id="humpu3" class="col-lg-6 ">
																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-3</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="Compensation1HumpUl"
																										class="control-label">UL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpUl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="Compensation1HumpDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="Compensation1HumpDl"
																											class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off3">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off3"
																											id="humpon_off3" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off3"
																											id="humpon_off3" unchecked="false" /></td>
																								</c:if>

																								<form:hidden path="Identifier" />
																								<td><input id="Identifier"
																									name="Identifier" type="hidden" value="34" /></td>
																								<form:hidden path="BandName" />
																								<td><input id="BandName" name="BandName"
																									type="hidden" value="UMTS" /></td>
																								<form:hidden path="snumber" />
																								<td><input id="snumber" name="snumber"
																									type="hidden" value="${message}" /></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequlu3"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequlu3"
																											class="form-control" type="number" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdlu3"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdlu3"
																											class="form-control" type="number" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdlu3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw3"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw3"
																											class="form-control"
																											placeholder="Saw Bandwidth"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw3"
																										class="control-label">Mhz</form:label></td>
																								<td></td>
																								<td></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																		</c:if>
																		<!-- end of hump-3 -->
																		<c:if
																			test="${humpParams.get(loop.index).getBandName()=='UMTS' && humpParams.get(loop.index).getHumpId()== 4}">

																			<div class="humpu4 col-lg-6">

																				<div class="block">
																					<table class="table table-striped">
																						<thead>
																							<tr>
																								<th><b>Hump-4</b></th>
																							</tr>
																						</thead>
																						<tbody>
																							<!-- hidden compensation value -->
																							<tr class="hide">

																								<td><form:label path="CompensationAllUl"
																										class=" control-label">UL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllUl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Ul() }" /></b></td>

																								<td><form:label path="CompensationAllUl"
																										class="control-label">Mhz</form:label></td>
																							</tr>
																							<tr class="hide">
																								<td><form:label path="CompensationAllDl"
																										class="control-label">DL</form:label></td>
																								<td><b><form:input
																											path="CompensationAllDl" class="form-control"
																											value="${humpParams.get(loop.index).getHump_Comp_Dl() }" /></b></td>

																								<td><form:label path="CompensationAllDl"
																										class="control-label">Mhz</form:label></td>
																							</tr>
																							<tr>
																								<td><label for="humpon_off4">ON/OFF
																								</label></td>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='1' }">
																									<td><form:checkbox path="humpon_off4"
																											id="humpon_off4" checked="true" /></td>
																								</c:if>
																								<c:if
																									test="${humpParams.get(loop.index).getHump_On_Off() =='0' }">
																									<td><form:checkbox path="humpon_off4"
																											id="humpon_off4" unchecked="false" /></td>
																								</c:if>
																								<td></td>
																							</tr>

																							<tr>
																								<td><form:label path="lofrequlu4"
																										class="control-label">LO
																					Freq UL</form:label></td>


																								<td><b><form:input path="lofrequlu4"
																											class="form-control" type="number" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqUL()/10 }" /></b></td>

																								<td><form:label path="lofrequlu4"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="lofreqdlu4"
																										class="control-label">LO
																					Freq DL</form:label></td>


																								<td><b><form:input path="lofreqdlu4"
																											class="form-control" type="number" step="0.1"
																											value="${humpParams.get(loop.index).getCentralFreqDL()/10 }" /></b></td>

																								<td><form:label path="lofreqdlu4"
																										class="control-label">Mhz</form:label></td>

																							</tr>

																							<tr>
																								<td><form:label path="sawbw4"
																										class="control-label">Saw
																					BW</form:label></td>


																								<td><b><form:input path="sawbw4"
																											class="form-control"
																											placeholder="Saw Bandwidth"
																											value="${humpParams.get(loop.index).getSawBandWidth()/10 }" /></b></td>

																								<td><form:label path="sawbw4"
																										class="control-label">Mhz</form:label></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																			</div>
																			<!-- end of hump-4 -->
																		</c:if>
																	</c:forEach>
																</c:when>
															</c:choose>
															<!-- </div> -->


															<!-- apply button for 3-4 Hump Params -->
															<div class="col-sm-12">
																<c:if test="${userDetails.getRoleId() !='6'}">
																	<div align="center">
																		<button type="submit" class="btn btn-success"
																			id="apply14">ApplySettings</button>
																	</div>
																</c:if>
															</div>
														</div>


													</div>
												</form:form>
											</div>


											<div id="band" class="tab-pane fade"></div>

											<c:forEach items="${repParams}" var="bandDataList"
												varStatus="loop">
												<c:if
													test="${repParams.get(loop.index).getBandName()=='UMTS' }">
													<div id="thresholdvalue3" class="tab-pane fade">

														<form:form id="RepeaterDtaForm_5"
															modelAttribute="cofigPageMapper" action="/nms/apply.htm"
															method="post">

															<div class="row">
																<div class="col-md-12">
																	<div class="block">


																		<div class="panel " data-collapsed="0">

																			<div style="color: white">
																				<h3 align="center">
																					<strong>2100 Threshold UL</strong>
																				</h3>
																			</div>

																			<div class="panel-body">

																				<table class="table">
																					<tbody>
																						<tr>

																							<td><form:label path="thlvlulumts"
																									class="control-label">2100 Threshold UL</form:label></td>


																							<td><b><form:input path="thlvlulumts"
																										class="form-control" type="number" min="-50"
																										max="50"
																										value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																							<c:if test="${userDetails.getRoleId() !='6'}">
																								<td><button type="submit"
																										class="btn btn-success" id="apply_5">ApplySettings</button></td>
																							</c:if>

																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="UMTS" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>
																							<form:hidden path="threshold_flag" />
																							<td><input id="threshold_flag"
																								name="threshold_flag" type="hidden" value="1ul" /></td>
																						</tr>

																					</tbody>
																				</table>

																			</div>

																		</div>
																	</div>

																</div>
															</div>
														</form:form>

														<form:form id="RepeaterDtaForm_6"
															modelAttribute="cofigPageMapper" action="/nms/apply.htm"
															method="post">

															<div class="row">
																<div class="col-md-12">
																	<div class="block">

																		<div class="panel " data-collapsed="0">

																			<div style="color: white">
																				<h3 align="center">
																					<strong>2100 Threshold DL</strong>
																				</h3>
																			</div>

																			<div class="panel-body">

																				<table class="table">
																					<tbody>

																						<tr>
																							<td><form:label path="thlvldlumts"
																									class="control-label">2100 Threshold DL</form:label></td>


																							<td><b><form:input path="thlvldlumts"
																										class="form-control" type="number" min="-50"
																										max="50"
																										value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																							<c:if test="${userDetails.getRoleId() !='6'}">
																								<td><button type="submit"
																										class="btn btn-success" id="apply_6">ApplySettings</button></td>
																							</c:if>

																							<form:hidden path="BandName" />
																							<td><input id="BandName" name="BandName"
																								type="hidden" value="UMTS" /></td>
																							<form:hidden path="snumber" />
																							<td><input id="snumber" name="snumber"
																								type="hidden" value="${message}" /></td>
																							<form:hidden path="threshold_flag" />
																							<td><input id="threshold_flag"
																								name="threshold_flag" type="hidden" value="1dl" /></td>
																						</tr>

																					</tbody>
																				</table>

																			</div>

																		</div>
																	</div>

																</div>
															</div>
														</form:form>
													</div>
												</c:if>
											</c:forEach>
										</div>
										<!-- end of tab content sha-->
									</div>
									<!-- end of umts -->
								</c:if>

							</c:forEach>

						</c:forEach>

						<div id="sysdetails" class="tab-pane in active">

							<form:form id="RepeaterDtaForm16"
								modelAttribute="cofigPageMapper" action="/nms/apply.htm"
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
												<div class="col-sm-12">
													<div class="col-sm-4">
														<div class="block margin-bottom-sm">
															<div class="table-responsive">
																<table class="table table-striped">
																	<tbody>
																		<tr>
																			<td><form:label path="sysname"
																					class="control-label">Site
														Name:</form:label>
																			<td><b><form:input path="sysname"
																						type="text" maxlength="20" class="form-controlnew"
																						placeholder="Normal input"
																						value="${repData.getRepName()}" /></b></td>

																			<form:hidden path="snumber" />
																			<td style="display: none"><input id="snumber"
																				name="snumber" type="hidden" data-ng-model="snumber"
																				value="${message}" /></td>
																		</tr>


																		<tr>

																			<td><form:label path="partnum"
																					class="control-label">Part
														Number:</form:label>
																			<td><b><form:input path="partnum"
																						type="text" maxlength="20" class="form-controlnew"
																						placeholder="Normal input"
																						value="${repData.getRepPartNumber()}" /></b></td>

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

																			<td><form:label path="ipaddr"
																					class="control-label">IP
														Address:</form:label></td>


																			<td><b><form:input path="ipaddr"
																						class="form-controlnew" placeholder="Normal input"
																						value="${repData.getSerevrIpAddress()}"
																						readonly="true" /></b></td>
																		</tr>

																		<tr>

																			<td><form:label path="port"
																					class="control-label">Port:</form:label></td>


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



																	</tbody>
																</table>
															</div>
														</div>
													</div>

													<div class="col-sm-4">
														<div class="block margin-bottom-sm">
															<div class="table-responsive">
																<table class="table table-striped">
																	<tbody>
																		<tr>

																			<td><form:label path="imei"
																					class="control-label">IMEI:
														Number</form:label></td>


																			<td><b><form:input path="imei"
																						class="form-controlnew" placeholder="Normal input"
																						value="${repData.getIMEI()}" readonly="true" /></b></td>
																		</tr>

																		<tr>

																			<td><form:label path="lacId"
																					class="control-label">LAC ID:</form:label>
																			<td><b><form:input path="lacId"
																						class="form-controlnew" id="lacId" name="lacId"
																						value="${repData.getLACID()}" readonly="true" /></b></td>
																		</tr>

																		<tr>

																			<td><form:label path="cellId"
																					class="control-label">CELL ID:</form:label></td>


																			<td><b><form:input path="cellId"
																						class="form-controlnew" id="cellId" name="cellId"
																						value="${repData.getCID()}" readonly="true" /></b></td>
																		</tr>
																		<tr>
																			<td style="color: black"><form:label
																					path="region_name" class="control-label">Region Name:</form:label></td>

																			<td><form:select path="region_name">
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
																					class="control-label">Street
														Name:</form:label>
																			<td><b><form:input path="streetName"
																						class="form-controlnew" id="streetName"
																						name="streetName"
																						value="${repData.getStreetName()}" /></b></td>

																		</tr>

																		<tr>

																			<td><form:label path="city"
																					class="control-label">City:</form:label></td>

																			<td><b><form:input path="city"
																						class="form-controlnew" id="city" name="city"
																						value="${repData.getCity()}" /> </b></td>
																		</tr>

																	</tbody>
																</table>
															</div>
														</div>
													</div>

													<div class="col-sm-4">
														<div class="block margin-bottom-sm">
															<div class="table-responsive">
																<table class="table table-striped">
																	<tbody>


																		<tr>

																			<td><form:label path="state"
																					class="control-label">State:</form:label></td>


																			<td><b><form:input path="state"
																						class="form-controlnew" id="state" name="state"
																						value="${repData.getState()}" /></b></td>
																		</tr>

																		<tr>

																			<td><form:label path="country"
																					class="control-label">Country:</form:label></td>


																			<td><b><form:input path="country"
																						class="form-controlnew" id="country"
																						name="country" value="${repData.getCountry()}" /></b></td>
																		</tr>

																		<tr>

																			<td><form:label path="latitude"
																					class="control-label">Latitude:</form:label>
																			<td><b><form:input path="latitude"
																						class="form-controlnew" id="latitude"
																						name="latitude" value="${repData.getLatitude()}" /></b></td>
																		</tr>

																		<tr>

																			<td><form:label path="longitude"
																					class="control-label">Longitude:</form:label></td>


																			<td><b><form:input path="longitude"
																						class="form-controlnew" id="longitude"
																						name="longitude" value="${repData.getLongitude()}" /></b></td>
																		</tr>

																		<tr>

																			<td><form:label path="contactName"
																					class="control-label">Contact Name:</form:label>
																			<td><b><form:input path="contactName"
																						class="form-controlnew" id="contactName"
																						name="contactName"
																						value="${repData.getContactName()}" /></b></td>
																		</tr>

																		<tr>

																			<td><form:label path="contactNumber"
																					class="control-label">Contact Number:</form:label></td>


																			<td><b><form:input path="contactNumber"
																						class="form-controlnew" id="contactNumber"
																						name="contactNumber"
																						value="${repData.getContactNumber()}" /></b></td>
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
															<button type="submit" class="btn btn-success"
																id="apply16">ApplySettings</button>
														</div>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form:form>
						</div>
						<!-- end of system details -->
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
									toastr.success('Update Successfully...!!!',
											'Success!!!')
								} else if ("${sendval}" == 'Successfully Send.Waiting for update....') {
									toastr
											.warning(
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

	<jsp:include page="script.jsp" />


</body>
</html>
