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
		
		<div class="address">
			<form name="form" id="form" method="post">
				<input type="text" name="currentPage" value="1" style="display:none;"/> 
				<input type="text" name="countPerPage" value="100" style="display:none;"/> 
				<input type="text" name="resultType" value="json" style="display:none;"/> 
				<input type="text" name="confmKey" value="U01TX0FVVEgyMDIwMDcyMjEwMTMyNDEwOTk3ODQ=" style="display:none;"/>
				<input type="text" name="keyword" value="" onkeydown="mobileenterSearch();" style="width:93%" autofocus="autofocus"/>
				<img onClick="mobilegetAddr();" src="${pageContext.request.contextPath}/resource/image/customer/mobilesearchicon.png" style="float:right; width:7%;">
				<div id="list"></div>
			</form>
		</div>
		
		<div style="width: 100%; height: 10%; float: left; margin-top: 5%; margin-bottom:5%; border-top: 1px solid #DBDBDB; border-bottom: 1px solid #DBDBDB;">
			<div onclick="location.href='${pageContext.request.contextPath}/customer/customer_mobile_main.do'" 
				style="width: 50%; background-color:white; height: 20%; float: left; border-right: 1px solid #DBDBDB;">
				<img src="${pageContext.request.contextPath}/resource/image/customer/mobilehomeicon.png" 
				style="width:15%; float:left; margin-left: 40%; margin-top: 5%; margin-bottom: 5%; ">	
			</div>
			<div onclick="location.href='${pageContext.request.contextPath}/customer/customer_mobile_searchlist.do'"
				style="width: 50%; background:white; height: 20%; float: left; ">		
				<img src="${pageContext.request.contextPath}/resource/image/customer/mobilesearchicon.png" 
				style="width:15%; float:left; margin-left: 40%; margin-top: 5%; margin-bottom: 5%; ">
			</div>		
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