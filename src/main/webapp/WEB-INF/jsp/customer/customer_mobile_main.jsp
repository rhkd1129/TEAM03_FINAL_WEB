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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_mobile_maincss.css">
		<script src="${pageContext.request.contextPath}/resource/script/addressapi.js"></script>
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		
		</head>
	<body>
		<div style="text-align:center" onclick="location.href='${pageContext.request.contextPath}/customer/customer_mobile_main.do'">
			<img src="${pageContext.request.contextPath}/resource/image/home/zgiyo_logo.png" style="width:20%">
		</div>
		
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resource/image/customer/banner1.jpg" style="width:100%"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resource/image/customer/banner2.jpg" style="width:100%"></div>
				<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resource/image/customer/banner3.jpg" style="width:100%"></div>
			</div>
		</div>
		
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category1.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category2.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category3.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category4.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category5.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category6.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category7.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category8.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category9.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category10.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category11.png" style="width:33%; float:left;"></div>
		<div><img src="${pageContext.request.contextPath}/resource/image/customer/category12.png" style="width:33%; float:left;"></div>
		
	
			<div class="address">
				<form name="form" id="form" method="post">
					<input type="text" name="currentPage" value="1" style="display:none;"/> 
					<input type="text" name="countPerPage" value="100" style="display:none;"/> 
					<input type="text" name="resultType" value="json" style="display:none;"/> 
					<input type="text" name="confmKey" value="U01TX0FVVEgyMDIwMDcyMjEwMTMyNDEwOTk3ODQ=" style="display:none;"/>
					<input type="text" name="keyword" value="" onkeydown="enterSearch();" style="width:93%" autofocus="autofocus"/>
					<input type="image" onClick="getAddr();" src="${pageContext.request.contextPath}/resource/image/customer/searchicon.png" style="float:right; width:7%;"/>
					<div id="list"></div>
				</form>
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