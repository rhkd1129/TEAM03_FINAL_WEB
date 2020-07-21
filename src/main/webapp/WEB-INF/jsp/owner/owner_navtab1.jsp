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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/owner_tab1css.css">
	</head>
	<body>
		<div class="menu">
			<div class="menu1" id='menu1'>
				접수대기
			</div>
			<div class="menu2" id='menu2'>
				처리중
			</div>
			<div class="menu3" id='menu3'>
				완료
			</div>
			<div class="menu4" id='menu4'>
				주문조회
			</div>
		</div>
		
		<div class="main">
	</div>
	</body>
	<script src="${pageContext.request.contextPath}/resource/script/owner_navtab.js"></script>
</html>