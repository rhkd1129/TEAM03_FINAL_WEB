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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_r_menucss.css">
	</head>
	<body>
		<div class="menuList" style="width:768px; height:100%;">
			<div class="foodtap">
				먹을거
			</div>
			<div class="foodList" style="display: none;">
				<ul>
					<c:forEach var="fnb" items="${foodList}">
						<li>
							<div class="food">
								<a id="foodInsert" onclick="foodInsert(${fnb.fno});" >
									<div class="food_summary">
										<ul>
											<li class="fnb_name">${fnb.fname}</li>
											<li class="fnb_price">${fnb.fprice}원</li>
										</ul>
									</div>
									<div class="food_img">
										<img class="fnb_img" src="${pageContext.request.contextPath}/${fnb.fimage}">
									</div>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="beveragetap">
				마실거
			</div>
			<div class="beverageList" style="display: none;">
				<ul>
					<c:forEach var="fnb" items="${beverageList}">
						<li>
							<div class="beverage">
								<a id="foodInsert" onclick="foodInsert(${fnb.fno});" >
									<div class="food_summary">
										<ul>
											<li class="fnb_name">${fnb.fname}</li>
											<li class="fnb_price">${fnb.fprice}원</li>
										</ul>
									</div>
									<div class="food_img">
										<img class="fnb_img" src="${pageContext.request.contextPath}/${fnb.fimage}">
									</div>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

		</div>
	</body>
	<script>


		$('.foodtap').click(function() {
			$(".foodList").toggle();

		});

		$('.beveragetap').click(function() {
			$(".beverageList").toggle();

		});
	</script>
</html>
