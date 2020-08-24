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
		<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/customer_paymentcss.css"> --%>
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
		<div style="text-align: center; margin-top: 5%; margin-bottom: 5%;" onclick="location.href='${pageContext.request.contextPath}/customer/customer_mobile_main.do'">
			<img src="${pageContext.request.contextPath}/resource/image/home/zgiyo_logo.png" style="width:25%">
		</div>
		
		<a href="javascript:history.back()">
			<img src="${pageContext.request.contextPath}/resource/image/customer/mobilebackicon.png" id="backButton">
		</a>
	
		<form id="paymentDetail" method="post" action="${pageContext.request.contextPath}/customer/customer_kakaopay.do"
		style="border-top: 1px solid #DBDBDB; border-left: 1px solid #DBDBDB; border-right: 1px solid #DBDBDB; margin-left: 5%; margin-right: 5%;">
		<div class="paymentMain">
			<div class="paymentMainFrame">
				<div class="paymentTop">
					결제하기
				</div>
					<div class="paymentBody">
						<div class="paymentInfo">
							배달 정보
						</div>
						<div class="paymentInfoContent">
							<table style="width: 100%;">
								<tr id="paymentInfoContentRows" style="display: none;">
									<td id="paymentInfoContentColumn1">가게 번호</td>
									<td>
										<input name="orno" value="${rno}" style="width:95%;">
										<input id="test" name="ototalprice" value="">
									</td>
								</tr>
							
								<tr id="paymentInfoContentRows">
									<td id="paymentInfoContentColumn1">주소</td>
									<td>
										<input name="ofulladdr" value="${fullAddr}" style="width:95%;">
									</td>
								</tr>
								<tr id="paymentInfoContentRows">
									<td id="paymentInfoContentColumn1"></td>
									<td>
										<input name="odetailaddr" placeholder="(필수) 상세주소 입력" style="width:95%;">
									</td>
								</tr>
								<tr id="paymentInfoContentRows">
									<td id="paymentInfoContentColumn1">휴대전화번호</td>
									<td>
										<input name="otel" placeholder="(필수) 휴대전화 번호 입력" style="width:95%;">
									</td>
								</tr>
							</table>
						</div>
						<div class="paymentRequirement">
							주문시 요청사항
						</div>
						<div class="paymentRequirementContent">
							<textarea name="orequirement" rows="3" cols="39"></textarea>
						</div>
						<div class="paymentMethod">
							카카오페이로만 결제 가능합니다
						</div>
					</div>
				
				
			</div>
		</div>
		<div class="paymentSide">
			<div class="paymentSideFrame">
				<div class="paymentSideTop">
					주문 내역
				</div>
				<div class="paymentSideBody">
					<c:forEach var="beforeOrder" items="${orderTableList}" varStatus="status">
						<table style="width:100%; margin-top: 2px; margin-bottom: 2px; border-bottom: 1px solid #d7dada;">
							<tr style="height: 30px">
								<td colspan="2" style="font-size: 17px; font-weight: bold; padding-left: 10px;">${beforeOrder.bfname}</td>
									
							</tr>	
							<tr style="height: 30px">
								<td id="price${status.count}" style="width: 100px; padding-left: 10px; text-align: right">${beforeOrder.bfprice}</td>
								<td style="width: 20px; text-align: left">원</td>
								<td id="count${status.count}" style="width:40px; text-align: right">${beforeOrder.bcount}</td>
								<td style="width: 40px;">개</td>
								<td id="flag${status.count}" style="display: none;">${status.last}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div style="height: 50px; color:#f4001f; font-size:20px; font-weight: bold; text-align: right; background-color: #ffffbe;">
				 	<table style="width: 100%;">
				 		<tr>
				 			<td style="text-align: left;">총 결제 금액 :</td>
				 			<td id="sum" style="text-align: right;">
				 			</td>
				 			<td>원</td>
				 		</tr>
				 	</table>
				</div>
				<div class="payment">
					 <input id="paymentSubmit" type="submit" style="width:100%; height: 50px; color:#ffffff; font-size:25px; font-weight: bold; text-align: center; background-color: #f4001f;" value="결제하기">
				</div>
			</div>
		</div>
	</form>
	
	<script>
			$(function(){
				sum = 0
				var i = 1
				while(true) {
					
					sum = sum + $('#price'+i).text() * $('#count'+i).text();
					var flag = $('#flag'+i).text()
					if(!flag) {
						break;
					}
					i = i + 1
				}
				$('#sum').text(sum);
				$('#test').val(sum);
			});
	</script>
	
	
	
	
	
	
	</body>
</html>