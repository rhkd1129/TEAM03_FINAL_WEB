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
		<script src="${pageContext.request.contextPath}/resource/script/addressapi.js"></script>
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		
		</head>
	<body>
		<div style="text-align:center; margin-top:5%;" onclick="location.href='${pageContext.request.contextPath}/customer/customer_mobile_main.do'">
			<img src="${pageContext.request.contextPath}/resource/image/home/zgiyo_logo.png" style="width:25%">
		</div>
		
		<div class="swiper-container" style="margin-bottom:5%; margin-top:5%;">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resource/image/customer/banner1.png" style="width:100%"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resource/image/customer/banner2.png" style="width:100%"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resource/image/customer/banner3.png" style="width:100%"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resource/image/customer/banner4.png" style="width:100%"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resource/image/customer/banner5.png" style="width:100%"></div>
			</div>
		</div>
		
		<div class="restaurant_list" style="width: 100%;">
			<c:forEach var="restaurant" items="${restaurantList}">
			
			<div class="restaurant" style="cursor:pointer;" 
				onclick="location.href='${pageContext.request.contextPath}/customer/customer_mobile_orderreviewmain.do?rno=${restaurant.rno}';">
				<div style="width:50%; float:left; padding-left:4%; padding-right:4%; margin-top:5%; margin-bottom:5%;">
					<div class="restaurant_logo">
						<img style="width:84%;" class="restaurant_logo_img" src="${pageContext.request.contextPath}/resource/image/restaurant/logo/${restaurant.rno}.png">
					</div>
					<div class="restaurant_summary" style="width:100%; padding-top:5%;">
						<table class="restaurant_summary_table">
							<tr style="font-family: 'Jua', sans-serif; font-size:18px;" class="restaurant_title"><td>${restaurant.rtitle}</td></tr>
							<tr style="font-family: 'Do Hyeon', sans-serif; font-size:14px;" class="restaurant_address"><td>${restaurant.raddress}</td></tr>
							<tr style="font-family: 'Do Hyeon', sans-serif; font-size:14px;" class="restaurant_tel"><td>${restaurant.rtel}</td></tr>
						</table>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	
		
		<script>

		new Swiper('.swiper-container', {
		pagination: '.swiper-pagination',
		paginationClickable: true,
		spaceBetween:0,
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		},
		speed: 2000,
		loop: true,
		onSlideChangeEnd: function (swiper) {
		swiper.activeIndex;
		var slidesLen = swiper.slides.length;
		
		}
		});

		</script>
	</body>
</html>