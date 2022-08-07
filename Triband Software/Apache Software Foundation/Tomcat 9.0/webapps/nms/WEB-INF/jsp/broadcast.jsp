<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<!DOCTYPE html>
<html lang="en">
<head>



<title>NMS | Broadcast</title>

<jsp:include page="link.jsp"></jsp:include>


<!-- Imported styles on this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/js/datatables/datatables.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/darkAdmin/bootstrap.min.css">

<script
	src="${pageContext.request.contextPath}/resources/darkAdmin/bootstrap.min.js"></script>
<script type="text/javascript">
	//for gsm
	function calcGSMCF() {
		if (document.getElementById("gsmHumpselection").value == '0') {
			validateStartStopGSM();
		}

		calcGSMBW();
		calcGSMCFUL();
		calcGSMCFDL();
	}

	function changeLabelGSM() {
		if (document.getElementById("gsmHumpselection").value == '0') {
			document.getElementById("gsm_hump_state").style.display = 'none';
			document.getElementById("gsm_hump_state_checkbox").style.display = 'none';
			document.getElementById("lbl_gsm_cful").innerHTML = 'LO UL:';
			document.getElementById("lbl_gsm_cfdl").innerHTML = 'LO DL:';
		} else {
			document.getElementById("gsm_hump_state").style.display = 'block';
			document.getElementById("gsm_hump_state_checkbox").style.display = 'block';
			document.getElementById("lbl_gsm_cful").innerHTML = 'CF Frequency UL:';
			document.getElementById("lbl_gsm_cfdl").innerHTML = 'CF Frequency DL:';
		}
	}

	function changeLabelDCS1() {
		if (document.getElementById("dcs1Humpselection").value == '0') {
			document.getElementById("dcs1_hump_state").style.display = 'none';
			document.getElementById("dcs1_hump_state_checkbox").style.display = 'none';
			document.getElementById("lbl_dcs1_cful").innerHTML = 'LO UL:';
			document.getElementById("lbl_dcs1_cfdl").innerHTML = 'LO DL:';
		} else {
			document.getElementById("dcs1_hump_state").style.display = 'block';
			document.getElementById("dcs1_hump_state_checkbox").style.display = 'block';
			document.getElementById("lbl_dcs1_cful").innerHTML = 'CF Frequency UL:';
			document.getElementById("lbl_dcs1_cfdl").innerHTML = 'CF Frequency DL:';
		}
	}

	function changeLabelDCS2() {
		if (document.getElementById("dcs2Humpselection").value == '0') {
			document.getElementById("dcs2_hump_state").style.display = 'none';
			document.getElementById("dcs2_hump_state_checkbox").style.display = 'none';
			document.getElementById("lbl_dcs2_cful").innerHTML = 'LO UL:';
			document.getElementById("lbl_dcs2_cfdl").innerHTML = 'LO DL:';
		} else {
			document.getElementById("dcs2_hump_state").style.display = 'block';
			document.getElementById("dcs2_hump_state_checkbox").style.display = 'block';
			document.getElementById("lbl_dcs2_cful").innerHTML = 'CF Frequency UL:';
			document.getElementById("lbl_dcs2_cfdl").innerHTML = 'CF Frequency DL:';
		}
	}

	function changeLabelUMTS() {
		if (document.getElementById("umtsHumpselection").value == '0') {
			document.getElementById("umts_hump_state").style.display = 'none';
			document.getElementById("umts_hump_state_checkbox").style.display = 'none';
			document.getElementById("lbl_umts_cful").innerHTML = 'LO UL:';
			document.getElementById("lbl_umts_cfdl").innerHTML = 'LO DL:';
		} else {
			document.getElementById("umts_hump_state").style.display = 'block';
			document.getElementById("umts_hump_state_checkbox").style.display = 'block';
			document.getElementById("lbl_umts_cful").innerHTML = 'CF Frequency UL:';
			document.getElementById("lbl_umts_cfdl").innerHTML = 'CF Frequency DL:';
		}
	}

	function validateStartStopGSM() {
		var start = parseInt(document.getElementById("gsmstart").value);
		var stop = parseInt(document.getElementById("gsmstop").value);
		if (stop != start) {
			stop = start;
			document.getElementById("gsmstop").value = stop;
		}
	}

	function calcGSMCFUL() {
		var start = parseInt(document.getElementById("gsmstart").value);
		var stop = parseInt(document.getElementById("gsmstop").value);
		var result = parseFloat(890.2 + 0.2 * ((start + (stop - start) / 2) - 1));
		result = result.toFixed(1);
		document.getElementById("gsmcful").value = result;
	}
	function calcGSMCFDL() {

		var n1 = parseFloat(document.getElementById("gsmcful").value);
		var y = 45.0;
		var elem = n1 + y;
		document.getElementById("gsmcfdl").value = elem;
	}
	function calcGSMBW() {

		var n1 = parseInt(document.getElementById('gsmstop').value);
		var n2 = parseInt(document.getElementById('gsmstart').value);
		var result = parseFloat((n1 - n2) * 0.2 + 0.2);
		result = result.toFixed(2);
		document.getElementById('gsmbw').value = result;
	}
	//for dcs-1
	function calcDCS1CF() {
		if (document.getElementById("dcs1Humpselection").value == '0')
			validateStartStopDCS1();
		calcDCS1BW();
		calcDCS1CFUL();
		calcDCS1CFDL();
	}

	function validateStartStopDCS1() {
		var start = parseInt(document.getElementById("dcs1start").value);
		var stop = parseInt(document.getElementById("dcs1stop").value);
		if (stop != start) {
			stop = start;
			document.getElementById("dcs1stop").value = stop;
		}
	}

	function calcDCS1CFUL() {
		var start = parseInt(document.getElementById("dcs1start").value);
		var stop = parseInt(document.getElementById("dcs1stop").value);
		var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
		result = result.toFixed(1);
		document.getElementById("dcs1cful").value = result;
	}
	function calcDCS1CFDL() {

		var n1 = parseFloat(document.getElementById("dcs1cful").value);
		var y = 95.00;
		var elem = parseFloat(n1 + y);
		document.getElementById("dcs1cfdl").value = elem;
	}
	function calcDCS1BW() {

		var n1 = parseInt(document.getElementById('dcs1stop').value);
		var n2 = parseInt(document.getElementById('dcs1start').value);
		var result = parseFloat((n1 - n2) * 0.2 + 0.2);
		result = result.toFixed(2);
		document.getElementById('dcs1bw').value = result;
	}
	//for dcs-2
	function calcDCS2CF() {
		if (document.getElementById("dcs2Humpselection").value == '0')
			validateStartStopDCS2();
		calcDCS2BW();
		calcDCS2CFUL();
		calcDCS2CFDL();
	}

	function validateStartStopDCS2() {
		var start = parseInt(document.getElementById("dcs2start").value);
		var stop = parseInt(document.getElementById("dcs2stop").value);
		if (stop != start) {
			stop = start;
			document.getElementById("dcs2stop").value = stop;
		}
	}

	function calcDCS2CFUL() {
		var start = parseInt(document.getElementById("dcs2start").value);
		var stop = parseInt(document.getElementById("dcs2stop").value);
		var result = parseFloat(1710.2 + 0.2 * ((start + (stop - start) / 2) - 512));
		result = result.toFixed(1);
		document.getElementById("dcs2cful").value = result;
	}
	function calcDCS2CFDL() {

		var n1 = parseFloat(document.getElementById("dcs2cful").value);
		var y = 95.00;
		var elem = parseFloat(n1 + y);
		document.getElementById("dcs2cfdl").value = elem;
	}
	function calcDCS2BW() {

		var n1 = parseInt(document.getElementById('dcs2stop').value);
		var n2 = parseInt(document.getElementById('dcs2start').value);
		var result = parseFloat((n1 - n2) * 0.2 + 0.2);
		result = result.toFixed(2);
		document.getElementById('dcs2bw').value = result;
	}
	//for umts
	function calcUMTSCF() {
		if (document.getElementById("umtsHumpselection").value == '0')
			validateStartStopUMTS();
		calcUMTSBW();
		calcUMTSCFDL();
		calcUMTSCFUL();
	}

	function validateStartStopUMTS() {
		var start = parseInt(document.getElementById("umtsstart").value);
		var stop = parseInt(document.getElementById("umtsstop").value);
		if (stop != start) {
			stop = start;
			document.getElementById("umtsstop").value = stop;
		}
	}

	function calcUMTSCFUL() {
		var result = parseFloat(document.getElementById("umtscfdl").value);
		result = result - 190.00;
		result = result.toFixed(1);
		document.getElementById("umtscful").value = result;
	}
	function calcUMTSCFDL() {

		var start = parseInt(document.getElementById("umtsstart").value);
		var stop = parseInt(document.getElementById("umtsstop").value);
		var result = parseFloat(start + (stop - start) / 2);
		result = 0.2 + (result / 5);
		result = result.toFixed(1);
		document.getElementById("umtscfdl").value = result;
	}
	function calcUMTSBW() {

		var n1 = parseInt(document.getElementById('umtsstop').value);
		var n2 = parseInt(document.getElementById('umtsstart').value);
		var result = parseFloat((n1 - n2) * 0.2 + 0.2);
		result = result.toFixed(2);
		document.getElementById('umtsbw').value = result;
	}

	function GSM() {
		validateFormGSM();
		//setGSMEmpty();

	}

	function setGSMEmpty() {
		document.forms["GSMbroadcast"]["gsmstart"].value = "";
		document.forms["GSMbroadcast"]["gsmstop"].value = "";
		document.forms["GSMbroadcast"]["gsmcfdl"].value = "";
		document.forms["GSMbroadcast"]["gsmcful"].value = "";
		document.forms["GSMbroadcast"]["gsmbw"].value = "";
		document.forms["GSMbroadcast"]["gsmsaw"].value = "";
	}

	function validateFormGSM() {
		var a = document.forms["GSMbroadcast"]["gsmstart"].value;
		var b = document.forms["GSMbroadcast"]["gsmstop"].value;
		var c = document.forms["GSMbroadcast"]["gsmsaw"].value;
		// var d=document.forms["broadcast"]["gsmbw"].value;
		if (a == null || a == "", b == null || b == "", c == null || c == "") {
			alert("Please Fill All Required Field");
			return false;
		}
	}

	function DCS1() {
		validateFormDCS1();
		//setDCS1Empty();

	}

	function setDCS1Empty() {
		document.forms["DCS1broadcast"]["dcs1start"].value = "";
		document.forms["DCS1broadcast"]["dcs1stop"].value = "";
		document.forms["DCS1broadcast"]["dcs1cfdl"].value = "";
		document.forms["DCS1broadcast"]["dcs1cful"].value = "";
		document.forms["DCS1broadcast"]["dcs1bw"].value = "";
		document.forms["DCS1broadcast"]["dcs1saw"].value = "";
	}

	function validateFormDCS1() {
		var a = document.forms["DCS1broadcast"]["dcs1start"].value;
		var b = document.forms["DCS1broadcast"]["dcs1stop"].value;
		var c = document.forms["DCS1broadcast"]["dcs1saw"].value;
		// var d=document.forms["broadcast"]["gsmbw"].value;
		if (a == null || a == "", b == null || b == "", c == null || c == "") {
			alert("Please Fill All Required Field");
			return false;
		}
	}
	function validateFormDCS2() {
		var a = document.forms["DCS2broadcast"]["dcs2start"].value;
		var b = document.forms["DCS2broadcast"]["dcs2stop"].value;
		var c = document.forms["DCS2broadcast"]["dcs2saw"].value;
		// var d=document.forms["broadcast"]["gsmbw"].value;
		if (a == null || a == "", b == null || b == "", c == null || c == "") {
			alert("Please Fill All Required Field");
			return false;
		}
	}
	function validateFormUMTS() {
		var a = document.forms["UMTSbroadcast"]["umtsstart"].value;
		var b = document.forms["UMTSbroadcast"]["umtsstop"].value;
		var c = document.forms["UMTSbroadcast"]["umtssaw"].value;
		// var d=document.forms["broadcast"]["gsmbw"].value;
		if (a == null || a == "", b == null || b == "", c == null || c == "") {
			alert("Please Fill All Required Field");
			return false;
		}
	}
