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
			<img class="zegiyo" src="${pageContext.request.contextPath}/resource/imgage/home/즈기요.png">
			
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