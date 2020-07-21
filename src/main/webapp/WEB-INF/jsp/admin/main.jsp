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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/admin_maincss.css">
</head>
<body>
	<div class="bodymainbox">
		<div class="navbarmain">
			<div class=nav1>
				<img class="nav1img1" src="${pageContext.request.contextPath}/resource/image/admin/관리자.png">
				<div class="nav1text1">Admin Page</div>
			</div>
			<div class=nav2>
				<img class="nav2img1" src="${pageContext.request.contextPath}/resource/image/admin/차범근.jpg">				
				<div class="nav2text1">welcome,</div>
				<div class="nav2text2">BoomBoom cha</div>
			</div>
			<div class=nav3>
				<div class="nav3text1">GENERAL</div>
				
				<div class="btnHome1">
					<img class="btnHomeimg1" src="${pageContext.request.contextPath}/resource/image/admin/home.png">
					<div class="btnHometext1">Home</div>
				</div>
				
				<div class="btnHome2">
					<img class="btnHomeimg2" src="${pageContext.request.contextPath}/resource/image/admin/data.png">
					<div class="btnHometext2">Data</div>
				</div>				
				
				
				
				
				
				
				
				
				
			</div>		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</div>
	</div>
</body>

<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(".btnHome1").click( function() {  
	$(".btnHome1").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
	$(".btnHome1").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
});	

$(".btnHome2").click( function() {  
	$(".btnHome2").css("background-color","linear-gradient(#334556, #2C4257),#2A3F54");
	$(".btnHome2").css("box-shadow","rgba(0,0,0,0.25) 0 1px 0,inset rgba(255,255,255,0.16) 0 1px 0");
});	

</script>
</html>
