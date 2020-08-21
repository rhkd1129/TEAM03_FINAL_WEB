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
			#backButton {
				margin-left: 8%;
				margin-top: 8%;
				width: 5%;
			    position: fixed;
			    top: 0px;
			    left: 0px; 
			}
		</style>
		
		</head>
	<body>
		<div style="text-align:center; margin-top:5%; margin-bottom: 5%;" onclick="location.href='${pageContext.request.contextPath}/customer/customer_mobile_main.do'">
			<img src="${pageContext.request.contextPath}/resource/image/home/zgiyo_logo.png" style="width:25%">
		</div>
		
		<div style="font-family: 'Jua', sans-serif; font-size: 40px; text-align: center; margin-bottom: 5%;">장바구니</div>
		
		<div style="width: 80%; height: 350px; margin-left: 10%; overflow: auto; border: 1px solid #313535;">
			<c:forEach var="beforeOrder" items="${orderTableList}" varStatus="status">
				<table style="width: 100%; margin-top: 2px; margin-bottom: 2px; border-bottom: 1px solid #d7dada;">
					<tr style="height: 30px">
						<td colspan="2" style="font-family: 'Do Hyeon', sans-serif; font-size: 20px; padding-left: 10px;">${beforeOrder.bfname}</td>
						
					</tr>	
					<tr style="height: 30px">
						<td style="width: 30px; padding-left: 5px;">
							<a onclick="foodDelete(${beforeOrder.bno})">
								<img src="${pageContext.request.contextPath}/resource/image/customer/x_button.png" style="width: 20px; height: 20px;">
							</a>
						</td>
						<td id="price${status.count}" style="width: 100px; padding-left: 10px; text-align: right; font-family: 'Do Hyeon', sans-serif; font-size: 20px;">${beforeOrder.bfprice}</td>
						<td style="width: 20px; text-align: left; font-family: 'Do Hyeon', sans-serif; font-size: 20px;">원</td>
						<td id="count${status.count}" style="width:40px; text-align: right; font-family: 'Do Hyeon', sans-serif; font-size: 20px;">${beforeOrder.bcount}</td>
						<td style="width: 40px; font-family: 'Do Hyeon', sans-serif; font-size: 20px;">개</td>
						<td id="flag${status.count}" style="display: none;">${status.last}</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		<div id="sum" style="width: 80%; height: 50px; padding-top: 1%; margin-left:10%; padding-right:5%; color:#f4001f; font-family: 'Do Hyeon', sans-serif; font-size: 25px; text-align: right; background-color: #d7dada; border: 1px solid #313535;">
		 총 금액 : 0원
		</div>
		<a id="order" style="text-decoration: none;">
		<div style="width: 80%; height: 50px; margin-left:10%; color:#ffffff; font-family: 'Do Hyeon', sans-serif; font-size:32px; text-align: center; background-color: #f4001f;">
		 주문하기
		</div>
		</a>
		
		<a href="javascript:history.back()">
			<img src="${pageContext.request.contextPath}/resource/image/customer/mobilebackicon.png" id="backButton">
		</a>

		<div id="floatMenu">
			<div id="floatMenu1"></div>
			<div id="floatMenu2"></div>
		</div>
		
		<script>
			var rno = ${rno}
		
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
				$('#sum').text("총 금액: " + sum + "원");		
						
			});
			
			function foodDelete(bno) {
				var fno = bno
				$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath}/customer/customer_mobile_deleteorder.do?bno="+bno + "&rno=" + rno,
					success : function(result) {
						alert("메뉴를 삭제했습니다.");
						location.reload(true);
					}
				});
			}
		</script>
		
		<script>
			var rno = ${rno}
			
			$("#order").click(function(){
				console.log("이야야얏결제!");
				location.href = "${pageContext.request.contextPath}/customer/customer_mobile_payment.do?rno=" + rno
			})
		</script>
	
	
	
	</body>
</html>