<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${rmember.rtitle}</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
	<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_r_infocss.css">
	<script src="${pageContext.request.contextPath}/resource/script/addressapi.js"></script>
	<script>
		var rno = ${rno}
		console.log(rno)
		$(function(){
			
			$('#menu_tab').css({
				'background-color' : '#ffffff',
				'color': '#000000'
			})
			$('#review_tab').css({
				'color': '#ffffff',
				'background-color' : '#313535',
			})
			
			$.ajax({
				type : "get", 
				url : "customer_r_menu.do?rno="+rno,
				success : function(result) { 
					$(".restaurant_info_main").html(result);
				}
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			
			// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
			var floatPosition = parseInt($("#floatMenu").css('top'));
			// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	
			$(window).scroll(function() {
				// 현재 스크롤 위치를 가져온다.
				
				var scrollTop = $(window).scrollTop();
				var newPosition = scrollTop + floatPosition + "px";
				
					
				/* 애니메이션 없이 바로 따라감
				 $("#floatMenu").css('top', newPosition);
				 */
	
				$("#floatMenu").stop().animate({
					"top" : newPosition
				}, 500);
	
			}).scroll();
	
		});
		
		

	</script>
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
				<img class="navimg" src="${pageContext.request.contextPath}/resource/image/home/customer_main_text.png">
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

 
	<div class="restaurant_detail" id="restaurant_detail"> 
		<div class="restaurant_info" id="restaurant_info">
			<div class="restaurant_title">
				${rmember.rtitle}
			</div>
			<div class="restaurant_info_tab">
				<div class="menu_tab" id="menu_tab">
					메뉴
				</div>
				<div class="review_tab" id="review_tab">
					리뷰
				</div>
			</div>
			<div class="restaurant_info_main">
				content
			</div>
		</div>
		
		<div id="floatMenu">
			<div id="floatMenu1">주문표</div>
			<div id="floatMenu2">하이</div>
		</div>
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
<script src="${pageContext.request.contextPath}/resource/script/customer_r_info.js"></script>
</html>
