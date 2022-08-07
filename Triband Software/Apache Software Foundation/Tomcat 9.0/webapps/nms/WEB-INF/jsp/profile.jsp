<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!doctype html>
<html>
<head>

<title>NMS | Profile</title>
<jsp:include page="link.jsp" />

<!-- <link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"> -->

<script
	src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>


<style type="text/css">
[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak,
	.x-ng-cloak {
	display: none !important;
}

body {
	background: white;
	margin: 0;
	padding: 0;
}

.form-container form>div {
	padding: 0 15px;
}

.form-container form>button {
	margin-left: 15px;
}

legend.form-label {
	font-size: 24pt;
	padding: 0 15px;
}

.form-control.error {
	border-color: red;
}

.form-hint {
	font-size: 7pt;
	line-height: 9pt;
	margin: -5px auto 5px;
	color: #999;
}

.form-hint.error {
	color: #C00;
	font-weight: bold;
	font-size: 8pt;
}

input {
	width: 200px;
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

</head>
<body data-ng-app="myApp" data-ng-controller="controller">

	<div id="load"></div>
	<div id="pageloader">
		<img
			src="${pageContext.request.contextPath}/resources/images/gears.gif" />
	</div>
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
					<li class="active" style="font-size: 15px; color: white"><strong>Profile
							>> Edit Profile</strong></li>
				</ul>
			</div>


			<input class="hide" id="rewind" type="submit" value="">


			<section>
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">

							<%-- <c:forEach items="${userDetails}" var="userDetailsList" varStatus="loop"> --%>

							<form:form id="UserDetailsForm" modelAttribute="UserDetails"
								action="/nms/edit_profile.htm" method="post">
								<div class="row">

									<div class="col-lg-12">
										<h4>
											<strong>${updateStatus}</strong>
										</h4>
									</div>

									<div class="col-lg-6">
										<button type="submit" class="btn btn-primary" id="apply">Apply
											Settings</button>
									</div>

									<div class="col-lg-6">
										<a href="#" data-target="#pwdModal"
											style="font-size: 12px; text-decoration: underline;"
											data-toggle="modal">Change password</a>
									</div>

								</div>
								<br />
								<div class="row">
									<div class="col-lg-12">
										<div class="block margin-bottom-sm">
											<div class="table-responsive">
												<table class="table table-striped">
													<tbody>
														<tr>
															<td><form:label path="username"
																	class="col-lg-6 control-label">User Name:</form:label>
															<td><b><form:input path="username" type="text"
																		maxlength="50" class="form-control"
																		placeholder="User Name" readonly="true"
																		value="${selectedUserDetails.getUsername()}" /></b></td>
														</tr>
														<tr>
															<td><form:label path="password"
																	class="col-lg-6 control-label">Password:</form:label>
															<td><b><form:input path="password"
																		type="password" readonly="true" maxlength="50"
																		class="form-control" placeholder="Password"
																		value="${selectedUserDetails.getPassword()}" /></b></td>

														</tr>
														<tr>
															<td><form:label path="EmailId"
																	class="col-lg-6 control-label">Email ID:</form:label>
															<td><b><form:input path="EmailId" type="text"
																		data-mask="email" autocomplete="off"
																		class="form-control" placeholder="Email Id"
																		value="${selectedUserDetails.getEmailId()}" /></b></td>
														</tr>
														<tr>
															<td><form:label path="PhoneNumber"
																	class="col-lg-6 control-label">Phone Number:</form:label>
															<td><b><form:input path="PhoneNumber"
																		type="text" data-mask="phone" autocomplete="off"
																		class="form-control" placeholder="Phone Number"
																		value="${selectedUserDetails.getPhoneNumber()}" /></b></td>
														</tr>
														<tr>
															<td><form:label path="RoleId"
																	class="col-lg-6 control-label">Role:</form:label></td>
															<td><form:select path="RoleId">
																	<form:option value="${selectedUserDetails.getRoleId()}">
																		<c:choose>
																			<c:when test="${selectedUserDetails.getRoleId()==4}">Super
													  </c:when>
																			<c:when test="${selectedUserDetails.getRoleId()==5}">Admin
													  </c:when>
																			<c:when test="${selectedUserDetails.getRoleId()==6}">Monitor
													  </c:when>
																		</c:choose>
																	</form:option>
																	<%-- <form:option value="4">Super</form:option> --%>
																	<option value="5">Admin</option>
																	<option value="6">Monitor</option>
																</form:select></td>

														</tr>

														<tr>
															<c:choose>

																<c:when test="${selectedUserDetails.getRoleId()!=0}">
																	<td><form:label path="assignedRegion"
																			class="col-lg-6 control-label">Region:</form:label></td>

																	<td><form:select path="assignedRegion">
																			<form:option
																				value="${selectedUserDetails.getAssignedRegion()}"
																				label="${selectedUserDetails.getAssignedRegion()}" />
																			<option value="AP & Telangana">AP & Telangana</option>
																				<option value="Assam">Assam</option>
																				<option value="Bihar Jharkhand">Bihar Jharkhand</option>
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
																				<option value="MP & Chhattisgarah">MP & Chhattisgarah</option>
																				<option value="Maharashtra & Goa">Maharashtra & Goa</option>
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
																			<option value="All">All</option>

																		</form:select></td>
																</c:when>

																<c:when
																	test="${selectedUserDetails.getRoleId()==4 || selectedUserDetails.getRoleId()==6}">
																	<td><form:label path="assignedRegion"
																			class="col-lg-6 control-label">Region Name</form:label></td>
																	<td><form:input path="assignedRegion" value="All"
																			readonly="true" />
																</c:when>
															</c:choose>
														</tr>

														<tr>

															<td><label id="Comment"
																class="col-lg-6 control-label">Memo:</label></td>
															<td><textarea id="Comment" name="Comment"
																	class="form-control" rows="5" cols="40"
																	placeholder="upto 250 characters only"><c:out
																		value="${selectedUserDetails.getComment()}" /></textarea></td>

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
									</div>
								</div>
							</form:form>

							<c:choose>
								<c:when test="${selectedUserDetails.getRoleId()==4}">
									<div class="col-lg-4">
										<a href="#" data-target="#smtpModal" data-toggle="modal">
											<font class="title"
											style="text-decoration: underline; font-size: 11px">SMTP
												Data</font>
										</a>
									</div>
								</c:when>
							</c:choose>

							<!-- SMTP data information modal-->

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
											<div class="block margin-bottom-sm">
												<div class="table-responsive">
													<table class="table table-striped">
														<c:choose>
															<c:when test="${smtpData == 'smtpIsNull'}">
																<tbody>
																	<tr>
																		<td><strong>Smtp data not
																				configured,Please update<a
																				style="text-decoration: underline;"
																				href="/nms/maintenance.htm"> Here</a>
																		</strong></td>
																	</tr>
																</tbody>
															</c:when>
															<c:otherwise>
																<tbody>
																	<tr>
																		<td><strong>SMTP:-</strong></td>
																		<td><strong><input type="text"
																				value="${smtpData.get(0).getSmtp()}" readonly="true" /></strong></td>
																	</tr>
																	<tr>
																		<td><strong>Port:-</strong></td>
																		<td><strong><input type="number"
																				value="${smtpData.get(0).getPort()}" readonly="true" /></strong></td>
																	</tr>
																	<tr>
																		<td><strong>Email-Id:-</strong></td>
																		<td><strong><input type="email"
																				value="${smtpData.get(0).getOutbox()}"
																				readonly="true" /></strong></td>
																	</tr>
																	<tr>
																		<td><strong>Password:-</strong></td>
																		<td><strong><input type="password"
																				value="${smtpData.get(0).getPassword()}"
																				id="emailPass" readonly="true" /> </strong><span
																			class="fa fa-eye" onclick="showHidePass()"></span></td>

																	</tr>
																</tbody>
															</c:otherwise>
														</c:choose>
													</table>
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

							<script>
								function showHidePass() {
									var x = document
											.getElementById("emailPass");
									if (x.type === "password") {
										x.type = "text";
									} else {
										x.type = "password";
									}
								}
							</script>


							<form:form action="change_password.htm" name="changePassword"
								method="post">
								<div id="pwdModal" class="modal fade" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="text-center">Change Password</h1>
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
																			<span class="input-group-addon"> <span
																				class="glyphicon glyphicon-lock"></span>
																			</span> <input type="password" placeholder="Password"
																				class="form-control" name="password"
																				data-ng-model="password" data-ng-required="true" />
																			<span class="glyphicon form-control-feedback"
																				aria-hidden="true"></span>
																		</div>

																		<%-- <div>
																			<!-- <p data-ng-bind="password"></p> -->
																			<p>{{password}}</p>
																			<p>${selectedUserDetails.getPassword()}</p>

																		</div>--%>


																		<div class="form-group input-group">
																			<span class="input-group-addon"> <i
																				class="glyphicon glyphicon-lock"></i>
																			</span> <input type="password" name="newPassword"
																				id="newPassword"
																				data-ng-model="user_input.newPassword"
																				data-ng-model-options="{allowInvalid: true}"
																				data-pattern-validator="((?=.*\d)(?=.*[A-Z])(?=.*\W).{8,8})"
																				class="form-control"
																				placeholder="Enter new password"
																				data-ng-required="true">
																		</div>
																		<div class="form-group">
																			<password-strength
																				data-ng-model="user_input.newPassword"></password-strength>
																		</div>
																		<div class="alert alert-info"
																			data-ng-show="changePassword.newPassword.$error.password_Check">
																			<strong>Info!</strong> Please enter At least 8
																			characters, and combine uppercase letters, lowercase
																			letter, number and symbols.
																		</div>

																		<div class="form-group">
																			<div class="error form-hint"
																				data-ng-show="changePassword.confirmPassword.$dirty && !changePassword.confirmPassword.$empty && changePassword.confirmPassword.$error.required"
																				data-ng-cloak>{{"You can't leave this
																				empty."}}</div>

																			<div class="error form-hint"
																				data-ng-show="
			( changePassword.confirmPassword.$dirty && changePassword.confirmPassword.$valid && !changePassword.confirmPassword.$invalid) && 
			( changePassword.newPassword.$modelValue != changePassword.confirmPassword.$modelValue )"
																				data-ng-cloak>{{"These passwords don't match.
																				Try again?"}}</div>

																			<div class="form-group input-group has-feedback">
																				<span class="input-group-addon"> <span
																					class="glyphicon glyphicon-lock"></span></span> <input
																					type="text" class="form-control"
																					id="confirmPassword" name="confirmPassword"
																					placeholder="Confirm new password "
																					data-ng-required="true"
																					data-ng-model="confirmPassword"
																					data-ng-class="(changePassword.confirmPassword.$dirty &&
			( changePassword.confirmPassword.$invalid || 
			( changePassword.newPassword.$modelValue != changePassword.confirmPassword.$modelValue ) ) ) ? 'error' : ''"
																					data-compare-to="changePassword.newPassword">

																				<span class="glyphicon form-control-feedback"
																					aria-hidden="true"></span> <span id='message'></span>
																			</div>
																		</div>


																		<button type="submit" class="btn btn-primary btn-lg">Save
																			Password</button>


																		<div class="modal fade" tabindex="-1" role="dialog"
																			id="spinnerModal">
																			<div
																				class="modal-dialog modal-dialog-centered text-center"
																				role="document">
																				<span class="fa fa-spinner fa-pulse fa-3x w-100"></span>
																			</div>
																		</div>
																	</fieldset>
																	<%-- <div>
																		<a class="txt1" style="color: #10A2E1">
																			${updateStatus} <i aria-hidden="true"></i>
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
						</div>
					</div>
				</div>
			</section>

			<jsp:include page="footer.jsp"></jsp:include></div>
	</div>

	<script>
		//myapp.js
		var app = angular
				.module('myApp', [])
				.controller('controller', [ '$scope', function($scope) {
					$scope.user_input = {
						newPassword : ''
					};
				} ])
				.directive(
						'passwordStrength',
						[ function() {
							return {
								require : 'ngModel',
								restrict : 'E',
								scope : {
									password : '=ngModel'
								},
								link : function(scope, elem, attrs, ctrl) {
									scope
											.$watch(
													'password',
													function(input_Value) {

														scope.strength = isSatisfied(input_Value
																&& input_Value.length >= 8)
																+ isSatisfied(input_Value
																		&& /[A-z]/
																				.test(input_Value))
																+ isSatisfied(input_Value
																		&& /(?=.*\W)/
																				.test(input_Value))
																+ isSatisfied(input_Value
																		&& /\d/
																				.test(input_Value));
														function isSatisfied(
																criteria) {
															return criteria ? 1
																	: 0;
														}
													}, true);
								},
								template : '<div class="progress">'
										+ '<div class="progress-bar progress-bar-danger progress-bar-striped active" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: {{strength >= 1 ? 25 : 0}}%"></div>'
										+ '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: {{strength >= 2 ? 25 : 0}}%"></div>'
										+ '<div class="progress-bar progress-bar-info progress-bar-striped active" style="width: {{strength >= 3 ? 25 : 0}}%"></div>'
										+ '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: {{strength >= 4 ? 25 : 0}}%"></div>'
										+ '</div>'
							}
						} ]).directive('patternValidator', [ function() {
					return {
						require : 'ngModel',
						restrict : 'A',
						link : function(scope, elem, attrs, ctrl) {
							ctrl.$parsers.unshift(function(viewStrength) {
								var patt = new RegExp(attrs.patternValidator);
								var isValid = patt.test(viewStrength);
								ctrl.$setValidity('password_Check', isValid);
								return viewStrength;

							});
						}
					};
				} ]);
	</script>

	<script type="text/javascript">
		jQuery(document).ready(
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

						if ("${message}" == 'success') {
							toastr.success('Profile updated successfully!!!',
									'Success!!!')
						}

						else if ("${message}" == 'success1') {
							toastr.success('Password updated successfully!!!',
									'Success!!!')
						}
					}

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
		$(document).ready(function() {
			$("#UserDetailsForm").on("submit", function() {
				$("#pageloader").fadeIn();
			});//submit
		});//document ready
	</script>


	<jsp:include page="script.jsp"></jsp:include>


</body>
</html>