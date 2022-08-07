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

<title>NMS | Profile</title>

<jsp:include page="link.jsp"></jsp:include>

<!-- Imported styles on this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/js/datatables/datatables.css">

<!-- <style>
#assignedRegion {
	background-position: 5px 5px;
	width: 100%;
	font-size: 12px;
	padding: 0px 20px 12px 40px;
	margin-bottom: 10px;
}
</style> -->

<style>
th {
	position: relative;
	outline: 0;
	color: white;
	font-size: 15px;
}

td {
	font-size: 1.1rem;;
	position: relative;
	outline: 0;
	color: white;
}

.table-wrapper-scroll-y {
	display: block;
	max-height: 450px;
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
<body data-ng-app="">

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
					<li class="active" style="font-size: 15px; color: white"><strong>Profile
							>> Manage User</strong></li>
				</ul>
			</div>
			<input class="hide" id="rewind" type="submit" value="">
			<section>
				<div class="container-fluid">
					<div class="row">

						<div class="col-lg-12">
							<a href="#" data-target="#addUserModal" data-toggle="modal"
								style="font-size: 12px;"> <i class="entypo-user-add right"></i>
								<span class="title" style="text-decoration: underline;">New
									User </span></a>
						</div>
						<br /> <br />

						<div class="container-fluid">
							<div class="col-lg-12">
								<div class="block margin-bottom-sm">
									<div class="table-responsive">
										<table class="table table-striped table-sm" id="table-4">
											<thead>
												<tr>
													<th>
														<div class="checkbox checkbox-replace">
															<input type="checkbox" id="chk-1">
														</div>
													</th>
													<th>User Name</th>
													<th>User Role</th>
													<th>Actions</th>
												</tr>
											</thead>

											<tbody>

												<c:forEach items="${userList}" var="repeaterList"
													varStatus="loop">
													<c:if
														test="${userList.get(loop.index).getRoleId()=='5' || userList.get(loop.index).getRoleId()=='6'}">
														<tr>
															<td>
																<div class="checkbox checkbox-replace">
																	<input type="checkbox" id="chk-1">
																</div>
															</td>
															<td><c:out
																	value="${userList.get(loop.index).getUsername()}" /></td>
															<td><c:choose>
																	<c:when
																		test="${userList.get(loop.index).getRoleId()=='4'}">
																		<font>Super User</font>
																	</c:when>
																	<c:when
																		test="${userList.get(loop.index).getRoleId()=='5'}">
																		<font>Admin User</font>
																	</c:when>
																	<c:when
																		test="${userList.get(loop.index).getRoleId()=='6'}">
																		<font>Monitor User</font>
																	</c:when>
																</c:choose></td>
															<!-- <td>123</td> -->
															<td><a
																href="/nms/profile/${userList.get(loop.index).getUserID()}.htm"
																class="btn btn-default btn-sm btn-icon icon-left"> <i
																	class="entypo-pencil"></i> Edit
															</a> <a
																href="/nms/deleteUser/${userList.get(loop.index).getUserID()}.htm"
																class="btn btn-danger btn-sm btn-icon icon-left"
																onclick="return confirm('Are you sure?')"> <i
																	class="entypo-cancel"></i> Delete
															</a></td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>


						<!--Add user Modal -->

						<form:form action="registerUser.htm" modelAttribute="UserDetails"
							id="registerUser" method="get">
							<div id="addUserModal" class="modal fade" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="text-center">User Information</h1>

										</div>

										<div class="modal-body">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-body">
														<div class="text-center">

															<div class="panel-body">

																<fieldset>
																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-user"></span>
																		</span> <input type="text" placeholder="User Name"
																			class="form-control" name="username"
																			data-ng-model="username"
																			data-ng-pattern="/^[a-zA-Z@.]{1,60}$/"
																			data-ng-required="true" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>

																	<div data-ng-show="registerUser.username.$touched">
																		<div style="color: red"
																			data-ng-show="registerUser.username.$error.required">Please
																			enter a valid username.</div>
																	</div>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-lock"></span>
																		</span> <input type="password" placeholder="Password"
																			class="form-control" name="password" id="password"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>
																	</div>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-envelope"></span>
																		</span> <input type="email"
																			placeholder="Please enter a valid Email id"
																			class="form-control" name="email" id="email"
																			autocomplete="off" required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>
																	</div>


																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-earphone"></span>
																		</span> <input type="number" autocomplete="off"
																			placeholder="Phone Number" class="form-control"
																			name="phoneNumber" id="phoneNumber" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>
																	<br />
																	<div id="role_id" class="row">
																		<div class="col-lg-6">
																			<label>Role Id:-</label> <select
																				class="md-form mdb-select colorful-select dropdown-primary"
																				name="roleId" id="roleId" required="required"
																				data-ng-model="roleId">
																				<option value="" disabled selected>--Choose
																					your option--</option>
																				<option value="5">Admin</option>
																				<option value="6">Monitor</option>
																			</select>
																		</div>
																	</div>
																	<br />
																	<div data-ng-if="roleId==5">
																		<div id="region_id" class="row">
																			<div class="col-lg-6">
																				<label>Region</label> <select
																					class="md-form mdb-select colorful-select dropdown-primary"
																					name="assignedRegion" id="assignedRegion"
																					required="required">
																					<option value="" disabled selected>--Please
																						select region --</option>
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
																				</select>
																			</div>
																		</div>
																	</div>
																	<br />
																	<div class="row">


																		<span class="col-lg-3"><label>Notification:-
																		</label></span> <label class="checkbox-inline" id="notification"><input
																			type="checkbox" value="1">SMS Notification</label> <label
																			class="checkbox-inline"><input
																			type="checkbox" value="1">Email Notification</label>
																		<label class="checkbox-inline"> </label>


																	</div>
																	<br />
																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-hand-right"></span>
																		</span> <input type="text" placeholder="Comment"
																			class="form-control" name="comment" id="comment" />
																		<span class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>

																	<div>
																		<button type="submit" class="btn btn-primary btn-lg">ApplySettings</button>
																		<button type="reset" class="btn btn-danger btn-lg">Reset</button>

																	</div>

																	<div class="modal fade" tabindex="-1" role="dialog"
																		id="spinnerModal">
																		<div
																			class="modal-dialog modal-dialog-centered text-center"
																			role="document">
																			<span class="fa fa-spinner fa-pulse fa-3x w-100"></span>
																		</div>
																	</div>
																</fieldset>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-lg-12-right">
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
		});
	</script>

	<script>
		function modal() {
			$('.modal').modal('show');
			setTimeout(function() {
				console.log('hejsan');
				$('.modal').modal('hide');
			}, 3000);
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
											text : 'Save as <img src="${pageContext.request.contextPath}/resources/images/excel.ico" height="25" width="25">'

										} /* ,'pdfHtml5' */
										]
									});
						});
	</script>

	<script>
		function phonenumber(inputtxt) {
			var phoneno = /^\d{10}$/;
			if ((inputtxt.value.match(phoneno))) {
				return true;
			} else {
				alert("message");
				return false;
			}
		}
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

								if ("${newUser}" == 'success') {
									toastr.success(
											'New user added successfully!!!',
											'Success!!!')
								}

								else if ("${newUser}" == 'Exist') {
									toastr.error('This User Already Exist.!!!',
											'Error!!!')
								}

								else if ("${newUser}" == 'wrong') {
									toastr.warning('Something went wrong!!!',
											'Warning!!!')
								}

								else if ("${deleteUser}" == 'Successfully Deleted!') {
									toastr.success('Successfully Deleted!!!',
											'Success!!!')
								} else if ("${deleteUser}" == 'Unsuccessfully Deleted.Please Try Again!') {
									toastr
											.error(
													'Unsuccessfully Deleted.Please Try Again!!!',
													'Error!!!')
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

	<jsp:include page="script.jsp"></jsp:include>

	<!-- Imported scripts on this page -->
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/datatables/datatables.js"></script>


</body>
</html>