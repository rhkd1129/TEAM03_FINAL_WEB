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
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		
		</head>
	<body>
		<div style="text-align:center; margin-top:5%; margin-bottom: 5%;" onclick="location.href='${pageContext.request.contextPath}/customer/customer_mobile_main.do'">
			<img src="${pageContext.request.contextPath}/resource/image/home/zgiyo_logo.png" style="width:25%">
		</div>
		
		<div style="font-family: 'Jua', sans-serif; font-size: 40px; text-align: center;">${rmember.rtitle}</div>
		
		<div style="width: 100%; height: 10%; float: left; margin-top: 5%; margin-bottom: 5%;">
			<div class="menu_tab" id="menu_tab"
				style="width: 50%; background-color:white; height: 20%; float: left;">
				<img src="${pageContext.request.contextPath}/resource/image/customer/mobilemenuicon.png" 
				style="width:15%; float:left; margin-left: 40%; margin-top: 5%; margin-bottom: 5%;">	
			</div>
			<div class="review_tab" id="review_tab"
				style="width: 50%; background:white; height: 20%; float: left;">	
				<img src="${pageContext.request.contextPath}/resource/image/customer/mobilereviewicon.png" 
				style="width:15%; float:left; margin-left: 40%; margin-top: 5%; margin-bottom: 5%;">
			</div>		
		</div>
		
		
		<div class="restaurant_info_main"></div>
		
		
		<script>
			var rno = ${rno}
			
			$(function(){

				$('#menu_tab').css({
					'border' : '2px solid #fd5858',
				})
				
				$('#review_tab').css({
					'border' : '2px solid #DBDBDB',
				})

				$.ajax({
					type : "get",
					url : "customer_mobile_order.do?rno="+rno,
					success : function(result) {
						$(".restaurant_info_main").html(result);
					}
				});

			});
		</script>
	
	
	
	
	</body>
	<script src="${pageContext.request.contextPath}/resource/script/customer_mobile_menureview.js"></script>
</html>