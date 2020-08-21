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
		
		
		<style>
			#basketButton {
				margin-right: 5%;
				margin-bottom: 5%;
				width: 15%;
			    position: fixed;
			    bottom: 0px;
			    right: 0px; 
			}
			
			ul {
			   list-style: none;
			   padding-left: 0px;
			}
		</style>
		
		</head>
	<body>
		<div class="menuList" style="width: 100%;">
			<div class="foodtap" style="font-family: 'Jua', sans-serif; font-size: 30px; padding-bottom: 5%; text-align: center; border-bottom: 1px solid #DBDBDB;">
				치킨
			</div>
			<div class="foodList">
				<ul>
					<c:forEach var="fnb" items="${foodList}">
						<li style="border-bottom: 1px solid #DBDBDB;">
							<div class="food">
								<a id="foodInsert" onclick="foodInsert(${fnb.fno});">
									<table>
										<tr>
											<td class="food_summary">												
												<ul>
													<li class="fnb_name" style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; margin-left: 5%;">${fnb.fname}</li>
													<li class="fnb_price" style="font-family: 'Do Hyeon', sans-serif; font-size: 18px; margin-left: 5%;">${fnb.fprice}원</li>
												</ul>
											</td>
											<td class="food_img" style="text-align: right; width: 40%;">
												<img class="fnb_img" src="${pageContext.request.contextPath}/${fnb.fimage}" style="width: 100%; margin-top: 5%; margin-bottom: 5%;">
											</td>
										</tr>
									</table>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="beveragetap" style="font-family: 'Jua', sans-serif; font-size: 30px; padding-bottom: 5%; text-align: center; margin-top: 5%; border-bottom: 1px solid #DBDBDB;">
				음료
			</div>
			<div class="beverageList">
				<ul>
					<c:forEach var="fnb" items="${beverageList}">
						<li style="border-bottom: 1px solid #DBDBDB;">
							<div class="food">
								<a id="foodInsert" onclick="foodInsert(${fnb.fno});" >
									<table>
										<tr>
											<td class="food_summary">												
												<ul>
													<li class="fnb_name" style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; margin-left: 5%;">${fnb.fname}</li>
													<li class="fnb_price" style="font-family: 'Do Hyeon', sans-serif; font-size: 18px; margin-left: 5%;">${fnb.fprice}원</li>
												</ul>
											</td>
											<td class="food_img" style="text-align: right; width: 40%;">
												<img class="fnb_img" src="${pageContext.request.contextPath}/${fnb.fimage}" style="width: 100%; margin-top: 5%; margin-bottom: 5%;">
											</td>
										</tr>
									</table>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

		</div>
		
		<a id="order">
			<img src="${pageContext.request.contextPath}/resource/image/customer/mobilebasketicon.png" id="basketButton">
		</a>
		
	
	</body>
	<script>
		$("#order").click(function() {
			location.href = "${pageContext.request.contextPath}/customer/customer_mobile_basket.do?rno="+rno
		})
	
	</script>
</html>