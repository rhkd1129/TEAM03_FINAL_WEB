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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/restaurant_maincss.css">
	<script>
			function registMenu() {
				var frno = ${rno}
			    var form = $('#menuReigister')[0];
	
			    // FormData 객체 생성
			    var formData = new FormData(form);
	
			    // 코드로 동적으로 데이터 추가 가능.
				formData.append("frno", frno);
	
			    $.ajax({
			        type: "POST",
			        enctype: 'multipart/form-data',
			        url: "${pageContext.request.contextPath}/restaurant/restaurant_manage_menu_register.do",
			        data: formData,
			        processData: false,
			        contentType: false,
			        cache: false,
			        timeout: 600000,
			        success: function (result) {
			        	alert("메뉴가 성공적으로 등록되었습니다.");
			            $(".content2").html(result);
			        },
			        error: function (e) {
			            console.log("ERROR : ", e);
			        }
			    });
			}
		</script>
</head>
<body>
	<div class="navbar1">
		<div class="navbar2">
			<img class="zgiyo" src="${pageContext.request.contextPath}/resource/image/home/즈기요.png">
		</div>
	</div>
	
	<div class="navtab">
		<div class="navtab1" id='navtab1'>
			주문접수
		</div>
		<div class="navtab2" id='navtab2'>
			매장관리
		</div>
	</div>
	
	<div class="main1">
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
		
		<div class="content1">
		content1
		</div>
	</div>
	
	<div class="main2">
		<div class="menu">
			<div class="menu1" id='menu5'>
				메뉴 등록
			</div>
			<div class="menu2" id='menu6'>
				b
			</div>
			<div class="menu3" id='menu7'>
				c
			</div>
			<div class="menu4" id='menu8'>
				d
			</div>
		</div>
		
		<div class="content2">
		content2
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
<script src="${pageContext.request.contextPath}/resource/script/restaurant_main.js"></script>
</html>
