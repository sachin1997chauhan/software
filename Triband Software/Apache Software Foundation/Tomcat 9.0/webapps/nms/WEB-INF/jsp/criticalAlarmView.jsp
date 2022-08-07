<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html lang="en">
<head>


<title>NMS | Critical Alarm</title>

<jsp:include page="link.jsp"></jsp:include>

<!-- Imported styles on this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/neon/assets/js/datatables/datatables.css">


<style type="text/css">
table {
	overflow: hidden;
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
	font-weight: bold;
	color: #fff;
}

body:not (.nohover ) tbody tr:hover {
	background-color: #ffa;
}

td:hover::after, thead th:not (:empty ):hover::after, td:focus::after,
	thead th:not (:empty ):focus::after {
	content: '';
	height: 10000px;
	left: 0;
	position: absolute;
	top: -5000px;
	width: 100%;
	z-index: -1;
}

td:hover::after, th:hover::after {
	background-color: #ffa;
}

td:focus::after, th:focus::after {
	background-color: lightblue;
}

/* Focus stuff for mobile */
td:focus::before, tbody th:focus::before {
	background-color: lightblue;
	content: '';
	height: 100%;
	top: 0;
	left: -5000px;
	position: absolute;
	width: 10000px;
	z-index: -1;
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
	background: url("${pageContext.request.contextPath}/resources/images/loading-spinner.gif") no-repeat center
		center rgba(0, 0, 0, 0.50);
	background-size: 150px 150px;
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
			<div class="container-fluid">
				<ul class="breadcrumb">
					<li><a href="/nms/dashboardView.htm"
						style="font-size: 15px; color: white"><i class="entypo-home"
							style="font-size: 15px; color: white"></i><strong>Home</strong></a></li>

					<li class="active" style="font-size: 15px; color: white"><strong>Active
							Alarms >> Critical Alarm</strong></li>
				</ul>
			</div>
			<br>


			<section>
				<div class="container-fluid">
					<div class="col-lg-12">
						<div class="block margin-bottom-sm">
							<div class="table-responsive">
								<table class="table table-striped table-sm" id="table-4">
									<thead>
										<tr>
											<th data-hide="phone,tablet"><b>Serial Number</b></th>
											<th data-hide="phone,tablet"><b>Site Name</b></th>
											<th data-hide="phone,tablet"><b>Circle Name</b></th>
											<th data-hide="phone,tablet"><b>Alarm Name</b></th>
											<th data-hide="phone,tablet"><b>Alarm Time</b></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${criticalAlarmDataList}"
											var="criticalAlarmList" varStatus="loop">


											<tr>
												<td><c:out
														value="${criticalAlarmDataList.get(loop.index).getSerialNumber()}" /></td>
												<td><c:out
														value="${criticalAlarmDataList.get(loop.index).getRepName()}" /></td>
												<td><c:out
														value="${criticalAlarmDataList.get(loop.index).getRegionName()}" /></td>
												<td><c:choose>
														<%-- <c:when test="${criticalAlarmDataList.get(loop.index).getElectricityStatus()==1}"><font color="#32CD32">Pass</font></c:when> --%>
														<c:when
															test="${criticalAlarmDataList.get(loop.index).getElectricityStatus()==0}">
															<font color="red">Electricity Fail</font>
														</c:when>
													</c:choose></td>
												<td><c:out
														value="${criticalAlarmDataList.get(loop.index).getRepTimeStamp()}" /></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</section>

			<jsp:include page="footer.jsp" />

		</div>
	</div>



	<jsp:include page="script.jsp"></jsp:include>

	<!-- Imported scripts on this page -->
	<script src="resources/neon/assets/js/datatables/datatables.js"></script>

</body>
</html>