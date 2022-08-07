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

<title>NMS | Dashboard</title>

<jsp:include page="link.jsp"></jsp:include>

<style>
/* basic positioning */
.legend span {
	border: 1px solid #ccc;
	float: left;
	width: 12px;
	height: 12px;
	margin: 7px;
}
/* your colors */
.legend .online {
	background-color: #008000;
}

.legend .general {
	background-color: #ffa500;
}

.legend .critical {
	background-color: #ff0000;
}

.table-wrapper-scroll-y {
	display: block;
	max-height: 125px;
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

.morris-chart text {
	fill: white;
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

<script>
	function date_time(id) {
		date = new Date;
		year = date.getFullYear();
		month = date.getMonth();
		months = new Array('January', 'February', 'March', 'April', 'May',
				'June', 'July', 'August', 'September', 'October', 'November',
				'December');
		d = date.getDate();
		day = date.getDay();
		days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday',
				'Thursday', 'Friday', 'Saturday');
		h = date.getHours();
		if (h < 10) {
			h = "0" + h;
		}
		m = date.getMinutes();
		if (m < 10) {
			m = "0" + m;
		}
		s = date.getSeconds();
		if (s < 10) {
			s = "0" + s;
		}
		result = '' + days[day] + ' ' + months[month] + ' ' + d + ' ' + year
				+ ' ' + h + ':' + m + ':' + s;
		document.getElementById(id).innerHTML = result;
		setTimeout('date_time("' + id + '");', '1000');
		return true;
	}
</script>

</head>
<body>

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

	<div id="load"></div>
	<div class="d-flex align-items-stretch">

		<!--Navigation bar-->

		<jsp:include page="nav.jsp" />

		<!--end of Navigation bar-->

		<div class="page-content">

			<!-- Breadcrumb-->
			<div class="container-fluid">
				<ul class="breadcrumb">

				</ul>
			</div>

			<section>
				<div class="container-fluid">
					<div class="row">


						<div class="col-lg-4">
							<div class="block">
								<div class="title">
									<strong>Site Statistics</strong>
								</div>
								<div id="donut-chart-demo" class="morris-chart"
									style="width: 188px; height: 215px;"></div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="block">
								<div class="title">
									<strong>Alarm Statistics</strong>
								</div>
								<div id="donut-chart-demo1" class="morris-chart"
									style="width: 188px; height: 215px"></div>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="block margin-bottom-sm">
								<div class="table-responsive">
									<table class="table table-striped table-sm">
										<thead>
											<tr>
												<th style="font-size: 25px; color: white"><strong>Total
														Repeater : ${totalCount}</strong></th>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td class="legend" style="font-size: 15px"><strong>
														Online Repeater :<font size="5px"> ${healthyCount}</font>
												</strong><span class="online"></span></td>
											</tr>
											<tr>
												<td class="legend" style="font-size: 15px"><strong>
														Offline Repeater : <font size="5px">${offlineCount}</font>
												</strong><span class="critical"></span></td>
											</tr>

											<tr>
												<td class="legend" style="font-size: 15px"><strong>
														General Alarms :<font size="5px"> ${alarmCount}</font>
												</strong><span class="general"></span></td>
											</tr>

											<tr>
												<td class="legend" style="font-size: 15px"><strong>
														Critical Alarms : <font size="5px">${criticalCount}</font>
												</strong><span class="critical"></span></td>

											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>


						<div class="col-lg-8">
							<div class="block margin-bottom-sm">
								<div class="table-responsive">
									<div class="form-group input-group has-feedback">
										<span class="input-group-addon"> <span
											class="entypo entypo-search"></span>
										</span><font color="white"> <input type="search"
											placeholder="Type for search..." class="form-control"
											id="myInput" /></font> <span
											class="glyphicon form-control-feedback" aria-hidden="true"></span>
									</div>
									<div class="table-wrapper-scroll-y">
										<table class="table table-striped table-sm" id="myTable">
											<thead>
												<tr>
													<th data-hide="phone,tablet"><b>Serial Number</b></th>
													<th data-hide="phone,tablet"><b>Site Name</b></th>
													<th data-hide="phone,tablet"><b>Circle Name</b></th>
													<th data-hide="phone,tablet"><b>Band</b></th>
													<th data-hide="phone,tablet"><b>Alarm Name</b></th>
													<th data-hide="phone,tablet"><b>Alarm Time</b></th>
												</tr>
											<tbody>
												<c:forEach items="${alarmDataList}" var="alarmList"
													varStatus="loop">
													<tr>
														<td><c:out
																value="${alarmDataList.get(loop.index).getSerialNumber()}" /></td>
														<td><c:out
																value="${alarmDataList.get(loop.index).getRepName()}" /></td>
														<td><c:out
																value="${alarmDataList.get(loop.index).getRegionName()}" /></td>
														<%-- <td><c:out
																value="${alarmDataList.get(loop.index).getBandName()}" /></td> --%>
														<td><c:if
																test="${alarmDataList.get(loop.index).getBandName()=='800' }">
																800
															</c:if>
															<c:if
																test="${alarmDataList.get(loop.index).getBandName()=='GSM' || alarmDataList.get(loop.index).getBandName()=='900'}">
																<font>900</font>
															</c:if> <c:if
																test="${alarmDataList.get(loop.index).getBandName()=='DCS1' || alarmDataList.get(loop.index).getBandName()=='1800'}">
																<font>1800</font>
															</c:if> <c:if
																test="${alarmDataList.get(loop.index).getBandName()=='DCS2' }">
																<font>1800</font>
															</c:if> <c:if
																test="${alarmDataList.get(loop.index).getBandName()=='UMTS' || alarmDataList.get(loop.index).getBandName()=='2100'}">
																<font>2100</font>
															</c:if></td>
														<td><c:if
																test="${alarmDataList.get(loop.index).getPowerFailDl()==1 }">
																<font color="red">RF Power DL</font>
															</c:if> <c:if
																test="${alarmDataList.get(loop.index).getPowerFailUl()==1 }">
																<font color="red">RF Power UL</font>
															</c:if> <c:if
																test="${alarmDataList.get(loop.index).getSynthesizerFailDl()==1 }">
																<font color="red">Synthesizer Fail DL</font>
															</c:if> <c:if
																test="${alarmDataList.get(loop.index).getSynthesizerFailUl()==1 }">
																<font color="red">Synthesizer Fail UL</font>
															</c:if></td>

														<td><c:out
																value="${alarmDataList.get(loop.index).getAlarmTimeStamp()}" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>


						<div class="col-lg-4">
							<div class="block margin-bottom-sm">
								<div class="table-responsive">
									<table class="table table-striped table-sm">
										<tbody>
											<tr>
												<td style="font-size: 15px"><strong>Name:
														${userDetails.getUsername()}</strong></td>
											</tr>
											<tr>
												<td style="font-size: 15px"><c:if
														test="${userDetails.getRoleId() =='4'}">
														<strong>Role: Super User</strong>
													</c:if> <c:if test="${userDetails.getRoleId() =='5'}">
														<strong>Role: Admin User</strong>
													</c:if> <c:if test="${userDetails.getRoleId() =='6'}">
														<strong>Role: Monitor User</strong>
													</c:if></td>
											</tr>
											<tr>
												<td>
													<fieldset style="font-size: 15px">
														<strong><span id="date_time"></span> <script
																type="text/javascript">
															window.onload = date_time('date_time');
														</script> </strong>
													</fieldset>
												</td>
											</tr>
											<tr>
												<td><input class="hide" id="rewind" type="submit"
													value=""></td>
											</tr>

											<!-- <tr>
												<td
													style=" font-size: 15px;  background-color: #2d3035">
													<input class="hide" type="button" id="location" value="" onclick="showlocation()" />
													<strong>Latitude: <span id="latitude"></span> <br /> Longitude: <span
													id="longitude"></span></strong>	
													<div id="map-canvas"></div>																									
												</td>
												
											</tr> -->
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>

			<jsp:include page="footer.jsp" />
		</div>
	</div>


	<script type="text/javascript">
		jQuery(document).ready(function($) {

			/* search in table */

			$('#myInput').on('keyup', function() {
				var value = $(this).val();
				var patt = new RegExp(value, "i");

				$('#myTable').find('tr').each(function() {
					if (!($(this).find('td').text().search(patt) >= 0)) {
						$(this).not('.myHead').hide();
					}
					if (($(this).find('td').text().search(patt) >= 0)) {
						$(this).show();
					}
				});

			});

			// Donut Chart
			var donut_chart_demo = $("#donut-chart-demo");

			donut_chart_demo.parent().show();

			var donut_chart = Morris.Donut({

				element : 'donut-chart-demo',
				data : [ {
					label : "Online Repeaters",
					value : "${healthyCount}",

				}, {
					label : "Offline Repeaters",
					value : "${offlineCount}"
				}, ],

				colors : [ '#008000',/* '#ff0000',  '#ff2052',*/
				'#ff0000' ],

				click : [ '/nms/RepeaterList.htm', '/nms/RepeaterList.htm' ]

			});

			donut_chart_demo.parent().attr('style', '');

			// Donut Chart 2

			var donut_chart_demo1 = $("#donut-chart-demo1");

			donut_chart_demo1.parent().show();

			var donut_chart = Morris.Donut({
				element : 'donut-chart-demo1',
				data : [
				/*{label: "Online Repeaters", value: "${healthyCount}"},*/
				{
					label : "Critical Alarms",
					value : "${criticalCount}"
				},
				/* {label: "Electricity Fail", value: getRandomInt(10,20)}, */
				{
					label : "General Alarms",
					value : "${alarmCount}"
				},/* getRandomInt(10,30)} ,*/
				/*{label: "Offline Repeaters", value: "${offlineCount}"},*/
				],
				/* colors: ['#00a651', '#ff4500' , '#ffff00' , '#ffa500' , '#6495ed' ] */
				colors : [ '#ff0000', '#ffa500' ]

			});

			donut_chart_demo1.parent().attr('style', '');

		});
	</script>

	<script type="text/javascript">
		jQuery(document).ready(function($) {

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

			var showToastrs = false;
			function toastrs() {
				if (!showToastrs) {

					// Display a warning toast, with no title
					toastr.success("${message}", 'Welcome !!!')

					// Display a success toast, with a title
					/* toastr.error("${message}",
							'Miracle Max Says') */

					/*
					// Display an error toast, with a title
					toastr
							.error(
									'I do not think that word means what you think it means.',
									'Inconceivable!') */
				} else {
					toastr.error('you can\'t.', 'several windows are opened!')
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
		var map = null;
		function showlocation() {
			// One-shot position request.
			navigator.geolocation.getCurrentPosition(callback);
		}

		function callback(position) {

			var lat = position.coords.latitude;
			var lon = position.coords.longitude;

			document.getElementById('latitude').innerHTML = lat;
			document.getElementById('longitude').innerHTML = lon;

			var latLong = new google.maps.LatLng(lat, lon);

			var marker = new google.maps.Marker({
				position : latLong
			});

			marker.setMap(map);
			map.setZoom(8);
			map.setCenter(marker.getPosition());
		}

		google.maps.event.addDomListener(window, 'load', initMap);
		function initMap() {
			var mapOptions = {
				center : new google.maps.LatLng(0, 0),
				zoom : 1,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById("map-canvas"),
					mapOptions);

		}
	</script>


	<jsp:include page="script.jsp"></jsp:include>

</body>
</html>