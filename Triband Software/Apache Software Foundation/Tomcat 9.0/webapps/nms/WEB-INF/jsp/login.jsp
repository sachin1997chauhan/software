<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%-- <%@ page session="false"%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->

<style type="text/css">
.css-form input.ng-invalid.ng-touched {
	background-color: #FA787E;
}

.css-form input.ng-valid.ng-touched {
	background-color: #78FA89;
}

#siginButton {
	color: #fff !important;
	background-color: #1395f0;
	border-color: #f2f2f2;
	width: 40%;
	text-align: center;
	border-radius: 7px !important;
	margin-top: 7px;
}

form


input

.ng-invalid


:not



(
.ng-pristine

)
{
box-shadow

:


0
px


0
px


13
px

rgba

(255
,
133,
0,
0
.9

);
}
input[type=text] {
	background: transparent;
	border: none;
	border-bottom: 1.5px solid #04586d;
}

input[type=text]:focus {
	background: transparent;
}

input[type=password] {
	background: transparent;
	border: none;
	border-bottom: 1.5px solid #04586d;
}

input[type=password]:focus {
	background: transparent;
}

.input-group {
	padding-left: 25px;
	padding-right: 25px;
}

.btn1 {
	width: 270px;
	border-radius: 15px;
}
</style>

</head>
<body data-ng-app="">

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('resources/images/bg-01.png');">

			<div>

				<!--    -->
				<%-- <c:url var="loginUrl" value="/login.htm" /> --%>
				<form:form name="loginForm"
					style="border-style: solid;  border-color: white;"
					modelAttribute="login" action="login.htm" method="post"
					class="login100-form validate-form p-b-33 p-t-5 css-form">
					<img src="resources/images/frog1.png"
						style="margin-top: -5px; border-radius: 9px;">

					<div>
						<p style="color: red; font-size: 100%; text-align: left;">
							${error} <i aria-hidden="true"></i>
						</p>
					</div>

					<%-- <div>
						<a class="txt1" style="color: #000000"> <strong>${confirmMessage}</strong> <i
							aria-hidden="true"></i>
						</a>
					</div> --%>
					<div>
						<div style="color: #000000; text-align: center;">${confirmMessage}</div>
					</div>

					<c:if test="${param.logout != null}">
						<div class="alert ">${msg}</div>
					</c:if>
					<br>

					<div class="input-group">
						<a style="border-bottom: 1.5px solid #04586d;"><img
							src="resources/images/Login-Icon.png" height="25px" width="25px"></a>
						<input type="text" placeholder="username" class="form-control"
							name="username" data-ng-model="username"
							data-ng-pattern="/^[a-zA-Z@.]{1,60}$/" data-ng-required="true" />
						<span class="form-control-feedback" aria-hidden="true"></span>
					</div>

					<div class="input-group">
					<div data-ng-show="loginForm.username.$touched">
						<div style="color: red"
							data-ng-show="loginForm.username.$error.required">Please
							enter a valid username.</div>
					</div></div>

					<!-- <div>
				<p data-ng-bind="username"></p>
				<p>{{username}}</p>
				
			</div> -->

					<br>


					<div class="input-group">
						<a style="border-bottom: 1.5px solid #04586d;"> <img
							src="resources/images/Password-Icon.png" height="25px"
							width="25px">
						</a> <input type="password" placeholder="************"
							class="form-control" name="password" data-ng-minlength=8
							data-ng-model="password" data-ng-required="true" /> <span
							class="form-control-feedback" aria-hidden="true"></span>

					</div>

					<div class="input-group">
					<div
						data-ng-show="loginForm.$submitted || loginForm.password.$touched">
						<span style="color: red"
							data-ng-show="loginForm.password.$error.required">Please
							enter your password.</span>
					</div></div>
					<br>


					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn btn1" style="color: #fff;">Login</button>
						</div>
					</div>


					<!-- <div class="input-group1">
						<button type="submit"
							class="btn btn-lg btn-sucess btn-block disabled"
							style="color: #fff;" name="login">Login</button>
					</div> -->

					<div>
						<span class="container"> <a href="#" data-backdrop="static"
							data-keyboard="false" data-target="#pwdModal"
							style="color: #04586d; text-decoration: underline"
							data-toggle="modal"><strong>Forgot password?</strong></a>

						</span>
					</div>

				</form:form>
			</div>
		</div>
	</div>

	<!--modal-->


	<div id="pwdModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="text-center">

									<p>If you have forgotten your password you can reset it
										here.</p>
									<br>
									<!-- 
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button> -->

									<div class="panel-body">


										<form:form action="forgot.htm" id="forgot" method="post">

											<div>
												<a class="form-feedback"
													style="color: #10A2E1; font-size: 14px">
													${confirmMessage} <i aria-hidden="true"></i>
												</a>
											</div>

											<div class="form-group input-group has-feedback">
												<a style="border-bottom: 1.5px solid #04586d;"><img
													src="resources/images/Login-Icon.png" height="25px"
													width="25px"></a> <input type="text"
													placeholder="User Name" class="form-control"
													name="username" required="required" /> <span
													class="glyphicon form-control-feedback" aria-hidden="true"></span>

											</div>

											<!-- <div class="form-group input-group has-feedback">
														<span class="input-group-addon"> <span
															class="fa fa-envelope"></span>
														</span> <input type="Email" placeholder="Email Address"
															class="form-control" name="email" id="email"
															required="required" /> <span
															class="glyphicon form-control-feedback"
															aria-hidden="true"></span>

													</div> -->


											<button type="submit" class="btn btn-primary btn-lg"
												onclick="spinner();">Send</button>

											<button type="reset" class="btn btn-danger btn-lg">Reset</button>

											<div class="modal fade" tabindex="-1" role="dialog"
												id="spinnerModal">
												<div class="modal-dialog modal-dialog-centered text-center"
													role="document">
													<span class="fa fa-spinner fa-pulse fa-3x w-100"></span>
												</div>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-md-12-right">
						<button class="btn btn-default" data-dismiss="modal"
							aria-hidden="true">Cancel</button>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		jQuery(function($) {

			$("#forgot").submit(
					function(e) {

						e.preventDefault();

						$form = $(this);

						$.post("forgot.htm", $(this).serialize(),
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
		function spinner() {
			$('.modal').modal('show');
			setTimeout(function() {
				console.log('hejsan');
				$('.modal').modal('hide');
			}, 5000);
		}
	</script>

	<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>
	<!--===============================================================================================-->
	<script src="resources/js/angular.min.js"></script>
	<!-- <script
		src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.6/angular.min.js"></script> -->
</body>
</html>