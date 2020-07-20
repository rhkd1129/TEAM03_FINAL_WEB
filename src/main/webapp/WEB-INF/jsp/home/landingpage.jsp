<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		<style>
			body {
				margin: 0;
			}
			
			/* Style the header */
			.header {
				background-color: #e60000;
				padding: 20px;
				text-align: center;
			}
			
			#enter_logo {
				width: 407px;
				height: 390px;
			}
			
			/* Create three equal columns that floats next to each other */
			.column {
			 	float: left;
				width: 33.33%;
				padding: 0px;
			}
			
			/* Clear floats after the columns */
			.row:after {
			  	content: "";
			  	display: table;
			  	clear: both;
			  
			}
			
			.row {
				padding-top: 200px;
				width: 1920px;
				height: 817px;
				margin: 0px;
			}
			
			/* Responsive layout - makes the three columns stack on top of each other instead of next to each other on smaller screens (600px wide or less) */
			@media screen and (max-width: 600px) {
				.column {
			  	  	width: 100%;
			 	}
			}
			
			.main {
				background-image:url('${pageContext.request.contextPath}/resource/image/home/landing_page_bg.png');
			}
		</style>
	</head>
	<body>
		<div class="header">
			<a href='${pageContext.request.contextPath}/home/main.do'>
				<img src="${pageContext.request.contextPath}/resource/image/home/zgiyo_logo.png" style="width:260px; height:111px">
			</a>
		</div>
		<div class='main'>
			<div class='row'>
				<div class='column' style="text-align:center;">
					<a href='${pageContext.request.contextPath}/home/main.do'>
					<img id='enter_logo' src="${pageContext.request.contextPath}/resource/image/home/zgiyo_app1.png" >
					</a>
				</div>
				
				<div class='column' style="text-align:center;">
					<a href='${pageContext.request.contextPath}/home/main.do'>
					<img id='enter_logo' src="${pageContext.request.contextPath}/resource/image/home/zgiyo_app2.png" >
					</a>
				</div>
				
				<div class='column' style="text-align:center;">
					<a href='${pageContext.request.contextPath}/home/main.do'>
					<img id='enter_logo' src="${pageContext.request.contextPath}/resource/image/home/zgiyo_app3.png">
					</a>
				</div>
			</div>
		</div>
		
	</body>
</html>