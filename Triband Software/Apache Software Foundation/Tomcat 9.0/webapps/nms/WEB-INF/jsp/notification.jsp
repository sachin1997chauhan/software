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

<title>NMS | Notification</title>

<jsp:include page="link.jsp"></jsp:include>

<style type="text/css">
#load {
	width: 100%;
	height: 100%;
	position: fixed;
	z-index: 9999;
	background: url("${pageContext.request.contextPath}/resources/images/loading-spinner.gif") no-repeat center
		center rgba(0, 0, 0, 0.50);
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
<body>
<div id="load"></div>
	<div class="d-flex align-items-stretch">
		<!--Navigation bar-->

		<jsp:include page="nav.jsp" />

		<!--end of Navigation bar-->
		<div class="page-content">

			<section>
				<div class="container-fluid">
					<div class="row">

						<div class="col-lg-12">
							<c:if test="${userDetails.getRoleId() =='4'}">


								<a href="#" data-target="#pwdModal" data-toggle="modal"> <i
									class="entypo-cog right"></i> <font class="title"
									style="text-decoration: underline;">Set SMTP</font>

								</a>

							</c:if>
						</div>
						<h4>
							<strong style=" font-size: 100%; text-align: center;">${statusMessage}</strong>
						</h4>
						<h4>
							<strong style=" font-size: 100%; text-align: center;">${statusMessage1}</strong>
						</h4>


						<form:form action="sendFile.htm" id="backupShare"
							modelAttribute="fileUpload" enctype="multipart/form-data"
							method="post">
							<br>
							<div class="row">
								<div class="col-lg-12">
									<div class="block margin-bottom-sm">
										<div class="table-responsive">
											<table class="table">
												<tbody>

													<tr>
														<th
															style="text-align: center; font-size: 25px; color: white">Alert
															Notification</th>
													</tr>

													<tr>
														<td>
															<div class="col-lg-6">
																<a href="#" data-target="#alertModal"
																	style="text-align: center; font-size: 15px;"
																	data-toggle="modal">Email</a>
															</div> <!-- <div class="col-lg-6">
													<a href="#" data-target="#pwdModal"
														style="text-align: center; font-size: 15px; "
														data-toggle="modal">SMS</a>
												</div> -->

														</td>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="block margin-bottom-sm">
										<div class="table-responsive">
											<table class="table">

												<tbody>
													<tr>
														<th
															style="text-align: center; font-size: 25px; color: white">Report
															Notification</th>
													</tr>
													<tr>
														<td>
															<!-- <div class="col-lg-6">
													<a href="#" data-target="#pwdModal"
														style="text-align: center; font-size: 15px; color: blue;"
														data-toggle="modal">SMS</a>
												</div> -->
															<div class="col-lg-6">
																<a href="#" data-target="#reportModal"
																	style="text-align: center; font-size: 15px; "
																	data-toggle="modal">Email</a>
															</div>
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

												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="col-lg-12">
									<div class="block margin-bottom-sm">
										<div class="table-responsive">
											<table class="table">

												<tbody>
													<tr>
														<th
															style="text-align: center; font-size: 25px; color: white">Log
															Notification</th>
													</tr>
													<tr>
														<td>
															<!-- <div class="col-lg-6">
													<a href="#" data-target="#pwdModal"
														style="text-align: center; font-size: 15px; color: blue;"
														data-toggle="modal">SMS</a>
												</div> -->
															<div class="col-lg-6">
																<a href="#" data-target="#logModal"
																	style="text-align: center; font-size: 15px;"
																	data-toggle="modal">Email</a>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</form:form>

						<!-- Set SMTP data information modal-->

						<form:form action="setSmtp.htm" id="setSMTP" method="post">
							<div id="pwdModal" class="modal fade" tabindex="-1" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="text-center">Smtp Information</h1>
											<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button> -->

										</div>
										<div class="modal-body">
											<div class="col-lg-12">
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
																		<button type="submit" class="btn btn-success btn-lg"
																			onclick="return check_password();">Save</button>
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
											<div class="col-md-lg-right">
												<button class="btn btn-primary" data-dismiss="modal"
													aria-hidden="true">Cancel</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>

						<!-- Alert Notification Modal -->

						<form:form action="alertNotification.htm" id="alertNotification"
							modelAttribute="fileUpload" enctype="multipart/form-data"
							method="post">

							<div id="alertModal" class="modal fade" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="text-center">Alert Notification</h1>
											<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button> -->

										</div>
										<div class="modal-body">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-body">
														<div class="text-center">

															<div class="panel-body">


																<fieldset>
																	<div>
																		<input type="file" id="file" name="file" class="file"
																			size="50" required="required">
																	</div>
																	<br>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-envelope"></span>
																		</span> <input type="email" placeholder="Email Id"
																			class="form-control" name="email" id="email"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>
																	</div>
																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-hand-right"></span>
																		</span> <input type="text" placeholder="Message"
																			class="form-control" name="message" id="message" />
																		<span class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>
																	</div>
																	<div>
																		<button type="submit" class="btn btn-success btn-lg">Send</button>
																	</div>
																</fieldset>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-md-lg-right">
												<button class="btn btn-primary" data-dismiss="modal"
													aria-hidden="true">Cancel</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>

						<!-- Report Notification Modal -->

						<form:form action="reportNotification.htm" id="reportNotification"
							modelAttribute="fileUpload" enctype="multipart/form-data"
							method="post">
							<div id="reportModal" class="modal fade" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="text-center">Report Notification</h1>
											<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button> -->

										</div>
										<div class="modal-body">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-body">
														<div class="text-center">

															<div class="panel-body">


																<fieldset>
																	<div>
																		<input type="file" id="file" name="file" class="file"
																			size="50" required="required">
																	</div>
																	<br>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-envelope"></span>
																		</span> <input type="email" placeholder="Email Id"
																			class="form-control" name="email" id="email"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>
																	</div>
																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-hand-right"></span>
																		</span> <input type="text" placeholder="Message"
																			class="form-control" name="message" id="message" />
																		<span class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>
																	<div>
																		<button type="submit" class="btn btn-success btn-lg">Send</button>
																	</div>
																</fieldset>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-md-lg-right">
												<button class="btn btn-primary" data-dismiss="modal"
													aria-hidden="true">Cancel</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form:form>

						<!-- Log Notification Modal -->

						<form:form action="logNotification.htm" id="logNotification"
							modelAttribute="fileUpload" enctype="multipart/form-data"
							method="post">
							<div id="logModal" class="modal fade" tabindex="-1" role="dialog"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="text-center">Log Notification</h1>
											<!-- <button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button> -->

										</div>
										<div class="modal-body">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<div class="panel-body">
														<div class="text-center">

															<div class="panel-body">


																<fieldset>
																	<div>
																		<input type="file" id="file" name="file" class="file"
																			size="50" required="required">
																	</div>
																	<br>

																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-envelope"></span>
																		</span> <input type="email" placeholder="Email Id"
																			class="form-control" name="email" id="email"
																			required="required" /> <span
																			class="glyphicon form-control-feedback"
																			aria-hidden="true"></span> <span id='message'></span>
																	</div>
																	<div class="form-group input-group has-feedback">
																		<span class="input-group-addon"> <span
																			class="glyphicon glyphicon-hand-right"></span>
																		</span> <input type="text" placeholder="Message"
																			class="form-control" name="message" id="message" />
																		<span class="glyphicon form-control-feedback"
																			aria-hidden="true"></span>

																	</div>
																	<div>
																		<button type="submit" class="btn btn-success btn-lg">Send</button>
																	</div>
																</fieldset>

															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-md-lg-right">
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

<jsp:include page="script.jsp"></jsp:include>

</body>
</html>