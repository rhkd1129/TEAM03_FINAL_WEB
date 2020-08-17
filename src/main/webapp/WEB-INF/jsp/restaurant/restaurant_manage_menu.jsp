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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/restaurant_manage_menucss.css">
		
	</head>
	<body class="content2">
		<div class="menuRegistForm" style="height:100%">
		<form id="menuReigister" method="post" enctype="multipart/form-data">
			<ul>
				<li style="height:50px; font-size: 25px; font-weight: bold;">메뉴명</li>
				<li style="height:50px; font-size: 25px; font-weight: bold;">
					<input name="fname"/>
				</li>
				<li style="height:50px; font-size: 25px; font-weight: bold;">카테고리</li>
				<li style="height:50px; font-size: 25px; font-weight: bold;">
					<select style="height:50px; font-size: 25px; font-weight: bold;" name="fcategory">
							<option>food</option>
							<option>beverage</option>
					</select>
				</li>
				<li style="height:50px; font-size: 25px; font-weight: bold;">가격</li>
				<li style="height:50px; font-size: 25px; font-weight: bold;">
					<input type="text" name="fprice"/>
				</li>
				<li style="height:50px; font-size: 25px; font-weight: bold;">대표 이미지</li>
				<li style="height:50px; font-size: 25px; font-weight: bold;">
					<input type="file" name="fimage"/>
				</li>
			</ul>
			<input style="margin-left: 40px;" class="btn btn-primary btn-lg" id="menuSubmit" type="button" value="확인" onclick="registMenu();">
		</form>
		</div>

		
		<div class="menuList" style="height:100%;">
			<div class="foodList" style="height:50%; overflow:auto;">
				<c:forEach var="fnb" items="${foodList}">
					<div class="fnb">
						<div class="fnb_summary">
							<ul>
								<li class="fnb_name">${fnb.fname}</li>
								<li class="fnb_price">${fnb.fprice}원</li>
							</ul>
						</div>
						<div class="fnb_img">
							<img class="food_img" src="${pageContext.request.contextPath}/${fnb.fimage}">
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="beverageList" style="height:50%; overflow:auto;">
				<c:forEach var="fnb" items="${beverageList}">
					<div class="fnb">
						<div class="fnb_summary">
							<ul>
								<li class="fnb_name">${fnb.fname}</li>
								<li class="fnb_price">${fnb.fprice}원</li>
							</ul>
						</div>
						<div class="fnb_img">
							<img class="food_img" src="${pageContext.request.contextPath}/${fnb.fimage}">
						</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
	</body>
	
</html>