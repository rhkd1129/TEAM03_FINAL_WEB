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
								<div>${fnb.fname}</div>
								<div>
									<img src="${pageContext.request.contextPath}/resource/image/restaurant/logo/1.png"
										 style="width: 50px; height: 50px">
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
								<div>${fnb.fname}</div>
								<div>
									<img src="${pageContext.request.contextPath}/resource/image/restaurant/logo/1.png"
										 style="width: 50px; height: 50px">
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			
		</div>
	</body>
	<script>
		var rno = ${rno}
	
		function foodInsert(fno) {
			var fno = fno
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/customer/customer_order_table.do?fno="+fno + "&rno=" + rno,
				success : function(result) {
					$("#floatMenu1").html(result);
				}
			});
		}
	
		$('.foodtap').click(function() {
			$(".foodList").toggle();
			
		});
		
		$('.beveragetap').click(function() {
			$(".beverageList").toggle();
			
		});
	</script>
</html>