</script>



<!-- for customize right click options -->
<script>
	var menuDisplayed = false;
	var menuBox = null;

	window.addEventListener("contextmenu", function() {
		var left = arguments[0].clientX;
		var top = arguments[0].clientY;

		menuBox = window.document.querySelector(".menu");
		menuBox.style.left = left + "px";
		menuBox.style.top = top + "px";
		menuBox.style.display = "block";

		arguments[0].preventDefault();

		menuDisplayed = true;
	}, false);

	window.addEventListener("click", function() {
		if (menuDisplayed == true) {
			menuBox.style.display = "none";
		}
	}, true);
</script>
<style>
.menu {
	width: 150px;
	box-shadow: 3px 3px 5px #888888;
	border-style: solid;
	border-width: 1px;
	border-color: grey;
	border-radius: 2px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 3px;
	padding-bottom: 3px;
	position: fixed;
	display: none;
}

.menu-item {
	height: 20px;
}

.menu-item:hover {
	background-color: #6CB5FF;
	cursor: pointer;
}

.table-wrapper-scroll-y {
	display: block;
	max-height: 200px;
	overflow-y: auto;
	-ms-overflow-style: -ms-autohiding-scrollbar;
}

th {
	position: relative;
	outline: 0;
	color: white;
	font-size: 15px;
}

