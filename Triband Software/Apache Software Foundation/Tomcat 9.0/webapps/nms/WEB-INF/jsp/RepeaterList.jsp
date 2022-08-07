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

<title>NMS | RepeaterList</title>

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
	color: white;
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

.confirmBox {
	position: absolute;
	top: 30%;
	bottom: 60%;
	left: 40%;
	width: 20%;
	height: 10%;
	background-color: white;
	border-radius: 10px;
	padding: 10px;
	z-index: 2;
	text-align: center;
	color: black;
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

#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	background-color: red;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 4px;
}

#myBtn:hover {
	background-color: #555;
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

<script type="text/javascript">
	//whatever kind of mobile test you wanna do.
	if (screen.width < 500) {

		$("body").addClass("nohover");
		$("td, th").attr("tabindex", "1").on("touchstart", function() {
			$(this).focus();
		});

	}
</script>

<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			document.getElementById("myBtn").style.display = "block";
		} else {
			document.getElementById("myBtn").style.display = "none";
		}
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>

</head>
<body>

	<!-- <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button> -->

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

					<li class="active" style="font-size: 15px; color: white"><strong>Site>>
							Site List</strong></li>
				</ul>
			</div>
			<!-- <br> -->



			<section>
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="block margin-bottom-sm">
								<!-- <div class="table-wrapper-scroll-y"> -->
								<table class="table table-striped table-sm" id="myTable">
									<thead>
										<tr>
											<th><b>Serial Number</b></th>
											<th><b>Site Name</b></th>
											<th><b>Circle Name</b></th>
											<th><b>Repeater Status</b></th>
											<th><b>Actions</b></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${repDataList}" var="repeaterList"
											varStatus="loop">
											<tr>
												<td><c:out
														value="${repDataList.get(loop.index).getSerialNumber()}" /></td>
												<td><c:out
														value="${repDataList.get(loop.index).getRepName()}" /></td>
												<td><c:out
														value="${repDataList.get(loop.index).getRegionName()}" /></td>
												<td><c:choose>
														<c:when
															test="${repDataList.get(loop.index).isConnectionStatus()==true}">
															<font color="#32CD32">Online</font>
														</c:when>
														<c:when
															test="${repDataList.get(loop.index).isConnectionStatus()==false}">
															<font color="orange">Offline</font>
														</c:when>
													</c:choose></td>
												<td><c:if
														test="${repDataList.get(loop.index).getReptype()=='1' || repDataList.get(loop.index).getReptype()=='2' || repDataList.get(loop.index).getReptype()=='4' || repDataList.get(loop.index).getReptype()=='5'}">
														<a
															href="<c:url value='/config/${repDataList.get(loop.index).getSerialNumber()}.htm' />">
															<font color="#32CD32"><i class="entypo-pencil"></i>
																Configuration</font>
														</a>
														<c:if test="${userDetails.getRoleId() !='6'}">

															<a
																href="/nms/deleteSite/${repDataList.get(loop.index).getSerialNumber()}.htm"
																class="btn btn-danger btn-sm btn-icon icon-left"
																onclick="return confirm('Are you sure you want to delete this site?')">
																<i class="entypo-cancel"></i> Delete
															</a>
														</c:if>
													</c:if> <c:if
														test="${repDataList.get(loop.index).getReptype()=='3'}">
														<a
															href="<c:url value='/odas/${repDataList.get(loop.index).getSerialNumber()}.htm' />">
															<font color="#32CD32"><i class="entypo-pencil"></i>
																Configuration</font>
														</a>


														<c:if test="${userDetails.getRoleId() !='6'}">
															<a
																href="/nms/deleteSite/${repDataList.get(loop.index).getSerialNumber()}.htm"
																class="btn btn-danger btn-sm btn-icon icon-left "
																onclick="return confirm('Are you sure you want to delete this site?')">
																<i class="entypo-cancel"></i> Delete
															</a>
														</c:if>
													</c:if> <c:if
														test="${repDataList.get(loop.index).getReptype()=='6'}">
														<a
															href="<c:url value='/soho/${repDataList.get(loop.index).getSerialNumber()}.htm' />">
															<font color="#32CD32"><i class="entypo-pencil"></i>
																Configuration</font>
														</a>


														<c:if test="${userDetails.getRoleId() !='6'}">
															<a
																href="/nms/deleteSite/${repDataList.get(loop.index).getSerialNumber()}.htm"
																class="btn btn-danger btn-sm btn-icon icon-left "
																onclick="return confirm('Are you sure you want to delete this site?')">
																<i class="entypo-cancel"></i> Delete
															</a>
														</c:if>
													</c:if> <c:if
														test="${repDataList.get(loop.index).getReptype()=='7'}">
														<a
															href="<c:url value='/sohoHid/${repDataList.get(loop.index).getSerialNumber()}.htm' />">
															<font color="#32CD32"><i class="entypo-pencil"></i>
																Configuration</font>
														</a>


														<c:if test="${userDetails.getRoleId() !='6'}">
															<a
																href="/nms/deleteSite/${repDataList.get(loop.index).getSerialNumber()}.htm"
																class="btn btn-danger btn-sm btn-icon icon-left "
																onclick="return confirm('Are you sure you want to delete this site?')">
																<i class="entypo-cancel"></i> Delete
															</a>
														</c:if>
													</c:if> <c:if
														test="${repDataList.get(loop.index).getReptype()=='8'}">
														<a
															href="<c:url value='/tetraMou/${repDataList.get(loop.index).getSerialNumber()}.htm' />">
															<font color="#32CD32"><i class="entypo-pencil"></i>
																Configuration</font>
														</a>


														<c:if test="${userDetails.getRoleId() !='6'}">
															<a
																href="/nms/deleteSite/${repDataList.get(loop.index).getSerialNumber()}.htm"
																class="btn btn-danger btn-sm btn-icon icon-left "
																onclick="return confirm('Are you sure you want to delete this site?')">
																<i class="entypo-cancel"></i> Delete
															</a>
														</c:if>
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- </div> -->
							</div>
						</div>
					</div>
				</div>
			</section>

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
								console.log("Hiiiii....");
								console.log("${deleteSite}");
								if ("${deleteSite}" == 'Successfully Deleted!') {
									toastr.success('Successfully Deleted !!!',
											'Success!!!')
								} else if ("${deleteSite}" == 'Unsuccessfully Deleted.Please Try Again!') {
									toastr
											.error(
													'Unsuccessfully Deleted.Please Try Again!',
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
	<script
		src="${pageContext.request.contextPath}/resources/neon/assets/js/datatables/datatables.js"></script>

</body>
</html>