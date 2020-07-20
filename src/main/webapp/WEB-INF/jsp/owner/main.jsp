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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/maincss.css">
</head>
<body>
	<div class="navbar1">
		<div class="navbar2">
			<img class="zgiyo" src="${pageContext.request.contextPath}/resource/image/home/즈기요.png">

			<div class="boxbox">
				<div class="login">로그인</div>
				<div class="join">회원가입</div>
			</div>
		</div>
	</div>

	<img class="backgroundimg" src="${pageContext.request.contextPath}/resource/image/home/1.jpg">
	<img class="backgroundimg" src="${pageContext.request.contextPath}/resource/image/home/2.jpg">
	<img class="backgroundimg" src="${pageContext.request.contextPath}/resource/image/home/3.jpg">
	<img class="backgroundimg" src="${pageContext.request.contextPath}/resource/image/home/4.jpg">




	<div class="textbox">
		<div class="textbox1">
			<div class="where">"어디로 </div>
			<div class="delivery">배달</div>
			<div class="doing">해 드릴까요?"</div>
			<div class="textbox1-1">배달 받으실 동 이름으로 검색해주세요</div>
		</div>
		<div class="textbox2">
			<div></div>
			<div></div>
		</div>
	</div>
	
	<div>
	
	</div>

	


	<!-- FOOTER START ======================================== -->
	<div class="footermain1">
		<div class="footer1-1">
			<div class="footer1-2-1">이용약관</div>
			<div class="footer1-2-2">개인정보처리방침</div>
			<div class="footer1-2-3">회원등급정책</div>
			<div class="footer1-2-4">회사소개</div>
			<div class="footer1-2-5">요기요사장님</div>
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
    location.href = "${pageContext.request.contextPath}/home/main.do";
});

$(".join").click(function(){
    location.href = "${pageContext.request.contextPath}/home/main.do";
});
</script>
</html>
