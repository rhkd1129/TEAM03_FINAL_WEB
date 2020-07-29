<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/restaurant_order_queuecss.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/restaurant_manage_menu_resgistercss.css">
		
	</head>
	<body class="content2">
		<div class="menuRegistForm">
		<form id="menuReigister" method="post" enctype="multipart/form-data">
			<ul>
				<li>메뉴명</li>
				<li>
					<input name="fname"/>
				</li>
				<li>카테고리</li>
				<li>
					<select name="fcategory">
							<option>food</option>
							<option>beverage</option>
					</select>
				</li>
				<li>가격</li>
				<li>
					<input type="text" name="fprice"/>
				</li>
				<li>대표 이미지</li>
				<li>
					<input type="file" name="fimage"/>
				</li>
			</ul>
			<input id="menuSubmit" type="button" value="확인" onclick="registMenu();">
		</form>
		</div>
		
		<div class="menuList">
			<c:forEach var="food" items="${foodList}">
			
			</c:forEach>
		</div>
	</body>
	
</html>