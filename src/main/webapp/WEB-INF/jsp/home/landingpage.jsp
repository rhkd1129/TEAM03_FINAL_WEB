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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/landingpagecss.css">
		<style type="text/css">
			.landingmain {
				background-image:url('${pageContext.request.contextPath}/resource/image/home/landing_page_bg.png');
			}
		</style>
	</head>
	<body>
		<div class="header">
			<img src="${pageContext.request.contextPath}/resource/image/home/zgiyo_logo.png" style="width:260px; height:111px">
		</div>
		<div class='landingmain'>
			<div class='row'>
				<div class='column' style="text-align:center;">
					<a href='${pageContext.request.contextPath}/customer/main.do'>
						<img class='enter_logo' id='enter_logo1' src="${pageContext.request.contextPath}/resource/image/home/zgiyo_app1.png" >
					</a>
				</div>
				
				<div class='column' style="text-align:center;">
					<a href='${pageContext.request.contextPath}/owner/main.do'>
						<img class='enter_logo' id='enter_logo2' src="${pageContext.request.contextPath}/resource/image/home/zgiyo_app2.png" >
					</a>
				</div>
				
				<div class='column' style="text-align:center;">
					<a href='${pageContext.request.contextPath}/admin/main.do'>
						<img class='enter_logo' id='enter_logo3' src="${pageContext.request.contextPath}/resource/image/home/zgiyo_app3.png">
					</a>
				</div>
			</div>
		</div>
		
	</body>
	<script src="${pageContext.request.contextPath}/resource/script/landingpage.js"></script>
</html>