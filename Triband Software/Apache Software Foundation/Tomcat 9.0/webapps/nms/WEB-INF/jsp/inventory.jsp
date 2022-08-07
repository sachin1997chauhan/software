<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false"%> --%>

<!DOCTYPE html>
<html lang="en">
<head>

<title>NMS | Inventory</title>

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

.page-content {
	width: calc(100% - 250px);
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

</head>
<body>
	<div id="load"></div>
	<div class="d-flex align-items-stretch">

		<jsp:include page="nav.jsp" />


		<div class="page-content">

			<div class="container-fluid">
				<ul class="breadcrumb">
					<li><a href="/nms/dashboardView.htm"
						style="font-size: 15px; color: white"><i class="entypo-home"
							style="font-size: 15px; color: white"></i><strong>Home</strong></a></li>

					<li class="active" style="font-size: 15px; color: white"><strong>Reports
							>>Inventory</strong></li>
				</ul>
			</div>
			<br>

			<!-- <div class="col-md-6">
				<div class="alert alert-success"><strong>Well done!</strong> You successfully read this important alert message.</div>
			</div> -->

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
			<section>
				<div class="container-fluid">
					<div class="col-lg-12">
						<div class="block margin-bottom-sm">
							<div class="table-responsive">
								<table class="table table-striped table-sm" id="table-4">
									<thead>
										<tr>
											<th><h4>S.No.</h4></th>
											<th><h4>Repeater Id</h4></th>
											<th><h4>Circle Name</h4></th>
											<th><h4>City</h4></th>
											<th><h4>Serial Number</h4></th>
											<th><h4>Repeater Type</h4></th>
											<th><h4>Last Status</h4></th>
											<th><h4>Site Name</h4></th>
											<th><h4>Site Address</h4></th>
											<th><h4>Contact Person</h4></th>
											<th><h4>Contact No.</h4></th>

											<th><h4>900 GainDL</h4></th>
											<th><h4>900 GainUL</h4></th>
											<th><h4>900 Dl OutPwr</h4></th>
											<th><h4>900 Ul OutPwr</h4></th>
											<th><h4>900 Start Hump1</h4></th>
											<th><h4>900 Stop Hump1</h4></th>
											<th><h4>900 Start Hump2</h4></th>
											<th><h4>900 Stop Hump2</h4></th>
											<th><h4>900 Start Hump3</h4></th>
											<th><h4>900 Stop Hump3</h4></th>
											<th><h4>900 Start Hump4</h4></th>
											<th><h4>900 Stop Hump4</h4></th>

											<th><h4>1800 GainDL</h4></th>
											<th><h4>1800 GainUL</h4></th>
											<th><h4>1800 Dl OutPwr</h4></th>
											<th><h4>1800 Ul OutPwr</h4></th>
											<th><h4>1800 Start Hump1</h4></th>
											<th><h4>1800 Stop Hump1</h4></th>
											<th><h4>1800 Start Hump2</h4></th>
											<th><h4>1800 Stop Hump2</h4></th>
											<th><h4>1800 Start Hump3</h4></th>
											<th><h4>1800 Stop Hump3</h4></th>
											<th><h4>1800 Start Hump4</h4></th>
											<th><h4>1800 Stop Hump4</h4></th>
											<th><h4>1800 Start Hump5</h4></th>
											<th><h4>1800 Stop Hump5</h4></th>
											<th><h4>1800 Start Hump6</h4></th>
											<th><h4>1800 Stop Hump6</h4></th>
											<th><h4>1800 Start Hump7</h4></th>
											<th><h4>1800 Stop Hump7</h4></th>
											<th><h4>1800 Start Hump8</h4></th>
											<th><h4>1800 Stop Hump8</h4></th>

											<th><h4>2100 GainDL</h4></th>
											<th><h4>2100 GainUL</h4></th>
											<th><h4>2100 Dl OutPwr</h4></th>
											<th><h4>2100 Ul OutPwr</h4></th>
											<th><h4>2100 Start Hump1</h4></th>
											<th><h4>2100 Stop Hump1</h4></th>
											<th><h4>2100 Start Hump2</h4></th>
											<th><h4>2100 Stop Hump2</h4></th>
											<th><h4>2100 Start Hump3</h4></th>
											<th><h4>2100 Stop Hump3</h4></th>
											<th><h4>2100 Start Hump4</h4></th>
											<th><h4>2100 Stop Hump4</h4></th>

											<th><h4>800 GainDL</h4></th>
											<th><h4>800 GainUL</h4></th>
											<th><h4>800 Dl OutPwr</h4></th>
											<th><h4>800 Ul OutPwr</h4></th>
											<th><h4>800 Start Hump1</h4></th>
											<th><h4>800 Stop Hump1</h4></th>
											<th><h4>800 Start Hump2</h4></th>
											<th><h4>800 Stop Hump2</h4></th>
											<th><h4>800 Start Hump3</h4></th>
											<th><h4>800 Stop Hump3</h4></th>
											<th><h4>800 Start Hump4</h4></th>
											<th><h4>800 Stop Hump4</h4></th>
									</thead>

									<tbody>
										<c:forEach items="${inventoryList}" var="inventoryDataList"
											varStatus="loop">

											<tr>
												<td>${loop.count}</td>
												<td>${inventoryList.get(loop.index).getRepId() }</td>
												<td>${inventoryList.get(loop.index).getCircle() }</td>
												<td>${inventoryList.get(loop.index).getCity() }</td>
												<td>${inventoryList.get(loop.index).getRepeaterSerialNumber() }</td>
												<td>${inventoryList.get(loop.index).getRepeaterType()}</td>
												<td><c:choose>
														<c:when
															test="${inventoryList.get(loop.index).isConnectionStatus()==true}">
															<font color="#32CD32">Online</font>
														</c:when>
														<c:when
															test="${inventoryList.get(loop.index).isConnectionStatus()==false}">
															<font color="orange">Offline</font>
														</c:when>
													</c:choose></td>
												<td>${inventoryList.get(loop.index).getSiteName() }</td>
												<td>${inventoryList.get(loop.index).getSiteAddress() }</td>
												<td>${inventoryList.get(loop.index).getContactName() }</td>
												<td>${inventoryList.get(loop.index).getContactNumber() }</td>

												<td>${inventoryList.get(loop.index).getGsmGaindl() }</td>
												<td>${inventoryList.get(loop.index).getGsmGainul() }</td>
												<td>${inventoryList.get(loop.index).getGsmForwardPwr() }</td>
												<td>${inventoryList.get(loop.index).getGsmReversePwr() }</td>
												<td>${inventoryList.get(loop.index).getGsmStartH1() }</td>
												<td>${inventoryList.get(loop.index).getGsmStopH1() }</td>
												<td>${inventoryList.get(loop.index).getGsmStartH2() }</td>
												<td>${inventoryList.get(loop.index).getGsmStopH2() }</td>
												<td>${inventoryList.get(loop.index).getGsmStartH3() }</td>
												<td>${inventoryList.get(loop.index).getGsmStopH3() }</td>
												<td>${inventoryList.get(loop.index).getGsmStartH4() }</td>
												<td>${inventoryList.get(loop.index).getGsmStopH4() }</td>

												<td>${inventoryList.get(loop.index).getDcs1Gaindl() }</td>
												<td>${inventoryList.get(loop.index).getDcs1Gainul() }</td>
												<td>${inventoryList.get(loop.index).getDcs1ForwardPwr() }</td>
												<td>${inventoryList.get(loop.index).getDcs1ReversePwr() }</td>
												<td>${inventoryList.get(loop.index).getDcs1StartH1() }</td>
												<td>${inventoryList.get(loop.index).getDcs1StopH1() }</td>
												<td>${inventoryList.get(loop.index).getDcs1StartH2() }</td>
												<td>${inventoryList.get(loop.index).getDcs1StopH2() }</td>
												<td>${inventoryList.get(loop.index).getDcs1StartH3() }</td>
												<td>${inventoryList.get(loop.index).getDcs1StopH3() }</td>
												<td>${inventoryList.get(loop.index).getDcs1StartH4() }</td>
												<td>${inventoryList.get(loop.index).getDcs1StopH4() }</td>

												<td>${inventoryList.get(loop.index).getDcs2StartH1() }</td>
												<td>${inventoryList.get(loop.index).getDcs2StopH1() }</td>
												<td>${inventoryList.get(loop.index).getDcs2StartH2() }</td>
												<td>${inventoryList.get(loop.index).getDcs2StopH2() }</td>
												<td>${inventoryList.get(loop.index).getDcs2StartH3() }</td>
												<td>${inventoryList.get(loop.index).getDcs2StopH3() }</td>
												<td>${inventoryList.get(loop.index).getDcs2StartH4() }</td>
												<td>${inventoryList.get(loop.index).getDcs2StopH4() }</td>

												<td>${inventoryList.get(loop.index).getWcdmaGaindl() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaGainul() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaForwardPwr() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaReversePwr() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaStartH1() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaStopH1() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaStartH2() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaStopH2() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaStartH3() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaStopH3() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaStartH4() }</td>
												<td>${inventoryList.get(loop.index).getWcdmaStopH4() }</td>

												<td>${inventoryList.get(loop.index).getEightGaindl() }</td>
												<td>${inventoryList.get(loop.index).getEightGainul() }</td>
												<td>${inventoryList.get(loop.index).getEightForwardPwr() }</td>
												<td>${inventoryList.get(loop.index).getEightReversePwr() }</td>
												<td>${inventoryList.get(loop.index).getEightStartH1() }</td>
												<td>${inventoryList.get(loop.index).getEightStopH1() }</td>
												<td>${inventoryList.get(loop.index).getEightStartH2() }</td>
												<td>${inventoryList.get(loop.index).getEightStopH2() }</td>
												<td>${inventoryList.get(loop.index).getEightStartH3() }</td>
												<td>${inventoryList.get(loop.index).getEightStopH3() }</td>
												<td>${inventoryList.get(loop.index).getEightStartH4() }</td>
												<td>${inventoryList.get(loop.index).getEightStopH4() }</td>

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