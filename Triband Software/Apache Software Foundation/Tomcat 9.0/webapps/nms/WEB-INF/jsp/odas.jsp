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

<style type="text/css">

/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}

td {
	border-bottom: 1px solid #ccc;
	/* or whatever specific values you prefer */
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/neon/assets/js/form_validation.js"></script>


</head>
<body>
	<div class="d-flex align-items-stretch">
		<!--Navigation bar-->

		<jsp:include page="nav.jsp" />

		<!--end of Navigation bar-->


		<div class="main-content">

			<ol class="breadcrumb bc-3">
				<li><a href="/nms/dashboardView.htm"><i class="fa-home"></i>Home</a>
				</li>
				<li class="active">${message}</li>

				<li><c:choose>
						<c:when test="${status==true}">
							<font color="green"><b>Online</b></font>
						</c:when>
						<c:when test="${status==false}">
							<font color="orange"><b>Offline</b></font>
						</c:when>
					</c:choose></li>

			</ol>

			<h2>
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
			</h2>

			<div class="container">


				<div class="row">

					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#gsm"><b>GSM</b></a></li>
						<!-- <li><a data-toggle="tab" href="#dcs1"><b>DCS-1</b></a></li>
						<li><a data-toggle="tab" href="#dcs2"><b>DCS-2</b></a></li> -->
						<li><a data-toggle="tab" href="#umts"><b>WCDMA</b></a></li>
						<li><a data-toggle="tab" href="#sysdetails"><b>System
									Details</b></a></li>
					</ul>


				</div>

				<%-- <c:forEach items="${repParams}" var="bandDataList" varStatus="loop"> --%>
				<div class="tab-content">
					<c:forEach items="${repParams}" var="bandDataList" varStatus="loop">

						<c:if test="${repParams.get(loop.index).getBandName()=='GSM' }">

							<c:set var="band1"
								value="${repParams.get(loop.index).getBandName()}" />
							<div id="gsm" class="tab-pane fade in active">


								<div class="row">



									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#home"><b>Main
													Params</b></a></li>
										<!-- <li><a data-toggle="tab" href="#g12hump"><b>Hump
													1-2</b></a></li>
										<li><a data-toggle="tab" href="#g34hump"><b>Hump
													3-4</b></a></li> -->
										<li><a data-toggle="tab" href="#thresholdvalue"><b>Threshold
													Value</b></a></li>
									</ul>


								</div>
								<br>


								<div class="tab-content">



									<div id="home" class="tab-pane fade in active">

										<form:form id="RepeaterDtaForm" modelAttribute="opticaldAS"
											action="/nms/oDASapply.htm" method="post">

											<!-- apply button for gsm common params -->
											<div class="row">


												<div class="col-sm-6">
													<button type="submit" class="btn btn-success" id="apply">ApplySettings</button>
												</div>

												<div class="col-sm-6">

													<b><form:input path="gsmversion" class="form-control"
															id="gsmversion" name="gsmversion" readonly="true"
															value="${repParams.get(loop.index).getFirmwareVersion()}" /></b>

												</div>

											</div>
											<hr />

											<!-- page division -->
											<div class="row">


												<!-- left section -->

												<div class="col-sm-4">

													<!-- PA  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>PA ON/OFF</b>
																	</h4></td>
															</tr>
															<tr>


																<td><label for="paon_offul">UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			id="paon_offul" checked="true" /></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			id="paon_offul" unchecked="true" /></td>
																</c:if>


															</tr>

															<tr>


																<td><label for="paon_offdl">DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			id="paon_offdl" checked="true" /></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			id="paon_offdl" unchecked="false" /></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="GSM" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
																<form:hidden path="threshold_flag" />
																<td><input id="threshold_flag"
																	name="threshold_flag" type="hidden" value="0" /></td>
															</tr>
														</tbody>
													</table>

												</div>
												<!-- Middle Section -->
												<div class="col-sm-4">

													<!-- OFFSET  -->

													<table>
														<tbody>

															<tr>
																<td align="center"><h4>
																		<b>OFFSET</b>
																	</h4></td>
															</tr>

															<tr>

																<td><form:label path="offsetul"
																		class="col-sm-3 control-label">UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="col-sm-3 control-label">DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>
															</tr>
														</tbody>
													</table>
												</div>

												<!-- Right Section -->
												<div class="col-sm-4">

													<!-- ALC  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>ALC</b>
																	</h4></td>
															</tr>
															<tr>
																<td><label for="alclvlon_off">ON/OFF </label></td>
																<c:if
																	test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																	<td><form:checkbox path="alclvlon_off"
																			id="alclvlon_off" checked="true" /></td>
																</c:if>
																<c:if
																	test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																	<td><form:checkbox path="alclvlon_off"
																			id="alclvlon_off" unchecked="false" /></td>
																</c:if>

															</tr>
															<tr>
																<td><form:label path="alclvlul"
																		class="col-sm-1 control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-45" max="45" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class="col-sm-1 control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-45" max="45" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

															</tr>
														</tbody>
													</table>
												</div>

											</div>
											<!-- enf of 1st row -->
											<hr />

											<div class="row">


												<div class="col-sm-4">

													<!-- GAIN  -->

													<!-- <div class="table-responsive"> -->
													<!-- <table class="table"> -->
													<table>
														<tbody>

															<tr>
																<td align="center"><h4>
																		<b>GAIN</b>
																	</h4></td>
															</tr>

															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul"
																		class="col-sm-3 control-label">UL</form:label></td>

																<!-- <div class="col-sm-5"> -->
																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" id="Gainul" class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }"
																			min="40" max="95" /></b></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl"
																		class="col-sm-3 control-label">DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" id="Gaindl" class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }"
																			min="40" max="95" /></b></td>

															</tr>
														</tbody>
													</table>
												</div>

												<div class="col-sm-4">
													<!-- POWER  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>RF Input</b>
																	</h4></td>
															</tr>

															<tr>
																<td><form:label path="powerulin"
																		class="col-sm-3 control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="col-sm-3 control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>
															</tr>
														</tbody>
													</table>
												</div>

												<div class="col-sm-4">
													<!-- Rf Output Power -->
													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr>
															<tr>
																<td><form:label path="powerulout"
																		class="col-sm-3 control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="col-sm-3 control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

															</tr>


														</tbody>
													</table>
												</div>

											</div>
											<!-- end of 2nd row -->
											<hr />





											<div class="row">

												<div class="col-sm-4">
													<table>
														<tbody>

															<tr>
																<td><form:label path="roupdpwr"
																		class="col-sm-3 control-label">ROU PD POWER
																			</form:label></td>


																<td><b><form:input path="roupdpwr" type="text"
																			class="form-control" readonly="true"
																			value="${repParams.get(loop.index).getStartChannel() }" /></b></td>

															</tr>

															<tr>
																<td><form:label path="rouldpwr"
																		class="col-sm-3 control-label">ROU LD POWER</form:label></td>


																<td><b><form:input path="rouldpwr" type="text"
																			class="form-control" readonly="true"
																			value="${repParams.get(loop.index).getStopChannel() }" /></b></td>

															</tr>

															<tr>

																<td><form:label path="moupdpwr"
																		class="col-sm-3 control-label">MOU PD POWER</form:label></td>


																<td><b><form:input path="moupdpwr"
																			class="form-control" placeholder="MOU PD POWER"
																			readonly="true"
																			value="${repParams.get(loop.index).getCfFreqDL()}" /></b></td>

															</tr>

															<tr>

																<td><form:label path="mouldpwr"
																		class="col-sm-3 control-label">MOU LD POWER</form:label></td>


																<td><b><form:input path="mouldpwr"
																			class="form-control" placeholder="MOU LD POWER"
																			readonly="true"
																			value="${repParams.get(loop.index).getCfFreqUL()}" /></b></td>

															</tr>

														</tbody>
													</table>
												</div>


											</div>




										</form:form>
									</div>

									<!-- end of active pane -->

									<!-- GSM 1 & 2 Hump Params -->
									<div id="g12hump" class="tab-pane fade"></div>

									<!-- GSM 3 & 4 Hump Params -->
									<div id="g34hump" class="tab-pane fade"></div>


									<div id="band" class="tab-pane fade"></div>

									<c:forEach items="${repParams}" var="bandDataList"
										varStatus="loop">
										<c:if
											test="${repParams.get(loop.index).getBandName()=='GSM' }">
											<div id="thresholdvalue" class="tab-pane fade">

												<form:form id="RepeaterDtaForm_1"
													modelAttribute="opticaldAS" action="/nms/oDASapply.htm"
													method="post">

													<div class="row">
														<div class="col-md-12">

															<div class="panel panel-primary" data-collapsed="0">

																<div class="panel-heading">
																	<div class="panel-title">
																		<h3>GSM Threshold UL</h3>
																	</div>

																	<div class="panel-options">
																		<!-- <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a> -->
																		<a href="#" data-rel="collapse"><i
																			class="entypo-down-open"></i></a> <a href="#"
																			data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
																		<a href="#" data-rel="close"><i
																			class="entypo-cancel"></i></a>
																	</div>
																</div>

																<div class="panel-body">

																	<table>
																		<tbody>
																			<tr>

																				<td><form:label path="thlvlulgsm"
																						class="col-sm-3 control-label"></form:label></td>


																				<td><b><form:input path="thlvlulgsm"
																							class="form-control" type="number" min="-50"
																							max="50"
																							value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																				<td><button type="submit"
																						class="btn btn-success" id="apply_1">ApplySettings</button></td>

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
												</form:form>

												<form:form id="RepeaterDtaForm_2"
													modelAttribute="opticaldAS" action="/nms/oDASapply.htm"
													method="post">

													<div class="row">
														<div class="col-md-12">

															<div class="panel panel-primary" data-collapsed="0">

																<div class="panel-heading">
																	<div class="panel-title">
																		<h3>GSM Threshold DL</h3>
																	</div>

																	<div class="panel-options">
																		<!-- <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a> -->
																		<a href="#" data-rel="collapse"><i
																			class="entypo-down-open"></i></a> <a href="#"
																			data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
																		<a href="#" data-rel="close"><i
																			class="entypo-cancel"></i></a>
																	</div>
																</div>

																<div class="panel-body">

																	<table>
																		<tbody>
																			<tr>
																				<td><form:label path="thlvldlgsm"
																						class="col-sm-3 control-label"></form:label></td>


																				<td><b><form:input path="thlvldlgsm"
																							class="form-control" type="number" min="-50"
																							max="50"
																							value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																				<td><button type="submit"
																						class="btn btn-success" id="apply_2">ApplySettings</button></td>

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

							<c:set var="band2"
								value="${repParams.get(loop.index).getBandName()}" />



							<div id="dcs1" class="tab-pane fade">

								<!-- <br /> -->

								<div class="row">



									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#home1"><b>Main
													Params</b></a></li>
										<!-- <li><a data-toggle="tab" href="#d112hump"><b>Hump
													1-2</b></a></li>
										<li><a data-toggle="tab" href="#d134hump"><b>Hump
													3-4</b></a></li> -->
										<li><a data-toggle="tab" href="#thresholdvalue1"><b>Threshold
													Value</b></a></li>
									</ul>


								</div>
								<br>


								<div class="tab-content">



									<div id="home1" class="tab-pane fade in active">

										<form:form id="RepeaterDtaForm4" modelAttribute="opticaldAS"
											action="/nms/oDASapply.htm" method="post">

											<!-- apply button for gsm common params -->
											<div class="row">

												<div class="col-sm-6">
													<button type="submit" class="btn btn-success" id="apply4">ApplySettings</button>
												</div>

												<div class="col-sm-6">

													<%-- <form:label path="dcsversion"
																	class="col-sm-3 control-label">Version</form:label> --%>

													<b><form:input path="dcsversion" class="form-control"
															id="dcsversion" name="dcsversion" readonly="true"
															value="${repParams.get(loop.index).getFirmwareVersion()}" /></b>

												</div>

											</div>
											<hr />

											<!-- page division -->
											<div class="row">
												<div class="col-sm-4">
													<!-- style="background-color:yellow;" -->
													<!-- PA  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>PA ON/OFF</b>
																	</h4></td>
															</tr>
															<tr>


																<td><label for="paon_offul">UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			id="paon_offul" checked="true" /></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			id="paon_offul" unchecked="true" /></td>
																</c:if>


															</tr>

															<tr>


																<td><label for="paon_offdl">DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			id="paon_offdl" checked="true" /></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			id="paon_offdl" unchecked="false" /></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="DCS1" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
																<form:hidden path="threshold_flag" />
																<td><input id="threshold_flag"
																	name="threshold_flag" type="hidden" value="0" /></td>
															</tr>
														</tbody>
													</table>

												</div>
												<!-- Middle Section -->
												<div class="col-sm-4">

													<!-- OFFSET  -->

													<table>
														<tbody>

															<tr>
																<td align="center"><h4>
																		<b>OFFSET</b>
																	</h4></td>
															</tr>

															<tr>

																<td><form:label path="offsetul"
																		class="col-sm-3 control-label">UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="col-sm-3 control-label">DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>
															</tr>
														</tbody>
													</table>
												</div>

												<!-- Right Section -->
												<div class="col-sm-4">

													<!-- ALC  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>ALC</b>
																	</h4></td>
															</tr>
															<tr>
																<td><label for="alclvlon_off">ON/OFF </label></td>
																<c:if
																	test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																	<td><form:checkbox path="alclvlon_off"
																			id="alclvlon_off" checked="true" /></td>
																</c:if>
																<c:if
																	test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																	<td><form:checkbox path="alclvlon_off"
																			id="alclvlon_off" unchecked="false" /></td>
																</c:if>

															</tr>
															<tr>
																<td><form:label path="alclvlul"
																		class="col-sm-1 control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-50" max="50" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class="col-sm-1 control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-50" max="50" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

															</tr>
														</tbody>
													</table>
												</div>

											</div>
											<!-- enf of 1st row -->
											<hr />

											<div class="row">


												<div class="col-sm-4">

													<!-- GAIN  -->

													<!-- <div class="table-responsive"> -->
													<!-- <table class="table"> -->
													<table>
														<tbody>

															<tr>
																<td align="center"><h4>
																		<b>GAIN</b>
																	</h4></td>
															</tr>

															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul"
																		class="col-sm-3 control-label">UL</form:label></td>

																<!-- <div class="col-sm-5"> -->
																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" id="Gainul" class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }"
																			min="0" max="99" /></b></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl"
																		class="col-sm-3 control-label">DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" id="Gaindl" class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }"
																			min="0" max="99" /></b></td>

															</tr>
														</tbody>
													</table>
												</div>

												<div class="col-sm-4">
													<!-- POWER  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>RF Input</b>
																	</h4></td>
															</tr>

															<tr>
																<td><form:label path="powerulin"
																		class="col-sm-3 control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="col-sm-3 control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>
															</tr>
														</tbody>
													</table>
												</div>

												<div class="col-sm-4">
													<!-- Rf Output Power -->
													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr>
															<tr>
																<td><form:label path="powerulout"
																		class="col-sm-3 control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="col-sm-3 control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

															</tr>


														</tbody>
													</table>
												</div>

											</div>
											<!-- end of 2nd row -->
											<hr />

											<!-- end of 3rd row -->


										</form:form>
									</div>

									<!-- end of active pane -->

									<!-- DCS1 1 & 2 Hump Params -->
									<div id="d112hump" class="tab-pane fade"></div>

									<!-- DCS-1 3 & 4 Hump Params -->
									<div id="d134hump" class="tab-pane fade"></div>


									<div id="band" class="tab-pane fade"></div>

									<c:forEach items="${repParams}" var="bandDataList"
										varStatus="loop">
										<c:if
											test="${repParams.get(loop.index).getBandName()=='DCS1' }">
											<div id="thresholdvalue1" class="tab-pane fade">

												<form:form id="RepeaterDtaForm_3"
													modelAttribute="opticaldAS" action="/nms/oDASapply.htm"
													method="post">

													<div class="row">
														<div class="col-md-12">

															<div class="panel panel-primary" data-collapsed="0">

																<div class="panel-heading">
																	<div class="panel-title">
																		<h3>DCS1 Threshold UL</h3>
																	</div>

																	<div class="panel-options">
																		<!-- <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a> -->
																		<a href="#" data-rel="collapse"><i
																			class="entypo-down-open"></i></a> <a href="#"
																			data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
																		<a href="#" data-rel="close"><i
																			class="entypo-cancel"></i></a>
																	</div>
																</div>

																<div class="panel-body">

																	<table>
																		<tbody>
																			<tr>

																				<td><form:label path="thlvluldcs1"
																						class="col-sm-3 control-label"></form:label></td>


																				<td><b><form:input path="thlvluldcs1"
																							class="form-control" type="number" min="-50"
																							max="50"
																							value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																				<td><button type="submit"
																						class="btn btn-success" id="apply_3">ApplySettings</button></td>

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
												</form:form>

												<form:form id="RepeaterDtaForm_4"
													modelAttribute="opticaldAS" action="/nms/oDASapply.htm"
													method="post">

													<div class="row">
														<div class="col-md-12">

															<div class="panel panel-primary" data-collapsed="0">

																<div class="panel-heading">
																	<div class="panel-title">
																		<h3>DCS1 Threshold DL</h3>
																	</div>

																	<div class="panel-options">
																		<!-- <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a> -->
																		<a href="#" data-rel="collapse"><i
																			class="entypo-down-open"></i></a> <a href="#"
																			data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
																		<a href="#" data-rel="close"><i
																			class="entypo-cancel"></i></a>
																	</div>
																</div>

																<div class="panel-body">

																	<table>
																		<tbody>

																			<tr>

																				<td><form:label path="thlvldldcs1"
																						class="col-sm-3 control-label"></form:label></td>


																				<td><b><form:input path="thlvldldcs1"
																							class="form-control" type="number" min="-50"
																							max="50"
																							value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																				<td><button type="submit"
																						class="btn btn-success" id="apply_4">ApplySettings</button></td>

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
												</form:form>

											</div>
										</c:if>
									</c:forEach>

								</div>
								<!-- end of tab content sha-->
								<%-- </c:if> --%>



							</div>
							<!-- end of dcs1 -->
						</c:if>
						<c:if test="${repParams.get(loop.index).getBandName()=='DCS2' }">

							<c:set var="band3"
								value="${repParams.get(loop.index).getBandName()}" />



							<div id="dcs2" class="tab-pane fade">

								<!-- <br /> -->

								<div class="row">



									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#home2"><b>Main
													Params</b></a></li>
										<li><a data-toggle="tab" href="#d212hump"><b>Hump
													1-2</b></a></li>
										<li><a data-toggle="tab" href="#d234hump"><b>Hump
													3-4</b></a></li>
										<li><a data-toggle="tab" href="#thresholdvalue2"><b>Threshold
													Value</b></a></li>
									</ul>


								</div>
								<br>


								<div class="tab-content">



									<div id="home2" class="tab-pane fade in active">

										<form:form id="RepeaterDtaForm8" modelAttribute="opticaldAS"
											action="/nms/oDASapply.htm" method="post">

											<!-- apply button for gsm common params -->
											<div class="row">

												<div class="col-sm-6">
													<button type="submit" class="btn btn-success" id="apply8">ApplySettings</button>
												</div>

												<div class="col-sm-6">

													<%-- <form:label path="dcsversion"
																	class="col-sm-3 control-label">Version</form:label> --%>

													<b><form:input path="dcsversion" class="form-control"
															id="dcsversion" name="dcsversion" readonly="true"
															value="${repParams.get(loop.index).getFirmwareVersion()}" /></b>

												</div>

											</div>
											<hr />

											<!-- page division -->
											<div class="row">

												<div class="col-sm-4">
													<!-- style="background-color:yellow;" -->
													<!-- PA  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>PA ON/OFF</b>
																	</h4></td>
															</tr>
															<tr>


																<td><label for="paon_offul">UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			id="paon_offul" checked="true" /></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			id="paon_offul" unchecked="true" /></td>
																</c:if>


															</tr>

															<tr>


																<td><label for="paon_offdl">DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			id="paon_offdl" checked="true" /></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			id="paon_offdl" unchecked="false" /></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="DCS2" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
																<form:hidden path="threshold_flag" />
																<td><input id="threshold_flag"
																	name="threshold_flag" type="hidden" value="0" /></td>
															</tr>
														</tbody>
													</table>

												</div>
												<!-- Middle Section -->
												<div class="col-sm-4">

													<!-- OFFSET  -->

													<table>
														<tbody>

															<tr>
																<td align="center"><h4>
																		<b>OFFSET</b>
																	</h4></td>
															</tr>

															<tr>

																<td><form:label path="offsetul"
																		class="col-sm-3 control-label">UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="col-sm-3 control-label">DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>
															</tr>
														</tbody>
													</table>
												</div>

												<!-- Right Section -->
												<div class="col-sm-4">

													<!-- ALC  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>ALC</b>
																	</h4></td>
															</tr>
															<tr>
																<td><label for="alclvlon_off">ON/OFF </label></td>
																<c:if
																	test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																	<td><form:checkbox path="alclvlon_off"
																			id="alclvlon_off" checked="true" /></td>
																</c:if>
																<c:if
																	test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																	<td><form:checkbox path="alclvlon_off"
																			id="alclvlon_off" unchecked="false" /></td>
																</c:if>

															</tr>
															<tr>
																<td><form:label path="alclvlul"
																		class="col-sm-1 control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-50" max="50" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class="col-sm-1 control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-50" max="50" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

															</tr>
														</tbody>
													</table>
												</div>

											</div>
											<!-- enf of 1st row -->
											<hr />

											<div class="row">


												<div class="col-sm-4">

													<!-- GAIN  -->

													<!-- <div class="table-responsive"> -->
													<!-- <table class="table"> -->
													<table>
														<tbody>

															<tr>
																<td align="center"><h4>
																		<b>GAIN</b>
																	</h4></td>
															</tr>

															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul"
																		class="col-sm-3 control-label">UL</form:label></td>

																<!-- <div class="col-sm-5"> -->
																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" id="Gainul" class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }"
																			min="0" max="99" /></b></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl"
																		class="col-sm-3 control-label">DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" id="Gaindl" class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }"
																			min="0" max="99" /></b></td>

															</tr>
														</tbody>
													</table>
												</div>

												<div class="col-sm-4">
													<!-- POWER  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>RF Input</b>
																	</h4></td>
															</tr>

															<tr>
																<td><form:label path="powerulin"
																		class="col-sm-3 control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="col-sm-3 control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>
															</tr>
														</tbody>
													</table>
												</div>

												<div class="col-sm-4">
													<!-- Rf Output Power -->
													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr>
															<tr>
																<td><form:label path="powerulout"
																		class="col-sm-3 control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="col-sm-3 control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

															</tr>


														</tbody>
													</table>
												</div>

											</div>
											<!-- end of 2nd row -->
											<hr />





											<!-- end of 3rd row -->


										</form:form>
									</div>

									<!-- end of active pane -->

									<!-- DCS2 1 & 2 Hump Params -->
									<div id="d212hump" class="tab-pane fade"></div>

									<!-- GSM 3 & 4 Hump Params -->
									<div id="d234hump" class="tab-pane fade"></div>


									<div id="band" class="tab-pane fade"></div>

									<c:forEach items="${repParams}" var="bandDataList"
										varStatus="loop">
										<c:if
											test="${repParams.get(loop.index).getBandName()=='DCS2' }">
											<div id="thresholdvalue2" class="tab-pane fade">

												<form:form id="RepeaterDtaForm11"
													modelAttribute="opticaldAS" action="/nms/oDASapply.htm"
													method="post">
													<!-- <div class="row">
														<div class="col-sm-5">
															<button type="submit" class="btn btn-success" id="apply11">ApplySettings</button>
														</div>
													</div> -->
													<br />
													<div class="row">
														<div class="col-md-12">

															<div class="panel panel-primary" data-collapsed="0">

																<div class="panel-heading">
																	<div class="panel-title">
																		<h3>DCS2 Threshold Value</h3>
																	</div>

																	<div class="panel-options">
																		<!-- <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a> -->
																		<a href="#" data-rel="collapse"><i
																			class="entypo-down-open"></i></a> <a href="#"
																			data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
																		<a href="#" data-rel="close"><i
																			class="entypo-cancel"></i></a>
																	</div>
																</div>

																<div class="panel-body">

																	<table>
																		<tbody>
																			<tr>

																				<td><form:label path="thlvluldcs2"
																						class="col-sm-3 control-label">TH Level UL</form:label></td>


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
																						class="col-sm-3 control-label">TH Level DL</form:label></td>


																				<td><b><form:input path="thlvldldcs2"
																							class="form-control" type="number" min="-50"
																							max="50"
																							value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>
																			</tr>

																		</tbody>
																	</table>

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
							<!-- end of dcs2 -->
						</c:if>
						<c:if test="${repParams.get(loop.index).getBandName()=='UMTS' }">

							<c:set var="band4"
								value="${repParams.get(loop.index).getBandName()}" />



							<div id="umts" class="tab-pane fade">

								<!-- <br /> -->

								<div class="row">



									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#home3"><b>Main
													Params</b></a></li>
										<!-- <li><a data-toggle="tab" href="#u12hump"><b>Hump
													1-2</b></a></li>
										<li><a data-toggle="tab" href="#u34hump"><b>Hump
													3-4</b></a></li> -->
										<li><a data-toggle="tab" href="#thresholdvalue3"><b>Threshold
													Value</b></a></li>
									</ul>


								</div>
								<br>


								<div class="tab-content">



									<div id="home3" class="tab-pane fade in active">

										<form:form id="RepeaterDtaForm12" modelAttribute="opticaldAS"
											action="/nms/oDASapply.htm" method="post">

											<!-- apply button for gsm common params -->
											<div class="row">

												<div class="col-sm-6">
													<button type="submit" class="btn btn-success" id="apply12">ApplySettings</button>
												</div>

												<div class="col-sm-6">

													<%-- <form:label path="umtsversion"
																	class="col-sm-3 control-label">Version</form:label> --%>

													<b><form:input path="umtsversion" class="form-control"
															id="umtsversion" name="umtsversion" readonly="true"
															value="${repParams.get(loop.index).getFirmwareVersion()}" /></b>

												</div>

											</div>
											<hr />

											<!-- page division -->
											<div class="row">

												<div class="col-sm-4">
													<!-- style="background-color:yellow;" -->
													<!-- PA  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>PA ON/OFF</b>
																	</h4></td>
															</tr>
															<tr>


																<td><label for="paon_offul">UL </label></td>
																<c:if test="${repParams.get(loop.index).getPAUL()=='1'}">
																	<td><form:checkbox path="paon_offul"
																			id="paon_offul" checked="true" /></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPAUL()=='0'}">
																	<td><form:checkbox path="paon_offul"
																			id="paon_offul" unchecked="true" /></td>
																</c:if>


															</tr>

															<tr>


																<td><label for="paon_offdl">DL </label></td>
																<c:if test="${repParams.get(loop.index).getPADL()=='1'}">
																	<td><form:checkbox path="paon_offdl"
																			id="paon_offdl" checked="true" /></td>
																</c:if>
																<c:if test="${repParams.get(loop.index).getPADL()=='0'}">
																	<td><form:checkbox path="paon_offdl"
																			id="paon_offdl" unchecked="false" /></td>
																</c:if>

																<form:hidden path="BandName" />
																<td><input id="BandName" name="BandName"
																	type="hidden" value="UMTS" /></td>
																<form:hidden path="snumber" />
																<td><input id="snumber" name="snumber"
																	type="hidden" value="${message}" /></td>
																<form:hidden path="threshold_flag" />
																<td><input id="threshold_flag"
																	name="threshold_flag" type="hidden" value="0" /></td>
															</tr>
														</tbody>
													</table>

												</div>
												<!-- Middle Section -->
												<div class="col-sm-4">

													<!-- OFFSET  -->

													<table>
														<tbody>

															<tr>
																<td align="center"><h4>
																		<b>OFFSET</b>
																	</h4></td>
															</tr>

															<tr>

																<td><form:label path="offsetul"
																		class="col-sm-3 control-label">UL</form:label></td>
																<td><b><form:input path="offsetul"
																			type="number" min="-9" max="9" name="offsetul"
																			id="offsetul" class="form-control"
																			value="${repParams.get(loop.index).getOffsetUl() }" /></b></td>
															</tr>
															<tr>
																<td><form:label path="offsetdl"
																		class="col-sm-3 control-label">DL</form:label></td>
																<td><b><form:input path="offsetdl"
																			type="number" min="-9" max="9" name="offsetdl"
																			id="offsetdl" class="form-control"
																			value="${repParams.get(loop.index).getOffsetDl() }" /></b></td>
															</tr>
														</tbody>
													</table>
												</div>

												<!-- Right Section -->
												<div class="col-sm-4">

													<!-- ALC  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>ALC</b>
																	</h4></td>
															</tr>
															<tr>
																<td><label for="alclvlon_off">ON/OFF </label></td>
																<c:if
																	test="${repParams.get(loop.index).getAlcStatus()=='1'}">
																	<td><form:checkbox path="alclvlon_off"
																			id="alclvlon_off" checked="true" /></td>
																</c:if>
																<c:if
																	test="${repParams.get(loop.index).getAlcStatus()=='0'}">
																	<td><form:checkbox path="alclvlon_off"
																			id="alclvlon_off" unchecked="false" /></td>
																</c:if>

															</tr>
															<tr>
																<td><form:label path="alclvlul"
																		class="col-sm-1 control-label">LVL UL</form:label></td>


																<td><b><form:input path="alclvlul"
																			type="number" min="-50" max="50" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlUl() }" /></b></td>

															</tr>
															<tr>

																<td><form:label path="alclvldl"
																		class="col-sm-1 control-label">LVL DL</form:label></td>


																<td><b><form:input path="alclvldl"
																			type="number" min="-50" max="50" class="form-control"
																			placeholder="Normal input"
																			value="${repParams.get(loop.index).getAlcLvlDl() }" /></b></td>

															</tr>
														</tbody>
													</table>
												</div>

											</div>
											<!-- enf of 1st row -->
											<hr />

											<div class="row">


												<div class="col-sm-4">

													<!-- GAIN  -->

													<!-- <div class="table-responsive"> -->
													<!-- <table class="table"> -->
													<table>
														<tbody>

															<tr>
																<td align="center"><h4>
																		<b>GAIN</b>
																	</h4></td>
															</tr>

															<tr>
																<!-- <div class="form-group"> -->
																<td><form:label path="Gainul"
																		class="col-sm-3 control-label">UL</form:label></td>

																<!-- <div class="col-sm-5"> -->
																<td><b><form:input path="Gainul" name="Gainul"
																			type="number" id="Gainul" class="form-control"
																			value="${repParams.get(loop.index).getGainUl() }"
																			min="0" max="99" /></b></td>
															</tr>

															<tr>
																<td><form:label path="Gaindl"
																		class="col-sm-3 control-label">DL</form:label></td>

																<td><b><form:input path="Gaindl" name="Gaindl"
																			type="number" id="Gaindl" class="form-control"
																			value="${repParams.get(loop.index).getGainDl() }"
																			min="0" max="99" /></b></td>

															</tr>
														</tbody>
													</table>
												</div>

												<div class="col-sm-4">
													<!-- POWER  -->

													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>RF Input</b>
																	</h4></td>
															</tr>

															<tr>
																<td><form:label path="powerulin"
																		class="col-sm-3 control-label">Power UL</form:label></td>



																<td><b><form:input path="powerulin"
																			name="powerulin" id="powerulin" class="form-control"
																			value="${repParams.get(loop.index).getPowerInUl() }"
																			readonly="true" /></b></td>
															</tr>
															<tr>

																<td><form:label path="powerdlin"
																		class="col-sm-3 control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlin"
																			class="form-control" id="powerdlin" name="powerdlin"
																			value="${repParams.get(loop.index).getPowerInDl() }"
																			readonly="true" /></b></td>
															</tr>
														</tbody>
													</table>
												</div>

												<div class="col-sm-4">
													<!-- Rf Output Power -->
													<table>
														<tbody>
															<tr>
																<td align="center"><h4>
																		<b>RF Output</b>
																	</h4></td>
															</tr>
															<tr>
																<td><form:label path="powerulout"
																		class="col-sm-3 control-label">Power UL</form:label></td>


																<td><b><form:input path="powerulout"
																			class="form-control" id="powerulout"
																			name="powerulout"
																			value="${repParams.get(loop.index).getPowerOutUl() }"
																			readonly="true" /></b></td>

															</tr>

															<tr>
																<td><form:label path="powerdlout"
																		class="col-sm-3 control-label">Power DL</form:label></td>


																<td><b><form:input path="powerdlout"
																			class="form-control" id="powerdlout"
																			name="powerdlout"
																			value="${repParams.get(loop.index).getPowerOutDl() }"
																			readonly="true" /></b></td>

															</tr>


														</tbody>
													</table>
												</div>

											</div>
											<!-- end of 2nd row -->
											<hr />

											<div class="row">

												<div class="col-sm-4">
													<table>
														<tbody>

															<tr>
																<td><form:label path="roupdpwr"
																		class="col-sm-3 control-label">ROU PD POWER
																			</form:label></td>


																<td><b><form:input path="roupdpwr" type="text"
																			class="form-control" readonly="true"
																			value="${repParams.get(loop.index).getStartChannel() }" /></b></td>

															</tr>

															<tr>
																<td><form:label path="rouldpwr"
																		class="col-sm-3 control-label">ROU LD POWER</form:label></td>


																<td><b><form:input path="rouldpwr" type="text"
																			class="form-control" readonly="true"
																			value="${repParams.get(loop.index).getStopChannel() }" /></b></td>

															</tr>

															<tr>

																<td><form:label path="moupdpwr"
																		class="col-sm-3 control-label">MOU PD POWER</form:label></td>


																<td><b><form:input path="moupdpwr"
																			class="form-control" placeholder="MOU PD POWER"
																			readonly="true"
																			value="${repParams.get(loop.index).getCfFreqDL()}" /></b></td>

															</tr>

															<tr>

																<td><form:label path="mouldpwr"
																		class="col-sm-3 control-label">MOU LD POWER</form:label></td>


																<td><b><form:input path="mouldpwr"
																			class="form-control" placeholder="MOU LD POWER"
																			readonly="true"
																			value="${repParams.get(loop.index).getCfFreqUL()}" /></b></td>

															</tr>

														</tbody>
													</table>
												</div>


											</div>



											<!-- end of 3rd row -->


										</form:form>
									</div>

									<!-- end of active pane -->

									<!-- UMTS 1 & 2 Hump Params -->
									<div id="u12hump" class="tab-pane fade"></div>

									<!-- UMTS 3 & 4 Hump Params -->
									<div id="u34hump" class="tab-pane fade"></div>


									<div id="band" class="tab-pane fade"></div>

									<c:forEach items="${repParams}" var="bandDataList"
										varStatus="loop">
										<c:if
											test="${repParams.get(loop.index).getBandName()=='UMTS' }">
											<div id="thresholdvalue3" class="tab-pane fade">

												<form:form id="RepeaterDtaForm_5"
													modelAttribute="opticaldAS" action="/nms/oDASapply.htm"
													method="post">

													<div class="row">
														<div class="col-md-12">

															<div class="panel panel-primary" data-collapsed="0">

																<div class="panel-heading">
																	<div class="panel-title">
																		<h3>UMTS Threshold UL</h3>
																	</div>

																	<div class="panel-options">
																		<!-- <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a> -->
																		<a href="#" data-rel="collapse"><i
																			class="entypo-down-open"></i></a> <a href="#"
																			data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
																		<a href="#" data-rel="close"><i
																			class="entypo-cancel"></i></a>
																	</div>
																</div>

																<div class="panel-body">

																	<table>
																		<tbody>
																			<tr>

																				<td><form:label path="thlvlulumts"
																						class="col-sm-3 control-label"></form:label></td>


																				<td><b><form:input path="thlvlulumts"
																							class="form-control" type="number" min="-50"
																							max="50"
																							value="${repParams.get(loop.index).getPwrThresholdUL() }" /></b></td>

																				<td><button type="submit"
																						class="btn btn-success" id="apply_5">ApplySettings</button></td>

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
												</form:form>

												<form:form id="RepeaterDtaForm_6"
													modelAttribute="opticaldAS" action="/nms/oDASapply.htm"
													method="post">

													<div class="row">
														<div class="col-md-12">

															<div class="panel panel-primary" data-collapsed="0">

																<div class="panel-heading">
																	<div class="panel-title">
																		<h3>UMTS Threshold DL</h3>
																	</div>

																	<div class="panel-options">
																		<!-- <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a> -->
																		<a href="#" data-rel="collapse"><i
																			class="entypo-down-open"></i></a> <a href="#"
																			data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
																		<a href="#" data-rel="close"><i
																			class="entypo-cancel"></i></a>
																	</div>
																</div>

																<div class="panel-body">

																	<table>
																		<tbody>

																			<tr>
																				<td><form:label path="thlvldlumts"
																						class="col-sm-3 control-label"></form:label></td>


																				<td><b><form:input path="thlvldlumts"
																							class="form-control" type="number" min="-50"
																							max="50"
																							value="${repParams.get(loop.index).getPwrThresholdDL() }" /></b></td>

																				<td><button type="submit"
																						class="btn btn-success" id="apply_6">ApplySettings</button></td>

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
												</form:form>

											</div>
										</c:if>
									</c:forEach>

								</div>
								<!-- end of tab content sha-->
								<%-- </c:if> --%>



							</div>
							<!-- end of umts -->
						</c:if>

						<div id="sysdetails" class="tab-pane fade">
							<br />
							<form:form id="RepeaterDtaForm16" modelAttribute="opticaldAS"
								action="/nms/oDASapply.htm" method="post">
								<div class="row">
									<div class="col-sm-5">
										<button type="submit" class="btn btn-success" id="apply16">ApplySettings</button>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-md-12">

										<div class="panel panel-primary" data-collapsed="0">

											<div class="panel-heading">
												<div class="panel-title">
													<h3>System Detail</h3>
												</div>

												<div class="panel-options">
													<!-- <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a> -->
													<a href="#" data-rel="collapse"><i
														class="entypo-down-open"></i></a> <a href="#"
														data-rel="reload"><i class="entypo-arrows-ccw"></i></a> <a
														href="#" data-rel="close"><i class="entypo-cancel"></i></a>
												</div>
											</div>

											<div class="panel-body">

												<table>
													<tbody>
														<tr>
															<td><form:label path="sysname"
																	class="col-sm-3 control-label">System
														Name</form:label>
															<td><b><form:input path="sysname" type="text"
																		maxlength="20" class="form-control"
																		placeholder="Normal input"
																		value="${repData.getRepName()}" /></b></td>

															<%-- <form:hidden path="snumber" />
															<td><input id="snumber" name="snumber" type="hidden"
																				value="${message}" /></td> --%>
														</tr>
														<tr>
															<td><form:label path="region_name"
																	class="col-sm-3 control-label">Region Name</form:label></td>

															<td><form:select path="region_name">
																	<form:option value="${repData.getRegionName()}"
																		label="${repData.getRegionName()}" />
																	<option value="Andhra Pradesh">Andhra Pradesh</option>
																	<option value="Assam">Assam</option>
																	<option value="Bihar">Bihar</option>
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

															<td><form:label path="partnum"
																	class="col-sm-3 control-label">Part
														Number</form:label>
															<td><b><form:input path="partnum" type="text"
																		maxlength="20" class="form-control"
																		placeholder="Normal input"
																		value="${repData.getRepPartNumber()}" /></b></td>

														</tr>

														<tr>

															<td><form:label path="snumber"
																	class="col-sm-3 control-label">Serial
														Number</form:label></td>


															<td><b><form:input path="snumber"
																		class="form-control" placeholder="Normal input"
																		readonly="true" value="${repData.getSerialNumber()}" /></b></td>

														</tr>

														<%-- 	<tr>

															<td><form:label path="moupdpwr"
																					class="col-sm-3 control-label">MOU PD POWER</form:label></td>


															<td><b><form:input path="moupdpwr"
																						class="form-control" placeholder="MOU PD POWER"
																						readonly="true"
																						value="${repData.getCfFreqDL()}" /></b></td>

														</tr>
														
														<tr>

															<td><form:label path="mouldpwr"
																					class="col-sm-3 control-label">MOU LD POWER</form:label></td>


															<td><b><form:input path="mouldpwr"
																						class="form-control" placeholder="MOU LD POWER"
																						readonly="true"
																						value="${repData.getCfFreqUL()}" /></b></td>

														</tr> --%>

														<tr>

															<td><form:label path="ipaddr"
																	class="col-sm-3 control-label">IP
														Address</form:label></td>


															<td><b><form:input path="ipaddr"
																		class="form-control" placeholder="Normal input"
																		value="${repData.getSerevrIpAddress()}"
																		readonly="true" /></b></td>
														</tr>

														<tr>

															<td><form:label path="port"
																	class="col-sm-3 control-label">Port</form:label></td>


															<td><b><form:input path="port"
																		class="form-control" placeholder="Normal input"
																		value="${repData.getPort()}" readonly="true" /></b></td>
														</tr>

														<tr>

															<td><form:label path="apn"
																	class="col-sm-3 control-label">APN</form:label>
															<td><b><form:input path="apn"
																		class="form-control" placeholder="Normal input"
																		value="${repData.getAPN()}" readonly="true" /></b></td>
														</tr>

														<tr>

															<td><form:label path="imei"
																	class="col-sm-3 control-label">IMEI
														Number</form:label></td>


															<td><b><form:input path="imei"
																		class="form-control" placeholder="Normal input"
																		value="${repData.getIMEI()}" readonly="true" /></b></td>
														</tr>

														<!-- custom params -->
														<tr>

															<td><form:label path="streetName"
																	class="col-sm-3 control-label">Street
														Name</form:label>
															<td><b><form:input path="streetName"
																		class="form-control" id="streetName" name="streetName"
																		value="${repData.getStreetName()}" /></b></td>

														</tr>

														<tr>

															<td><form:label path="city"
																	class="col-sm-3 control-label">City</form:label></td>


															<td><b><form:input path="city"
																		class="form-control" id="city" name="city"
																		value="${repData.getCity()}" /></b></td>

														</tr>

														<tr>

															<td><form:label path="state"
																	class="col-sm-3 control-label">State</form:label></td>


															<td><b><form:input path="state"
																		class="form-control" id="state" name="state"
																		value="${repData.getState()}" /></b></td>
														</tr>

														<tr>

															<td><form:label path="country"
																	class="col-sm-3 control-label">Country</form:label></td>


															<td><b><form:input path="country"
																		class="form-control" id="country" name="country"
																		value="${repData.getCountry()}" /></b></td>
														</tr>

														<tr>

															<td><form:label path="latitude"
																	class="col-sm-3 control-label">Latitude</form:label>
															<td><b><form:input path="latitude"
																		class="form-control" id="latitude" name="latitude"
																		value="${repData.getLatitude()}" /></b></td>
														</tr>

														<tr>

															<td><form:label path="longitude"
																	class="col-sm-3 control-label">Longitude</form:label></td>


															<td><b><form:input path="longitude"
																		class="form-control" id="longitude" name="longitude"
																		value="${repData.getLongitude()}" /></b></td>
														</tr>


													</tbody>
												</table>

											</div>

										</div>

									</div>
								</div>
							</form:form>
						</div>
						<!-- end of system details -->
					</c:forEach>
				</div>
				<!-- end of band tab -->
				<%-- </c:forEach> --%>
			</div>
			<%-- </c:forEach> --%>
			<!-- end of class container -->
			<!-- Footer -->
			<jsp:include page="footer.jsp"></jsp:include>

		</div>


	</div>

	<jsp:include page="link.jsp"></jsp:include>


</body>
</html>