td {
	font-size: 11px;
	position: relative;
	outline: 0;
	color: white;
}

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

.table-wrapper-scroll-y {
	display: block;
	max-height: 250px;
	overflow-y: auto;
	-ms-overflow-style: -ms-autohiding-scrollbar;
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

<style>
#searchBy {
	background-color: #2d3035;
	background-position: 5px 5px;
	background-repeat: no-repeat;
	color: white;
	font-size: 12px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
	width: 100%;
}
</style>

<script type="text/javascript">
	//whatever kind of mobile test you wanna do.
	if (screen.width < 500) {

		$("body").addClass("nohover");
		$("td, th").attr("tabindex", "1").on("touchstart", function() {
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
		$("#GSMbroadcast").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#DCS1broadcast").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#DCS2broadcast").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#UMTSbroadcast").on("submit", function() {
			$("#pageloader").fadeIn();
		});

		$("#repeaterByRegion").on("submit", function() {
			$("#pageloader").fadeIn();
		});
	});
</script>

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
							if ("${message}" == 'Welcome to your Dashboard !!!') {
								toastr.success('Welcome to your Dashboard !!!',
										'Welcome!!!')
							} else if ("${sendval}" == 'Connection Error...') {
								toastr.error('Connection Error...!!!',
										'Error!!!')
							} else if ("${sendval}" == 'Update Successfully...') {
								toastr.success('Update Successfully...!!!',
										'Success!!!')
							} else if ("${sendval}" == 'Successfully Send.Waiting for update....') {
								toastr
										.success(
												'Successfully Send.Waiting for update....!!!',
												'Success!!!')
							} else {
								toastr.success('Welcome to Broadcast !!!',
										'Welcome!!!')
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

</head>
<body>

	<div id="pageloader">
		<img
			src="${pageContext.request.contextPath}/resources/images/gears.gif" />
	</div>
	<div id="load"></div>

	<input class="hide" id="rewind" type="submit" value="">

	<div class="d-flex align-items-stretch">
		<!--Navigation bar-->

		<jsp:include page="nav.jsp" />

		<!--end of Navigation bar-->

		<div class="page-content">

			<ol class="breadcrumb bc-3">

				<li><a href="/nms/dashboardView.htm"
					style="font-size: 15px; color: white"><i class="entypo-home"
						style="font-size: 15px; color: white"></i><strong>Home</strong></a></li>
				<li class="active"><a href="/nms/broadcast.htm"
					style="font-size: 15px; color: white"><strong>Site>>
							Broadcast</strong></a></li>

			</ol>

			<!-- <div class="jumbotron">
				<h1>Frequency Configuration</h1>

				<div class="menu">
					<div class="menu-item">
						<ul>
							<li class="has-sub"><a href="#">GSM Threshold</a>

								<ul>
									<li><a href="javascript:;"
										onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});"
										class="btn btn-default"><strong>UL</strong></a></li>
									<li><a href="javascript:;"
										onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});"
										class="btn btn-default"><strong>DL</strong></a></li>
								</ul></li>
						</ul>
					</div>

					<div class="menu-item">
						<a href="javascript:;"
							onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});"
							class="btn btn-default"><strong>DCS Threshold</strong></a>
					</div>

					<div class="menu-item">
						<a href="javascript:;"
							onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});"
							class="btn btn-default"><strong>UMTS Threshold</strong></a>
					</div>

				</div>

				Modal 6 (Long Modal)
				<div class="modal fade" id="modal-6">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title">Threshold Setting Broadcast</h4>
							</div>

							<div class="modal-body">

								<div class="row">
									<div class="col-md-6">

										<div class="form-group">
											<label for="field-1" class="control-label">UL:</label> <input
												type="number" min="-50" max="50" class="form-control"
												id="gsmul" placeholder="Threshold Up Link Value">
										</div>

									</div>

									<div class="col-md-6">

										<div class="form-group">
											<label for="field-2" class="control-label">DL:</label> <input
												type="number" min="-50" max="50" class="form-control"
												id="gsmdl" placeholder="Threshold Down Link Value">
										</div>

									</div>
								</div>


							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-info">Broadcast
									changes</button>
							</div>
						</div>
					</div>
				</div>

			</div>  -->


			<form:form id="repeaterByRegion" method="post"
				action="repeaterByRegion.htm">

				<div class="container-fluid">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-4">

								<select name="searchBy" id="searchBy" required="required">
									<c:choose>
										<c:when
											test="${userDetails.getRoleId() =='5' && !(userDetails.getAssignedRegion().equals('All'))}">

											<option value="${userDetails.getAssignedRegion()}" selected
												label="${userDetails.getAssignedRegion()}" />

										</c:when>

										<c:otherwise>
											<option value="${regionName}" selected label="${regionName}" />

											<!-- <option value="" disabled selected>--Search by regions--</option> -->

											<option value="AP & Telangana">AP & Telangana</option>
											<option value="Assam">Assam</option>
											<option value="Bihar Jharkhand">Bihar Jharkhand</option>
											<option value="Chennai">Chennai</option>
											<option value="Delhi & NCR">Delhi & NCR</option>
											<option value="Gujarat">Gujarat</option>
											<option value="Haryana">Haryana</option>
											<option value="Himachal Pradesh">Himachal Pradesh</option>
											<option value="Jammu & Kashmir">Jammu & Kashmir</option>
											<option value="Karnataka">Karnataka</option>
											<option value="Kerala">Kerala</option>
											<option value="Kolkata">Kolkata</option>
											<option value="MP & Chhattisgarah">MP &
												Chhattisgarah</option>
											<option value="Maharashtra & Goa">Maharashtra & Goa</option>
											<option value="Mumbai">Mumbai</option>
											<option value="Northeast">Northeast</option>
											<option value="Orissa">Orissa</option>
											<option value="Punjab">Punjab</option>
											<option value="Rajasthan">Rajasthan</option>
											<option value="Tamil Nadu">Tamil Nadu</option>
											<option value="Uttar Pradesh (East)">Uttar Pradesh
												(East)</option>
											<option value="Uttar Pradesh (West)">Uttar Pradesh
												(West)</option>
											<option value="West Bengal">West Bengal</option>

										</c:otherwise>
									</c:choose>

								</select>

							</div>

							<span> <!-- <input id="showRepeaterList"
								class="btn btn-primary" value="Search" type="submit"> -->
								<button type="submit" id="myButton"
									class="btn btn-primary btn-lg-3 form-feedback">Search
								</button> <span> <a class="txt1" style="color: orange">
										${errorMessage} <i aria-hidden="true"></i>
								</a>
							</span></span>



							<!-- <span class="col-lg-4"> <span
												class="form-group input-group has-feedback"> <span
													class="input-group-addon"> <span
														class="fa fa-search"></span>
												</span> <input type="search" placeholder="Type for search..."
													class="form-control" id="myInput" /> <span
													class="glyphicon form-control-feedback" aria-hidden="true"></span>
											</span></span> -->

							<div class="col-lg-12">
								<div class="block margin-bottom-sm">
									<div class="table-responsive">
										<div class="table-wrapper-scroll-y">
											<table class="table table-striped table-sm form-feedback"
												id="table-4">

												<thead>
													<tr>
														<th><b>Serial Number</b></th>
														<th><b>Site Name</b></th>
														<th><b>Region Name</b></th>
														<th><b>City Name</b></th>
														<th><b>Repeater Status</b></th>
													</tr>
												</thead>

												<tbody>

													<c:forEach items="${repDataList}" var="repeaterList"
														varStatus="loop">
														<tr>
															<td><c:out
																	value="${repDataList.get(loop.index).getSerialNumber()}" /></td>
															<td><c:out
																	value="${repDataList.get(loop.index).getSitename()}" /></td>
															<td><c:out
																	value="${repDataList.get(loop.index).getRegionName()}" /></td>
															<td><c:out
																	value="${repDataList.get(loop.index).getCity()}" /></td>
															<td style="color: #32CD32"><c:out value="online" /></td>
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
				</div>
			</form:form>


			<h4>

				<c:if test="${ack == 'Not Sent.Try Again...'}">
					<font color="orange">Not Sent.Try Again...</font>
				</c:if>
			</h4>
			<h4>
				<c:if test="${ack == 'Successfully Sent'}">
					<font color="#32CD32">Successfully Sent...</font>
				</c:if>
			</h4>




			<div class="container-fluid">
				<div class="col-lg-12">
					<div class="block">

						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#gsm"><b>GSM</b></a></li>
							<li><a data-toggle="tab" href="#dcs1"><b>DCS1</b></a></li>
							<li><a data-toggle="tab" href="#dcs2"><b>DCS2</b></a></li>
							<li><a data-toggle="tab" href="#umts"><b>UMTS</b></a></li>
						</ul>


						<div class="tab-content">

							<div id="gsm" class="tab-pane fade in active">

								<form:form id="GSMbroadcast" modelAttribute="broadcastMapper"
									action="/nms/broadcast_apply.htm" method="post">

									<div class="row">

										<div class="col-lg-6">


											<table class="table table-striped">
												<tbody>

													<form:hidden path="bandName" value="GSM" />

													<tr>
														<td><label><b>Select Hump:</b></label></td>
														<td><strong><font><form:select
																		path="selectedHumpNumber" id="gsmHumpselection"
																		onchange="changeLabelGSM();">
																		<form:option value="0">HUMP-0</form:option>
																		<option value="1">HUMP-1</option>
																		<option value="2">HUMP-2</option>
																		<option value="3">HUMP-3</option>
																		<option value="4">HUMP-4</option>
																	</form:select></font></strong></td>
													</tr>

													<tr>
														<td><form:label path="startchannel">
																<b>Start Channel:</b>
															</form:label>
														<td><strong><form:input path="startchannel"
																	id="gsmstart" type="number" min="1" max="124"
																	placeholder="1" value="" onblur="calcGSMCF();" /></strong></td>
														<!--value - ${repData.getRegionName()}, label - ${repData.getRegionName()}, path="region_name" -->
														<%-- <td><select>
								<form:option value=""
									label="" />
								<option value="Andhra Pradesh">Andhra Pradesh</option>
								<option value="Assam">Assam</option>
								<option value="Bihar">Bihar</option>
								<option value="Delhi">Delhi</option>
								<option value="Gujarat">Gujarat</option>
								<option value="Haryana">Haryana</option>
								<option value="Himachal Pradesh">Himachal Pradesh</option>
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
								<option value="Uttar Pradesh (East)">Uttar Pradesh
									(East)</option>
								<option value="Uttar Pradesh (West)">Uttar Pradesh
									(West)</option>
								<option value="West Bengal">West Bengal</option>
								<option value="Other">Other</option>

							</select></td> --%>
													</tr>

													<tr>
														<td><form:label path="stopchannel">
																<b>Stop Channel:</b>
															</form:label></td>
														<td><strong><form:input path="stopchannel"
																	id="gsmstop" type="number" min="1" max="124"
																	placeholder="124" value="" onblur="calcGSMCF();" /></strong></td>
													</tr>

													<tr>
														<td><form:label path="bw">
																<b>Bandwidth:</b>
															</form:label></td>
														<td><strong><form:input path="bw" id="gsmbw"
																	readonly="true" /></strong></td>
													</tr>


												</tbody>

											</table>
										</div>
										<!-- end of first column -->

										<div class="col-lg-6">
											<table class="table table-striped">
												<tbody>

													<tr>
														<td><label id="gsm_hump_state"><b>Hump
																	On/Off:</b></label></td>
														<td><form:checkbox path="humpState"
																id="gsm_hump_state_checkbox" /></td>
													</tr>

													<tr>
														<td><label id="lbl_gsm_cful"><b>CF
																	Frequency UL:</b></label>
														<td><strong><form:input path="cfUL"
																	id="gsmcful" readonly="true" /></strong></td>
													</tr>

													<tr>
														<td><label id="lbl_gsm_cfdl"><b>CF
																	Frequency DL:</b></label></td>
														<td><strong><form:input path="cfDL"
																	id="gsmcfdl" readonly="true" /></strong></td>
													</tr>

													<tr>
														<td><label><b>Saw Bandwidth:</b></label></td>
														<td><strong><form:input path="saw"
																	id="gsmsaw" type="number" min="1" max="25" step="0.1" /></strong></td>
													</tr>

												</tbody>

											</table>
										</div>
										<!-- end of second column -->

										<div class="col-sm-12">

											<c:if test="${userDetails.getRoleId() !='6'}">
												<div align="center">
													<button type="submit" class="btn btn-primary" id="applyGSM">
														<strong>Broadcast</strong>
													</button>
												</div>
											</c:if>
										</div>


									</div>

								</form:form>
							</div>
							<!-- end of gsm -->


							<div id="dcs1" class="tab-pane">

								<form:form id="DCS1broadcast" modelAttribute="broadcastMapper"
									action="/nms/broadcast_apply.htm" method="post">

									<div class="row">

										<div class="col-sm-6">
											<table class="table table-striped">
												<tbody>

													<form:hidden path="bandName" value="DCS1" />

													<tr>
														<td><label><b>Select Hump:</b></label></td>
														<td><strong><font><form:select
																		path="selectedHumpNumber" id="dcs1Humpselection"
																		onchange="changeLabelDCS1();">
																		<form:option value="0">HUMP-0</form:option>
																		<option value="1">HUMP-1</option>
																		<option value="2">HUMP-2</option>
																		<option value="3">HUMP-3</option>
																		<option value="4">HUMP-4</option>
																	</form:select></font></strong></td>
													</tr>

													<tr>
														<td><form:label path="startchannel">
																<b>Start Channel:</b>
															</form:label>
														<td><strong><form:input path="startchannel"
																	id="dcs1start" type="number" min="512" max="850"
																	placeholder="512" value="" onblur="calcDCS1CF();" /></strong></td>



													</tr>

													<tr>
														<td><form:label path="stopchannel">
																<b>Stop Channel:</b>
															</form:label></td>
														<td><strong><form:input path="stopchannel"
																	id="dcs1stop" type="number" min="512" max="850"
																	placeholder="850" value="" onblur="calcDCS1CF();" /></strong></td>
													</tr>

													<tr>
														<td><form:label path="bw">
																<b>Bandwidth:</b>
															</form:label></td>
														<td><strong><form:input path="bw"
																	id="dcs1bw" readonly="true" /></strong></td>
													</tr>

												</tbody>

											</table>
										</div>
										<!-- end of first column -->

										<div class="col-sm-6">
											<table class="table table-striped">
												<tbody>

													<tr>
														<td><label id="dcs1_hump_state"><b>Hump
																	On/Off:</b></label></td>
														<td><form:checkbox path="humpState"
																id="dcs1_hump_state_checkbox" /></td>
													</tr>

													<tr>
														<td><label id="lbl_dcs1_cful"><b>CF
																	Frequency UL:</b></label>
														<td><strong><form:input path="cfUL"
																	id="dcs1cful" readonly="true" /></strong></td>
													</tr>

													<tr>
														<td><label id="lbl_dcs1_cfdl"><b>CF
																	Frequency DL:</b></label></td>
														<td><strong><form:input path="cfDL"
																	id="dcs1cfdl" readonly="true" /></strong></td>
													</tr>

													<tr>
														<td><label><b>Saw Bandwidth:</b></label></td>
														<td><strong><form:input path="saw"
																	id="dcs1saw" type="number" min="1" max="75" step="0.1" /></strong></td>
													</tr>

												</tbody>

											</table>
										</div>
										<!-- end of second column -->

										<div class="col-sm-12">

											<c:if test="${userDetails.getRoleId() !='6'}">
												<div align="center">
													<button type="submit" class="btn btn-primary"
														id="applyDCS1">
														<strong>Broadcast</strong>
													</button>
												</div>
											</c:if>
										</div>


									</div>
								</form:form>
							</div>
							<!-- end of dcs1 -->

							<div id="dcs2" class="tab-pane">

								<form:form id="DCS2broadcast" modelAttribute="broadcastMapper"
									action="/nms/broadcast_apply.htm" method="post">

									<div class="row">

										<div class="col-sm-6">
											<table class="table table-striped">
												<tbody>

													<form:hidden path="bandName" value="DCS2" />

													<tr>
														<td><label><b>Select Hump:</b></label></td>
														<td><strong><font><form:select
																		path="selectedHumpNumber" id="dcs2Humpselection"
																		onchange="changeLabelDCS2();">
																		<form:option value="0">HUMP-0</form:option>
																		<option value="1">HUMP-1</option>
																		<option value="2">HUMP-2</option>
																		<option value="3">HUMP-3</option>
																		<option value="4">HUMP-4</option>
																	</form:select></font></strong></td>
													</tr>

													<tr>
														<td><form:label path="startchannel">
																<b>Start Channel:</b>
															</form:label>
														<td><strong><form:input path="startchannel"
																	id="dcs2start" type="number" min="512" max="850"
																	placeholder="512" onblur="calcDCS2CF();" /></strong></td>



													</tr>

													<tr>
														<td><form:label path="stopchannel">
																<b>Stop Channel:</b>
															</form:label></td>
														<td><strong><form:input path="stopchannel"
																	id="dcs2stop" type="number" min="512" max="850"
																	placeholder="850" onblur="calcDCS2CF();" /></strong></td>
													</tr>

													<tr>
														<td><form:label path="bw">
																<b>Bandwidth:</b>
															</form:label></td>
														<td><strong><form:input path="bw"
																	id="dcs2bw" readonly="true" /></font></strong></td>
													</tr>

												</tbody>

											</table>
										</div>
										<!-- end of first column -->

										<div class="col-sm-6">
											<table class="table table-striped">
												<tbody>

													<tr>
														<td><label id="dcs2_hump_state"><b>Hump
																	On/Off:</b></label></td>
														<td><form:checkbox path="humpState"
																id="dcs2_hump_state_checkbox" /></td>
													</tr>

													<tr>
														<td><label id="lbl_dcs2_cful"><b>CF
																	Frequency UL:</b></label>
														<td><strong><form:input path="cfUL"
																	id="dcs2cful" readonly="true" /></strong></td>
													</tr>

													<tr>
														<td><label id="lbl_dcs2_cfdl"><b>CF
																	Frequency DL:</b></label></td>
														<td><strong><form:input path="cfDL"
																	id="dcs2cfdl" readonly="true" /></strong></td>
													</tr>

													<tr>
														<td><label><b>Saw Bandwidth:</b></label></td>
														<td><strong><form:input path="saw"
																	id="dcs2saw" type="number" min="1" max="75" step="0.1" /></strong></td>
													</tr>

												</tbody>

											</table>
										</div>
										<!-- end of second column -->

										<div class="col-sm-12">

											<c:if test="${userDetails.getRoleId() !='6'}">
												<div align="center">
													<button type="submit" class="btn btn-primary"
														id="applyDCS2">
														<strong>Broadcast</strong>
													</button>
												</div>
											</c:if>
										</div>


									</div>
								</form:form>
							</div>
							<!-- end of dcs2 -->

							<div id="umts" class="tab-pane">

								<form:form id="UMTSbroadcast" modelAttribute="broadcastMapper"
									action="/nms/broadcast_apply.htm" method="post">

									<div class="row">

										<div class="col-sm-6">
											<table class="table table-striped">
												<tbody>

													<form:hidden path="bandName" value="UMTS" />

													<tr>
														<td><label><b>Select Hump:</b></label></td>
														<td><strong><font><form:select
																		path="selectedHumpNumber" id="umtsHumpselection"
																		onchange="changeLabelUMTS();">
																		<form:option value="0">HUMP-0</form:option>
																		<option value="1">HUMP-1</option>
																		<option value="2">HUMP-2</option>
																		<option value="3">HUMP-3</option>
																		<option value="4">HUMP-4</option>
																	</form:select></font></strong></td>
													</tr>

													<tr>
														<td><form:label path="startchannel">
																<b>Start Channel:</b>
															</form:label>
														<td><strong><form:input path="startchannel"
																	id="umtsstart" onblur="calcUMTSCF();" type="number"
																	min="10550" max="10850" placeholder="10550" /></strong></td>

													</tr>

													<tr>
														<td><form:label path="stopchannel">
																<b>Stop Channel:</b>
															</form:label></td>
														<td><strong><form:input path="stopchannel"
																	id="umtsstop" onblur="calcUMTSCF();" type="number"
																	min="10550" max="10850" placeholder="10850" /></strong></td>
													</tr>

													<tr>
														<td><form:label path="bw">
																<b>Bandwidth:</b>
															</form:label></td>
														<td><strong><form:input path="bw"
																	id="umtsbw" readonly="true" /></strong></td>
													</tr>

												</tbody>

											</table>
										</div>
										<!-- end of first column -->

										<div class="col-sm-6">
											<table class="table table-striped">
												<tbody>

													<tr>
														<td><label id="umts_hump_state"><b>Hump
																	On/Off:</b></label></td>
														<td><form:checkbox path="humpState"
																id="umts_hump_state_checkbox" /></td>
													</tr>

													<tr>
														<td><label id="lbl_umts_cful"><b>CF
																	Frequency UL:</b></label>
														<td><strong><form:input path="cfUL"
																	id="umtscful" readonly="true" /></strong></td>
													</tr>

													<tr>
														<td><label id="lbl_umts_cfdl"><b>CF
																	Frequency DL:</b></label></td>
														<td><strong><form:input path="cfDL"
																	id="umtscfdl" readonly="true" /></strong></td>
													</tr>

													<tr>
														<td><label><b>Saw Bandwidth:</b></label></td>
														<td><strong><form:input path="saw"
																	id="umtssaw" type="number" min="1" max="60" step="0.1" /></strong></td>
													</tr>

												</tbody>

											</table>
										</div>
										<!-- end of second column -->

										<div class="col-sm-12">

											<c:if test="${userDetails.getRoleId() !='6'}">
												<div align="center">
													<button type="submit" class="btn btn-primary"
														id="applyUMTS">
														<strong>Broadcast</strong>
													</button>
												</div>
											</c:if>
										</div>
									</div>
								</form:form>
							</div>
							<!-- end of umts -->
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
									toastr.success('Update Successfully...!!!',
											'Success!!!')
								} else if ("${sendval}" == 'Successfully Send.Waiting for update....') {
									toastr
											.success(
													'Successfully Send.Waiting for update....!!!',
													'Success!!!')
								} else {
									toastr.success('Welcome to Broadcast !!!',
											'Welcome!!!')
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

	<script type="text/javascript">
		jQuery(document)
				.ready(
						function($) {

							var $table4 = jQuery("#table-4");

							$table4
									.DataTable({
										dom : 'Bfrtip',
										buttons : [ {

											extend : 'csv',
											text : 'Save as <img src="resources/images/excel.ico" height="25" width="25">'

										} /* ,'pdfHtml5' */
										]
									});
						});
	</script>

	<script type="text/javascript">
		// Code used to add Todo Tasks
		jQuery(document)
				.ready(
						function($) {
							var $todo_tasks = $("#todo_tasks");

							$todo_tasks
									.find('input[type="text"]')
									.on(
											'keydown',
											function(ev) {
												if (ev.keyCode == 13) {
													ev.preventDefault();

													if ($.trim($(this).val()).length) {
														var $todo_entry = $('<li><div class="checkbox checkbox-replace color-white"><input type="checkbox" /><label>'
																+ $(this).val()
																+ '</label></div></li>');
														$(this).val('');

														$todo_entry
																.appendTo($todo_tasks
																		.find('.todo-list'));
														$todo_entry.hide()
																.slideDown(
																		'fast');
														replaceCheckboxes();
													}
												}
											});
						});

		jQuery(document)
				.ready(
						function($) {
							// Sample Toastr Notification
							setTimeout(
									function() {
										var opts = {
											"closeButton" : true,
											"debug" : false,
											"positionClass" : rtl() /*|| public_vars.$pageContainer.hasClass('right-sidebar') ? "toast-top-left" : "toast-top-right"*/,
											"toastClass" : "black",
											"onclick" : null,
											"showDuration" : "300",
											"hideDuration" : "1000",
											"timeOut" : "5000",
											"extendedTimeOut" : "1000",
											"showEasing" : "swing",
											"hideEasing" : "linear",
											"showMethod" : "fadeIn",
											"hideMethod" : "fadeOut"
										};

										/* toastr.success("You have been awarded with 1 year free subscription. Enjoy it!", "Account Subcription Updated", opts);*/
									}, 3000);

							// Sparkline Charts
							$('.inlinebar').sparkline('html', {
								type : 'bar',
								barColor : '#ff6264'
							});
							$('.inlinebar-2').sparkline('html', {
								type : 'bar',
								barColor : '#445982'
							});
							$('.inlinebar-3').sparkline('html', {
								type : 'bar',
								barColor : '#00b19d'
							});
							$('.bar').sparkline(
									[ [ 1, 4 ], [ 2, 3 ], [ 3, 2 ], [ 4, 1 ] ],
									{
										type : 'bar'
									});
							$('.pie').sparkline(
									'html',
									{
										type : 'pie',
										borderWidth : 0,
										sliceColors : [ '#3d4554', '#ee4749',
												'#00b19d' ]
									});
							$('.linechart').sparkline();
							$('.pageviews').sparkline('html', {
								type : 'bar',
								height : '30px',
								barColor : '#ff6264'
							});
							$('.uniquevisitors').sparkline('html', {
								type : 'bar',
								height : '30px',
								barColor : '#00b19d'
							});

							$(".monthly-sales").sparkline(
									[ "${alarmCount}", "${criticalCount}" ], {
										type : 'bar',
										barColor : '#485671',
										height : '80px',
										barWidth : 150,
										barSpacing : 5
									});
						});

		function getRandomInt(min, max) {
			return Math.floor(Math.random() * (max - min + 1)) + min;
		}

		/* jQuery( document ).ready( function( $ ) {
			var $table1 = jQuery( '#table-1' );
			
			// Initialize DataTable
			$table1.DataTable( {
				"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"bStateSave": true
			});
			
			// Initalize Select Dropdown after DataTables is created
			$table1.closest( '.dataTables_wrapper' ).find( 'select' ).select2( {
				minimumResultsForSearch: -1
			});
		} ); */

		// Initialize and add the map
		/*function initMap() {
			// The location of Delhi
			var delhi = {
				lat : 28.7041,
				lng : 77.1025
			};
			// The map, centered at Delhi
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 4,
				center : delhi
			});
			// The marker, positioned at Delhi
			var marker = new google.maps.Marker({
				position : delhi,
				map : map
			});

			var siteDta = document.getElementById('data').innerHTML;
			showAll(siteDta)

		}

		function showAll(siteDta) {
			Array.prototype.forEach.call(siteDta, function(data) {
				var marker = new google.maps.Marker({
					position : new google.maps.LatLng(28.7041, 77.1025),
					map : map
				});
			})

		}*/
	</script>

	<script type="text/javascript">
		jQuery(document).ready(function($) {
			var $table1 = jQuery('#myTable');

			// Initialize DataTable
			$table1.DataTable({
				"aLengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
				"bStateSave" : true
			});

			// Initalize Select Dropdown after DataTables is created
			$table1.closest('.dataTables_wrapper').find('select').select2({
				minimumResultsForSearch : -1
			});
		});
	</script>


	<jsp:include page="script.jsp"></jsp:include>

	<!-- Imported scripts on this page -->
	<script src="resources/neon/assets/js/datatables/datatables.js"></script>

</body>
</html>