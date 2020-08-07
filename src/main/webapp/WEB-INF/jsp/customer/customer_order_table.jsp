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
		<script>
			$(function(){
				var sum = 0
				var i = 1
				while(true) {
					
					sum = sum + $('#price'+i).text() * $('#count'+i).text();
					var flag = $('#flag'+i).text()
					if(!flag) {
						break;
					}
					i = i + 1
				}
				$('#sum').text("합계: " + sum + "원");		
						
			});
		</script>
	</head>
	<body>
		<div style="width: 377px; height: 350px; overflow: auto; border: 1px solid #313535;">
			<c:forEach var="beforeOrder" items="${orderTableList}" varStatus="status">
				<table style="width: 375px; margin-top: 2px; margin-bottom: 2px; border-bottom: 1px solid #d7dada;">
					<tr style="height: 30px">
						<td colspan="2" style="font-size: 17px; font-weight: bold; padding-left: 10px;">${beforeOrder.bfname}</td>
						
					</tr>	
					<tr style="height: 30px">
						<td style="width: 30px; padding-left: 5px">
							<a onclick="foodDelete(${beforeOrder.bno})">
								<img src="${pageContext.request.contextPath}/resource/image/customer/x_button.png" style="width: 20px; height: 20px">
							</a>
						</td>
						<td id="price${status.count}" style="width: 100px; padding-left: 10px; text-align: right">${beforeOrder.bfprice}</td>
						<td style="width: 20px; text-align: left">원</td>
						<td id="count${status.count}" style="width:40px; text-align: right">${beforeOrder.bcount}</td>
						<td style="width: 40px;">개</td>
						<td id="flag${status.count}" style="display: none;">${status.last}</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		<div id="sum" style="width: 377px; height: 50px; color:#f4001f; font-size:20px; font-weight: bold; text-align: right; background-color: #d7dada; border: 1px solid #313535;">
		 합계 : 0원
		</div>
		<a id="order" style="text-decoration: none;">
		<div style="width: 377px; height: 50px; color:#ffffff; font-size:25px; font-weight: bold; text-align: center; background-color: #f4001f;">
		 주문하기
		</div>
		</a>
	</body>
	<script>
		$("#order").click(function(){
			location.href = "${pageContext.request.contextPath}/customer/customer_payment.do?rno=" + rno
		})
	</script>
</html>