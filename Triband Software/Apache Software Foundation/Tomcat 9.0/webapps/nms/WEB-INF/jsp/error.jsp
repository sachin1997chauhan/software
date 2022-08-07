<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Error</title>

<jsp:include page="link.jsp"></jsp:include>

<style type="text/css">
.page-content{
    width: -webkit-fill-available;
}
</style>

</head>
<body>

	<div class="d-flex align-items-stretch">

		<div class="page-content">

			<form>
				<div>
					<input style="text-align: center; font-size: -webkit-xxx-large;"
						type="text" id="fname" name="fname" value="Unauthorized User">
				</div>

				<!-- <div class="wrap-input100 validate-input"
			data-validate="Enter username">
			<input class="input100" name="username" placeholder="Username">
			<span class="focus-input100" data-placeholder="&#xf207;"></span>
		</div>
 -->
				<div>
					<p style="color: #FF0000; font-size: 15px; text-align: center;">
						${errorMessage} <i aria-hidden="true"></i>
					</p>
				</div>
				<div>
					<p style="color: #FF0000; font-size: 15px; text-align: center;">
						${statusMessage} <i aria-hidden="true"></i>
					</p>
				</div>

				<!-- <p style="font-size: 120%; text-align: center;">
			The Page You requested can't authorized<br>Perhaps you are here
			because:<br> <br>Check the credentilas that you supplied
			check <br>the address for errors.
		</p>
 -->
				<div class="wrapper">
					<a class="button" href="login.htm">Go Home</a>
				</div>
			</form>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>

</body>

<style>
input[type=text] {
	width: 100%;
	padding: 20px 20px;
	margin: 15px 0;
	box-sizing: border-box;
	border: none;
	background-color: #8EBCF7;
	color: white;
}

.wrapper {
	text-align: center;
}

.button {
	background-color: #8EBCF7;
	border: black;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border: black;
	text-align: center;
	border-radius: 12px;
}
<
jsp
:include
 
page
="link
.jsp
"
>
</
jsp
:include
>
</style>
</html>