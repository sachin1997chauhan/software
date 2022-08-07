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

<title>NMS | Maintenance</title>

<jsp:include page="link.jsp"></jsp:include>


<!-- Imported styles on this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/js/datatables/datatables.css">
<script
	src="${pageContext.request.contextPath}/resources/js/filesaver.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>



<style>
*
#emailbox {
	background-color: #1E1D1D;
	background-position: 5px 5px;
	background-repeat: no-repeat;
	width: 80%;
	font-size: 12px;
	padding: 0px 20px 12px 40px;
	margin-bottom: 10px;
}

.myModal {
	width: 850px;
}

.myModal1 {
	width: 600px;
}

#alarmLogBackup {
	background-position: 5px 5px;
	background-repeat: no-repeat;
	color: white;
	/* padding: 12px 20px 12px 40px;  */
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#load {
	width: 100%;
	height: 100%;
	position: fixed;
	z-index: 9999;
	background: url("${pageContext.request.contextPath}/resources/images/loading-spinner.gif") no-repeat center
		center rgba(0, 0, 0, 0.50);
	background-size: 150px 150px;
}
#pageloader
{
 
  display: none;
  height: 100%;
  position: fixed;
  width: 100%;
  z-index: 9999;
  background-color: rgba(0, 0, 0, 0.50);
}

