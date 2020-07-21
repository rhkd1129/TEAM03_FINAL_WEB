<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/owner_joincss.css">
</head>
<body>
	<div class="navbar1">
		<div class="navbar2">
			<img class="zgiyo" src="${pageContext.request.contextPath}/resource/image/home/즈기요.png">
		</div>
	</div>

	<div class="ownerjoin">
		<div>
			<img class="ownerjoinimg" src="${pageContext.request.contextPath}/resource/image/owner/owner_login.png">
		</div>

		<div class="ownerjoinform" style="width:576px">
			<form:form method="post" modelAttribute="omember">
				<ul>
					<li>아이디</li>
					<li>
						<form:input path="oid" style="width:500px; height:50px;"/>
					</li>
					<li>비밀번호</li>
					<li>
						<form:input path="opassword" style="width:500px; height:50px;"/>
					</li>
					<li>이름</li>
					<li>
						<form:input path="oname" style="width:500px; height:50px;"/>
					</li>
					<li>점포명</li>
					<li>
						<form:input path="otitle" style="width:500px; height:50px;"/>
					</li>
					<li>주소</li>
					<li>
						<form:input path="oadress" style="width:500px; height:50px;"/>
					</li>
					<li>전화번호</li>
					<li>
						<form:input path="otel" style="width:500px; height:50px;"/>
					</li>
					<li>업종</li>
					<li>
						<form:input path="ocategory" style="width:500px; height:50px;"/>
					</li>				
				</ul>
				<input type="submit" value="가입" style="width:500px; height:50px; margin:20px"/>
				
			</form:form>
			
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
    location.href = "${pageContext.request.contextPath}/member/ologin.do";
});

$(".join").click(function(){
    location.href = "${pageContext.request.contextPath}/member/ojoin.do";
});
</script>
</html>
