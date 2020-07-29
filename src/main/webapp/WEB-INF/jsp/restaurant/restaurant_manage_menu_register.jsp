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
		<script>
			function registMenu() {
			    var form = $('#menuReigister')[0];
	
			    // FormData 객체 생성
			    var formData = new FormData(form);
	
			    // 코드로 동적으로 데이터 추가 가능.
				// formData.append("userId", "testUser!");
	
			    $.ajax({
			        type: "POST",
			        enctype: 'multipart/form-data',
			        url: "${pageContext.request.contextPath}/restaurant/restaurant_manage_menu_register.do",
			        data: formData,
			        processData: false,
			        contentType: false,
			        cache: false,
			        timeout: 600000,
			        success: function (data) {
			            console.log("SUCCESS : ", data);
			        },
			        error: function (e) {
			            console.log("ERROR : ", e);
			        }
			    });
			}
		</script>
	</head>
	<body class="content2">
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
	</body>
	
</html>