#pageloader img
{
    left : 45%;
    top : 45%;
    position : absolute;
    width : 150px;
    height : 150px;
    margin-left : -12px;
    margin-top : -12px;
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
<!-- <script type="text/javascript">
		$(document).ready(function() {
			$("#backupDB").on("submit", function() {
				$("#pageloader").fadeIn();
			});
			
			$("#DCS1broadcast").on("submit", function() {
				$("#pageloader").fadeIn();
			});
			
			$("#applicationBackup").on("submit", function() {
				$("#pageloader").fadeIn();
			});
			
			$("#backupShare").on("submit", function() {
				$("#pageloader").fadeIn();
			});
			
			$("#repeaterByRegion").on("submit", function() {
				$("#pageloader").fadeIn();
			});
		});
	</script> -->

</head>
<body data-ng-app="">

<div id="pageloader">
      <img src="${pageContext.request.contextPath}/resources/images/gears.gif" />
</div>
<div id="load"></div>
	<div class="d-flex align-items-stretch">
		<!--Navigation bar-->

		<jsp:include page="nav.jsp" />

		<!--end of Navigation bar-->

		<div class="page-content">

			<div class="container-fluid">
				<ul class="breadcrumb">
					<li><a href="/nms/dashboardView.htm"
						style="font-size: 15px; color: white"><i class="entypo-home"
							style="font-size: 15px; color: white"></i><strong>Home</strong></a></li>
					<li class="active" style="font-size: 15px; color: white"><strong>Maintenance</strong></li>
				</ul>
			</div>
			
			<input class="hide" id="rewind" type="submit" value="">
			

			<section>
				<div class="container-fluid">
					<div class="row">

						<!-- <div class="col-lg-4">
							<a href="#" data-target="#notificationModal" data-toggle="modal">
								<i class="entypo-cog right"></i> <font class="title"
								style="text-decoration: underline;">Notification
									Configuration</font>
							</a>
						</div> -->

						<!-- <div class="col-lg-4">
							<a class="col-lg-4" href="#" data-target="#smsModal"
								data-toggle="modal"> <i class="entypo-cog right"></i> <font
								class="title" style="text-decoration: underline;">Set SMS
									Configuration</font></a>
						</div> -->

						<div style="color: #fff; font-size: 14px;">
							<strong>${fileShareMessage} ${fileShareMessage1}
								${statusMessage} </strong><i aria-hidden="true"></i>
						</div>
						<div style="color: #fff; font-size: 14px;">
							<c:choose>
								<c:when test="${scheduledMessage == 'Exist'}">
									<strong>Inventory backup already scheduled. You can <a
										style="text-decoration: underline;" href="#"
										data-target="#updateInventoryScheduledBackup"
										data-toggle="modal">Edit</a></strong>
								</c:when>
								<c:otherwise>
									<strong>${scheduledMessage}</strong>
								</c:otherwise>
							</c:choose>
						</div>


						<div class="row">
							<div class="col-lg-12">
								<div class="block margin-bottom-sm">
									<div class="table-responsive">
										<table class="table table-striped">
											<tbody>

												<tr>
													<th
														style="text-align: center; font-size: 25px; color: white">Database
														Management</th>
												</tr>
												<!-- <tr>
											<td>
												<div class="col-sm-6">
													<a
														style="text-align: center; font-size: 15px; color: blue;">Auto
														schedule Database Backup</a>
												</div>

												<div class="col-sm-6">
													<a
														style="text-align: center; font-size: 15px; color: blue;">Auto
														schedule Database Restore</a>
												</div>
											</td>
										</tr> -->
												<tr>
													<td>
														<div class="col-sm-6">
															<a href="#" data-backdrop="static" data-keyboard="false"
																data-target="#dBBackupModal"
																style="text-align: center; font-size: 15px;"
																data-toggle="modal">Database Backup</a>
														</div>



														<div class="col-sm-6">
															<a href="#" data-backdrop="static" data-keyboard="false"
																data-target="#dBRestoreModal"
																style="text-align: center; font-size: 15px;"
																data-toggle="modal">Database Restore</a>
														</div>
													</td>
												</tr>

												<tr>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>



							<!-- Application Backup Modal -->

							<div class="col-lg-12">
								<div class="block margin-bottom-sm">
									<div class="table-responsive">
										<table class="table table-striped">

											<tbody>
												<tr>
													<th
														style="text-align: center; font-size: 25px; color: white">Application
														Backup</th>
												</tr>
												<tr>
													<td>
														<div class="col-lg-6">
															<a href="#" data-backdrop="static" data-keyboard="false"
																data-target="#applicationBackupModal"
																style="text-align: center; font-size: 15px;"
																data-toggle="modal">Application Backup</a>
														</div>
														<div class="col-lg-6">
															<a href="#" data-backdrop="static" data-keyboard="false"
																data-target="#applicationRestoreModal"
																style="text-align: center; font-size: 15px;"
																data-toggle="modal">Application Restore</a>
														</div> <!-- <div class="col-sm-6">
													<a
														style="text-align: center; font-size: 15px; color: blue;">Auto
														Schedule Application Backup</a>
												</div> -->
													</td>
												</tr>
												<!-- <tr>
											<td>
												<div class="col-lg-6">
													<a href="#" data-target="#applicationRestoreModal"
														style="text-align: center; font-size: 15px; color: blue;"
														data-toggle="modal">Application Restore</a>
												</div> <div class="col-sm-6">
													<a
														style="text-align: center; font-size: 15px; color: blue;">Auto
														Schedule Application Backup</a>
												</div>
											</td>
										</tr> -->
												<tr>
													<td></td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>
							</div>


							<div class="col-lg-12">
								<div class="block margin-bottom-sm">

									<form:form action="sendFile.htm" id="backupShare"
										modelAttribute="fileUpload" enctype="multipart/form-data"
										method="post">
										<div class="table-responsive">
											<table class="table table-striped">

												<tbody>
													<tr>
														<th
															style="text-align: center; font-size: 25px; color: white">Log
															Backup</th>
													</tr>
													<tr>
														<td>

															<div class="col-lg-6">
																<a id="mylink" href="#" data-backdrop="static"
																	data-keyboard="false" data-target="#logBackupModal"
																	style="text-align: center; font-size: 15px;"
																	data-toggle="modal">Alarm Log Backup</a>
															</div> <!-- <div class="col-sm-6">
													<a
														style="text-align: center; font-size: 15px; color: blue;">Auto
														Schedule Alarm Log Backup</a>
												</div> -->
														</td>
													</tr>
													<tr>
														<td>
															<div>
																<a style="font-size: 15px; color: #ffffff;"> You can
																	share alarm log file from here....</a>

																<div>
																	<br>
																	<div>
																		<div class="col-lg-4">
																			<input type="file" id="file" name="file" class="file"
																				size="50" required="required" accept=".log">
																		</div>

																		<div class="col-lg-4">
																			Email Id:- <input type="email" name="email"
																				required="required" id="emailbox">
																		</div>

																		<div class="col-lg-4">
																			<button type="submit" name="button"
																				class="btn btn-primary">Send Mail</button>
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td></td>
													</tr>

												</tbody>
											</table>
										</div>
									</form:form>
								</div>
							</div>

							<div class="col-lg-12">
								<div class="block margin-bottom-sm">
									<div class="table-responsive">
										<table class="table table-striped">
											<tbody>

												<tr>
													<th
														style="text-align: center; font-size: 25px; color: white">Inventory
														Management</th>
												</tr>
												<tr>
													<td>
														<div class="col-sm-6">
															<a href="#" data-target="#inventoryScheduledModal"
																data-backdrop="static"
																style="text-align: center; font-size: 15px;"
																data-toggle="modal">Schedule Inventory Backup</a>
														</div>

														<div class="col-sm-6">
															<a href="#" data-target="#updateInventoryScheduledBackup"
																data-backdrop="static"
																style="text-align: center; font-size: 15px;"
																data-toggle="modal">Update Schedule Inventory Backup</a>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<div class="col-lg-12">
								<div class="block margin-bottom-sm">
									<div class="table-responsive">
										<table class="table table-striped">
											<tbody>

												<tr>
													<th
														style="text-align: center; font-size: 25px; color: white">SMTP
														Data Configuration</th>
												</tr>
												<tr>
													<td>
														<div class="col-lg-6">
															<a href="#" data-target="#smtpModal" data-toggle="modal"
																data-backdrop="static"
																style="text-align: center; font-size: 14px;"> Set
																SMTP </a>
														</div>
													</td>
												</tr>
												<tr>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>


						<!-- Scheduled Inventory Backup  modal -->

						<form:form id="inventoryScheduledBackup"
							action="inventoryScheduledBackup.htm" method="post">
							<div id="inventoryScheduledModal" class="modal fade "
								tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="myModal1 block">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="text-center">Scheduled Inventory Backup</h1>
												<!-- <button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">×</button> -->
											</div>
											<div class="modal-body">
												<div class="panel">
													<div class="panel-body">
														<div class="text-center">


															<%-- <div class="form-feedback" style="color: #fff">
																${scheduledMessage} <i aria-hidden="true"></i>
															</div> --%>


															<div class="row">
																<span class="col-lg-4"> <label>Daily</label> <input
																	type="radio" id="daily" name="cron"
																	data-ng-model="cron" value="daily">
																</span> <span class="col-lg-4"> <label>Weekly</label> <input
																	type="radio" id="weekly" name="cron"
																	data-ng-model="cron" value="weekly">
																</span> <span class="col-lg-4"> <label>Monthly</label> <input
																	type="radio" id="monthly" name="cron"
																	data-ng-model="cron" value="monthly">
																</span>
															</div>
															<br>
															<!-- <p>{{cron}}</p> -->
															<div class="row">
																<span
																	data-ng-show="cron == 'daily' || cron == 'weekly' || cron == 'monthly' ">
																	<span class="col-lg-2"><label>Hours</label> <select
																		id="cronHour" name="cronHour">
																			<option value="-1">-select-</option>
																			<option value="0">00</option>
																			<option value="1">01</option>
																			<option value="2">02</option>
																			<option value="3">03</option>
																			<option value="4">04</option>
																			<option value="5">05</option>
																			<option value="6">06</option>
																			<option value="7">07</option>
																			<option value="8">08</option>
																			<option value="9">09</option>
																			<option value="10">10</option>
																			<option value="11">11</option>
																			<option value="12">12</option>
																			<option value="13">13</option>
																			<option value="14">14</option>
																			<option value="15">15</option>
																			<option value="16">16</option>
																			<option value="17">17</option>
																			<option value="18">18</option>
																			<option value="19">19</option>
																			<option value="20">20</option>
																			<option value="21">21</option>
																			<option value="22">22</option>
																			<option value="23">23</option>

																	</select></span>
																</span> <span
																	data-ng-show="cron == 'daily' || cron == 'weekly' || cron == 'monthly' ">
																	<span class="col-lg-2"> <label>Minutes</label> <select
																		id="cronMinute" name="cronMinute">
																			<option value="-1">-select-</option>
																			<option value="0">00</option>
																			<option value="1">01</option>
																			<option value="2">02</option>
																			<option value="3">03</option>
																			<option value="4">04</option>
																			<option value="5">05</option>
																			<option value="6">06</option>
																			<option value="7">07</option>
																			<option value="8">08</option>
																			<option value="9">09</option>
																			<option value="10">10</option>
																			<option value="11">11</option>
																			<option value="12">12</option>
																			<option value="13">13</option>
																			<option value="14">14</option>
																			<option value="15">15</option>
																			<option value="16">16</option>
																			<option value="17">17</option>
																			<option value="18">18</option>
																			<option value="19">19</option>
																			<option value="20">20</option>
																			<option value="21">21</option>
																			<option value="22">22</option>
																			<option value="23">23</option>
																			<option value="24">24</option>
																			<option value="25">25</option>
																			<option value="26">26</option>
																			<option value="27">27</option>
																			<option value="28">28</option>
																			<option value="29">29</option>
																			<option value="30">30</option>
																			<option value="31">31</option>
																			<option value="32">32</option>
																			<option value="33">33</option>
																			<option value="34">34</option>
																			<option value="35">35</option>
																			<option value="36">36</option>
																			<option value="37">37</option>
																			<option value="38">38</option>
																			<option value="39">39</option>
																			<option value="40">40</option>
																			<option value="41">41</option>
																			<option value="42">42</option>
																			<option value="43">43</option>
																			<option value="44">44</option>
																			<option value="45">45</option>
																			<option value="46">46</option>
																			<option value="47">47</option>
																			<option value="48">48</option>
																			<option value="49">49</option>
																			<option value="50">50</option>
																			<option value="51">51</option>
																			<option value="52">52</option>
																			<option value="53">53</option>
																			<option value="54">54</option>
																			<option value="55">55</option>
																			<option value="56">56</option>
																			<option value="57">57</option>
																			<option value="58">58</option>
																			<option value="59">59</option>
																	</select>
																</span>
																</span> <span
																	data-ng-show="cron == 'weekly' || cron == 'monthly' ">
																	<span class="col-lg-2"><label>Day</label> <select
																		id="cronDay" name="cronDay">
																			<option value="null">-select-</option>
																			<option value="SUN">Sunday</option>
																			<option value="MON">Monday</option>
																			<option value="TUE">Tuesday</option>
																			<option value="WED">Wednesday</option>
																			<option value="THU">Thursday</option>
																			<option value="FRI">Friday</option>
																			<option value="SAT">Saturday</option>
																	</select></span>
																</span> <span data-ng-show="cron == 'monthly'"> <span
																	class="col-lg-2"><label>Month</label> <select
																		id="cronMonth" name="cronMonth">
																			<option value="null">-select-</option>
																			<option value="JAN">January</option>
																			<option value="FEB">February</option>
																			<option value="MAR">March</option>
																			<option value="APR">April</option>
																			<option value="MAY">May</option>
																			<option value="JUN">June</option>
																			<option value="JUL">July</option>
																			<option value="AUG">August</option>
																			<option value="SEP">September</option>
																			<option value="OCT">October</option>
																			<option value="NOV">November</option>
																			<option value="DEC">December</option>
																	</select> </span>
																</span>
															</div>

															<br>
															<div class="content">
																<input id="setInventory" class="btn btn-primary"
																	value="Scheduled" type="submit">
															</div>

														</div>
													</div>
												</div>
												<div class="modal-footer">
													<div class="col-md-12-right">
														<button class="btn btn-primary" data-dismiss="modal"
															aria-hidden="true">Cancel</button>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>


						<!--Update Scheduled Inventory Backup  modal -->

						<form:form id="updateInventoryBackup" action="updateScheduled.htm"
							method="post">
							<div id="updateInventoryScheduledBackup" class="modal fade "
								tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="myModal1 block">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="text-center">Update Inventory Backup
													Scheduled</h1>
												<!-- <button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">×</button> -->
											</div>
											<div class="modal-body">
												<div class="panel">
													<div class="panel-body">
														<div class="text-center">


															<%-- <div class="form-feedback" style="color: #fff">
																${scheduledMessage} <i aria-hidden="true"></i>
															</div> --%>

															<div class="row">
																<span class="col-lg-4"> <label>Unscheduled</label>
																	<input type="radio" id="unscheduled" name="scheduled"
																	data-ng-model="cron" value="unscheduled">
																</span> <span class="col-lg-4"> <label>Rescheduled</label>
																	<input type="radio" id="rescheduled" name="scheduled"
																	data-ng-model="cron" value="rescheduled">
																</span>
																<c:choose>
																	<c:when test="${backupStatus}">
																		<span class="col-lg-4"> <label>Pause</label> <input
																			type="radio" id="pause" name="scheduled"
																			data-ng-model="cron" value="pause">
																		</span>
																	</c:when>
																</c:choose>
															</div>

															<br>
															<!-- <p>{{cron}}</p> -->
															<div class="row">
																<span data-ng-show="cron == 'rescheduled' "> <span
																	class="col-lg-2"><label>Hours</label> <select
																		id="cronHour" name="cronHour">
																			<option value="-1">-select-</option>
																			<option value="0">00</option>
																			<option value="1">01</option>
																			<option value="2">02</option>
																			<option value="3">03</option>
																			<option value="4">04</option>
																			<option value="5">05</option>
																			<option value="6">06</option>
																			<option value="7">07</option>
																			<option value="8">08</option>
																			<option value="9">09</option>
																			<option value="10">10</option>
																			<option value="11">11</option>
																			<option value="12">12</option>
																			<option value="13">13</option>
																			<option value="14">14</option>
																			<option value="15">15</option>
																			<option value="16">16</option>
																			<option value="17">17</option>
																			<option value="18">18</option>
																			<option value="19">19</option>
																			<option value="20">20</option>
																			<option value="21">21</option>
																			<option value="22">22</option>
																			<option value="23">23</option>

																	</select></span>
																</span> <span data-ng-show="cron == 'rescheduled' "> <span
																	class="col-lg-2"> <label>Minutes</label> <select
																		id="cronMinute" name="cronMinute">
																			<option value="-1">-select-</option>
																			<option value="0">00</option>
																			<option value="1">01</option>
																			<option value="2">02</option>
																			<option value="3">03</option>
																			<option value="4">04</option>
																			<option value="5">05</option>
																			<option value="6">06</option>
																			<option value="7">07</option>
																			<option value="8">08</option>
																			<option value="9">09</option>
																			<option value="10">10</option>
																			<option value="11">11</option>
																			<option value="12">12</option>
																			<option value="13">13</option>
																			<option value="14">14</option>
																			<option value="15">15</option>
																			<option value="16">16</option>
																			<option value="17">17</option>
																			<option value="18">18</option>
																			<option value="19">19</option>
																			<option value="20">20</option>
																			<option value="21">21</option>
																			<option value="22">22</option>
																			<option value="23">23</option>
																			<option value="24">24</option>
																			<option value="25">25</option>
																			<option value="26">26</option>
																			<option value="27">27</option>
																			<option value="28">28</option>
																			<option value="29">29</option>
																			<option value="30">30</option>
																			<option value="31">31</option>
																			<option value="32">32</option>
																			<option value="33">33</option>
																			<option value="34">34</option>
																			<option value="35">35</option>
																			<option value="36">36</option>
																			<option value="37">37</option>
																			<option value="38">38</option>
																			<option value="39">39</option>
																			<option value="40">40</option>
																			<option value="41">41</option>
																			<option value="42">42</option>
																			<option value="43">43</option>
																			<option value="44">44</option>
																			<option value="45">45</option>
																			<option value="46">46</option>
																			<option value="47">47</option>
																			<option value="48">48</option>
																			<option value="49">49</option>
																			<option value="50">50</option>
																			<option value="51">51</option>
																			<option value="52">52</option>
																			<option value="53">53</option>
																			<option value="54">54</option>
																			<option value="55">55</option>
																			<option value="56">56</option>
																			<option value="57">57</option>
																			<option value="58">58</option>
																			<option value="59">59</option>
																	</select>
																</span>
																</span> <span data-ng-show="cron == 'rescheduled'"> <span
																	class="col-lg-2"><label>Day</label> <select
																		id="cronDay" name="cronDay">
																			<option value="null">-select-</option>
																			<option value="SUN">Sunday</option>
																			<option value="MON">Monday</option>
																			<option value="TUE">Tuesday</option>
																			<option value="WED">Wednesday</option>
																			<option value="THU">Thursday</option>
																			<option value="FRI">Friday</option>
																			<option value="SAT">Saturday</option>
																	</select></span>
																</span> <span data-ng-show="cron == 'rescheduled'"> <span
																	class="col-lg-2"><label>Month</label> <select
																		id="cronMonth" name="cronMonth">
																			<option value="null">-select-</option>
																			<option value="JAN">January</option>
																			<option value="FEB">February</option>
																			<option value="MAR">March</option>
																			<option value="APR">April</option>
																			<option value="MAY">May</option>
																			<option value="JUN">June</option>
																			<option value="JUL">July</option>
																			<option value="AUG">August</option>
																			<option value="SEP">September</option>
																			<option value="OCT">October</option>
																			<option value="NOV">November</option>
																			<option value="DEC">December</option>
																	</select> </span>
																</span>
															</div>

															<br>
															<div class="content">
																<input id="setInventory" class="btn btn-primary"
																	value="Update" type="submit">
															</div>

														</div>
													</div>
												</div>
												<div class="modal-footer">
													<div class="col-md-12-right">
														<button class="btn btn-primary" data-dismiss="modal"
															aria-hidden="true">Cancel</button>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>



						<!-- Notification Configuration -->

						<form:form action="notificationConfiguration.htm"
							id="notificationConfigure" method="post">
							<div id="notificationModal" class="modal fade" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="container-fluid text-center">Notification
												Configuration</h1>

											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>

										</div>
										<div class="modal-body">
											<div class="col-md-12">
												<div class="panel panel-default">
													<div class="panel-body">
														<div class="text-center">

															<div class="panel-body">


																<fieldset>

																	<div class="row">
																		<div class="col-md-6">
																			<form>
																				<label>FM:- </label> <span class="checkbox-inline"
																					id="notification"><input type="checkbox"
																					value="1">SMS </span> <span
																					class="checkbox-inline"><input
																					type="checkbox" value="1">Email </span>
																			</form>
																		</div>
																	</div>
																	<br> <br>
																	<div class="row">
																		<div class="col-md-6">
																			<form>
																				<label>CM:- </label> <span class="checkbox-inline"
																					id="notification"><input type="checkbox"
																					value="1">SMS </span> <span
																					class="checkbox-inline"><input
																					type="checkbox" value="1">Email </span>
																			</form>
																		</div>
																	</div>
																	<br> <br>

																	<div class="row">
																		<div class="col-md-6">
																			<form>
																				<label>UM:-</label> <span class="checkbox-inline"
																					id="notification"><input type="checkbox"
																					value="1">SMS </span> <span
																					class="checkbox-inline"><input
																					type="checkbox" value="1">Email </span>
																			</form>
																		</div>
																	</div>
																	<br> <input
																		class="btn btn-lg btn-primary btn-block"
																		value="Save Settings" type="submit">

																</fieldset>
																<%-- <div>
																<a class="txt1" style="color: #10A2E1">
																	${confirmMessage} <i aria-hidden="true"></i>
																</a>
															</div> --%>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-md-12-right">
												<button class="btn btn-primary" data-dismiss="modal"
													aria-hidden="true">Cancel</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>

						<!-- Set SMTP data information modal-->

						<form:form action="setSmtp.htm" id="setSMTP" method="post">
							<div id="smtpModal" class="modal fade" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="container-fluid text-center">Smtp Information</h1>
											<!-- <button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button> -->

										</div>
										<div class="modal-body">
											<div class="col-md-12">
												<div class="panel panel-default">
													<div class="panel-body">
														<div class="text-center">

															<div class="panel-body">


																<fieldset>
																	<div class="form-group input-group has-feedback">
																		<!-- <label for="usrname"><span
															class="glyphicon glyphicon-user"></span> SMTP</label> -->
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-user"></span>
																		</span> <input type="text" placeholder="UserName"
																			class="form-control" name="username" id="username"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>


																	<div class="form-group input-group has-feedback">
																		<!-- <label for="usrname"><span
															class="glyphicon glyphicon-user"></span> SMTP</label> -->
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-usd"></span>
																		</span> <input type="text" placeholder="SMTP"
																			class="form-control" name="smtp" id="smtp"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>


																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-ruble"></span>
																		</span> <input type="number" placeholder="Port"
																			class="form-control" name="port" id="port"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>

																	<!-- 
													<div class="checkbox-inline">
														<label>SSL<input type="checkbox" value="">
														</label>
													</div> -->


																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-envelope"></span>
																		</span> <input type="email" placeholder="Outbox"
																			class="form-control" name="outbox" id="outbox"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>

																	</div>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-lock"></span>
																		</span> <input type="password" placeholder="Password"
																			class="form-control" name="emailPassword"
																			id="emailPassword" required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>

																	</div>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-lock"></span>
																		</span> <input type="text" placeholder="Confirm Password"
																			class="form-control" name="confirmEmailPassword"
																			id="confirmEmailPassword" required="required"
																			autocomplete="false" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>

																	</div>
																	<div>
																		<button type="submit" class="btn btn-primary btn-lg">Save</button>
																		<button type="reset" class="btn btn-lg">
																			<font color="black">Reset</font>
																		</button>

																	</div>
																</fieldset>
																<div>
																	<a class="txt1" style="color: #10A2E1">
																		${statusMessage} <i aria-hidden="true"></i>
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-md-12-right">
												<button class="btn btn-primary" data-dismiss="modal"
													aria-hidden="true">Cancel</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>

						<form:form action="setSMS.htm" id="setSMS" method="post">
							<div id="smsModal" class="modal fade" tabindex="-1" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="container-fluid text-center">SMS Information</h1>
											<!-- <button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button> -->

										</div>
										<div class="modal-body">
											<div class="col-md-12">
												<div class="panel panel-default">
													<div class="panel-body">
														<div class="text-center">

															<div class="panel-body">


																<fieldset>
																	<div class="form-group input-group has-feedback">
																		<!-- <label for="usrname"><span
															class="glyphicon glyphicon-user"></span> SMTP</label> -->
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-user"></span>
																		</span> <input type="text" placeholder="UserName"
																			class="form-control" name="username" id="username"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>


																	<div class="form-group input-group has-feedback">
																		<!-- <label for="usrname"><span
															class="glyphicon glyphicon-user"></span> SMTP</label> -->
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-usd"></span>
																		</span> <input type="text" placeholder="SMTP"
																			class="form-control" name="smtp" id="smtp"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>


																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-ruble"></span>
																		</span> <input type="number" placeholder="Port"
																			class="form-control" name="port" id="port"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>

																	<!-- 
													<div class="checkbox-inline">
														<label>SSL<input type="checkbox" value="">
														</label>
													</div> -->


																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-envelope"></span>
																		</span> <input type="email" placeholder="Outbox"
																			class="form-control" name="outbox" id="outbox"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>

																	</div>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-lock"></span>
																		</span> <input type="password" placeholder="Password"
																			class="form-control" name="emailPassword"
																			id="emailPassword" required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>

																	</div>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-lock"></span>
																		</span> <input type="text" placeholder="Confirm Password"
																			class="form-control" name="confirmEmailPassword"
																			id="confirmEmailPassword" required="required"
																			autocomplete="false" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>

																	</div>
																	<div>
																		<button type="submit" class="btn btn-primary btn-lg">Save</button>
																		<button type="reset" class="btn btn-danger btn-lg">Reset</button>

																	</div>
																</fieldset>
																<div>
																	<a class="txt1" style="color: #10A2E1">
																		${statusMessage} <i aria-hidden="true"></i>
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-md-12-right">
												<button class="btn btn-primary" data-dismiss="modal"
													aria-hidden="true">Cancel</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>


						<!-- Alarm Log Backup Modal -->

						<div id="logBackupModal" class="modal fade " tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="myModal block">
									<div class="modal-content">


										<div class="modal-header">
											<h1 class="text-center">Alarm Log Backup</h1>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
										</div>


										<div class="modal-body">
											<div class="panel">

												<div class="panel-body">
													<div class="text-center">


														<%-- <div class="form-feedback" style="color: #fff">
																${statusMessage} <i aria-hidden="true"></i>
															</div> --%>


														<form:form id="logBackup" action="alarmLogBackup.htm"
															method="post">

															<div id="selectDuration">
																<label>Please select time duration</label> <select
																	name="alarmLogBackup" id="alarmLogBackup"
																	required="required">
																	<option value="" disabled selected>--duration--</option>

																	<option value="15 Days">15 Days</option>
																	<option value="30 Days">30 Days</option>
																	<option value="45 Days">45 Days</option>
																	<option value="60 Days">60 Days</option>
																	<option value="Last 1 Year">1 Year</option>
																</select> <span class="content"> <input id="showList"
																	class="btn btn-primary" value="Show List" type="submit"
																	onclick="hide();">
																</span>
															</div>

															<div id="loading" style="display: none;">
																<img id="img-spinner" src="resources/images/spinner.gif"
																	alt="Loading" />
															</div>

															<table class="table table-striped form-feedback"
																id="testTable">
																<thead id="tableHeader">
																	<tr>
																		<th><b>Serial Number</b></th>
																		<th><b>Site Name</b></th>
																		<th><b>Circle Name</b></th>
																		<th><b>Band</b></th>
																		<th><b>Alarm Name</b></th>
																		<th><b>Connection Status</b></th>
																		<th><b>Alarm Time</b></th>
																	</tr>
																</thead>

																<tbody>
																	<c:forEach items="${alarmDataList}" var="alarmList"
																		varStatus="loop">

																		<tr class="odd gradeX">
																			<td><c:out
																					value="${alarmDataList.get(loop.index).getSerialNumber()}" /></td>
																			<td><c:out
																					value="${alarmDataList.get(loop.index).getRepName()}" /></td>
																			<td><c:out
																					value="${alarmDataList.get(loop.index).getRegionName()}" /></td>
																			<td><c:out
																					value="${alarmDataList.get(loop.index).getBandName()}" /></td>

																			<td><c:if
																					test="${alarmDataList.get(loop.index).getPowerFailDl()==1 }">
																					<font color="red">RF Power DL, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getPowerFailDl()==0 }">
																					<font color="#32CD32">RF Power DL Normal, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getPowerFailUl()==1 }">
																					<font color="red">RF Power UL, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getPowerFailUl()==0 }">
																					<font color="#32CD32">RF Power UL Normal, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getSynthesizerFailDl()==1 }">
																					<font color="red">Synthesizer Fail DL, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getSynthesizerFailDl()==0 }">
																					<font color="#32CD32">Synthesizer Fail DL
																						Normal, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getSynthesizerFailUl()==1 }">
																					<font color="red">Synthesizer Fail UL, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getSynthesizerFailUl()==0 }">
																					<font color="#32CD32">Synthesizer Fail UL
																						Normal, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getElectricityStatus()==0 }">
																					<font color="red">Electricity Alarm, </font>
																				</c:if> <c:if
																					test="${alarmDataList.get(loop.index).getElectricityStatus()==1 }">
																					<font color="#32CD32">Electricity Alarm
																						Normal, </font>
																				</c:if></td>

																			<td><c:choose>
																					<c:when
																						test="${alarmDataList.get(loop.index).isConnectionStatus()==true}">
																						<font color="#32CD32">Online</font>
																					</c:when>
																					<c:when
																						test="${alarmDataList.get(loop.index).isConnectionStatus()==false}">
																						<font color="orange">Offline</font>
																					</c:when>
																				</c:choose></td>
																			<td><c:out
																					value="${alarmDataList.get(loop.index).getAlarmTimeStamp()}" /></td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
															<br>

															<input type="button" id="exportExcel"
																class="btn btn-primary"
																onclick="fnExcelReport('testTable', 'alarmLog')"
																value="Export to Excel">


															<!-- <input type="button"
																onclick="tableToExcel('testTable', 'W3C Example Table')"
																value="Export to Excel"> -->

														</form:form>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<div class="col-md-12-right">
													<button class="btn btn-primary" data-dismiss="modal"
														aria-hidden="true">Cancel</button>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Database Backup Modal -->

						<div id="dBBackupModal" class="modal fade" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="container-fluid text-center">Database Backup</h1>
										<!-- <button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button> -->

									</div>
									<div class="modal-body">
										<div class="col-md-12">
											<div class="panel panel-default">
												<div class="panel-body">
													<div class="text-center">

														<div class="panel-body">


															<div id="loading1" style="display: none;">
																<img id="img-spinner" src="resources/images/spinner.gif"
																	alt="Loading" />
															</div>
															<form:form action="backupDB.htm" id="backupDB"
																method="post">
																<div>
																	<a class="form-feedback3"
																		style="color: #fff; font-size: 14px">
																		${statusMessage} <i aria-hidden="true"></i>
																	</a>
																</div>
																<div>
																	<a class="form-feedback3"
																		style="color: #fff; font-size: 14px">
																		${locationMessage} <i aria-hidden="true"></i>
																	</a>
																</div>

																<!-- <input class="hide" id="rewind" type="submit" value=""> -->

																<input class="btn btn-lg btn-primary btn-block"
																	value="Create Database Backup" type="submit"
																	id="rewind">
															</form:form>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="col-md-12-right">
											<button class="btn btn-primary" data-dismiss="modal"
												aria-hidden="true">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- Database Restore Modal -->


						<div id="dBRestoreModal" class="modal fade" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="container-fluid text-center">Database Restore</h1>
										<!-- <button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button> -->

									</div>
									<div class="modal-body">
										<div class="col-md-12">
											<div class="panel panel-default">
												<div class="panel-body">
													<div class="text-center">

														<div class="panel-body">

															<div id="loading2" style="display: none;">
																<img id="img-spinner" src="resources/images/spinner.gif"
																	alt="Loading" />
															</div>
															<form:form action="restoreDB.htm" id="restoreDB"
																method="post">
																<div>
																	<a class="form-feedback4"
																		style="color: #fff; font-size: 14px">
																		${statusMessage} <i aria-hidden="true"></i>
																	</a>
																</div>
																<div>
																	<a class="form-feedback4"
																		style="color: #fff; font-size: 14px">
																		${locationMessage} <i aria-hidden="true"></i>
																	</a>
																</div>
																<!-- <div class="input-group">
																		<span class="input-group-btn"> <span
																			class="btn btn-primary btn-file">
																				Browse... <input type="file" name="selectedFile" accept=".sql">
																		</span>
																		</span> <input type="text" class="form-control" readonly>
																	</div> -->
																<input class="btn btn-lg btn-primary btn-block"
																	value="Restore Database" type="submit">

															</form:form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="col-md-12-right">
											<button class="btn btn-primary" data-dismiss="modal"
												aria-hidden="true">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Application Backup Modal -->

						<div id="applicationBackupModal" class="modal fade" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="container-fluid text-center">Application
											Backup</h1>
										<!-- <button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button> -->
									</div>
									<div class="modal-body">
										<div class="col-md-12">
											<div class="panel panel-default">
												<div class="panel-body">
													<div class="text-center">

														<div class="panel-body">

															<div id="loading3" style="display: none;">
																<img id="img-spinner" src="resources/images/spinner.gif"
																	alt="Loading" />
															</div>

															<form:form action="applicationBackup.htm"
																id="applicationBackup" method="post">


																<div class="form-feedback1"
																	style="color: #fff; font-size: 14px">
																	${statusMessage}${statusMessage1} <i aria-hidden="true"></i>
																</div>
																<div class="form-feedback1"
																	style="color: #fff; font-size: 14px">
																	${locationMessage} <i aria-hidden="true"></i>
																</div>

																<!-- <div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-file"></span>
																		</span> <input type="text"
																			placeholder="Please enter file path "
																			class="form-control" name="filePath"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div> -->

																<input class="btn btn-lg btn-primary btn-block"
																	value="Save Backup" type="submit">
															</form:form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="col-md-12-right">
											<button class="btn btn-primary" data-dismiss="modal"
												aria-hidden="true">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- Application Restore Modal -->


						<div id="applicationRestoreModal" class="modal fade" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="container-fluid text-center">Application
											Restore</h1>
										<!-- <button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button> -->

									</div>
									<div class="modal-body">
										<div class="col-md-12">
											<div class="panel panel-default">
												<div class="panel-body">
													<div class="text-center">

														<div class="panel-body">

															<div id="loading4" style="display: none;">
																<img id="img-spinner" src="resources/images/spinner.gif"
																	alt="Loading" />
															</div>

															<form:form action="applicationRestore.htm"
																id="applicationRestore" method="post">

																<div class="form-feedback2"
																	style="color: #fff; font-size: 14px">
																	${statusMessage}${statusMessage1} <i aria-hidden="true"></i>
																</div>

																<!-- <div>
																		<input type="file" name="selectedFile" value=""
																			required="required">
																	</div> -->
																<input class="btn btn-lg btn-primary btn-block"
																	value="Restore Application" type="submit">
															</form:form>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="col-md-12-right">
											<button class="btn btn-primary" data-dismiss="modal"
												aria-hidden="true">Close</button>
										</div>
									</div>
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
		function hide() {
			$('#tableHeader').hide();
			$('#selectDuration').hide();

		}
	</script>

	<script type="text/javascript">
		function Export() {
			html2canvas(document.getElementById('dataTable'), {
				onrendered : function(canvas) {
					var data = canvas.toDataURL();
					var docDefinition = {
						content : [ {
							image : data,

						} ]
					};
					pdfMake.createPdf(docDefinition).download("AlarmLog.xls");
				}
			});
		}
	</script>

	<script type="text/javascript">
		function fnExcelReport(id, name) {
			var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
			tab_text = tab_text
					+ '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
			tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
			tab_text = tab_text
					+ '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
			tab_text = tab_text
					+ '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
			tab_text = tab_text + "<table border='1px'>";
			var exportTable = $('#' + id).clone();
			exportTable.find('input').each(function(index, elem) {
				$(elem).remove();
			});
			tab_text = tab_text + exportTable.html();
			tab_text = tab_text + '</table></body></html>';
			var fileName = name + '.xls';

			//Save the file
			var blob = new Blob([ tab_text ], {
				type : "application/vnd.ms-excel;charset=utf-8"
			})
			window.saveAs(blob, fileName);
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
		jQuery(function($) {

			$("#logBackup").submit(
					function(e) {

						e.preventDefault();

						$form = $(this);

						$.post("alarmLogBackup.htm", $(this).serialize(),
								function(data) {
									$feedback = $("<div>").html(data).find(
											".form-feedback").hide();

									$form.prepend($feedback);
									$feedback.fadeIn(500);
								});

					});
		});
	</script>

	<script type="text/javascript">
		jQuery(function($) {

			$("#applicationBackup").submit(
					function(e) {

						e.preventDefault();

						$form = $(this);

						$.post("applicationBackup.htm", $(this).serialize(),
								function(data) {
									$feedback = $("<div>").html(data).find(
											".form-feedback1").hide();

									$form.prepend($feedback);
									$feedback.fadeIn(500);
								});

					});
		});
	</script>

	<script type="text/javascript">
		jQuery(function($) {

			$("#applicationRestore").submit(
					function(e) {

						e.preventDefault();

						$form = $(this);

						$.post("applicationRestore.htm", $(this).serialize(),
								function(data) {
									$feedback = $("<div>").html(data).find(
											".form-feedback2").hide();

									$form.prepend($feedback);
									$feedback.fadeIn(500);
								});

					});
		});
	</script>

	<script type="text/javascript">
		jQuery(function($) {

			$("#backupDB").submit(
					function(e) {

						e.preventDefault();

						$form = $(this);

						$.post("backupDB.htm", $(this).serialize(), function(
								data) {
							$feedback = $("<div>").html(data).find(
									".form-feedback3").hide();

							$form.prepend($feedback);
							$feedback.fadeIn(500);
						});

					});
		});
	</script>

	<script type="text/javascript">
		jQuery(function($) {

			$("#restoreDB").submit(
					function(e) {

						e.preventDefault();

						$form = $(this);

						$.post("restoreDB.htm", $(this).serialize(), function(
								data) {
							$feedback = $("<div>").html(data).find(
									".form-feedback4").hide();

							$form.prepend($feedback);
							$feedback.fadeIn(500);
						});

					});
		});
	</script>

	<script type="text/javascript">
		$(document).ajaxStart(function() {
			// Show image container
			$("#loading").show();
		});
		$(document).ajaxComplete(function() {
			// Hide image container
			$("#loading").hide();
		});
	</script>

	<script type="text/javascript">
		$(document).ajaxStart(function() {
			// Show image container
			$("#loading1").show();
		});
		$(document).ajaxComplete(function() {
			// Hide image container
			$("#loading1").hide();
		});
	</script>

	<script type="text/javascript">
		$(document).ajaxStart(function() {
			// Show image container
			$("#loading2").show();
		});
		$(document).ajaxComplete(function() {
			// Hide image container
			$("#loading2").hide();
		});
	</script>

	<script type="text/javascript">
		$(document).ajaxStart(function() {
			// Show image container
			$("#loading3").show();
		});
		$(document).ajaxComplete(function() {
			// Hide image container
			$("#loading3").hide();
		});
	</script>

	<script type="text/javascript">
		$(document).ajaxStart(function() {
			// Show image container
			$("#loading4").show();
		});
		$(document).ajaxComplete(function() {
			// Hide image container
			$("#loading4").hide();
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

							var showToastrs = false;
							function toastrs() {
								if (!showToastrs) {

									if ("${message}" == 'welcome') {
										toastr.success(
												'Welcome to Maintenance!!!',
												'Welcome!!!')
									} 

									else {
										toastr
												.error(
														'Something Went Wrong. Please Try Again!!!',
														'Error!!!')
									}

								} else {
									toastr.error('you can\'t.',
											'several windows are opened!')
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

	<!-- <script>
		window.onload = function() {
			document.getElementById('rewind').click();
		}
	</script> -->

	<jsp:include page="script.jsp"></jsp:include>

	<!-- Imported scripts on this page -->
	<script src="resources/neon/assets/js/datatables/datatables.js"></script>

</body>
</html>
