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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_searchcss.css">
	<script src="${pageContext.request.contextPath}/resource/script/addressapi.js"></script>
</head>
<body>
	<div class="header">
		<div class="navbar1">
			<img class="zgiyo" src="${pageContext.request.contextPath}/resource/image/home/즈기요.png">

			<div class="boxbox">
				<div class="login">로그인</div>
				<div class="join">회원가입</div>
			</div>
		</div>
		<div class="navbar2" style="background-image: url('${pageContext.request.contextPath}/resource/image/home/customer_main_bg.png');">
			<div class="navtext">
				<img src="${pageContext.request.contextPath}/resource/image/home/customer_main_text.png">
			</div>
			<div class="address">
				<form name="form" id="form" method="post">
					<input type="text" name="currentPage" value="1" style="display:none;"/> 
					<input type="text" name="countPerPage" value="100" style="display:none;"/> 
					<input type="text" name="resultType" value="json" style="display:none;"/> 
					<input type="text" name="confmKey" value="U01TX0FVVEgyMDIwMDcyMjEwMTMyNDEwOTk3ODQ=" style="display:none;"/>
					<input type="text" name="keyword" value="${fullAddr}" onkeydown="enterSearch();" style="width: 400px; height: 40px"/>
					<input type="button" onClick="getAddr();" value="검색" style="height: 40px"/>
					<div id="list"></div>
				</form>
			</div>
		</div>
	</div>

 
	<div class="restaurant_list">
		<c:forEach var="restaurant" items="restaurantList">
		
		<div class="restaurant" style="cursor:pointer;" 
			onclick="location.href='${pageContext.request.contextPath}/customer/restaurant_detail.do?rid=${restaurant.rid}';">
			<div class="restaurant_logo">
				<img src="${pageContext.request.contextPath}/resource/image/restaurant/logo/${restaurant.rid}.png">
			</div>
			<div class="restaurant_summary">
				<table>
					<tr class="restaurant_title"><td>${restaurant.rid}</td></tr>
					<tr class="restaurant_title"><td></td></tr>
					<tr class="restaurant_title"><td></td></tr>
				</table>
			</div>
		</div>
		
		</c:forEach>
	</div>


	<!-- FOOTER START ======================================== -->
	<div class="footermain1">
		<div class="footer1-1">
			<div class="footer1-2-1">이용약관</div>
			<div class="footer1-2-2">개인정보처리방침</div>
			<div class="footer1-2-3">회원등급정책</div>
			<div class="footer1-2-4">회사소개</div>
			<div class="footer1-2-5">즈기요사장님</div>
			<div class="footer1-2-6">입점문의</div>
			<div class="footer1-2-7">공지사항</div>

			<div class="foot1-2">
				<img class="footimg1" src="${pageContext.request.contextPath}/resource/image/home/footer/face.png">
				페이스북
			</div>
			<div class="foot1-3">
				<img class="footimg2" src="${pageContext.request.contextPath}/resource/image/home/footer/blog.png">
				블로그
			</div>
		</div>
	</div>

	<div class="footermain2">
		<img class="footimg3" src="${pageContext.request.contextPath}/resource/image/home/footer/footer.png">
	</div>
	<!-- FOOTER END ======================================== -->
















</body>
<script type="text/javascript">
$(".login").click(function(){
    location.href = "${pageContext.request.contextPath}/customer/customer_login.do";
});

$(".join").click(function(){
    location.href = "${pageContext.request.contextPath}/customer/customer_join.do";
});

$(".zgiyo").click(function(){
    location.href = "${pageContext.request.contextPath}/home/landingpage.do";
});

</script>
</html>
